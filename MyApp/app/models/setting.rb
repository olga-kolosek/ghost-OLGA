class Setting < RailsSettings::Base
  # cache_prefix { "v1" }
  field :app_name, default: "Rails Teams", validates: { presence: true, length: { in: 2..20 } }
  field :description, default: "The best Rails Team ever"

  field :host, default: "http://localhost:3000", readonly: true
  field :default_locale, default: "zh-CN", validates: { presence: true, inclusion: { in: %w[zh-CN en jp] } }
  field :readonly_item, type: :integer, default: 100, readonly: true
  field :user_limits, type: :integer, default: 20
  field :exchange_rate, type: :float, default: 0.123
  #field :admin_emails, type: :array, default: %w[admin@rubyonrails.org]
  field :captcha_enable, type: :boolean, default: true

  # Override array separator, default: /[\n,]/ split with \n or comma.
  field :tips, type: :array, separator: /[\n]+/

  field :notification_options, type: :hash, default: {
    send_all: true,
    logging: true,
    sender_email: "foo@bar.com"
  }

  # lambda default value
  field :welcome_message, type: :string, default: -> { "welcome to #{self.app_name}" }, validates: { length: { maximum: 255 } }
end