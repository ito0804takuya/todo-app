module Mutations
  class CreateTask < BaseMutation
    graphql_name 'CreateTask'

    # 
    field :task, Types::TaskType, null: true
    field :result, Boolean, null: true

    # 引数
    argument :title, String, required: false
    argument :description, String, required: false

    # TODO: define resolve method
    def resolve(**args)
      task = Task.create(
        title: args[:title],
        description: args[:description],
        completed: false
      )
      { 
        task: task,
        result: task.errors.blank?
       }
    end
  end
end
