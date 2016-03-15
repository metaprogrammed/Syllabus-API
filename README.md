##Syllabus


![alt text](http://i.imgur.com/VpGwuk2.png "Syllabus")


###A Teachable API wrapper written in Ruby

**Keeping track of your Teachable orders has never been so easy.**

---

**Use**

```
client = Syllabus::Client.new({})
```

---

```def sign_in(email, password)```

- Authenticates an existing user.
- Returns a `Syllabus::User` object or raises an error if incorrect sign in credentials were provided.
    
---

```def sign_up(email, password, password_confirmation)```

- Registers a new user.
- Returns a `Syllabus::User` object or raises an error if incorrect sign up parameters were provided.
    
---

```def current_user(options={})``` _Requires an authenticated user_

- Retrieves the current user for a provided email and token combination.
- Returns a `Syllabus::User` object or raises an error if incorrect credentials were provided.

---

```def get_orders(options={})``` _Requires an authenticated user_

- Retrieves the orders for a user.
- Returns an array of orders that corresponds to a user.

---

```def add_order(number, total, total_quantity, email, options={})``` _Requires an authenticated user_

- Creates a new order for the current_user.
- Returns an order that was created.

---

```def delete_order(order_id, options={})``` _Requires an authenticated user_

- Destroys an order belonging to the current_user that corresponds to the provided order ID.
- Returns the status code to indicate whether it was successful or not