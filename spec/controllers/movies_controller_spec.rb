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

  describe 'new' do
    it 'it should  select the new movie template for rendering' do
      get :new
      response.should render_template('new')
    end
  end

  describe 'create' do
<<<<<<< HEAD
    # fixtures :movies
    # before :each do
    #   @fake_new_movie = movies(:new_movie)
    # end
    it 'should call the modle method performe create' do
      Movie.should_receive(:create!).with(title: 'Milk', rating: 'R')
    # post :create, :movie => {:title => "Milk"}
=======
    it 'should call the model method performe create!' do
      Movie.should_receive(:create!).with({"title" => 'Milk', "rating" => 'R'})
        .and_return(stub_model(Movie))
      post :create, :movie => {:title => 'Milk', :rating => 'R'}
    end
    it 'should redirected to movies path after create new object' do
>>>>>>> 9ee423691db32526aa52310115691337336f9751
      post :create, :movie => {:title => 'Milk', :rating => 'R'}
      response.should redirect_to movies_path
    end
  end

  describe 'edit' do
    fixtures :movies
    before :each do
      @fake_movie = movies(:star_wars_movie)
    end
    it 'should make the movie avaliabe to the template' do
      get :edit, :id => @fake_movie.id
      assigns[:movie].should == @fake_movie
    end
  end

  describe 'update' do
    fixtures :movies
    before :each do
      @fake_movie = movies(:star_wars_movie)
    end
    it 'should pass the modle the correct movie need to updated' do
      @fake_movie.rating = 'PG-15'
      Movie.should_receive(:update_attributes!).with({"title" => @fake_movie.title, "rating" => @fake_movie.rating, "director" => @fake_movie.director}).and_return(stub_model(Movie))
      post :update, {:id => @fake_movie.id, :movie => {:title => @fake_movie.title,
          :rating => @fake_movie.rating, :director => @fake_movie.director}}
    end
  end
end

