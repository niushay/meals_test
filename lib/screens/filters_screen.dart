import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String,bool> currentFilters;
  FiltersScreen(this.saveFilters,this.currentFilters);

  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed:() {
                final selectedFilters = {
                  'gluten' : _glutenFree,
                  'lactose' :_lactoseFree,
                  'vegan' :_vegan,
                  'vegetarian' :_vegetarian,
                };
                widget.saveFilters(selectedFilters);
                },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SwitchListTile(
                    title: Text('GLuten-Free'),
                    value: _glutenFree,
                    subtitle: Text('only include free-gluten meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegetarian'),
                    value: _vegetarian,
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegan'),
                    value: _vegan,
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Laktose-Free'),
                    value: _lactoseFree,
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
