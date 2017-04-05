defmodule Fall.FallController do
  use Fall.Web, :controller

  def welcome(conn, params) do
    choices = ["Earth": 1, "Moon": 2, "Mars": 3]
    speed = 0
    render conn, "faller.html", speed: speed, choices: choices
  end

  # First
  def faller(conn, %{"calculation" => %{"planet" => planet, "distance" => distance}}) do
    {calc_planet, _null} = Integer.parse(planet)
    {calc_distance, _null} = Float.parse(distance)
    speed = fall_velocity(calc_planet, calc_distance)
    choices = ["Earth": 1, "Moon": 2, "Mars": 3]
    render conn, "faller.html", speed: speed, choices: choices
  end
  # Second
  def faller(conn, params) do
    choices = ["Earth": 1, "Moon": 2, "Mars": 3]
    speed = 0
    render conn, "faller.html", speed: speed, choices: choices
  end

  def fall_velocity(1, distance) do
   :math.sqrt(2 * 9.8 * distance)
  end

  def fall_velocity(2, distance) do
   :math.sqrt(2 * 1.6 * distance)
  end

  def fall_velocity(3, distance) do
   :math.sqrt(2 * 3.71 * distance)
  end

end
