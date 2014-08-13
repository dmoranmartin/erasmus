class WordsController < ApplicationController
	  before_filter :authenticate_user!, except: [:index]
		  add_breadcrumb "home", :root_path
  
	def index
		@words = Word.all
		@alphabet = ("a".."z").to_a

		add_breadcrumb "words", words_path
	end
	def new
		@word = Word.new
		add_breadcrumb "new", new_word_path
	end
	def create
		@word = Word.new entry_params

		if @word.save
			redirect_to action: 'index', controller:'words'
		else
			flash[:alert] = 'Something failed'
			render 'new'
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
		params.require(:word).permit(:name, :language)
	end

end
