CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJU3PZRWFI4UDDZ4A',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'us-west-2',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'qwertytest'                          # required
end