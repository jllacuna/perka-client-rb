# Generated File - DO NOT EDIT

require 'perka/model/list_target'

module Perka
  module Model 

    # Classifies customers based on their performance within the <entityReference 
    # payloadName='program'> Program</entityReference> associated with a <entityReference 
    # payloadName='programType'> ProgramType</entityReference>.
    class ParticipationTarget < ListTarget

      PROPERTY_NAMES = [

        # The program type for which punches should be found.
        :program_type,
        :metric,

        # The comparison value.
        :threshold,

        # A moving window used to filter the statistics.
        :window_days
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/program_type'
      TYPE_MAP = {
        :program_type => Perka::Model::ProgramType
      }

    end
  end
end