require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe PurposePlatformQueuedClient::Client do
  specify { expect(subject).to respond_to :action }
  specify { expect(subject).to respond_to :unsubscribe }

  describe "instantiated" do
    subject { described_class.new(options) }

    context 'process_basic_auth' do
      let(:options) { { :host => 'foo.bar.com' } }
      let(:config) { subject.connection.configuration  }
      specify { expect(config.host).to eq 'foo.bar.com' }
    end
  end
end
