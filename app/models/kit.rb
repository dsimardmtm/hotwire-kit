class Kit < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, against: %i[name fabric_id lining_id button_id], using: { tsearch: { prefix: true } }

  belongs_to :button
  belongs_to :fabric
  belongs_to :lining

  validates :name, presence: true
  validates :fabric_id, presence: true
  validates :button_id, presence: true
  validates :lining_id, presence: true

  after_create_commit {
    broadcast_prepend_to "kits",
                         target: "kits_list",
                         partial: "kits/kit"
  }
  after_update_commit { broadcast_replace_to "kits" }
  after_destroy_commit { broadcast_remove_to "kits" }
end
