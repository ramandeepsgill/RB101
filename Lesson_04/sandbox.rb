def star_method(stars)
  for star in stars
    star.downcase!
  end
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
stars_2 = star_method(stars_1)

p stars_1

p stars_2

