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

var firstNamesData = ["Jim","Jill","Tim","Dan","Sally","Jackie","Sam","Joe","George","Zac","Mary","Julie","Erica","Shelly","Ruth","Isabella","Amelia","Olivia","Harper","Noah","Liam","Eric","Troy","Elijah","Lucas","Jackson","Matthew","Sebastian","Wyatt","Owen"];
var lastNamesData = ["Smith","Johnson","Williams","Garcia","Miller","Gonzalez","Lopez","Moore","Thompson","Lewis","Wright","King","Baker","Mitchell","Flores","Allen","Roberts","Bailey","Sanchez","Cohen","Beckett","Goldstien","Channing","Dixon","Easton","Gibbs","Griffin","Hendrix","Hutton","Lennon"];
var biosData = ["Lead programmer with a track record of incorporating user and business requirements into cost-effective, secure and user-friendly solutions known for scalability and durability.",
  "Experience designing, developing, deploying and maintaining large scale software and distributed systems, utilizing various AWS tools and services.",
  "Software Engineer with an interest in making a difference in the technological field. Tech stack includes Java, JavaScript, C++, PHP, Python, React and Angular",
  "I care about creating value and learning. I like to help my organization get better at translating effort into customer value.",
  "Optimizing problems by thinking out of the box. A learning enthusiast grasping and observing patterns in day-to-day activities.",
  "I am a determined, driven, and hardworking person with a passion for computing. I am always looking for new opportunities and experiences.",
  "Dedicated Systems Engineer with skills in linux, code deployments, python scripting, support for aws services, test of hardware and software applications.",
  "Full Stack Developer/Designer with a passion for finding analytical and elegant solutions to complex problems.",
  "I am a senior-level software engineer, playing leading roles in designing and creating mostly web-based full-stack solutions.",
  "Experienced Consultant with a demonstrated history of working in the information technology and services industry.",
  "Experienced leading technical teams to ensure collaboration and efficiency.  Able to communicate with clients and management to implement project goals.",
  "Experienced Software Developer with a focus on backend architecture, particularly dynamically typed languages and relational databases.",
  "I am a tech enthusiast and a developer who makes things for fun, productivity and for solving real-world problems.",
  "Engineer who innovates, and executes with great deal of quality, cost efficiency, and satisfaction from Customers around the world.",
  "A creative software engineer who is experienced in building complex web applications and passionate about intuitive and smooth user experience. ",
  "As a lifelong dabbler turned full-stack developer, I find joy in taking apart problems and hatching a solid plan.",
  "Principal software engineer with experience building machine learning and data analysis pipelines that scale to terabytes of data.",
  "Engineer who's interested in green technology and consumer-focused tech which helps make people's lives better.",
];