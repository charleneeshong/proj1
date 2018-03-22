# Q0: Why is this error being thrown?
There is no new method from our CRUD system which initializes any relevant constants (in this case trainerless_pokemon). We also haven't created a Pokemon with any defined attributes.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *
The embedded Ruby code in the index.html.erb is checking "if @pokemon and current_trainer" are both true, in which case it also checks is "@pokemon.ndex" is true. If it is, then an image of a wild pokemon is displayed. All pokemon that appear are three of the Kanto starter pokemon.

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.
It creates a "Throw a Pokeball!" button, which points to/calls the pokemons_controller capture method (defined as capture_path) on the input id: parameter of the @pokemon variable.

# Question 3: What would you name your own Pokemon?
Since I started playing Pokemon when I was like 5, the default name for my starter has always been GreatOne. It's dumb and lame as hell, but I can't let it go.

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?
I redirected to "trainer_path(current_trainer)", which needs to point to the current_trainer in order to render the right profile.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.
Our validation of the presence and uniquness of the name will create errors if they fails. Any errors found are accessed with errors.messages, which returns the collection of errors (according to the documentation).

# Give us feedback on the project and decal below!

# Extra credit: Link your Heroku deployed app
