class MusicsController < ApplicationController
  before_action :set_music, only: [:show, :edit, :update, :destroy]
  respond_to :html

  # def send_file
  #   puts "*" * 100
  #   file_path = "#{Rails.root}/public/#{params[:attachment]}"
  #   send_file file_path, :filename => params[:attachment], :disposition => 'attachment'
  # end

  def parse

  puts "8" * 100
  uri = URI('http://www.api.parse.com' )
  req = Net::HTTP::Post.new(uri)
  req['X-Parse-Application-Id'] ="cg6iHL8YwU72M53e8U0XZkNeE698IVbBDo2o5LEW"
  req['X-Parse-REST-API-Key'] = "nd8iZTjMxdTcqHSNMuGign8RpvirPaLHcs8gLHKd"
  req['Content-Type'] = 'audio/mpeg'
#   file = Parse::File.new({
#   :body => "Hello World!",
#   :local_filename => "hello.txt",
#   :content_type => "text/plain"
# })
# file.save
Net::HTTP.get(URI('https://api.parse.com/1/files/hello.txt'))
  end
  # # res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  # # http.request(req)
  # end
  # case res
  # when Net::HTTPSuccess, Net::HTTPRedirection
  #   # OK
  # else
  #   res.value
  # end
# end
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
        parse
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
