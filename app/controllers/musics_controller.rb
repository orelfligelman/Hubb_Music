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

  def create_parse_user
    name =  "name"
    password =  "password"
    email = "example@email.com"
    puts name, password, email
    uri = URI('https://api.parse.com/1/users')
    req = Net::HTTP::Post.new(uri)
    req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
    req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
    req['Content-Type'] = 'application/json'
    http = Net::HTTP.new(uri.host, uri.port)
    req.body = {
        :username => name,
        :password => password,
        :email => email,
        :music => "hello",
    }.to_json
    http.use_ssl = true
    response = http.request(req)
    puts response.body
    objID = response.body.split(',')[1].split("\"" )[3]
    sesstoken = response.body.split(',')[2].split("\"")[3]
    puts objID
    puts sesstoken
  end


  def login_parse_user
    username =  @parseuser.name
    password =  @parseuser.password
    puts @parseuser.password
    uri = URI('https://api.parse.com/1/login?username=username&password=password')
    req = Net::HTTP::Get.new(uri)
    req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
    req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
    req['Content-Type'] = 'application/json'
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.request(req)
    puts response.body
    #not working
  end

  def validate_user_session
    uri = URI('https://api.parse.com/1/users/me')
    req = Net::HTTP::Get.new(uri)
    req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
    req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
    req['X-Parse-Session-Token'] = "VpRMPOhRHZI0fM1xfXeDaaQHP"
    req['Content-Type'] = 'application/json'
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.request(req)
    puts response.body
  end

  def create_base_object
    uri = URI('https://api.parse.com/1/classes/PlayerProfile/')
    req = Net::HTTP::Post.new(uri)
    req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
    req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
    req['Content-Type'] = 'application/json'
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.request(req)
    puts response.body
    obj = response.body.split(',')[1].split("\"" )[3]
    puts obj
    # associate_obj_with_a_user
    uri_two = URI("https://api.parse.com/1/classes/PlayerProfile/HxiRjCe0Qx")
    req = Net::HTTP::Put.new(uri_two)
    req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
    req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
    req['Content-Type'] = 'application/json'
    http = Net::HTTP.new(uri.host, uri.port)
    payload = {
        :user => {
            :__op => "AddRelation",
            :objects => [{
                :__type => "Pointer",
                :className => "PlayerProfile",
                :objectId => obj,
            }],
        }
    }
    req.body = payload.to_json
    http.use_ssl = true
    response = http.request(req)
    puts response.body
    # upload_file_to_parse
    file = "/Users/adityanarayan/Desktop/orel/Hubb_Music/public/#{@music.attachment.url}"
    puts file
    request = RestClient::Request.new(
        :method => :post,
        :url => 'https://api.parse.com/1/files/test',
        :headers => {
            :'X-Parse-Application-Id' => "cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW",
            :'X-Parse-REST-API-Key' => "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd",
            :'Content-Type' => 'audio/mpeg'
        },
        :payload => {
            :multipart => true,
            :file => File.new(file, 'rb'),
        })
    response =  request.execute
    puts response.body
    parsed_json = JSON(response)
    puts parsed_json["name"]
    payload = {
        :name => "#{@music.title}",
        :url => {
            :__type => "File",
            :name => parsed_json["name"]

        }
    }
    uri = URI('https://api.parse.com/1/classes/PlayerProfile/')
    req = Net::HTTP::Post.new(uri)
    req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
    req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
    req['Content-Type'] = 'application/json'
    http = Net::HTTP.new(uri.host, uri.port)
    req.body = payload.to_json
    http.use_ssl = true
    http.request(req)
    puts response.body
    # associate_file_with_object
     uri = URI('https://api.parse.com/1/classes/PlayerProfile/7vlDYp5GfO')
    req = Net::HTTP::Put.new(uri)
    req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
    req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
    req['Content-Type'] = 'application/json'
    http = Net::HTTP.new(uri.host, uri.port)
    payload = {
            :music => {
                :__type => "File",
                :name => parsed_json,
            }
     }
     req.body = payload.to_json
    http.use_ssl = true
    response = http.request(req)
    puts response.body
  end

  def check_users
    uri = URI('https://api.parse.com/1/users/QFlWE01NWM')
    req = Net::HTTP::Get.new(uri)
    req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
    req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
    req['Content-Type'] = 'application/json'
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.request(req)
    puts response.body
  end


  def index
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
        create_base_object
        # associate_with_a_user
        # upload_file_to_parse
        # associate_file_with_object
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
