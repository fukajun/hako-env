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
          env[key] = ENV[key]
        end
        env
      end

      def can_ask_keys?
        true
      end

      def ask_keys(variables)
        keys = []
        variables.each do |key, _|
          keys << ENV.has_key?(key)
        end
        keys
      end

      private
      def default_options
        { 'raise_error' => true }
      end
    end
  end
end
