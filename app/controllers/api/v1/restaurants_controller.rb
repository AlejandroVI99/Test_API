
module Api
	module V1
		class RestaurantsController < ApplicationController
			#method to show all the restaurants
			def index
				@restaurants = Restaurant.all
				render json:{
					status: 'success',
					message: 'Welcome',
					data: @restaurants
				}, status: :ok
			end
			
			def new
				@restaurant = Restaurant.new
			end

			#method to create a new restaurant
			def create
				@restaurant = Restaurant.create(restaurant_params)
				if @restaurant.save
					render json:{
						status: 'success',
						message: 'creation success',
						data: @restaurant
					}, status: :ok
					else
						render json:{
							status: 'error',
							message: 'not created',
							data: @restaurant
						}, status: :unprocessable_entity
				end

			end

			#method to updated data of a restaurant
			def update
				set_restaurant
				if @restaurant.update(restaurant_params)
					render json:{
						status: 'success',
						message: 'updated success',
						data: @restaurant
					}, status: :ok
					else
						render json:{
							status: 'error',
							message: 'not updated',
							data: @restaurant
						}, status: :unprocessable_entity
				end
			end
			
			#method to delete a restaurant 
			def destroy
				set_restaurant
				if @restaurant.destroy
					render json:{
						status: 'success',
						message: 'destroy success',
						data: @restaurant
					}, status: :ok
					else
						render json:{
							status: 'error',
							message: 'not created',
							data: @restaurant
						}, status: :unprocessable_entity
				end
			end


#---------------------------------------------------------------
			#methods to do all the statistics operations
			def statistics(latitude = params['latitude'].to_f,longitude = params['longitude'].to_f,z= params['z'].to_f)
				restaurant_loop(latitude,longitude,z)
				render json:{
					status: 'success',
					message: 'operations success',
					count: @contador, 
					avg:@promedio,
					std: @std
				}, status: :ok

			end

			def restaurant_loop(latitude,longitude,z)
				@contador = 0
				@list_rating = []
				Restaurant.all.each do |restaurant|
					x = latitude - restaurant.lat
					y = longitude - restaurant.lng
					formula = x**2 + y**2
					if formula <= z**2
						@contador+=1
						@list_rating.push(restaurant.rating)
					end
				end
				statistics_operations(@list_rating)
			end
			
			def statistics_operations(list_rating)
				@promedio = 0
				@suma = 0
				@variance = 0
				@std = 0
				@promedio = @list_rating.sum(0.0) / @list_rating.size
				@suma = @list_rating.sum(0.0) {|element| (element - @promedio)**2}
				@variance = @suma/ (@list_rating.size - 1)
				@std = Math::sqrt(@variance)
			end
			
	#-----------------------------------------------------------------	
			
			def set_restaurant
				@restaurant = Restaurant.find(params[:id])
			end
			
			private

			def restaurant_params
				info = params.require(:restaurant).permit(:rating, :name, :site, :email, :phone, :street, :city,
					:state, :lat, :lng)
			end
		
		end 
	end
end