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
            'match' => { "message" => "%{WORD:word}", "examplefield" => "%{NUMBER:num}" },
            'break_on_match' => false
        }
    }
    let(:data) { { "message" => "hello world", "examplefield" => "12345" } }

    it "passes for commercetools" do
        expect(true).to be false
    end
  end
end
