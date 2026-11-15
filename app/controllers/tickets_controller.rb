class TicketsController < ApplicationController
  before_action :authenticate
  def create
    row=Ticket.create!(reference:Input.id(params[:reference]),subject:Input.text(params[:subject],120),state:'open')
    render json:serialize(row),status: :created
  end
  def show = render(json:serialize(Ticket.find_by!(reference:params[:reference])))
  def transition
    row=Ticket.find_by!(reference:params[:reference]);target=Input.text(params[:state],20)
    row.with_lock {Input.transition!(row.state,target);row.update!(state:target)}
    render json:serialize(row)
  end
  def counts
    actual=Ticket.group(:state).count;render json:Input::STATES.to_h{|s|[s,actual.fetch(s,0)]}
  end
  private
  def serialize(row) = row.as_json(only:[:id,:reference,:subject,:state])
end
