class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(_resource)
    wallets_path
  end

  def configure_permitted_parameters
    # 新規登録時に許可するストロングパラメータ
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:image, :nickname, :gender_id, :last_name, :first_name, :last_kana, :first_kana,
                                             :birthday, { wallet_attributes: %i[stock_quantity wallet_name] }])
    # ログイン時に許可するストロングパラメータ
    devise_parameter_sanitizer.permit(:sign_in,
                                      keys: [:nickname, :gender_id, :last_name, :first_name, :last_kana, :first_kana,
                                             :birthday, { wallet_attributes: [:stock_quantity] }])
    # ユーザー情報更新時に許可するストロングパラメータ
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:nickname, :gender_id, :last_name, :first_name, :last_kana, :first_kana,
                                             :birthday, { wallet_attributes: [:stock_quantity] }])
  end
end
