// https://docs.cypress.io/api/introduction/api.html

describe("Delete item", () => {
  const key1 = "key1";
  describe("When visit home", () => {
    beforeEach(() => {
      cy.visit("/");
    });
    describe("When create item", () => {
      beforeEach(() => {
        cy.get("button").click();
        cy.get(".create-item-modal--input-key-js").type(key1);
        cy.get(".create-item-modal--input-value-js").type("value1");
        cy.get(".create-item-modal--button-create-js").click();
      });

      describe("When click delete", () => {
        beforeEach(() => {
          cy.get(`.show-item---button-remove-js[dataId=${key1}]`).click();
        });

        it("should not display item", () => {
          cy.contains(key1).should("not.exist");
        });
      });
    });
  });
});
