'use strict';

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model');

class AttributeValue extends Model {
  static get table() {
    return 'attribute_value';
  }

  static get primaryKey () {
    return 'attribute_value_id';
  }

  static get createdAtColumn () {
    return null;
  }

  static get updatedAtColumn () {
    return null;
  }

  static get computed() {
    return ['id']
  }

  getId({ attribute_value_id }) {
    return attribute_value_id;
  }

  attribute() {
    return this.belongsTo('App/Models/Attribute')
  }
}

module.exports = AttributeValue;
