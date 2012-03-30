require 'spec_helper'

describe MoviesController do
  describe 'searching similar' do
    fixtures :movies
    before :each do
      @fake_movie = movies(:star_wars_movie)
      @fake_sad_movie = movies(:alien_movie)
      @fake_results = [movies(:star_wars_movie), movies(:thx_1138_movie)]
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
      it 'should make the search similar results available to that template' do
        assigns(:movies).should == @fake_results
      end
    end
    describe 'for sad path where there is no director info for current movie' do
      it 'should return to the home page' do
        post :search_similar, {:id => @fake_sad_movie.id}
        response.should redirect_to movies_path
      end
    end
  end

  describe 'show' do
    fixtures :movies
    before :each do
      @fake_movie = movies(:star_wars_movie)
      @fake_sad_movie = movies(:alien_movie)
      @fake_results = [movies(:star_wars_movie), movies(:thx_1138_movie)]
    end
    it 'should call the model method that performs search movies with id' do
      Movie.should_receive(:find).with(@fake_movie.id).
        and_return(@fake_movie)
      id = @fake_movie.id
      post :show, {:id => id}
    end
  end

  describe 'create' do
    # fixtures :movies
    # before :each do
    #   @fake_new_movie = movies(:new_movie)
    # end
    it 'should call the modle model method performe create' do
      Movie.should_receive(:create!).with({"title" => 'Milk', "rating" => 'R'})
      # post :create, :movie => {:title => "Milk"}
      post :create, :movie => {:title => 'Milk', :rating => 'R'}
    end
  end
end

