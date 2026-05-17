function first() {
    console.log(`First function`);
}

async function second() {
	await fetch(`https://jsonplaceholder.typicode.com/users/1`)
		.then((res) => res.json())
		.then((user) => console.log(`Second function - ${user.name}`));
}

function third() {
    console.log(`Third function`);
}

// (async () => {
//     first();
//     await second();
//     third();    
// })();

first();
await second();
third();    