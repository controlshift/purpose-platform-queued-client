require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe PurposePlatformQueuedClient::Action do
  subject { PurposePlatformQueuedClient.new(host: 'test.com') }

  before(:each) do
    logger = double
    allow(logger).to receive(:debug).and_return(true)

    allow(PurposePlatformQueuedClient).to receive(:logger).and_return(logger)
    allow(Vertebrae::Base).to receive(:logger).and_return(logger)
  end

  let(:request_body) { {"guard"=>"", "hp_enabled"=>"true", "member"=>{"email"=>"george@washington.com", "first_name"=>"George", "last_name"=>"Washington", "postcode"=>"11238"}, "org"=>"foo"}}
  let(:request_path) { '/action' }
  let(:body) {'{"foo": "bar"}'}

  describe "success" do
    let(:status) { 200 }

    before(:each) do
      stub_post(request_path).with(body: request_body).to_return(:body => body, :status => status,
                                       :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should return a single object" do
      subject.action.create(member: {first_name: 'George', last_name: 'Washington', email: 'george@washington.com', postcode: '11238'}, org: 'foo')

    end
  end
end
