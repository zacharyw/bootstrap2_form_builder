class PersonsController < ApplicationController
	def new
		@person = Person.new
	end
end
