#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'optparse'

require './aws'

# コマンドライン解析
opts = OptionParser.new do |parser|
    parser.on('-a', '--access_key ACCESS_KEY_ID')
    parser.on('-s', '--secret_key SECRET_ACCESS_KEY')
    parser.on('-b', '--bucket_name BUCKET_NAME')

end.getopts



aws = AwsCommand.new(opts)
#aws.getOpts()

s3 = aws.S3()

s3.list(opts['bucket_name'])

s3.getObject(opts['bucket_name'], 'index2.html')

s3.download(opts['bucket_name'], 'index2.html', '/tmp/download.html')
