class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy, :delete_image]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @ads = unless params[:q]
      Ad.all.order("created_at DESC")
      else
        Ad.includes(:tags).where('tags.title ilike ? OR category ilike ?' ,
          "%#{params[:q]}%", "%#{params[:q]}%").references(:tags)
        end
      end

  def show
    @ad = Ad.find(params[:id])
    @users = User.all
  end

  def new
      @ad = Ad.new
      @categories = Category.pluck(:title)

      @tags_musica =         Tag.where(category_id: 1)
      @tags_deporte =        Tag.where(category_id: 2)
      @tags_web =            Tag.where(category_id: 3)
      @tags_ciencias =       Tag.where(category_id: 4)
      @tags_ingles =         Tag.where(category_id: 5)
      @tags_otros =          Tag.where(category_id: 6)
      @tags_diferencial =    Tag.where(category_id: 7)
      @tags_coaching =       Tag.where(category_id: 8)
      @tags_asesorias =      Tag.where(category_id: 9)

    end

  def edit
    @ad = Ad.find(params[:id])
    @categories = Category.pluck(:title)


    @tags_musica =         Tag.where(category_id: 1)
    @tags_deporte =        Tag.where(category_id: 2)
    @tags_web =            Tag.where(category_id: 3)
    @tags_ciencias =       Tag.where(category_id: 4)
    @tags_ingles =         Tag.where(category_id: 5)
    @tags_otros =          Tag.where(category_id: 6)
    @tags_diferencial =    Tag.where(category_id: 7)
    @tags_coaching =       Tag.where(category_id: 8)
    @tags_asesorias =      Tag.where(category_id: 9)

  end

  def create
    @ad = Ad.new(ad_params)
    @ad.user = current_user

    params[:ad][:ads_tags].each do |id, value|
      @ad.tags.push Tag.find(id) if value == '1'

    end

    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Tu anuncio fue creado con éxito' }
        format.json { render :show, status: :created, location: @ad }
      else
        @categories = Category.pluck(:title)
        @tags = Tag.all
        format.html { render :new }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ads/1
  # PATCH/PUT /ads/1.json
  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Tu edición fue realizada con éxito.' }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url, notice: 'Tu anuncio fue eliminado con éxito' }
      format.json { head :no_content }
    end
  end

  def delete_image
    begin
      @image = ActiveStorage::Attachment.find(params[:image_id])
      @image.purge
        redirect_to ad_path(@ad), notice: 'Imagen eliminada con éxito'
        rescue ActiveRecord::RecordNotFound
      redirect_to ad_path(@ad), alert: 'Error al eliminar la imagen'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ad_params
      params.require(:ad).permit(:title, :category, :tag, :image, :instruction)
    end

end
