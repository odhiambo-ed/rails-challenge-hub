class CurrentUserController < ApplicationController
  def index
    before_action :authenticate_user!
    def index
      render json: UserSerialzier.new(current_user).serializeable_hash[:data][:attributes], status: :ok
    end
  end
end
