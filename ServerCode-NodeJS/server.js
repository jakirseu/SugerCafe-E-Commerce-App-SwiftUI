
const express = require("express");
const app = express();
app.use(express.json());
 

const stripe = require('stripe')('stripe secreate code');
// This example sets up an endpoint using the Express framework.
// Watch this video to get started: https://youtu.be/rPR2aJ6XnAc.

app.post('/payment-sheet', async (req, res) => {

  // receiving total amount from request body 
 const { total } = req.body;
  
  // Use an existing Customer ID if this is a returning customer.
  const customer = await stripe.customers.create();
  const ephemeralKey = await stripe.ephemeralKeys.create(
    {customer: customer.id},
    {apiVersion: '2023-08-16'}
  );
  
  const paymentIntent = await stripe.paymentIntents.create({
    // passing total ammount as cents 
    amount: total * 100,
    currency: 'usd',
    customer: customer.id,
  });

  res.json({
    paymentIntent: paymentIntent.client_secret,
    ephemeralKey: ephemeralKey.secret,
    customer: customer.id,
    publishableKey: 'stripe public key'
  });
});




app.listen(8080, () => console.log('Node server listening on port 8080!'));
