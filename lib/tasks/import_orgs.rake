# require 'csv'
# desc "Import from CSV file"
# task :import_orgs do |task|
#   counter = 0
#   CSV.foreach("#{Rails.root.to_s}/public/listings.csv") do |row|
#     unless counter == 0
#       @organization = Organization.where(name: row[0]).first_or_create!
#       if row[1].present?
#         @organization.update_attributes(address: row[1], city: row[2], zipcode: row[3], phone: row[4], email: row[6], website: row[7])
#       else
#         @location = @organization.locations.create(name: row[0], address: row[9], city: row[10], zipcode: row[11], email: row[12])
#         @location.business_types.create(name: row[13])
#       end
#     end
#     counter += 1
#   end
# end