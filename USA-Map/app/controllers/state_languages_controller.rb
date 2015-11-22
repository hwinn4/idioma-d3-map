class StateLanguagesController < ApplicationController
  def new
  end

  def show
    state_name = params["name"].split("-").map {|word| word.capitalize}
    state_name = state_name.join(" ")
    @state = State.find_by(name: state_name)
    @state_languages = @state.state_languages
    string = render_to_string(partial: "state_languages/data", locals: {:language_info => @state_languages})
    render json: {text: string}
  end

end