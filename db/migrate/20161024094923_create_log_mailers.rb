class CreateLogMailers < ActiveRecord::Migration[5.0]
  def change
    create_table :log_mailers do |t|
      t.string :message_object_id
      t.string :mailer
      t.string :action
      t.string :params
      t.string :mail_to
      t.string :cc_to
      t.string :sent_status
      t.string :sent_string
      t.timestamps
    end
  end
end
