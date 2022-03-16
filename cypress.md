## Use APIs to Build State

**Never use the UI to build up state** in tests not specifically testing that data entry or in `before` hooks. It's super slow and it can be flaky. Use `cy.api` calls as much as possible.

This includes login flows: you can use API-based logins and the session cookie will get saved properly.

### Use Fixtures

Because Cypress uses chainables and does not have async/await, it's super ugly to make multiple API calls. Opt instead to use fixture files and verify that the correct data is present on the server. Then, you can parse relationships/data out of the fixture files in your tests instead of needing to make a bunch of queries. (Very helpful for data that you'd need to obtain with multiple queries or that you need to parse on the frontend.)

Example:

Campaigns belong in a Category through a relationship with Product:

Campaign -> Product -> Category

Instead of using queries to determine this, you can ensure that each entity exists with the proper relationships and then create a campaign fixture that has the correct category relationship on it directly.

### Using Aliases

You can alias fixtures and use their data more easily in each test like so:

```
beforeEach(() => {
  cy.fixture("fixture-file.json").as("fixture");
}
```

Then in a test:

```
it("Loaded fixture data", function () {
  cy.get("whatever").should("contain", this.fixture.text);
});
```

**NOTE: You need to use the `function(){}` syntax when doing aliasing and you must use `beforeEach` hooks (its a Mocha thing).**

## Use Utility Files

Within the root tests directory (`integration` by default), create separate utility files to share functions across multiple screens. Otherwise, tests from those files will be performed for each screen.

(Example: A function for testing menu contents for each screen belongs in a utility file.)

## Be Careful with Assertions

Cypress uses custom `Chainable` objects to bake-in retries, timeouts, and etc; this is why it blows Selenium out of the water. However, some actions cannot be retried (such as `click()`). Make sure you are checking the DOM well enough before and after taking non-retry-able actions.

An example could be waiting for an AJAX call result:

```
// Ensure AJAX contents render
cy.get("ajax-result-component").should("be.visible");
// Nothing about this element is dependent on the AJAX contents, so it would not wait/retry properly
cy.get("something-else").click();
```

See [more about retry-ability.](https://docs.cypress.io/guides/core-concepts/retry-ability.html)

Some commands also have default assertions, for example, `click()` checks for visibility. Thus, the following is bad:
 
```
cy.get("something").should("be.visible").click(); // Bad kitty
```

## Add Assertions to All Page Rendering/AJAX

If you have parts of the page that get rendered after AJAX calls, they can modify other parts of the DOM or result in your selectors not doing what you think they should. This is reflected in the test runner snapshots, for example, you may see the page change unexpectedly before/after a click action due to AJAX data loading.

**Wait for page components to render** so that the DOM doesn't do random updates in the middle of your tests.

## High Level Points

- Use `tasks` for DB operations and certain API calls (you can run any Node code in `tasks`).
- Tests run in order in the files (but don't create ordering dependencies by building up state with the UI!)
- A `before` hook in the `support/index.js` file (by default) will run before all other tests (perfect place to check fixture data and configuration)
- `cy.api` is great because it renders API calls in the DOM for the test runner. However, **it will cover visibility of the actual page**. Thus, ensure your `visit` calls come after API calls when using `cy.api`.