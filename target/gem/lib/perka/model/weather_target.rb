# Generated File - DO NOT EDIT

require 'perka/model/list_target'

module Perka
  module Model 

    class WeatherTarget < ListTarget

      PROPERTY_NAMES = [
        :operation,
        :metric,
        :threshold,

        # The local minutes-of-day after which the availability of the coupon will 
        # not change for the remainder of the day.
        :local_decision_at,

        # The time of day for which the metric threshold must be met.
        :local_metric_at
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end