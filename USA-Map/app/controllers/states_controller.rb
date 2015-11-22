class StatesController < ApplicationController
  def new
    
  end

  def show
    @data = State.state_language_hash(params["language_num"])
    @state_names = @data.keys
    render json: {data: @data, state_names: @state_names}

  end
end