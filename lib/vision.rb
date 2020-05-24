require 'base64'
require 'json'
require 'net/https'
module Vision
  class << self
    def get_image_data(image_file)
      api_url = "https://vision.googleapis.com/v1/images:annotate?key=#{ENV['API_KEY']}"
      # 画像をbase64にエンコード
      base64_image = Base64.encode64(open(image_file).read)
      # APIリクエスト用のJSONパラメータ
      params = {
        requests: [{
          image: {
            content: base64_image
          },
          features: [
            {
              type: 'LABEL_DETECTION'
            }
          ]
        }]
      }.to_json
      # Google Cloud Vision APIにリクエスト
      uri = URI.parse(api_url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      response = https.request(request, params)
      # APIレスポンス出力
      JSON.parse(response.body)['responses'][0]['labelAnnotations'].pluck('description').take(3)
    end

    def get_face_data(image_file)
      api_url = "https://vision.googleapis.com/v1/images:annotate?key=#{ENV['API_KEY']}"
      # 画像をbase64にエンコード
      base64_image = Base64.encode64(open(image_file).read)
      # APIリクエスト用のJSONパラメータ
      params = {
        requests: [{
          image: {
            content: base64_image
          },
          features: [
            {
              type: 'FACE_DETECTION'
            }
          ]
        }]
      }.to_json
      # Google Cloud Vision APIにリクエスト
      uri = URI.parse(api_url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      response = https.request(request, params)
      # APIレスポンス出力

      #コントローラー に渡す配列の作成
      face_array = []
      likelihoods = [ "VERY_LIKELY", "LIKELY" ]
      unless JSON.parse(response.body)["responses"][0]["faceAnnotations"] == nil
        binding.pry
        if likelihoods.include?(JSON.parse(response.body)["responses"][0]["faceAnnotations"][0]["joyLikelihood"])
          face_array.push("Joy")
        end
        if likelihoods.include?(JSON.parse(response.body)["responses"][0]["faceAnnotations"][0]["angerLikelihood"])
          face_array.push("Anger")
        end
        if likelihoods.include?(JSON.parse(response.body)["responses"][0]["faceAnnotations"][0]["sorrowLikelihood"])
          face_array.push("Sorrow")
        end
        if likelihoods.include?(JSON.parse(response.body)["responses"][0]["faceAnnotations"][0]["surpriseLikelihood"])
          face_array.push("Suprise")
        end

        # eachで回す書き方
        # JSON.parse(response.body)["responses"].each do |res|
        #   res["faceAnnotations"].each do |face|
        #     if likelihoods.include?(face["joyLikelihood"])
        #       unless face_array.include?("Joy")
        #         face_array.push("Joy")
        #       end
        #     end
        #     if likelihoods.include?(face["angerLikelihood"])
        #       unless face_array.include?("Anger")
        #         face_array.push("Anger")
        #       end
        #       face_array.push("Anger")
        #     end
        #     if likelihoods.include?(face["sorrowLikelihood"])
        #       unless face_array.include?("Sorrow")
        #         face_array.push("Sorrow")
        #       end
        #     end
        #     if likelihoods.include?(face["surpriseLikelihood"])
        #       unless face_array.include?("Suprise")
        #         face_array.push("Suprise")
        #       end
        #     end
        #   end
        # end
        face_array
      end
    end
  end
end