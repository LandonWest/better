require 'spec_helper'

describe Issue, '#ready_for_accepted?' do

  let(:issue) { Issue.new }

  context 'when IssueStatus is accepted' do
    it 'returns true' do
      issue.status = IssueStatus.accepted
      issue.ready_for_accepted?.should be true
    end
  end

  context 'when accept_total is < 1 or points are nil' do
    it 'returns false' do
      issue.points = nil
      issue.ready_for_accepted?.should be false
    end
  end

  context 'when accept_total > 0 and updated prior to cutoff date' do
    it 'returns true' do
      cutoff_date = Setting::LAZY_MAJORITY_LENGTH
      issue.accept_total = 5
      issue.points = 1
      issue.updated_at = DateTime.now - cutoff_date - 1
      issue.ready_for_accepted?.should be true
    end
  end

end
