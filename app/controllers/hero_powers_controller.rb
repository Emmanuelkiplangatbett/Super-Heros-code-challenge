class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  
    def create
      hero_power = HeroPower.create!(hero_powers_params)
      if hero_power
        hero = Hero.find(params[:hero_id])
        render json: hero, include: ['powers'], status: :created
      end
    end
      
    private
  
    
    def hero_powers_params
      params.require(:hero_power).permit(:strength, :power_id, :hero_id)
    end
        
    def render_unprocessable_entity(invalid)
      render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end 
  end
  