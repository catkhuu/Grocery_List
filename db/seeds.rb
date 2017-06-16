# Create users (Chefs Andrea, Elana, and Michelle from the Culinary team)
michelle = User.create!(username: 'michelle.kresch', email: 'michelle@plated.com', position: 'Chef', password: '12345678', password_confirmation: '12345678')
andrea = User.create!(username: 'andrea.folkerts', email: 'andrea@plated.com', position: 'Chef', password: '12345678', password_confirmation: '12345678')
elana = User.create!(username: 'elana.karp', email: 'elana@plated.com', position: 'Chef', password: '12345678', password_confirmation: '12345678')


# Create themed Shopping Lists
fourth_of_july_specials = ShoppingList.create!(title: 'Fourth of July Specials', shopping_date: '20 June, 2017', user: michelle)

labor_day_weekend_specials = ShoppingList.create!(title: 'Labor Day Weekend Specials', shopping_date: '13 August, 2017', user: andrea)

summer_grillers = ShoppingList.create!(title: 'Summer Grill Specials', shopping_date: '13 August, 2017', user: andrea)


# Create Ingredients
garlic = Ingredient.create!(name: 'Garlic')
red_onion = Ingredient.create!(name: 'Red Onion')
watermelon = Ingredient.create!(name: 'Watermelon', is_specialty: true)
champagne_mango = Ingredient.create!(name: 'Champagne Mango', is_specialty: true)
romaine = Ingredient.create!(name: 'Romaine')
dandelion_greens = Ingredient.create!(name: 'Dandelion Greens', is_specialty: true)
butter = Ingredient.create!(name: 'Butter')
whole_oats = Ingredient.create!(name: 'Whole Oats')
shiitake_mushrooms = Ingredient.create!(name: 'Shiitake Mushrooms', is_specialty: true)
miso_paste = Ingredient.create!(name: 'Miso Paste')
pasta = Ingredient.create!(name: 'Pasta', is_specialty: true)
roma_tomato = Ingredient.create!(name: 'Roma Tomato')
basil = Ingredient.create!(name: 'Basil')
olive_oil = Ingredient.create!(name: 'Olive Oil')
saffron = Ingredient.create!(name: 'Saffron', is_specialty: true)
black_garlic = Ingredient.create!(name: 'Black Garlic', is_specialty: true)
quinoa = Ingredient.create!(name: 'Quinoa')
curry_powder = Ingredient.create!(name: 'Curry Powder')
red_lentils = Ingredient.create!(name: 'Red Lentils')
garbanzo_beans = Ingredient.create!(name: 'Garbanzo Beans')
tumeric = Ingredient.create!(name: 'Tumeric')
cayenne = Ingredient.create!(name: 'Cayenne')
sea_salt = Ingredient.create!(name: 'Sea Salt')
black_salt = Ingredient.create!(name: 'Black salt', is_specialty: true)
vegetable_stock = Ingredient.create!(name: 'Vegetable Stock')


# Create note for specialty ingredients
specialty_black_garlic = SpecialtyPurchaseDestination.create!(company_name: 'The Spice House', website: 'https://www.thespicehouse.com/black-garlic-bulb', ingredient: black_garlic)

specialty_saffron = SpecialtyPurchaseDestination.create!(company_name: 'Peapod', website: 'http://stopandshop.peapod.com/pd/Badia/Spanish-Saffron/0-01-oz/033844000554/', ingredient: saffron)

specialty_dandelion_greens_1 = SpecialtyPurchaseDestination.create!(company_name: 'Fresh Direct', website: 'https://www.freshdirect.com/pdp.jsp?productId=orgveg_dndlion_vsku&catId=orgnat_veg_lfygrns', ingredient: dandelion_greens)

specialty_dandelion_greens_2 = SpecialtyPurchaseDestination.create!(company_name: 'Whole Foods', address: '250 7th Ave, New York, NY 10001', ingredient: dandelion_greens)


