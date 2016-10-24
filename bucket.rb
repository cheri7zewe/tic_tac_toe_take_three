require 'rubygems'
require 'aws/s3'
require 'csv'
load "./local_env.rb" 
AWS::S3::Base.establish_connection!(
  :access_key_id => ENV['S3_KEY'],
  :secret_access_key => ENV['S3_SECRET']   
)
file = "summary.csv" 
bucket = ENV['S3_BUCKET']
csv = AWS::S3::S3Object.value(file, bucket)
csv << "Something"
AWS::S3::S3Object.store(File.basename(file), 
                        csv, 
                        bucket, 
                        :access => :public_read)