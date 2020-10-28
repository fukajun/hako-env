# frozen_string_literal: true

require 'hako/env_provider'

module Hako
  module EnvProviders
    class Envvars < EnvProvider
      def initialize(_root_path, options)
        merged_options = default_options.merge(options)
        @raise_error = merged_options['raise_error']
      end

      def ask(variables)
        env = {}
        variables.each do |key|
          if valid_key?(key)
            env[key] = ENV[key]
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
          keys << valid_key?(key)
        end
        keys
      end

      private
      def valid_key?(key)
        raise_error? ? ENV.has_key?(key) : true
      end

      def raise_error?
        @raise_error
      end

      def default_options
        { 'raise_error' => true }
      end
    end
  end
end
