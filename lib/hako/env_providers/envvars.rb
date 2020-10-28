# frozen_string_literal: true

require 'hako/env_provider'

module Hako
  module EnvProviders
    class Envvars < EnvProvider
      def initialize(_root_path, _options)
      end

      def ask(variables)
        env = {}
        variables.each do |key|
          val = ENV[key]
          if val
            env[key] = val
          end
        end
        env
      end

      def can_ask_keys?
        true
      end

      def ask_keys(variables)
        keys = []
        variables.each do |key, _|
          keys << ENV.hask_key?(key)
        end
        keys
      end
    end
  end
end
