class MusicsController < ApplicationController
  include ActionController::Live
  before_action :set_music, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @musics = Music.all
    respond_with(@musics)
    render stream: true
    10.times do
      response.stream.write "new line"
    end
  ensure
    response.stream.close
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
      if  @music.save
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
      params.require(:music).permit(:title, :description, :name)
    end
end
