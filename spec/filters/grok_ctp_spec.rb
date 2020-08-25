# encoding: utf-8
require_relative "../spec_helper"

require "logstash/filters/grok"

describe LogStash::Filters::Grok do
  subject { described_class.new(config) }
  let(:config) { {} }
  let(:event) { LogStash::Event.new(data) }
  let(:data) { { "message" => message } }

  before(:each) do
    subject.register
    subject.filter(event)
  end

  describe "commercetools" do
    let(:config) {
        {
            'match' => {
                "message" => ' comment: "%{DATA:comment}"'
            },
            'break_on_match' => false
        }
    }
    let(:data) { { "message" => 'I COMMAND  [conn2270261] command thingies.collection command: find { find: "thingy", filter: { thingyAttribute: "thingyValue" }, projection: { _id: 1 }, limit: 1, batchSize: 73981728, comment: "comment", $db: "thingies" } planSummary: COLLSCAN keysExamined:0 docsExamined:89801 cursorExhausted:1 numYields:703 nreturned:0 reslen:97 locks:{ Global: { acquireCount: { r: 1408 } }, MMAPV1Journal: { acquireCount: { r: 708 } }, Database: { acquireCount: { r: 704 } }, Collection: { acquireCount: { R: 704 }, acquireWaitCount: { R: 4 }, timeAcquiringMicros: { R: 14878 } } } protocol:op_msg 400ms', } }

    it "can parse comment from mongodb logs" do
        expect( event.get("comment") ).to eql "comment"
    end
  end
end
