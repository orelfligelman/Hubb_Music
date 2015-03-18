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




  def rest
    puts "hello" * 500
    file = "/Users/adityanarayan/Desktop/orel/Hubb_Music/public/#{@music.attachment.url}"
    puts file
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
