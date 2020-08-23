class Developer {
  String email;
  String password;
  String firstName;
  String lastName;
  String bio;
  int index;

  Developer (email,password,firstName,lastName,bio,index) {
    this.email = email;
    this.password = password;
    this.firstName = firstName;
    this.lastName = lastName;
    this.bio = bio;
    this.index = index;
  }
}

var myDevelopers =[];
int myLastSelectedDeveloper;

var firstNames = ["Jim","Jill","Tim","Dan","Sally","Jackie","Sam","Joe","George","Zac","Mary","Julie","Erica","Shelly","Ruth","Isabella","Amelia","Olivia","Harper","Noah","Liam","Eric","Troy","Elijah","Lucas","Jackson","Matthew","Sebastian","Wyatt","Owen"];
var lastNames = ["Smith","Johnson","Williams","Garcia","Miller","Gonzalez","Lopez","Moore","Thompson","Lewis","Wright","King","Baker","Mitchell","Flores","Allen","Roberts","Bailey","Sanchez","Cohen","Beckett","Goldstien","Channing","Dixon","Easton","Gibbs","Griffin","Hendrix","Hutton","Lennon"];
var bios = ["Lead programmer with a track record of incorporating user and business requirements into cost-effective, secure and user-friendly solutions known for scalability and durability.",
  "Experience designing, developing, deploying and maintaining large scale software and distributed systems, utilizing various AWS tools and services.",
  "Software Engineer with an interest in making a difference in the technological field. Most experience is with Java, particularly 8, but have some experience with JavaScript, C++, PHP, Python and many front end frameworks",
  "I care about creating value and learning. I like to help my organization get better at translating effort into customer value; in doing so I frequently see a lot of opportunities to improve communication.",
  "Optimizing problems by thinking out of the box. A learning enthusiast grasping and observing patterns in day-to-day activities. ",
  "I am a determined, driven, and hardworking person with a passion for computing. I am always looking for new opportunities and experiences to better myself as well as my education. ",
  "Dedicated Systems Engineer with skills in linux, code deployments, python scripting, support for aws services, test of hardware and software applications, simulation development, and the analysis of software components within virtual test environments. ",
  "Full Stack Developer/Designer with a passion for finding analytical and elegant solutions to complex problems. "];