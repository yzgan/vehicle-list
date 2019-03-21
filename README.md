# Vehicle Listing Rails API Application - Demo

## Environment & plugins
1. **Ruby** 2.6.0
1. **Postgresql**
1. gem `geokit-rails` for geocoding and distance calculation.
1. gem `pagy` for records pagination.
1. gem `fast_jsonapi` for optimized JSON data serializer 

## Deployment
Deployed to Heroku with following domain:
```
https://rocky-shore-98362.herokuapp.com
```

## Note
To query vehicle list, send `GET` request to link provided with `latitude`, `longitude` and optional `page` params.

Example:

```
https://rocky-shore-98362.herokuapp.com/vehicles?latitude=3.119158&longitude=101.674239&page=1
```
