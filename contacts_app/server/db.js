const faker = require('faker');
const { range } = require('lodash');

const generateDb = () => ({
  users: range(0, 10).map(i => ({
    id: faker.random.uuid(),
    name: faker.name.findName(),
    username: faker.internet.userName(),
    phoneNumber: faker.phone.phoneNumber(),
    email: faker.internet.email(),
    avatar: faker.internet.avatar(),
    notes: faker.lorem.sentence()
  }))
});

module.exports = generateDb;
