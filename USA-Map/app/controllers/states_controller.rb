class StatesController < ApplicationController
  def new
    
  end

  def show
    @data = State.state_language_hash(params["language_num"])
    @state_names = @data.keys
    @lang_colors = State.language_colors
    string = render_to_string(partial: "states/key", locals: {:lang_colors => @lang_colors})
    render json: {data: @data, state_names: @state_names, text: string}

  end
end