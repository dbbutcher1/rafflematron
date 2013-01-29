class AddPhotosToPrize < ActiveRecord::Migration
  def self.up
    add_column :prizes, :photo, :string
    add_column :prizes, :photo_file_name, :string
    add_column :prizes, :photo_content_type, :string
    add_column :prizes, :photo_file_size, :integer
  end

  def self.down
    remove_column :prizes, :photo_file_name
    remove_column :prizes, :photo_content_type
    remove_column :prizes, :photo_file_size
  end
end
