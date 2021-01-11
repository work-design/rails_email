module RailsLog::LogCsp
  extend ActiveSupport::Concern

  included do
    attribute :document_uri, :string
    attribute :referrer, :string
    attribute :violated_directive, :string
    attribute :effective_directive, :string
    attribute :original_policy, :string, limit: 1024
    attribute :disposition, :string
    attribute :blocked_uri, :string
    attribute :line_number, :string
    attribute :column_number, :string
    attribute :source_file, :string
    attribute :status_code, :string
    attribute :script_sample, :string

    default_scope -> { order(id: :desc) }
  end

end
