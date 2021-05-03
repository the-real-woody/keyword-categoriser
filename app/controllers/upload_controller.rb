require 'csv'
require "json"
require "ibm_watson/authenticators"
require "ibm_watson/natural_language_understanding_v1"

class UploadController < ApplicationController

  def upload
  end

  def import
    myfile = params[:file]
    categorised = []
    CSV.foreach(myfile.path, headers: true) do |row|
      authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
        apikey: "PUTXECjlQk8hxh0UFrZldBVLOd_TB_UpMrxlMoikhYAQ"
      )

      natural_language_understanding = IBMWatson::NaturalLanguageUnderstandingV1.new(
        version: "2020-08-01",
        authenticator: authenticator
      )
      natural_language_understanding.service_url = "https://api.eu-gb.natural-language-understanding.watson.cloud.ibm.com/instances/d52e2833-b175-45cb-acdb-ec1ea3bbff9f"

      response = natural_language_understanding.analyze(
        text: "#{row[0]}",
        features: { categories: { limit: 1 } },
        language: "en"
      )
      unless response.result["categories"].blank?
        categorised << [row[0], response.result["categories"][0]["label"], row[1]]
      end
    end
    @display = categorised
  end
end
