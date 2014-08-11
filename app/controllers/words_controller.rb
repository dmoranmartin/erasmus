class WordsController < ApplicationController
	def index
	end
	def new
		@word = Word.create
	end
	def create
		@word = @word.new entry_params

		if @word.save
			redirect_to action: 'new', controller:'words'
		else
			render 'error'
			
		end
	end

	private

	def entry_params
		params.require(:word).permit()
	end

end
