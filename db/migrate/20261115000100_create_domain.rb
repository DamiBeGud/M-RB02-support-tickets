class CreateDomain < ActiveRecord::Migration[8.1]
 def change
create_table(:tickets){|t|t.string :reference,null:false,limit:64;t.string :subject,null:false,limit:120;t.string :state,null:false}
add_index :tickets,:reference,unique:true
add_check_constraint :tickets,"state IN ('open','in_progress','resolved')",name:'ticket_state_allowed'
 end
end
