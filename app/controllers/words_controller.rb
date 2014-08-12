class WordsController < ApplicationController
	  before_filter :authenticate_user!, except: [:index]
	def index
		@words = Word.all

	end
	def new
		@word = Word.new
	end
	def create
		@word = Word.new entry_params

		if @word.save
			redirect_to action: 'index', controller:'words'
		else
			render 'error'
		end
	end
	def show
		@word = Word.find params[:id]
	end

	def edit
		@word = Word.find params[:id]

	end

	def update
		@word = Word.find params[:id]
		if @word.update_attributes entry_params
			redirect_to action: 'index', controller: 'words', id: @word.id
			flash[:notice] = 'Word edited succesfully!'
		else
			flash[:alert] = 'Something failed'
			render 'edit'
		end
	end

	def destroy
		@word = Word.find params[:id]
		@word.destroy
		redirect_to action: 'index', controller: 'words', id: @word.id
	end


	private

	def entry_params
		params.require(:word).permit(:name, :origin, :definition, :photo, :video, :example)
	end

end
