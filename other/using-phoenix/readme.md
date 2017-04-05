# Phonex
```bash
$ mix phoenix.new fall --no-ecto
$ cd fall
$ mix phoenix.server
```
You can also run your app inside IEx as:
```bash
$ iex -S mix phoenix.server
```
# Structuring a Basic Phoenix Application

* Router
  The router logic gives Phoenix basic direction on what to do when it receives a request for a given URL.
* Controller
  The controller is the switchboard for information coming in and going out, the piece that will connect requests for calculations to the calculations.
* View
  The view takes results from the controller and makes everything ready for final formatting in the template.

* Template
  The template combines HTML formatting with variables that come to it from the controller using logic from the view.

```bash
$ mix phoenix.gen.html
```
