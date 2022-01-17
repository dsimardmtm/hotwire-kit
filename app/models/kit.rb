class Kit < ApplicationRecord
  belongs_to :button
  belongs_to :fabric
  belongs_to :lining

  validates :name, presence: true
  validates :fabric_id, presence: true
  validates :button_id, presence: true
  validates :lining_id, presence: true

  after_create_commit { broadcast_prepend_to "kits"  }
  after_update_commit { broadcast_replace_to "kits" }
  after_destroy_commit { broadcast_remove_to "kits" }
end
