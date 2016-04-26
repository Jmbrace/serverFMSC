CarrierWave.configure do |config|
  config.fog_credentials = {
     provider: 'AWS',          
     aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],    
     aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],     
     region: 'us-west-2'           
  }
  config.fog_directory  = ENV['S3_BUCKET_NAME']                          # required
  config.asset_host = 'https://s3-us-west-2.amazonaws.com/fmsc4262016/'
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = {'Cache-Control' => 'max-age=315576000'} # optional, defaults to {}
end