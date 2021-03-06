require_relative '../spec_helper'

describe 'JsonMoviesParser' do
  describe '#to_hashes' do
    subject { JsonMoviesParser.new }
    it 'return some valid ids for a given search' do
      hashes = subject.to_hashes FilmAffinity::Search.new('truman').movies
      expect(hashes.map { |hash| hash['id'] }).to include(193_232, 504_889)
    end
  end
end
