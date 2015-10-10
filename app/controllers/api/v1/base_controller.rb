# encoding: utf-8
module Api::V1
  class BaseController < ActionController::API
    respond_to :json, :png
    def show_image
      resource = Bases::Resource.find_by(["id=?",params[:id]])
      # 转码二进制
      data =resource.file
      decoded_val = Base64.decode64(data)
      # 设置头
      response.headers['Cache-Control'] = "public, max-age=#{12.hours.to_i}"
      response.headers['Content-Type'] = 'image/jpeg'
      response.headers['Content-Disposition'] = 'inline'
      #　返回图片
      render :text => decoded_val
    end
  end
end