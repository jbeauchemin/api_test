import 'package:alfred/alfred.dart';

// Crud for Beers
void beerRoutes(NestedRoute app) {
  app.get('/', (req, res) {
    res.json({'message': 'Get all beers'});
  });
  app.get('/:id', (req, res) {
    res.json({'message': 'Get beer by id'});
  });
  app.post('/', (req, res) {
    res.json({'message': 'Create beer'});
  });
  app.put('/:id', (req, res) {
    res.json({'message': 'Update beer by id'});
  });
  app.delete('/:id', (req, res) {
    res.json({'message': 'Delete beer by id'});
  });
}
