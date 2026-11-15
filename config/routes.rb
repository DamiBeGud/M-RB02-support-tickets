Rails.application.routes.draw do
 get '/health/live',to:'health#live'
 get '/health/ready',to:'health#ready'
get '/tickets/counts',to:'tickets#counts'
post '/tickets',to:'tickets#create'
get '/tickets/:reference',to:'tickets#show'
patch '/tickets/:reference/state',to:'tickets#transition'
end
