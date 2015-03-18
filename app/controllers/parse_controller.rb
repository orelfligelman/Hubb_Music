class ParseController < ApplicationController

    # login
    request = RestClient::Request.new(
        :method => :post,
        :url => 'https://api.parse.com/1/login'
    :headers => {
        :'X-Parse-Application-Id' => "cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW",
        :'X-Parse-REST-API-Key' => "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
    },
        payload = {
            :data => url-encode '@user.name'
    :data => url-encode '@user.password'
    })
    response = request.execute
    parsed_json = JSON(response)
    puts parsed_json
    puts parsed_json["objectID"]
    puts parsed_json["sessionToken"]

  #   #retrieve contents of a user...
  #
  #   request = RestClient::Request.new(
  #       :method => :get,
  #       :url => "https://api.parse.com/1/users/#{@user.objectID}",
  #       :headers => {
  #           :'X-Parse-Application-Id' => "cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW",
  #           :'X-Parse-REST-API-Key' => "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
  #       })
  #   response = request.execute
  #
  #
  #   #update user model
  #   request = RestClient::Request.new(
  #       :method => :put,
  #       :url => "https://api.parse.com/1/users/#{@user.objectID}",
  #       :headers => {
  #           :'X-Parse-Application-Id' => "cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW",
  #           :'X-Parse-REST-API-Key' => "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd",
  #           :'X-Parse-Session-Token' => #sessiontoken
  #       })
  #   response = request.execute
  #
  #
  #   #associate file with user
  #   request = RestClient::Request.new(
  #       :method => :put,
  #       :url => "https://api.parse.com/1/users/#{@user.objectID}",
  #       :headers => {
  #           :'X-Parse-Application-Id' => "cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW",
  #           :'X-Parse-REST-API-Key' => "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd",
  #           :'Content-Type' => 'application/json'
  #       }
  #   :payload => {
  #       :name:
  #       @user.password
  #   })
  #
  #   response = request.execute
  #
  #
  #   uri = URI('https://api.parse.com/1/classes/PlayerProfile')
  #   req = Net::HTTP::Post.new(uri)
  #   req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
  #   req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
  #   req['Content-Type'] = 'application/json'
  #   http = Net::HTTP.new(uri.host, uri.port)
  #   req.body = payload.to_json
  #   http.use_ssl = true
  #   http.request(req)
  #
  # end
  #
