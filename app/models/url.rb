require 'retriable'

class Url < ApplicationRecord

  validates :given_url, presence: true
  validates :slug, uniqueness: true

  after_create :generate_slug

  has_many :logs, dependent: :destroy, inverse_of: :url

  private

  def generate_slug
    self.slug = SecureRandom.uuid
    save
  end

end


 #base62 = ['0'..'9','A'..'Z','a'..'z'].map{|a| a.to_a}.flatten
 #base36 = {};['0'..'9','a'..'z'].map { |range| range.to_a }.flatten.each_with_index { |char, position| base36[char] = position} url10 = 0; url62 = "" # convert to base10 url36.reverse.chars.to_a.each_with_index { |c,i| url10 += base36[c] * (36 ** i)} # convert to base62 6.times{|i| url62 &lt;&lt; base62[url10 % 62]; url10 = url10 / 62}
