module SpreeSubscriptions
  class Engine < Rails::Engine
    engine_name 'spree_subscriptions'

    config.autoload_paths += %W(#{config.root}/lib)

    initializer "spree.subscriptions.preferences", :after => "spree.environment" do |app|
      module Spree::Subscriptions
        Config = Spree::SubscriptionsConfiguration.new
      end
    end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
