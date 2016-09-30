# AssertFunctional

Functional and composable assertions for your elixir tests. They especially clean up testing the result of pipelines:

Instead of this:

```elixir
conn =
  build_conn()
  |> post("/upload_content_cover", params)


assert %{"success" => true} = json_response(conn, 200)
```

You can write this:

```elixir
build_conn()
|> post("/upload_content_cover", params)
|> json_response(conn, 200)
|> assert_match(%{"success" => true})
```

Currently the only implemented assertions are `assert_equal` and `assert_match`. Pull request for improvement are welcome.

## Installation

The package can be installed as:

  1. Add `assert_functional` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:assert_functional, "~> 0.1.0"}]
    end
    ```

  2. Ensure `assert_functional` is started before your application:

    ```elixir
    def application do
      [applications: [:assert_functional]]
    end
    ```
