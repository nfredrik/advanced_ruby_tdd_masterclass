require "cli/commands/cli_command"

module Cli
  module Commands
    class AddCommand < CliCommand
      def execute
        Todo::UseCases::AddTodos.new(
          todo_repo: todo_repo,
          observer: self,
        ).add(description: todo_description)
      end

      def use_case_succeeded(*)
      end

      def validation_failed(todo)
        puts todo.failed_validations.join("\n")
      end

      private
      def todo_description
        ARGV[1..-1].join(" ")
      end
    end
  end
end
