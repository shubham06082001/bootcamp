const isInteger = require('./integerdemo');
 
test('should return true id value is an integer',() =>{
      expect(isInteger(42)).toBe(true);
      expect(isInteger(0)).toBe(true);
      expect(isInteger(-1)).toBe(true);

 })

