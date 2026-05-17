function first(callback) {
    console.log(`First function`);
    callback();
}

function second(callback) {
	fetch(`https://jsonplaceholder.typicode.com/users/1`)
		.then((res) => res.json())
		.then((user) => console.log(`Second function - ${user.name}`))
        .then(() => callback());
}

function third() {
    console.log(`Third function`);
}

first(() => {
    second(() => {
        third();
    });
});    

//first(() => second(() => third()));   