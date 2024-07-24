module Email
  module Model::Template
    extend ActiveSupport::Concern

    included do
      attribute :contact, :string
      attribute :subject, :string
      attribute :honorific, :string
      attribute :body, :string
      attribute :order_prefix, :string
      attribute :position, :integer, index: true

      belongs_to :organ, class_name: 'Org::Organ', optional: true

      has_one_attached :cover

      positioned
    end



  end
end
