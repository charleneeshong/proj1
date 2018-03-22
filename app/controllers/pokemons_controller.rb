class PokemonsController < ApplicationController
	
	def show
		#@pokemons = Pokemon.all
		@pokemons = Pokemon.where(trainer_id: @trainer.id)
	end

	def new
		@pokemon = Pokemon.new
	end

	def create
		@pokemon = Pokemon.new(pokemon_params)
		@pokemon.health = 100
		@pokemon.level = 1
		@pokemon.trainer_id = current_trainer.id

		if @pokemon.save
			redirect_to trainer_path(current_trainer)
		else
			#flash[:error] = "Error: Name was not given or is already taken."
			flash[:error] = @pokemon.errors.full_messages.to_sentence
			redirect_to new_path
		end
	end

	def destroy
		@pokemon = Pokemon.find(params[:id])
		@pokemon.destroy
	 
		redirect_to trainer_path(current_trainer)
	end

	def capture
		#@pokemon = Pokemon.new(pokemon_params)
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer_id = current_trainer.id
		@pokemon.save

		redirect_to :root
	end

	def damage
		#@pokemon = Pokemon.new(pokemon_params)
		@pokemon = Pokemon.find(params[:id])
		temp = @pokemon.health
		if temp - 10 <= 0 #pokemon health <= 0 after damage
			@pokemon.destroy 
		else
			@pokemon.health -= 10
		end
		@pokemon.save

		redirect_to trainer_path(current_trainer)
	end

	private
	    def pokemon_params
	      params.require(:pokemon).permit(:name, :level, :ndex, :trainer_id)
	    end
end
