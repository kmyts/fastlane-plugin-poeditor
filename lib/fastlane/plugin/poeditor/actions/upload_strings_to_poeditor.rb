require 'rest-client'

module Fastlane
  module Actions
    class UploadStringsToPoeditorAction < Action
      def self.run(params)
        UI.message("Uploading localization file #{params[:language_file_path]} to POEditor")

        response = RestClient.post('https://api.poeditor.com/v2/projects/upload/',
          :api_token => params[:api_key],
          :id => params[:project_id],
          :updating => 'terms',
          :language => params[:language],
          :file => File.new(params[:language_file_path], 'rb'),
        )

        UI.message("Finished uploading file")
        UI.message("#{response}")

        return response
      end

      def self.description
        "Upload strings to POEditor"
      end

      def self.authors
        ["Kostia Myts"]
      end

      def self.return_value
        "The content of POEditor API response"
      end

      def self.details
        "Upload strings to POEditor."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :language_file_path,
                                  env_name: "LANGUAGE_FILE_PATH",
                               description: "Langage file to upload in POEditor",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :api_key,
                                  env_name: "POEDITOR_API_KEY",
                               description: "API Key for POEditor",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :project_id,
                                  env_name: "POEDITOR_PROJECT_ID",
                               description: "Project Id in POEditor",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :language,
                                  env_name: "POEDITOR_LANGUAGE",
                               description: "Exported language",
                                  optional: false,
                                      type: String),

        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
