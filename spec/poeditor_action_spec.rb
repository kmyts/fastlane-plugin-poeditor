describe Fastlane::Actions::PoeditorAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The poeditor plugin is working!")

      Fastlane::Actions::PoeditorAction.run(nil)
    end
  end
end
