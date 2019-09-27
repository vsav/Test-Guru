class ChangeGistsGistUrl < ActiveRecord::Migration[6.0]
  def change
    rename_column :gists, :gist_url, :url
  end
end
