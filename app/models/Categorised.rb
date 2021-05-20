class Categorised < ApplicationRecord
  def self.to_csv
    CSV.generate do |csv|
      all.each do |result|
        csv << result
      end
    end
  end
end
