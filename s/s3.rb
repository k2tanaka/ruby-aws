require 'aws-sdk'

class S3
    def initialize(aws)
        @s3 = aws::S3.new
    end

    def getBucket(bucket_name)
        begin
            bucket = @s3.buckets[bucket_name]

            unless bucket.exists?
                raise "getBucket need create bucket!"
            end

            return bucket

        rescue Exception => e
            puts e.message
            puts e.backtrace.inspect

            raise "getBucket error!"
        end
    end

    def list(bucket_name)
        begin
            bucket = getBucket(bucket_name)
        rescue Exception => e
            puts e.message
            puts e.backtrace.inspect
        end

        bucket.objects.each do | object |
            p object.key
        end
    end

    def getObject(bucket_name, key_name)
        begin
            object = getBucket(bucket_name).objects[key_name]
        rescue Exception => e
            puts e.message
            puts e.backtrace.inspect
        end

        return object
    end

    def download(bucket_name, key_name, local_file)

        object = getObject(bucket_name, key_name)

        File.open(local_file, "w") do |f|
            f.write(object.read)
        end
    end

end
