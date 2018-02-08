module Todo
  module UseCases
    class NullObserver
      def use_case_succeeded(*)
        Kernel.puts "NullObserver succeeded"
      end
      def validation_failed(*); end
    end
  end
end
