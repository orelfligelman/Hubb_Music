class ParseusersController < ApplicationController
  # require 'parse-ruby-client'
  require 'rest_client'
  # Parse.init :application_id => "<cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW>",
  #            :api_key        => "<nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd>",
  #            :quiet           => true | false
  before_action :set_parseuser, only: [:show, :edit, :update, :destroy]
  respond_to :html



  def create_parse_user
   name =  @parseuser.name
   password =  @parseuser.password
   email = @parseuser.email
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
       :email => email
   }.to_json
   http.use_ssl = true
   response = http.request(req)
   puts response.body
   puts response.body["objectID"]
   puts response.body{"objectID"}
   objID = response.body.split(',')[1].split("\"" )[3]
   sesstoken = response.body.split(',')[2].split("\"")[3]
   puts objID
   puts sesstoken
  end
  #
  # def login_parse_user
  #   # login
  #   name =  @parseuser.name
  #   password =  @parseuser.password
  #   puts @parseuser.password
  #   uri = URI('https://api.parse.com/1/login')
  #   req = Net::HTTP::Get.new(uri)
  #   req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
  #   req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
  #   req['Content-Type'] = 'application/json'
  #   http = Net::HTTP.new(uri.host, uri.port)
  #   req.body = {
  #       :username => p,
  #       :password => password
  #   }.to_json
  #   http.use_ssl = true
  #   response = http.request(req)
  #   puts response.body
  #   # parsed_json = JSON(response)
  #   # puts parsed_json
  #   # puts parsed_json["objectID"]
  #   # puts parsed_json["sessionToken"]
  # end

  def associate_file_with_user
    name =  @parseuser.name
    password =  @parseuser.password
    email = @parseuser.email
    puts name, password, email
    uri = URI('https://api.parse.com/1/users/TEx1GNvAql')
    req = Net::HTTP::Put.new(uri)
    req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
    req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
    req['Content-Type'] = 'application/json'
    req['X-Parse-Session-Token'] = 'ToB5KuvZWpT5p1ciZ2nPNER3S'
    http = Net::HTTP.new(uri.host, uri.port)
    req.body = {
        :email => "w@me.com",
        :username => "vag"
    }.to_json
    http.use_ssl = true
    response = http.request(req)
    puts response.body
  end

  def index
    @parseusers = Parseuser.all
    respond_with(@parseusers)
  end

  def show
    respond_with(@parseuser)
  end

  def new
    @parseuser = Parseuser.new
    respond_with(@parseuser)
  end

  def edit
     # login_parse_user
    associate_file_with_user
  end

  def create
    @parseuser = Parseuser.new(parseuser_params)
    @parseuser.save
    create_parse_user
    # user = Parse::User.new({
    #                            :username => "cooldude6",
    #                            :password => "p_n7!-e8",
    #                            :phone => "415-392-0202"
    #                        })
    # user.save
    respond_with(@parseuser)
  end

  def update
    @parseuser.update(parseuser_params)
    respond_with(@parseuser)
  end

  def destroy
    @parseuser.destroy
    respond_with(@parseuser)
  end

  private
    def set_parseuser
      @parseuser = Parseuser.find(params[:id])
    end

    def parseuser_params
      params.require(:parseuser).permit(:name, :email, :password)
    end
end
