class StatesSeeder
  STATES = [
   ["Alabama", "AL"],
   ["Alaska", "AK"],
   ["Arizona", "AZ"],
   ["Arkansas", "AR"],
   ["California", "CA"],
   ["Colorado", "CO"],
   ["Connecticut", "CT"],
   ["Delaware", "DE"],
   ["Florida", "FL"],
   ["Georgia", "GA"],
   ["Hawaii", "HI"],
   ["Idaho", "ID"],
   ["Illinois", "IL"],
   ["Indiana", "IN"],
   ["Iowa", "IA"],
   ["Kansas", "KS"],
   ["Kentucky", "KY"],
   ["Loisiana", "LA"],
   ["Maine", "ME"],
   ["Maryland", "MD"],
   ["Massachesetts", "MA"],
   ["Michigan", "MI"],
   ["Minnesota", "MN"],
   ["Mississipi", "MS"],
   ["Missouri", "MO"],
   ["Montana", "MT"],
   ["Nebraska", "NE"],
   ["Nevada", "NV"],
   ["New Hempshire", "NH"],
   ["New Jersey", "NJ"],
   ["New Mexico", "NM"],
   ["New York", "NY"],
   ["North Carolina", "NC"],
   ["North Dakota", "ND"],
   ["Ohio", "OH"],
   ["Oklahoma", "OK"],
   ["Oregon", "OR"],
   ["Pennsylvania", "PA"],
   ["Rhode Island", "RI"],
   ["South Carolina", "SC"],
   ["South Dakota", "SD"],
   ["Tennessee", "TN"],
   ["Texas", "TX"],
   ["Utah", "UT"],
   ["Vermont", "VT"],
   ["Virginia", "VA"],
   ["Washington", "WA"],
   ["West Virginia", "WV"],
   ["Wisconsin", "WI"],
   ["Wyoming", "WY"]
  ]
    def State (name, abbreviation)
      @name = name
      @abbreviation = abbreviation
    end

    def self.seed!
      STATES.each do |state_info|
        name, abbreviation = state_info
        State.find_or_create_by!(name: name, abbreviation: abbreviation)
    end
  end
end

# class State
#   def initialize(name, abbreviation)
#     @name = name
#     @abbreviation = abbreviation
#   end
# end
