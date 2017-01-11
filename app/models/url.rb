require 'retriable'

class Url < ApplicationRecord

  validates :given_url, presence: true
  validates :slug, uniqueness: true

  after_create :generate_slug

  has_many :logs, dependent: :destroy, inverse_of: :url

  private

  # Adds gem Retriable that tries 5 times, if it still fails it will retry after 0.5, 1.0, 2.0, 2.5 seconds
  # Assigns SecureRandom.uuid version 4 UUID is purely random
  def generate_slug
    Retriable.retriable tries: 5, intervals: [0.5, 1.0, 2.0, 2.5] do
      self.slug = SecureRandom.uuid
      save
    end
  end

end
