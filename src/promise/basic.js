function first() {
    console.log(`First function`);
}

function second() {
	fetch(`https://jsonplaceholder.typicode.com/users/1`)
		.then((res) => res.json())
		.then((user) => console.log(`Second function - ${user.name}`));
}

function third() {
    console.log(`Third function`);
}

first();
second();
third();    