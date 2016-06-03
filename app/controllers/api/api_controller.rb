class Api::ApiController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :change_unit_price

  def change_unit_price
    if params['unit_price']
      params['unit_price'] = ((params['unit_price'].to_f) * 100).round
    end
  end

end
