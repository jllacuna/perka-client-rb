# Generated File - DO NOT EDIT

require 'perka/model/list_target'

module Perka
  module Model 

    # A coupon target that enables coupons based upon weather predictions. The data-source 
    # for these targets is based on USGS forecasts. Given the inherent intra-day 
    # variance in weather forecasts, the availability of the coupon is triggered 
    # at a specific time-of-day by evaluating a metric and comparison operation 
    # (e.g. the predicted high temperature is above 100).
    class WeatherTarget < ListTarget

      PROPERTY_NAMES = [
        :operation,

        # The local minutes-of-day after which the availability of the coupon will 
        # not change for the remainder of the day.
        :local_decision_at,

        # The time of day for which the metric threshold must be met.
        :local_metric_at,
        :metric,
        :threshold
      ]
      attr_accessor *PROPERTY_NAMES



    end
  end
end