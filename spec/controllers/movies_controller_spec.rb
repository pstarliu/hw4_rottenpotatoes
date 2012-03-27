require 'spec_helper'

describe MoviesController do
  describe 'searching similar' do
    fixtures :movies
    before :each do
      @fake_movie = movies(:star_wars_movie)
      @fake_results = [mock('Movie'), mock('Movie')]
    end
    it 'should call the model method that performs search movies with same director' do
      Movie.should_receive(:find_all_by_director).with(@fake_movie.director).
        and_return(@fake_results)
      post :search_similar, {:id => @fake_movie.id}
    end
    describe 'after valid search' do
      before :each do
        post :search_similar, {:id => @fake_movie.id}
      end
    it 'should select the Search Similar Results template for rendering' do
        response.should render_template('search_similar')
      end
    end
  end
end
