class Api::V1::AthletesController < ApplicationController

    #Only render the athletes of the current user
    def index
        athletes = Athlete.select{
            |athlete| athlete.user_id == current_user.id
        }
        render json: athletes
    end

    def show
        athlete = Athlete.find(params[:id])
        render json: { athlete: AthleteSerializer.new(athlete) }
    end

    def create
        athlete = Athlete.create(athlete_params)
        if athlete.valid?
            render json: { athlete: AthleteSerializer.new(athlete) }, status: :created
        else
            render json: { errors: athlete.errors.full_messages }
        end
    end

    def update
        athlete = Athlete.find(params[:id])
        athlete.update(athlete_params)
        if athlete.valid?
            render json: { athlete: AthleteSerializer.new(athlete) }
        else
            render json: { errors: athlete.errors.full_messages }
        end
    end

    def destroy
        athlete = Athlete.find(params[:id])
        athlete.destroy
        render json: { message: "Athlete Deleted" }, status: :ok
    end

    private

    def athlete_params
        params.require(:athlete).permit(:image, :full_name, :phone_number, :address, :height, :weight, :birthday, :positions, :high_school, :graduation_year, :gpa, :user_id)
    end
end
