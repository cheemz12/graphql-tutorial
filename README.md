This is query for the following query: <img width="848" alt="Screen Shot 2024-03-14 at 6 27 20 PM" src="https://github.com/cheemz12/graphql-tutorial/assets/111143528/c2d3dddf-13f3-4bdb-a3cb-eee197ce24fc">

Without BatchLoader
```
  Link Load (0.4ms)  SELECT "links".* FROM "links"
  ↳ app/controllers/graphql_controller.rb:15:in `execute'
  User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  ↳ app/controllers/graphql_controller.rb:15:in `execute'
  User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 2], ["LIMIT", 1]]
  ↳ app/controllers/graphql_controller.rb:15:in `execute'
  User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 3], ["LIMIT", 1]]
  ↳ app/controllers/graphql_controller.rb:15:in `execute'
Completed 200 OK in 27ms (Views: 0.6ms | ActiveRecord: 0.6ms | Allocations: 4803)
```

With BatchLoader
```
  Link Load (0.3ms)  SELECT "links".* FROM "links"
  ↳ app/controllers/graphql_controller.rb:15:in `execute'
  User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."id" IN (?, ?, ?)  [["id", 1], ["id", 2], ["id", 3]]
  ↳ app/graphql/loaders/record_loader.rb:8:in `perform'
Completed 200 OK in 40ms (Views: 0.2ms | ActiveRecord: 0.8ms | Allocations: 52001)
```
