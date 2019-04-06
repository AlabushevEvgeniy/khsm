# (c) goodprogrammer.ru
#
# Контроллер, отображающий список и профиль юзера
class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
  end

  def show
    if user_signed_in?
      @game_question = @game.current_game_question
    else
      redirect_to new_user_session_path, alert: I18n.t('controllers.games.not_your_game')
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
