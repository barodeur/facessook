#encoding: utf-8
class CybersquattingController < ApplicationController
  respond_to :html, :json, :text

  layout false

  def index
    render :index
  end

  def how_much
    @domain = 'facebook'
    @domain_price = 4.99

    # ß, à, á, â, ã, ä, å, æ, ç, è, é, ê, ë, ì, í
    # î, ï, ñ, ò, ó, ô, õ, ö, ù, ú, û, ü, ý, ÿ, œ
    squatting = {
      'a' => ['à', 'á', 'â', 'ã', 'ä', 'å', 'æ'],
      'b' => ['ß'],
      'c' => ['ç'],
      'e' => ['è', 'é', 'ê', 'ë', 'œ'],
      'i' => ['ì', 'í', 'î', 'ï'],
      'n' => ['ñ'],
      'o' => ['ò', 'ó', 'ô', 'ô', 'õ', 'ö', 'œ'],
      'u' => ['ù', 'ú', 'û', 'ü'],
      'y' => ['ý', 'ÿ']
    }

    return render text: 'too much chars', status: 400 if @domain.length > 15 || @domain.split(//).reduce(0){|n, c| squatting.keys.include?(c) ? n+1 : n} > 6

    @domains = @domain.split(//).reduce(['']) do |ary, c|
      ary = ary.map do |partial_domain|
        squatting[c].try(:map){|sc| partial_domain + sc}.try(:<<, partial_domain + c) || partial_domain + c
      end
      ary.flatten
    end

    @domains.delete @domain #delete original

    @price = @domain_price * @domains.length
    r = {domains: @domains, price: @price}
    respond_with r.to_json
  end

  def to_facebook
    request.format = :txt
    respond_with
  end
end
