# Supervisors
# Supervisors are specialized processes with one purpose:
# monnitoring other processe.
# These superisors ennable us to create fault-tolerant app by automatically restart child processes when they fail.

# Using the SimpleQueue form Conncurrency
import Supervisor.Spec

childern = [
  worker(SimpleQueue, [], [name: SimpleQueue])
]

{:ok, pid} = Supervisor.start_link(children, starteqy: :one_for_one)

# If our process were to crash or be terminated our Supervisor would automatically resart it as if nothing had happened.

## Strategies
# * :one_for_one        -> Only restart the failed child process
# * :one_for_all        -> Restart all child processes in the event failure
# * :rest_for_one       -> Restart the failed process and any process started after it
# * :simple_one_for_one -> Best for dynamically attached children....

## Restart values
# * :permanet   -> [Default] Child is always restarted
# * :temporary  -> Child process is never restarted
# * .transient  -> Child process is restared ony if it terminate abnormally

# Nesting
import Supervisor.Spec

childern = [
  Supervisor(ExampleApp.ConnectionSupervisor, [[name: ExampleApp.ConnectionSupervisor]]),
  worker(SimpleQueue, [[],[name: SimpleQueue]])
]

{:ok, pid} = Supervisor.start_link(children, starteqy: :one_for_one)

# Task Supervisor
# 
