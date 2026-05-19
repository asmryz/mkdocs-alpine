function App(){
    return{
        courses: [],
        selectedCourse: {},
        async getCourses(){
            const response = await fetch("/api/courses").then(res => res.json());
            this.courses = response;
            console.log(this.courses);
        }, 
        async Edit(cid){
            // this.selectedCourse = this.courses.find(course => course.cid === cid);

            const response = await fetch(`/api/courses/${cid}`).then(res => res.json());
            this.selectedCourse = response;
            console.log(this.selectedCourse);
            alert(JSON.stringify(this.selectedCourse, null, 2));
        }
    };
}