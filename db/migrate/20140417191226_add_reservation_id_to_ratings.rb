class AddReservationIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :reservation_id, :integer
  end
end