# Create Test Recipes
simple_tomato_basil_pasta = TestRecipe.create!(title: 'Simple tomato basil pasta')

curried_lentil_stew = TestRecipe.create!(title: 'Curried lentil stew')

miso_glazed_dandelion_salad = TestRecipe.create!(title: 'Miso glazed dandelion salad')


# Create Ingredient Amounts
  ## Ingredient Amounts for Recipe #1
    amount_pasta = IngredientAmount.create!(amount: 60, units: 'Grams', test_recipe: simple_tomato_basil_pasta, ingredient: pasta)

    amount_roma_tomato = IngredientAmount.create!(amount: 8, units: 'Each', test_recipe: simple_tomato_basil_pasta, ingredient: roma_tomato)

    amount_basil = IngredientAmount.create!(amount: 2, units: 'Bunch', test_recipe: simple_tomato_basil_pasta, ingredient: basil)

    amount_olive_oil = IngredientAmount.create!(amount: 2, units: 'Tbsp', test_recipe: simple_tomato_basil_pasta, ingredient: olive_oil)

    amount_sea_salt = IngredientAmount.create!(amount: 1, units: 'Tsp', test_recipe: simple_tomato_basil_pasta, ingredient: sea_salt)

    amount_garlic = IngredientAmount.create!(amount: 4, units: 'Each', test_recipe: simple_tomato_basil_pasta, ingredient: garlic)

  ## Ingredient Amounts for Recipe #2
    amount_curry_powder = IngredientAmount.create!(amount: 1, units: 'Tbsp', test_recipe: curried_lentil_stew, ingredient: curry_powder)

    amount_garlic_curry = IngredientAmount.create!(amount: 6, units: 'Each', test_recipe: curried_lentil_stew, ingredient: garlic)

    amount_roma_tomato_curry = IngredientAmount.create!(amount: 3, units: 'Each', test_recipe: curried_lentil_stew, ingredient: roma_tomato)

    amount_lentils = IngredientAmount.create!(amount: 100, units: 'Grams', test_recipe: curried_lentil_stew, ingredient: red_lentils)

    amount_vegetable_stock = IngredientAmount.create!(amount: 907, units: 'Grams', test_recipe: curried_lentil_stew, ingredient: vegetable_stock)

  ## Ingredient Amounts for Recipe #3
    amount_miso_paste = IngredientAmount.create!(amount: 3, units: 'Tbsp', test_recipe: miso_glazed_dandelion_salad, ingredient: miso_paste)

    amount_dandelion_greens = IngredientAmount.create!(amount: 1, units: 'Bunch', test_recipe: miso_glazed_dandelion_salad, ingredient: dandelion_greens)

    amount_romaine = IngredientAmount.create!(amount: 1, units: 'Bunch', test_recipe: miso_glazed_dandelion_salad, ingredient: romaine)

    amount_black_salt = IngredientAmount.create!(amount: 1, units: 'Tsp', test_recipe: miso_glazed_dandelion_salad, ingredient: black_salt)

    amount_roma_tomato_miso = IngredientAmount.create!(amount: 3, units: 'Each', test_recipe: miso_glazed_dandelion_salad, ingredient: roma_tomato)


# Add Test Recipes to Shopping Lists

ShoppingListTestRecipe.create!(shopping_list: fourth_of_july_specials, test_recipe: miso_glazed_dandelion_salad)

ShoppingListTestRecipe.create!(shopping_list: fourth_of_july_specials, test_recipe: simple_tomato_basil_pasta)

ShoppingListTestRecipe.create!(shopping_list: labor_day_weekend_specials, test_recipe: simple_tomato_basil_pasta)

ShoppingListTestRecipe.create!(shopping_list: labor_day_weekend_specials, test_recipe: curried_lentil_stew)

ShoppingListTestRecipe.create!(shopping_list: summer_grillers, test_recipe: miso_glazed_dandelion_salad)
