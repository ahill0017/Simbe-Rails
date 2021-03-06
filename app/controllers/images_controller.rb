class ImagesController < ApplicationController
	before_action :set_image, only: [:show, :update, :edit, :destroy]
	before_filter :authorize
	
	def index
		@images = Image.all
	end

	def new
		@image = Image.new
	end

	def create
		@image = Image.new(image_params)
		
		if @image.save
			redirect_to @image, notice: "Image saved"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @image.update(image_params)
			redirect_to @image, notice: 'Update successful'
		else
			render :edit
		end
	end

	def destroy
		@image = Image.find(params[:id])
		@image.destroy
		redirect_to images_path
	end

	private

	def image_params
		params.require(:image).permit(:name, :screen_cap, :selected)
	end
	
	def set_image
		@image = Image.find(params[:id])
	end
end
