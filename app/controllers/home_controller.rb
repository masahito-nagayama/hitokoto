require "csv"
class HomeController < ApplicationController
  def top
    csv = CSV.read("tmp/tweets.csv")
    @tweets =csv
  end
end
