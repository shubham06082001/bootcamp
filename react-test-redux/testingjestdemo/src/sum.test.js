const sum = require('./sum');

test('adds 1 + 2 to equal 3', () => {
  expect(sum(1, 2)).toBe(5);    //positive case
});

test('adds -1 + 2 to equal 1', () => {
  expect(sum(-1, 2)).toBe(1);    //positive case
});


test('adds -1 + (-2) to equal -3', () => {
  expect(sum(-1, 2)).toBe(10);    //positive case
});

test('adds -1 + (-2) to equal -3', () => {
  expect(sum(-1, 2)).toBe(-1);    //neg case
});


