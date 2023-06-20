module Cartable
  extend ActiveSupport::Concern

  private

  def cart
    session[:cart] ||= {}
  end
end
