function first() {
    return new Promise((resolve) => resolve(`First function`));
}

function second() {
    return new Promise((resolve) => {
        fetch(`https://jsonplaceholder.typicode.com/users/1`)
            .then((res) => res.json())
            .then((user) => resolve(`Second function - ${user.name}`));
    });
}

function third() {
    return new Promise((resolve) => resolve(`Third function`));
}

/*
first()
    .then((firstMessage) => {
        console.log(firstMessage);
        return second();
    })
    .then((secondMessage) => {
        console.log(secondMessage);
        return third();
    })
    .then((thirdMessage) => {
        console.log(thirdMessage);
    });
*/

first()
    .then(firstMessage => console.log(firstMessage))
    .then(() => second()
        .then(secondMessage => console.log(secondMessage)))
    .then(() => third()
        .then(thirdMessage => console.log(thirdMessage)))       
