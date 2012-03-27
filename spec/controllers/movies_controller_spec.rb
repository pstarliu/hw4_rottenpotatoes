require 'spec_helper'

describe MoviesController do
  describe 'searching similar' do
    it 'should call the model method that performs search movies with same director' do
      fake_movie = mock('Movie')
      fake_movie.stub(:director).and_return('George Lucas')
      fake_movie.stub(:id).and_return(1)
    fake_results = [mock('Movie'), mock('Movie')]
      # Movie.should_receive(:find_all_by_director).with(fake_movie.director).
      Movie.should_receive(:find_all_by_director).with(fake_movie.director).
      and_return(fake_results)
    post :search_similar, {:id => fake_movie.id}
    end
  end
end
