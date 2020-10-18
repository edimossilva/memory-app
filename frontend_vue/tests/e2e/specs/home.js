// https://docs.cypress.io/api/introduction/api.html

describe("Create task", () => {
  it("Visits the app root url", () => {
    cy.visit("/");

    cy.get("button").click();
    cy.get(".create-item-modal-js").should("exist");

    cy.contains("label", "Key");
    cy.get(".create-item-modal--input-key-js").type("key1");
    cy.get(".create-item-modal--input-value-js").type("value1");
    cy.get(".create-item-modal--button-create-js").click();
    cy.get(".create-item-modal-js").should("not.exist");

    cy.contains("key: key1, value: value1");
  });
});
