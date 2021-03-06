class Post::AdministratorToAws

	attr_accessor :s3

	def initialize()
		@s3 = aws_accessor()
	end

	def get_image(image_key)
		@s3.get_object(
			bucket: "www.imagehike",
			key: image_key,
		)
	end

	def put_image(image, image_key)
        @s3.put_object(
			bucket: "www.imagehike",
			body: image,
			key: image_key,
		)
	end

	def aws_accessor()
		Dotenv.load
		Aws.config.update(
			access_key_id: ENV["AWS_ACCESS_KEY_ID"],
			secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
			region: ENV['REGION']
		)
		Aws::S3::Client.new(access_key_id: ENV["AWS_ACCESS_KEY_ID"], secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"])
	end
	private :aws_accessor
end
