// https://docs.cypress.io/api/introduction/api.html

describe("Delete item", () => {
  const key1 = "key1";
  const value1 = "value1";
  const key2 = "key2";
  const value2 = "value2";

  describe("When visit home", () => {
    beforeEach(() => {
      cy.visit("/");
    });

    describe("When create items", () => {
      beforeEach(() => {
        cy.get("[dataId=home__add-item-button-js]").click();
        cy.get(".create-item-modal--input-key-js").type(key1);
        cy.get(".create-item-modal--input-value-js").type(value1);
        cy.get(".create-item-modal--button-create-js").click();

        cy.get("[dataId=home__add-item-button-js]").click();
        cy.get(".create-item-modal--input-key-js").type(key2);
        cy.get(".create-item-modal--input-value-js").type(value2);
        cy.get(".create-item-modal--button-create-js").click();
      });

      describe("When fill filter", () => {
        beforeEach(() => {
          cy.get(".list-items__filter-js").type("y1");
        });

        it("should see only filtered item", () => {
          cy.contains("key1").should("exist");
          cy.contains("key2").should("not.exist");
        });
      });
    });
  });
});
