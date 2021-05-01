module Email
  module Model::Template
    extend ActiveSupport::Concern

    included do
      attribute :honorific, :string
      attribute :body, :string
      attribute :order_prefix, :string

      has_one_attached :cover
    end

  end
end
