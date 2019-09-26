class AddShortenedUrlToProfile < ActiveRecord::Migration[5.2]
  def chang
    add_column :profiles, :shortened_url, :string
  end
end
