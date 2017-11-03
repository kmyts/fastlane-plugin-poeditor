module Fastlane
  module Helper
    class PoeditorHelper
      # class methods that you define here become available in your action
      # as `Helper::PoeditorHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the poeditor plugin helper!")
      end
    end
  end
end
