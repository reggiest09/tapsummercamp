class Child < ActiveRecord::Base
      enum sizes: [:YS,:YM,:Yl,:AS,:AM,:AL,:ALL]
    
    class << self
        def allergies
            ["GK", "DEF","MID", "FW"]
        end
    end
end
