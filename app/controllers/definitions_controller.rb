class DefinitionsController < ApplicationController
		before_filter :authenticate_user!, except: [:index]
	def index
		@words = Word.find params[:word_id]
		@definitions = @words.definitions.all

	end
	def new
		@word = Word.find params[:word_id]
		@definition = @word.definitions.new
	end
	def create
		@word = Word.find params[:word_id]
		@definition = @word.definitions.new entry_params

		if @definition.save
			redirect_to action: 'index', controller:'definitions'
		else
			render 'error'
		end
	end
	def show
		@word = Word.find params[:word_id]

		@definition = @word.definitions.find params[:id]
	end

	def edit
		@word = Word.find params[:word_id]
		@definition = @word.definitions.find params[:id]

	end

	def update
		@word = Word.find params[:word_id]
		@definition = @word.definitions.find params[:id]
		if @definition.update_attributes entry_params
			redirect_to action: 'index', controller: 'definitions', id: @definition.id
			flash[:notice] = 'definition edited succesfully!'
		else
			flash[:alert] = 'Something failed'
			render 'edit'
		end
	end

	def destroy
		@word = Word.find params[:word_id]

		@definition = @word.definitions.find params[:id]
		@definition.destroy
		redirect_to action: 'index', controller: 'definitions', id: @definition.id
	end


	private

	def entry_params
		params.require(:definition).permit(:text, :origin, :category, :video, :example)
	end
end
