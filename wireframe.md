### STUDENT
#### Attributes
- name
- email
#### Associations
- has many enrollments
- has many courses, through enrollments

### COURSE
#### Attributes
- name
- description
- instructor id
#### Associations
- has many enrollments
- has many students, through enrollments
- belongs to instructor

### ENROLLMENT (join model between student and course)
#### Attributes
- student id
- course id
#### Associations
- belongs to student
- belongs to course

### INSTRUCTOR
#### Attributes
- name
- email
#### Associations
- has many courses
