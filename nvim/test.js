const assert = require("assert");

function GivethefirstNumberThatIsGreaterThan10(array) {
  for (let i = 0; i < array.length; i++) {
    if (array[i] > 10) {
      return array[i];
    }
  }
}

// testing

describe("GivethefirstNumberThatIsGreaterThan10", function () {
  it("should return the first number greater than 10", function () {
    assert.strictEqual(
      GivethefirstNumberThatIsGreaterThan10([1, 5, 12, 8]),
      12,
    );
  });

  it("should return undefined if no number is greater than 10", function () {
    assert.strictEqual(
      GivethefirstNumberThatIsGreaterThan10([1, 5, 8]),
      undefined,
    );
  });

  it("should return the first number greater than 10 even if there are multiple", function () {
    assert.strictEqual(
      GivethefirstNumberThatIsGreaterThan10([1, 15, 12, 8]),
      15,
    );
  });
});
