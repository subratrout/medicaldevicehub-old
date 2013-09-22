
CarrierWave.configure do |config|

  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: "S3_KEY",
    aws_secret_access_key: "S3_SECRET",
    #region: 'Northern California'
    #endpoint: "https://medicaldevicehub-images.s3-website-us-west-1.amazonaws.com"
  }
  config.fog_directory = "S3_BUCKET"
  config.fog_public = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end

