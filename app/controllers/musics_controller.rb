class MusicsController < ApplicationController
  require 'rest_client'
  class << self
    attr_accessor :BOUNDARY
  end


  before_action :set_music, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def boundary
    self.class.BOUNDARY = "AaB03x"
  end

  def send_file
    puts "*" * 100
    file_path = "#{Rails.root}/public/#{params[:attachment]}"
    send_file file_path, :filename => params[:attachment], :disposition => 'attachment'
  end

  # def send_file
  #   puts "*" * 100
  #   file_path = "#{Rails.root}/public/#{params[:attachment]}"
  #   send_file file_path, :filename => params[:attachment], :disposition => 'attachment'
  # end

#   def parse
#     stub_request(:post, "http://www.api.parse.com").
#         with(:body => @music.attachment_url, :headers => { 'Content-Length' => 3 }, {'X-Parse-Application-Id' => "cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"'}, {'} )
#
#     uri = URI.parse("http://www.example.com/")
#     req = Net::HTTP::Post.new(uri.path)
#     req['Content-Length'] = 3
#
#     res = Net::HTTP.start(uri.host, uri.port) do |http|
#       http.request(req, "abc")
#     end    # ===> Success
#
#
#
#   puts "8" * 100
#   uri = URI('http://www.api.parse.com' )
#   req = Net::HTTP::Post.new(uri)
#   req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
#   req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
#   req['Content-Type'] = 'audio/mpeg'
# #   file = Parse::File.new({
# #   :body => "Hello World!",
# #   :local_filename => "hello.txt",
# #   :content_type => "text/plain"
# # })
# # file.save
# Net::HTTP.get(URI('https://api.parse.com/1/files/hello.txt'))
#   end
#   # # res = Net::HTTP.start(uri.hostname, uri.port) do |http|
#   # # http.request(req)
#   # end
#   # case res
#   # when Net::HTTPSuccess, Net::HTTPRedirection
#   #   # OK
#   # else
#   #   res.value
#   # end
#   # end

  def parseupload
    puts "8" * 100
    boundary
    file = "/Users/adityanarayan/Desktop/orel/Hubb_Music/public/uploads/tmp/test.txt"

    post_body = []
    post_body << "--#{boundary}\r\n"
    post_body << "Content-Disposition: form-data; name=""datafile""; filename=""hellokoshik""\r\n"
    post_body << "Content-Type: audio/mpeg"
    post_body << "\r\n"
    post_body << File.read(file)
    post_body << "\r\n--#{boundary}--\r\n"


    uri = URI('http://www.api.parse.com' )
    req = Net::HTTP::Post.new(uri)
    req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
    req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
    req['Content-Type'] = 'text/plain'
    http = Net::HTTP.new(uri.host, uri.port)
    req.body = post_body.join
    req["Content-Type"] = "multipart/form-data, boundary=#{boundary}"
    res = http.request(req)
    upload = res.body
    i = 0
    100.times do |i|
      puts upload[i]
      i += 1
    end
    puts upload
    #   curl -X POST
    # -H "X-Parse-Application-Id: cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
    # -H "X-Parse-REST-API-Key: nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
    # -H "Content-Type: text/plain"
    # -d 'Ping!'
    # https://api.parse.com/1/files/hello.txt

    # curl -X POST -H "X-Parse-Application-Id: cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW" -H "X-Parse-REST-API-Key: nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd" -H "Content-Type: application/json" -d '{"name":"test file", "url": { "name": "tfss-e195c6c6-3867-43c6-a8be-b635cf01bcff-hello.txt", "__type": "File"} }' https://api.parse.com/1/classes/PlayerProfile
    # {"createdAt":"2015-03-11T19:46:53.178Z","objectId":"Wg9juQKuKs"}
    # curl -X POST -H "X-Parse-Application-Id: cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW" -H "X-Parse-REST-API-Key: nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd" -H "Content-Type: text/plain" -d 'Pong!' https://api.parse.com/1/files/super.txt
    # curl -X POST -H "X-Parse-Application-Id: cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW" -H "X-Parse-REST-API-Key: nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd" -H "Content-Type: application/json" -d '{"name":"test file", "url": { "name": "tfss-152ba0b5-026f-420a-b78d-b924bbd2f05e-super.txt", "__type": "File"} }' https://api.parse.com/1/classes/PlayerProfile


    # curl -X POST -H "X-Parse-Application-Id: cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW" -H "X-Parse-REST-API-Key: nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd" -H "Content-Type: text/plain" -d 'Pong!' https://api.parse.com/1/files/super.txt

  end

  def rest
    puts "hello" * 500
     file = "/Users/adityanarayan/Desktop/orel/Hubb_Music/public/#{@music.attachment.url}"
    puts file
  puts
    request = RestClient::Request.new(
        :method => :post,
        :url => 'https://api.parse.com/1/files/daftpunk.mp3',
        :headers => {
            :'X-Parse-Application-Id' => "cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW",
            :'X-Parse-REST-API-Key' => "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd",
            :'Content-Type' => 'audio/mpeg'
        },
         :payload => {
            :multipart => true,
            :file => File.new(file, 'rb')
        })
    response =  request.execute
    parsed_json = JSON(response)
    puts parsed_json
    puts parsed_json["name"]


    url = "https://api.parse.com/1/classes/PlayerProfile"
    payload = {
        :name => "#{@music.title}",
        :url => {
            :__type => "File",
            :name => parsed_json["name"]

        }
    }

    headers = {
        :'X-Parse-Application-Id' => "cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW",
        :'X-Parse-REST-API-Key' => "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"

    }


    request = RestClient::Request.new(
        :method => :post,
        :url => 'https://api.parse.com/1/classes/PlayerProfile',
        :content_type => "application/json",
        :headers => {
            :'X-Parse-Application-Id' => "cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW",
            :'X-Parse-REST-API-Key' => "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
        },
        :payload => {
             :name => "my file",
            :url => {
                :__type => "File",
                :name => parsed_json["name"]

            }

        })


    uri = URI('https://api.parse.com/1/classes/PlayerProfile')
    req = Net::HTTP::Post.new(uri)
    req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
    req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
    req['Content-Type'] = 'application/json'
    http = Net::HTTP.new(uri.host, uri.port)
    req.body = payload.to_json
    http.use_ssl = true
    http.request(req)

    #RestClient.post url, payload.to_json, { :content_type => "application/json", :headers => headers.to_json}

    # RestClient.post "https://api.parse.com/1/classes/PlayerProfile", {:name => "my file",
    #                                                                   :url => {
    #                                                                       :__type => "File",
    #                                                                       :name => parsed_json["name"]
    #
    #                                                                   } }.to_json,
    #                 :content_type => :json, :headers => {
    #         :'X-Parse-Application-Id' => "cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW",
    #         :'X-Parse-REST-API-Key' => "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
    #
    #     }


  end

  def index
    puts "*" * 100
    @musics = Music.all
    respond_with(@musics)
  end

  def show
    respond_with(@music)
  end

  def new
    @music = Music.new
    respond_with(@music)
  end

  def edit
  end

  def create
    @music = Music.new(music_params)
    # render json:params
      if  @music.save
       rest
        # parseupload
      # respond_to do |format|
      #   format.html
        # format.json {render :json}
        #post request to parse to send filename
     # end
        redirect_to musics_path, notice: "The video has been uploaded!"
      else
        respond_with(@music)
      end
  end

  def update
    @music.update(music_params)
    respond_with(@music)
  end

  def destroy
    @music.destroy
    respond_with(@music)
  end

  private
    def set_music
      @music = Music.find(params[:id])
    end

    def music_params
      params.require(:music).permit(:title, :description, :name, :attachment)
    end
end
