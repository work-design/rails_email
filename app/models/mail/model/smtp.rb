module Mail
  module Model::Smtp
    extend ActiveSupport::Concern

    included do
      attribute :address, :string
      attribute :port, :string
      attribute :enable_starttls_auto, :boolean, default: true
      attribute :ssl, :boolean, default: true

      enum authentication: {
        plain: 'plain',
        login: 'login',
        cram_md5: 'cram_md5'
      }
      enum openssl_verify_mode: {
        none: 'none',
        peer: 'peer'
      }, _prefix: true

      has_many :smtp_accounts
    end

  end
end
