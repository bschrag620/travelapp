class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_destinations
  has_many :destinations, through: :trip_destinations
  has_many :activities
  validates :description, presence: true, allow_blank: false
  validates :budget, presence: true, allow_blank: false
  #default_scope { order(created_at: :desc) }

#add scope method for ordering by name in the controller - define here

	# playing around in rails c, to make find the correct methods

	# Trip.joins(trip_destinations: :destination)
	# to join trip and destination tables
	def self.with_destinations
		joins(trip_destinations: :destination)
	end

	# will group a table by common destination_ids
	def self.group_by_destinations
		with_destinations.group("destinations.id")
	end

	# take a grouped value
	def self.rank_by_destinations
		group_by_destinations.select("*, count(trips.id) as total_count").order("total_count desc")
	end

	# uses rank_by_destination, limit to top n values, ie top 5, 10, etc.
	def self.top_n_destinations(n)
		rank_by_destinations.limit(n)
	end	

end

# now to convert these class methods into scopes, checkout this link

# https://guides.rubyonrails.org/active_record_querying.html#scopes

# ex:
	# this scope would replace the .with_destinations class method
	# scope :with_destinations, -> { joins(trip_destinations: :destination)}

	# will replace group_by_destinations
	# scope :group_by_destinations, -> { with_destinations.group("destinations.id")}