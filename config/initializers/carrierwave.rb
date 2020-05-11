CarrierWave.configure do |config|
  # S3設定
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['aws_access_key_id'],
    aws_secret_access_key: ENV['aws_secret_access_key'],
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'rails-idolplaces-photo'
  config.cache_storage = :fog
  config.fog_public = false
end