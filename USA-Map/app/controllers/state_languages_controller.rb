class StateLanguagesController < ApplicationController
  def new
    byebug
  end

  def show
    @state = State.find_by(name: params["name"])
    @state_languages = @state.state_languages
    # @state_languages = @state.languages
    byebug
    string = render_to_string(partial: "state_languages/data", locals: {:state => @state, :language_info => @state_languages})
    render json: {text: string}
    # respond_to do |format|
    #   if @state_languages
    #     format.html { redirect_to @state, notice: 'State info found.' }
    #     format.json { render :show, status: :created, location: @state }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @state.errors, status: :unprocessable_entity }
    #   end
    # end
  end
end