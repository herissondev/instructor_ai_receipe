# AiRecipe

This repo is a demo of what is possible to build using [intructor_ex](https://github.com/thmsmlr/instructor_ex) and how easy it is to integrate it using liveview. 

This example generates recipes based on a list of ingredients or instructions provided by a user. The ingredients and steps are then showed to the user in a simple ui. 

You can try it live [here.](https://recipe.herisson.dev/)

The Instructor library is useful for coaxing an LLM to return JSON that maps to an Ecto schema that you provide, rather than the default unstructured text output. If you define your own validation logic, Instructor can automatically retry prompts when validation fails (returning natural language error messages to the LLM, to guide it when making corrections).

## How does it work ?

TODO


## Features

- [x] Recipe generation
- [ ] Live view integration
    - [x] show current Recipe
    - [ ] recipe history
- [ ] User input verification 
- [ ] GPT 4 Vision : ingredients photo to recipe



## Developpement

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


