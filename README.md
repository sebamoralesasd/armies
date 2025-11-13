# Armies model data

This repo contains the armies problem data modelling. The model schema can be found at db/schema.rb and a possible seed at db/seeds.rb.  

You can run the following commands to query the database

```
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

bundle exec rails c
```

## Entity-Relationship diagram

![erd](./erd.png)

## Notes
 - The initial unit config from each civilization is defined as a JSON assuming unit types might change over time. 
 - Defeat and draw battles criteria are not defined into the Battle model. Might consider implement service classes for both requirements. 
