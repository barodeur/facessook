#encoding: utf-8
class CybersquattingController < ApplicationController
  respond_to :html, :json, :text

  layout false

  def index
    render :index
  end

  def how_much
  end

  def to_facebook
    request.format = :txt
    respond_with
  end
end
