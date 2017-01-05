class Url < ApplicationRecord

  validates :given_url, presence: true

  after_create :generate_slug

  has_many :logs, dependent: :destroy, inverse_of: :url

  private

  def generate_slug
    self.slug = Digest::MD5.hexdigest("#{given_url}/#{id}").slice(0..6)
    save
  end

end
