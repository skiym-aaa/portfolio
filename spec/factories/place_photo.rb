FactoryBot.define do
  factory :place_photo do
    image_id { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/place-image.jpg')) }
  end
end
