class Log < ApplicationRecord

  belongs_to :url, inverse_of: :logs

end
