require 'spec_helper'

describe MoviesController do
  describe 'update' do
    fixtures :movies
    before :each do
      @fake_movie = movies(:star_wars_movie)
    end
    it 'should retrive the right movie from Movie model to update' do
      Movie.should_receive(:find).with(@fake_movie.id.to_s).and_return(@fake_movie)
      put :update, :id => @fake_movie.id, :movie => {:title => @fake_movie.title,
        :rating => @fake_movie.rating, :director => @fake_movie.director}
    end

    it 'should assigned the right movie by search Movie model' do
      assigns(:movie).should == @fake_movie
      put :update, :id => @fake_movie.id, :movie => {:title => @fake_movie.title,
        :rating => @fake_movie.rating, :director => @fake_movie.director}
    end
    
    it 'should pass specified movie object the correct fields to updated' do
      fake_new_rating = 'PG-15'
      @fake_movie.should_receive(:update_attributes!).with({"title" => @fake_movie.title, "rating" => fake_new_rating, "director" => @fake_movie.director}).and_return(:true)
      put :update, :id => @fake_movie.id, :movie => {:title => @fake_movie.title,
        :rating => fake_new_rating, :director => @fake_movie.director}
    end
  end
end

