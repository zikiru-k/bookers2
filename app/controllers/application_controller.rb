class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # resourceという引数には、ログインを実行したモデルのデータ、今回の場合はつまりログインしたUserのインスタンスが格納
  # ログイン後にマイページなどのログインしたユーザーに関連するようなページ遷移を実装したい場合は、このresourceを活用して実装
  # Home画面？
  def after_sign_in_path_for(resource)
    books_path
  end

  # ログイン画面？
  def after_sign_out_path_for(resource)
    about_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
