require 'spec_helper'

module MyTimeline
  describe ApplicationHelper do

    class HelperTester
      include MyTimeline::ApplicationHelper

      class MainApp
        def self.bar_path
          "/bar"
        end
      end

      def main_app
        MainApp
      end
    end

    subject { HelperTester.new }

    describe "#method_missing" do

      it "with a non url/path method, herps and dies" do
        expect { subject.foo_and_bar }.to raise_error NoMethodError
      end

      it "with a url/path method not found in the main app, herps and dies" do
        expect { subject.foo_path }.to raise_error NoMethodError
      end

      it "passes a valid url/path method back to the main app" do
        expect(subject.bar_path).to eq "/bar"
      end
    end
  end
end
