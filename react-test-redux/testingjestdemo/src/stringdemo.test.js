 const isString = require('./stringdemo');

test('should return true if the value is a string', () => {
    expect(isString('Hello')).toBe(true);
    expect(isString(42)).toBe(true);
    expect(isString(null)).toBe(false);
    expect(isString(undefined)).toBe(false);
    expect(isString({})).toBe(false);
    expect(isString([])).toBe(false);
    expect(isString(() => {})).toBe(false);
   
  });