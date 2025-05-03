require 'csv'
require 'yaml'
require 'open-uri'
require 'fileutils'

# Folder to store remote sheet data
DATA_FOLDER = "_data/remote"

FileUtils.mkdir_p(DATA_FOLDER)

# Map of filenames to their respective CSV URLs
sheets = {
  'speakers' => 'https://docs.google.com/spreadsheets/d/e/2PACX-1vRk_Qim-zjDzZSwwztz5OIci_LGb7f0f5qmHC5YCQ5qJMMR8Bhg57Nviz4lG4qw143RcdRyt1YQbmjA/edit?gid=0&single=true&output=csv',
  'sponsors' => 'https://docs.google.com/spreadsheets/d/e/2PACX-1vRk_Qim-zjDzZSwwztz5OIci_LGb7f0f5qmHC5YCQ5qJMMR8Bhg57Nviz4lG4qw143RcdRyt1YQbmjA/edit?gid=561911824&single=true&output=csv'
}

sheets.each do |filename, url|
  puts "Fetching #{filename}..."
  csv_data = URI.open(url).read
  rows = CSV.parse(csv_data, headers: true)
  data = rows.map(&:to_h)

  output_file = File.join(DATA_FOLDER, "#{filename}.yml")
  File.write(output_file, data.to_yaml)
  puts "Saved to #{output_file}"
end
