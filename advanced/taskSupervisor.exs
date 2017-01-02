# Setup
import Supervisor.Spec

children = [
  supervisor(Task.Supervisor, [[name: ExampleApp.TaskSupervisor, restart: :transient]]),
]

{:ok, pid} = Supervisor.start_link(children, strategy: :one_for_one)

