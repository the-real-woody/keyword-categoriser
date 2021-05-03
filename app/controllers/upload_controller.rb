require 'csv'
require "ibm_watson"

class UploadController < ApplicationController
  def upload
  end

  def import
    myfile = params[:file]
    @rowarraydisp = CSV.read(myfile.path)
  end
end
