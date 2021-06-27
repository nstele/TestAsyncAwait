# TestAsyncAwait

Test Swift 5.5 new feature for handle asynchronous code almost is if it were synchronous.
This is done in two steps: marking async functions with the new async keyword, then calling them using the await keyword, similar to other languages such as C# and JavaScript.

To see how async/await helps the language, it’s helpful to look at how we solved the same problem previously. Completion handlers are commonly used in Swift code to allow us to send back values after a function returns, but they had tricky syntax.

The addition of async/await fits perfectly alongside try/catch, meaning that async functions and initializers can throw errors if needed. The only proviso here is that Swift enforces a particular order for the keywords, and that order is reversed between call site and function.
