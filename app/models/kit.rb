class Kit < ApplicationRecord
  belongs_to :button
  belongs_to :fabric
  belongs_to :lining
end
