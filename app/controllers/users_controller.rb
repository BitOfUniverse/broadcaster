class UsersController < ApplicationController
  before_action :authenticate_user!

  def stream
    @stream     = current_user.stream || current_user.create_stream
    gon.opentok = opentok_data(@stream)
  end

  def watch
    @stream = User.find(params[:id]).stream
    gon.opentok = opentok_data(@stream)
  end

  private

  def opentok_data(stream)
    token = OpenTokClient.generate_token(stream.opentok_session_id)
    { sessionId: stream.opentok_session_id, apiKey: Figaro.env.opentok_api_key, token: token }
  end
end