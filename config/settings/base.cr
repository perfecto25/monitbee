Marten.configure do |config|
  # IMPORTANT: please ensure the secret key value is kept secret!
  config.secret_key = "__insecure_88da6e8caa947ba4345adc800cf6e41405a1747a8cb5a68cb76d193956926e71__"

  # config.installed_apps = []

  config.middleware = [
    Marten::Middleware::Session,
    Marten::Middleware::Flash,
    Marten::Middleware::GZip,
    Marten::Middleware::XFrameOptions,
  ]

  config.database do |db|
    db.backend = :sqlite
    db.name = Path["monitbee.db"].expand
  end

  config.templates.context_producers = [
    Marten::Template::ContextProducer::Request,
    Marten::Template::ContextProducer::Flash,
    Marten::Template::ContextProducer::Debug,
    Marten::Template::ContextProducer::I18n,
  ]
end
