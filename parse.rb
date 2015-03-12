def parseupload
  puts "8" * 100
  boundary
  file = "/Users/adityanarayan/Desktop/orel/Hubb_Music/public/uploads/tmp/1425592405-11760-3834/01._Good_Times_Bad_Times.mp3"

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
  end