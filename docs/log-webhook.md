# Log webhook

The app expects to receive a `POST` webhook with `object_key` and `bucket_name` in its body.
This information is used to instantiate a background job to run an ETL task using the log file received in the webhook.

The webhook path is `/log_webhook`.

## AWS S3 & AWS Lambda

I recommend using an AWS Lambda function to trigger the webhook.

1. Create a lambda function with the code:

```ruby
require 'json'
require 'net/http'
require 'uri'

def lambda_handler(event:, context:)
  uri = URI.parse("#{ENV.fetch('BASE_URL')}/log_webhook")
  headers = { 'Authorization' => "Bearer #{ENV.fetch('TOKEN')}" }

  response_codes = event['Records'].map do |record|
    key = record['s3']['object']['key']
    bucket = record['s3']['bucket']['name']

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, headers)
    request.body = {
      object_key: key,
      bucket_name: bucket
    }.to_json

    http.request(request).code
  end

  { statusCode: 200, body: JSON.generate(response_codes) }
end
```

2. Set the environment variables in AWS Lambda: `BASE_URL` and `TOKEN`. (`TOKEN` must match the `LOG_WEBHOOK_TOKEN` environment variable used in your app)

3. Create an S3 bucket to store your log files (if you don't have one already). [Papertrail](http://papertrailapp.com/) has an easy to use configuration to upload your logs into S3 in an hourly basis.

4. Configure the property called Events in your bucket to use the Lambda previously created.
