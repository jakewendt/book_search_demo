class SearchesController < ApplicationController

	def show
		@results = Sunspot.search(Book,Chapter,Verse) do
			keywords params[:q]
			facet :class 
		end
	end

end
