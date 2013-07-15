require 'aws-sdk'

# aws module
require './s/s3'

class AwsCommand

    def initialize(opts)
        @opts = opts

        AWS.config(
          :access_key_id => @opts['access_key'],
          :secret_access_key => @opts['secret_key']
        )

        # service
        @s3 = S3.new(AWS)

    end

    def getOpts()
        @opts
    end

    def S3()
        @s3
    end

end
