import fs from 'fs';

console.log("Start reading file...");
fs.readFile('test.txt', 'utf8', (err, data) => {
  if (err) throw err;
  console.log(data); // This happens later
});
console.log("I didn't wait for the file!");