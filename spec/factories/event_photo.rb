FactoryBot.define do
  factory :event_photo do
    image_id {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/face-image.jpg'))}
  end
end