class Ticket < ApplicationRecord
 validates :state,inclusion:{in:%w[open in_progress resolved]}
end
