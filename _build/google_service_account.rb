# WIP

require 'google/apis/sheets_v4'
require 'googleauth'
require 'yaml'
require 'fileutils'
require 'dotenv'

Dotenv.load if File.exist?('.env') # Load .env variables

# Folder to store remote sheet data
DATA_FOLDER = "_data/new_remote"
FileUtils.mkdir_p(DATA_FOLDER)

# Path to your service account JSON file
CREDENTIALS_PATH = ENV['CREDENTIALS_PATH'] || "../service_acc.json"
APPLICATION_NAME = ENV['APPLICATION_NAME'] || 'GoogleSheetsSync'
SPREADSHEET_ID = ENV['SPREADSHEET_ID']

# Sheet names and output files
sheets_config = {
  ENV['SHEET']
}

# Define the scope for Google Sheets API
SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY

# Function to authorize using the service account
def authorize
  Google::Auth::ServiceAccountCredentials.make_creds(
    json_key_io: File.open(CREDENTIALS_PATH),
    scope: SCOPE
  )
end

# Initialize the GOOGLE Sheets API service
sheets_service = Google::Apis::SheetsV4::SheetsService.new
sheets_service.client_options.application_name = APPLICATION_NAME
sheets_service.authorization = authorize

# Map of filename to their respective Spreadsheet IDs and sheet names

sheets_config = {
  'speakers' => {
    spreadsheet_id: spreadsheet_id,
    sheet_name: ENV['SHEET1_NAME'] || 'Sheet1'
  },
  'sponsors' => {
    spreadsheet_id: spreadsheet_id,
    sheet_name: ENV['SHEET2_NAME'] || 'Sheet2'
  }
}