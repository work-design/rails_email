class RailsLogInit < ActiveRecord::Migration[5.0]
  def change

    create_table :log_records do |t|
      t.string :path
      t.string :controller
      t.string :action
      t.string :params, limit: 2048
      t.string :headers, limit: 4096
      t.string :cookie, limit: 2048
      t.string :session, limit: 2048
      t.string :exception, limit: 10240
      t.string :exception_object
      t.text :exception_backtrace
      t.timestamps
    end

    create_table :log_mailers do |t|
      t.string :message_object_id
      t.string :mailer
      t.string :action
      t.string :params
      t.string :subject
      t.string :mail_to
      t.string :cc_to
      t.string :sent_status
      t.string :sent_string
      t.timestamps
    end

    create_table :log_csps do |t|
      t.string :document_uri
      t.string :referrer
      t.string :violated_directive
      t.string :effective_directive
      t.string :original_policy, limit: 1024
      t.string :disposition
      t.string :blocked_uri
      t.string :line_number
      t.string :column_number
      t.string :source_file
      t.string :status_code
      t.string :script_sample
      t.timestamps
    end

  end
end
