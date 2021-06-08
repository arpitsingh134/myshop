function add_to_cart(pId, pName, pPrice) {

	//alert(pName);
	updateCart();
	let cart = localStorage.getItem("cart");
	if (cart == null) {
		let products = [];
		let product = {
			productID: pId,
			productName: pName,
			productQuantity: 1,
			productPrice: pPrice



		};

		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		//console.log("product add first time");
		toastr.success('New Product added in cart', toastr.options = {
			timeOut: 3000, "closeButton": true,
			"progressBar": true,
			"positionClass": "toast-bottom-right"
		});

	}
	else {
		let pCart = JSON.parse(cart);
		let pvar = pCart.find((item) => item.productID == pId);




		if (pvar) {

			pvar.productQuantity = pvar.productQuantity + 1;
			pCart.map((item) => {
				if (item.productID == pvar.productID) {

					item.productQuantity = pvar.productQuantity;

				}


			});

			localStorage.setItem("cart", JSON.stringify(pCart));
			//console.log("product quantity added");
			toastr.success('product quantity added', toastr.options = {
				timeOut: 3000, "closeButton": true,
				"progressBar": true,
				"positionClass": "toast-bottom-right"
			});

		}
		else {

			let product = {
				productID: pId,
				productName: pName,
				productQuantity: 1,
				productPrice: pPrice



			}
			pCart.push(product);
			localStorage.setItem("cart", JSON.stringify(pCart));
			//console.log("new extra product added");
			toastr.success('New  product added in cart', toastr.options = {
				timeOut: 3000, "closeButton": true,
				"progressBar": true,
				"positionClass": "toast-bottom-right"
			});

		}


	}

	updateCart();
}

function updateCart() {


	let cartString = localStorage.getItem('cart');
	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) {

		console.log("cart is empty");

		$(".cart-items").html("(0)");
		$(".cart-body").html("<h1>Your cart is empty ! Please add some product </h1>");
		$(".checkout-btn").attr('disabled',true);
	} else {

		console.log(cart.length);

		$(".cart-items").html(`(${cart.length})`);


		let table = `
		
		
		
		<table class="table table-sm ">
				  <thead class="thead-light">
				    <tr>
				      <th scope="col">Item Name</th>
				      <th scope="col">Price</th>
				      <th scope="col">Quantity</th>
				      <th scope="col">Total Price</th>
				      <th scope="col">Action</th>
				    </tr>
				  </thead>
				<tbody>	
		
		
		`;

		let totalPrice = 0;
		cart.map((item) => {

			table += `
			
				<tr>
				  <th >${item.productName}</th>
				  <th >${item.productPrice}</th>
				  <th >${item.productQuantity}</th>
				  <th >${item.productPrice * item.productQuantity}</th>
				  <th ><button class="btn btn-sm btn-outline-danger" onclick="deleteFormCartByPid(${item.productID})">Remove </button></th>

				</tr>
			
			
			`;
			totalPrice += item.productPrice * item.productQuantity;



		});
		table += `
		<tr>
		<td colspan="4" class="text-right font-weight-bold" >Total Price : ${totalPrice}</td>
		
		</tr>
		
		
		`;


		table += `</tbody></table>`;
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false);

	}





}

function deleteFormCartByPid(pId) {

	let cartString = localStorage.getItem('cart');
	let cart = JSON.parse(cartString);
	let newcart = cart.filter((item) => item.productID != pId);
	localStorage.setItem("cart", JSON.stringify(newcart));
	toastr.warning('Product Remove form cart', toastr.options = {
		timeOut: 3000, "closeButton": true,
		"progressBar": true,
		"positionClass": "toast-bottom-right"
	});
	updateCart();





}



$(document).ready(function() {
	updateCart();
})

function goToCheckout(){
	window.location="checkout.jsp";
	
}
function continueShopping(){
	window.location="index.jsp";
	
}


