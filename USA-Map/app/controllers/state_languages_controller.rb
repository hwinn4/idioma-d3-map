class StateLanguagesController < ApplicationController
  def new
    byebug
  end

  def show
    @state = State.find_by(name: params["name"])
    @state_languages = @state.state_languages
    string = render_to_string(partial: "state_languages/data", locals: {:state => @state, :language_info => @state_languages})
    render json: {text: string}
  end
end