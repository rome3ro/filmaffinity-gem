require_relative '../spec_helper'

describe 'FilmAffinity::Top' do
  describe '#create_document_html' do
    subject(:top) { FilmAffinity::Top.new }

    it '#create_document_html' do
      document_html = top.document_html 0
      expect(document_html).to respond_to(:search)
    end
  end

  describe '#movies' do
    context 'no options' do
      subject(:top) { FilmAffinity::Top.new }
      it 'should return an array' do
        movies = top.movies
        expect(movies).to be_an(Array)
      end
      it 'should return just FilmAffinity::Movie objects only' do
        movies = top.movies
        movies.each { |movie| expect(movie).to be_an(FilmAffinity::Movie) }
      end
      it 'should include "El Padrino"' do
        movies = top.movies
        el_padrino_movie = FilmAffinity::Movie.new(809_297, 'El padrino')
        expect(movies).to include_movie(el_padrino_movie)
      end
      it 'should return 30 movies' do
        movies = top.movies
        expect(movies.size).to eq(30)
      end
    end
    context 'with options' do
      options = {
        genre: 'BE',
        country: 'DE'
      }
      subject(:top) { FilmAffinity::Top.new options: options }
      it 'should return an array' do
        movies = top.movies
        expect(movies).to be_an(Array)
      end
      it 'should return just FilmAffinity::Movie objects only' do
        movies = top.movies
        movies.each { |movie| expect(movie).to be_an(FilmAffinity::Movie) }
      end
      it 'should include "Hijos del Tercer Reich (Miniserie de TV)"' do
        movies = top.movies
        hijos = FilmAffinity::Movie.new(831_118, 'Hijos del Tercer Reich (Miniserie de TV)')
        expect(movies).to include_movie(hijos)
      end
    end
    context 'with limit 60' do
      limit = 60
      subject(:top) { FilmAffinity::Top.new limit: limit }
      it 'should include "American History X"' do
        movies = top.movies
        american_history_x = FilmAffinity::Movie.new(261_972, 'American History X')
        expect(movies).to include_movie(american_history_x)
      end
      it 'should NOT include "Con la muerte en los talones"' do
        movies = top.movies
        con_movie = FilmAffinity::Movie.new(351_704, 'Con la muerte en los talones')
        expect(movies).not_to include_movie(con_movie)
      end
      it 'should return 60 movies' do
        movies = top.movies
        expect(movies.size).to eq(60)
      end
    end
    context 'with limit 132' do
      limit = 132
      subject(:top) { FilmAffinity::Top.new limit: limit }
      it 'should return 132 movies' do
        movies = top.movies
        expect(movies.size).to eq(132)
      end
    end
    context 'with limit 10' do
      limit = 10
      subject(:top) { FilmAffinity::Top.new limit: limit }
      it 'should return 10 movies' do
        movies = top.movies
        expect(movies.size).to eq(10)
      end
    end
  end
end
