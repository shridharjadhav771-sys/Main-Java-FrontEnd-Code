(function() {
  "use strict";

  var elements = stripe.elements({
    fonts: [
      {
        cssSrc: "https://rsms.me/inter/inter-ui.css"
      }
    ],     
    locale: window.__exampleLocale
  });

   
  
  var elementStyles = {
		    base: {
		    	iconColor: "#ddd",
			      color: "#000",
			      fontWeight: 400,
			      fontSmoothing: "antialiased",

			      "::placeholder": {
			        color: "#cccccc"
			      },
			      ":-webkit-autofill": {
			        color: "#000000"
			      }
		    },
		    invalid: {
		      color: 'red',

		      '::placeholder': {
		        color: '#cccccc',
		      },
		    },
		  };
  var elementClasses = {
		    focus: 'focused',
		    empty: 'empty',
		    invalid: 'invalid',
		  };
var cardNumber = elements.create('cardNumber', {
	    style: elementStyles,
	    classes: elementClasses,
	  });
	  cardNumber.mount('#stripe-card-number');

	  var cardExpiry = elements.create('cardExpiry', {
	    style: elementStyles,
	    classes: elementClasses,
	  });
	  cardExpiry.mount('#stripe-card-expiry');

	  var cardCvc = elements.create('cardCvc', {
	    style: elementStyles,
	    classes: elementClasses,
	  });
	  cardCvc.mount('#stripe-card-cvc');

registerElements([cardNumber, cardExpiry, cardCvc]);
})();