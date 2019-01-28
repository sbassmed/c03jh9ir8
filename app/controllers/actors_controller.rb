class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end
  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      redirect_to actors_path, notice: "El Actor fue publicado con éxito"
    else
      render :new
    end
  end


 private
 def actor_params
   params.require(:actor).permit(:name, :bio, :image_url)
 end

end
