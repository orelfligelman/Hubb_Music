json.array!(@musics) do |music|
  json.extract! music, :id, :title, :description
  json.url music_url(music, format: :json)
end
