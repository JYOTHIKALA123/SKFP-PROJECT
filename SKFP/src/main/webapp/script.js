document.addEventListener('DOMContentLoaded', function() {
    var sweetBtn = document.getElementById('sweetBtn');
    var karamBtn = document.getElementById('karamBtn');
    var foodBtn = document.getElementById('foodBtn');
    var productGrid = document.getElementById('productGrid');

    var sweetProducts = [
        {
            image: 'images/sweet1.jpeg',
            name: 'Gulab Jamun',
            price: 'Price: 1 kg $100',
            offer: 'Offer: 10% off'
        },
        {
            image: 'images/sweet2.jpeg',
            name: 'Jalebi',
            price: 'Price: 1 kg $90',
            offer: 'Offer: 5% off'
        },
        {
            image: 'images/sweet3.jpeg',
            name: 'Mysore Pak',
            price: 'Price: 1 kg $80',
            offer: 'Offer: 8% off'
        }
    ];

    var karamProducts = [
        {
            image: 'images/karam1.jpeg',
            name: 'Murukku',
            price: 'Price: 1 kg $80',
            offer: 'Offer: 5% off'
        },
        {
            image: 'images/karam2.jpeg',
            name: 'Mixture',
            price: 'Price: 1 kg $70',
            offer: 'Offer: 7% off'
        },
        {
            image: 'images/karam3.jpeg',
            name: 'Thattai Vadai',
            price: 'Price: 1 kg $60',
            offer: 'Offer: 10% off'
        }
    ];

    var foodProducts = [
        {
            image: 'images/food1.jpeg',
            name: 'Poori',
            price: 'Price: $30'
        },
        {
            image: 'images/food2.jpeg',
            name: 'Dosa',
            price: 'Price: $20'
        },
        {
            image: 'images/food3.jpeg',
            name: 'Idli',
            price: 'Price: $15'
        }
    ];

    function displayProducts(products) {
        productGrid.innerHTML = '';
        products.forEach(function(product) {
            var productItem = document.createElement('div');
            productItem.className = 'product-item';
            productItem.innerHTML = `
                <img src="${product.image}" alt="${product.name}">
                <h2>${product.name}</h2>
                <p>${product.price}</p>
                ${product.offer ? `<p>${product.offer}</p>` : ''}
                <button class="order-btn" data-name="${product.name}" data-price="${product.price}">Order Now</button>
            `;
            productGrid.appendChild(productItem);
        });
        productGrid.classList.remove('hidden');

        // Add event listener for order buttons
        document.querySelectorAll('.order-btn').forEach(function(button) {
            button.addEventListener('click', function() {
                var name = button.getAttribute('data-name');
                var price = button.getAttribute('data-price');
                window.location.href = `Order.jsp?name=${encodeURIComponent(name)}&price=${encodeURIComponent(price)}`;
            });
        });
    }

    sweetBtn.addEventListener('click', function() {
        displayProducts(sweetProducts);
    });

    karamBtn.addEventListener('click', function() {
        displayProducts(karamProducts);
    });

    foodBtn.addEventListener('click', function() {
        displayProducts(foodProducts);
    });
});

