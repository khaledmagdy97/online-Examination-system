namespace Examination_System_UML;

public class Program
{
    static public List<Department> Departments = new List<Department> {
        new Department{Id = 1, Name = "D1"},
        new Department{Id = 2, Name = "D2"},
        new Department{Id = 3, Name = "D3"},
        new Department{Id = 4, Name = "D4"},
        new Department{Id = 5, Name = "D5"},
        new Department{Id = 6, Name = "D6"},
        new Department{Id = 7, Name = "D7"},
        new Department{Id = 8, Name = "D8"},
        new Department{Id = 9, Name = "D9"},
        new Department{Id = 10, Name = "D10"}
    };

    static public List<Topic> Topics = new List<Topic>
    {
        new Topic{ Id = 1, Name = "OOP"},
        new Topic{ Id = 2, Name = "Databases"},
        new Topic{ Id = 3, Name = "CST"},
        new Topic{ Id = 4, Name = "Programming"},
    };

    static public List<Course> Courses = new List<Course> {
        new Course{Id = 1, Name = "C++", Topics = new List<Topic>{Topics[0], Topics[3]}, Questions = new List<Question>(), Exams = new List<Exam>() },
        new Course{Id = 2, Name = "Databases Fundamentals", Topics = new List<Topic>{Topics[1]}, Questions = new List<Question>(), Exams = new List<Exam>()},
        new Course{Id = 3, Name = "HTML5", Topics = new List<Topic>{Topics[2]}, Questions = new List<Question>(), Exams = new List<Exam>()},
        new Course{Id = 4, Name = "Javascript Fundamentals", Topics = new List<Topic>{Topics[2]}, Questions = new List<Question>(), Exams = new List<Exam>()},
    };
    
    static public List<Question> Questions = Helpers.AddQuestions();
    
    static public List<Exam> Exams = new List<Exam>();
    
    static public List<Instructor> Instructors = new List<Instructor>
    {
        new Admin     {Id = 1   ,FirstName = "Walid"   ,LastName = "Ahmed"   ,Department = Departments[3] ,  Username = "Walid_Ahmed1"     ,Password = "123", Courses = new List<Course>(){Courses[0]}},
        new Admin     {Id = 2   ,FirstName = "Ahmed"   ,LastName = "Ali"     ,Department = Departments[1] ,  Username = "Ahmed_Ali2"       ,Password = "123", Courses = new List<Course>(){Courses[1]}},
        new Instructor{Id = 3   ,FirstName = "Wael"    ,LastName = "Ali"     ,Department = Departments[2] ,  Username = "Wael_Ali3"        ,Password = "123", Courses = new List<Course>(){Courses[2]}},
        new Instructor{Id = 4   ,FirstName = "Rami"    ,LastName = "Mohamed" ,Department = Departments[3] ,  Username = "Rami_Mohamed4"    ,Password = "123", Courses = new List<Course>(){Courses[3]}},
        new Instructor{Id = 5   ,FirstName = "Hany"    ,LastName = "Alaa"    ,Department = Departments[4] ,  Username = "Hany_Alaa5"       ,Password = "123", Courses = new List<Course>()},
        new Instructor{Id = 6   ,FirstName = "Yasser"  ,LastName = "Ali"     ,Department = Departments[5] ,  Username = "Yasser_Ali6"      ,Password = "123", Courses = new List<Course>(){Courses[0]}},
        new Instructor{Id = 7   ,FirstName = "Marwa"   ,LastName = "Ahmed"   ,Department = Departments[6] ,  Username = "Marwa_Ahmed7"     ,Password = "123", Courses = new List<Course>(){Courses[1]}},
        new Instructor{Id = 8   ,FirstName = "Basma"   ,LastName = "Ali"     ,Department = Departments[7] ,  Username = "Basma_Ali8"       ,Password = "123", Courses = new List<Course>(){Courses[2]}},
        new Instructor{Id = 9   ,FirstName = "Hadeer"  ,LastName = "Ali"     ,Department = Departments[8] ,  Username = "Hadeer_Ali9"      ,Password = "123", Courses = new List<Course>(){Courses[3]}},
        new Instructor{Id = 10  ,FirstName = "Mariam"  ,LastName = "Ibrahim" ,Department = Departments[9] ,  Username = "Mariam_Ibrahim10" ,Password = "123", Courses = new List<Course>()},
        new Instructor{Id = 11  ,FirstName = "Hagar"   ,LastName = "Ali"     ,Department = Departments[9],  Username = "Hagar_Ali11"       ,Password = "123", Courses = new List<Course>(){Courses[0]}},
        new Instructor{Id = 12  ,FirstName = "Mostafa" ,LastName = "Ali"     ,Department = Departments[1] ,  Username = "Mostafa_Ali12"    ,Password = "123", Courses = new List<Course>(){Courses[1]}},
        new Instructor{Id = 13  ,FirstName = "Nada"    ,LastName = "Ali"     ,Department = Departments[1] ,  Username = "Nada_Ali13"       ,Password = "123", Courses = new List<Course>(){Courses[2]}},
        new Instructor{Id = 14  ,FirstName = "Samy"    ,LastName = "Ali"     ,Department = Departments[2] ,  Username = "Samy_Ali14"       ,Password = "123", Courses = new List<Course>(){Courses[3]}},
        new Instructor{Id = 15  ,FirstName = "Rami"    ,LastName = "Adel"    ,Department = Departments[3] ,  Username = "Rami_Adel15 "     ,Password = "123", Courses = new List<Course>()},
        new Instructor{Id = 16  ,FirstName = "Ahmed"   ,LastName = "Alaa"    ,Department = Departments[4] ,  Username = "Ahmed_Alaa16"     ,Password = "123", Courses = new List<Course>()},
        new Instructor{Id = 17  ,FirstName = "Ahmed"   ,LastName = "Safwat"  ,Department = Departments[5] ,  Username = "Ahmed_Safwat17"   ,Password = "123", Courses = new List<Course>()},
        new Instructor{Id = 18  ,FirstName = "Mohamed" ,LastName = "Ahmed"   ,Department = Departments[6] ,  Username = "Mohamed_Ahmed18"  ,Password = "123", Courses = new List<Course>()},
        new Instructor{Id = 19  ,FirstName = "Basma"   ,LastName = "Wael"    ,Department = Departments[7] ,  Username = "Basma_Wael19"     ,Password = "123", Courses = new List<Course>()},
        new Instructor{Id = 20  ,FirstName = "Ali"     ,LastName = "Youssef" ,Department = Departments[8] ,  Username = "Ali_Youssef20"    ,Password = "123", Courses = new List<Course>()},
        new Instructor{Id = 21  ,FirstName = "Ibrahim" ,LastName = "Wael"    ,Department = Departments[9] ,  Username = "Ibrahim_Wael21"   ,Password = "123", Courses = new List<Course>()},
    };

    static public List<Student> Students = new List<Student> {
        new Student{Id=0    ,FirstName = "Hagar"     ,LastName = "Mostafa"     ,Department = Departments[1]           ,Username = "a"                      ,Password = "123"                   , Courses = new List<Course>(){Courses[3], Courses[0]}, Exams = new List<StudentExam>()},
        new Student{Id=1    ,FirstName = "Hagar"     ,LastName = "Mostafa"     ,Department = Departments[1]           ,Username = "Hagar_Mostafa1"         ,Password = "Mostafa_Hagar1"        , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=2    ,FirstName = "Sara"      ,LastName = "Mohamed"     ,Department = Departments[2]           ,Username = "Sara_Mohamed2"          ,Password = "Mohamed_Sara2"         , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=3    ,FirstName = "Eman"      ,LastName = "Mohammed"    ,Department = Departments[3]           ,Username = "Eman_Mohammed3"         ,Password = "Mohammed_Eman3"        , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=4    ,FirstName = "Bassant"   ,LastName = "Mahgoub"     ,Department = Departments[4]           ,Username = "Bassant_Mahgoub4"       ,Password = "Mahgoub_Bassant4"      , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=5    ,FirstName = "Hafsa"     ,LastName = "Ebrahim"     ,Department = Departments[5]           ,Username = "Hafsa_Ebrahim5"         ,Password = "Ebrahim_Hafsa5"        , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=6    ,FirstName = "Dina"      ,LastName = "Samir"       ,Department = Departments[6]           ,Username = "Dina_Samir6"            ,Password = "Samir_Dina6"           , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=7    ,FirstName = "Khaled"    ,LastName = "Ayman"       ,Department = Departments[7]           ,Username = "Khaled_Ayman7"          ,Password = "Ayman_Khaled7"         , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=8    ,FirstName = "Ahmed"     ,LastName = "Muhammed"    ,Department = Departments[8]           ,Username = "Ahmed_Muhammed8"        ,Password = "Muhammed_Ahmed8"       , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=9    ,FirstName = "Ahmed"     ,LastName = "Negmeldin"   ,Department = Departments[9]           ,Username = "Ahmed_Negmeldin9"       ,Password = "Negmeldin_Ahmed9"      , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=10   ,FirstName = "Raouf"     ,LastName = "Alaadin"     ,Department = Departments[1]           ,Username = "Raouf_Alaadin10"        ,Password = "Alaadin_Raouf10"       , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=11   ,FirstName = "Karim"     ,LastName = "Eid"         ,Department = Departments[1]           ,Username = "Karim_Eid11"            ,Password = "Eid_Karim11"           , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=12   ,FirstName = "Shrief"    ,LastName = "Hesham"      ,Department = Departments[2]           ,Username = "Shrief_Hesham12"        ,Password = "Hesham_Shrief12"       , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=13   ,FirstName = "Abdallah"  ,LastName = "Mohamed"     ,Department = Departments[3]           ,Username = "Abdallah_Mohamed13"     ,Password = "Mohamed_Abdallah13"    , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=14   ,FirstName = "Mina"      ,LastName = "Yossry"      ,Department = Departments[4]           ,Username = "Mina_Yossry14"          ,Password = "Yossry_Mina14"         , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=15   ,FirstName = "Hossam"    ,LastName = "Mahmoud"     ,Department = Departments[5]           ,Username = "Hossam_Mahmoud15"       ,Password = "Mahmoud_Hossam15"      , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=16   ,FirstName = "Maged"     ,LastName = "Samir"       ,Department = Departments[6]           ,Username = "Maged_Samir16"          ,Password = "Samir_Maged16"         , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=17   ,FirstName = "Mohaned"   ,LastName = "Saudi"       ,Department = Departments[7]           ,Username = "Mohaned_Saudi17"        ,Password = "Saudi_Mohaned17"       , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=18   ,FirstName = "Asmaa"     ,LastName = "Mohamed"     ,Department = Departments[8]           ,Username = "Asmaa_Mohamed18"        ,Password = "Mohamed_Asmaa18"       , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=19   ,FirstName = "Zeinab"    ,LastName = "Mahmoud"     ,Department = Departments[9]           ,Username = "Zeinab_Mahmoud19"       ,Password = "Mahmoud_Zeinab19"      , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=20   ,FirstName = "Shahenda"  ,LastName = "Hamdy"       ,Department = Departments[1]           ,Username = "Shahenda_Hamdy20"       ,Password = "Hamdy_Shahenda20"      , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=21   ,FirstName = "Heba"      ,LastName = "Allah"       ,Department = Departments[1]           ,Username = "Heba_Allah21"           ,Password = "Allah_Heba21"          , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=22   ,FirstName = "Maha"      ,LastName = "Yehia"       ,Department = Departments[2]           ,Username = "Maha_Yehia22"           ,Password = "Yehia_Maha22"          , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=23   ,FirstName = "Mohamed"   ,LastName = "Refaat"      ,Department = Departments[3]           ,Username = "Mohamed_Refaat23"       ,Password = "Refaat_Mohamed23"      , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=24   ,FirstName = "Youssef"   ,LastName = "Ehab"        ,Department = Departments[4]           ,Username = "Youssef_Ehab24"         ,Password = "Ehab_Youssef24"        , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=25   ,FirstName = "Omar"      ,LastName = "Mosaad"      ,Department = Departments[5]           ,Username = "Omar_Mosaad25"          ,Password = "Mosaad_Omar25"         , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=26   ,FirstName = "Amr"       ,LastName = "Sherif"      ,Department = Departments[6]           ,Username = "Amr_Sherif26"           ,Password = "Sherif_Amr26"          , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=27   ,FirstName = "Khaled"    ,LastName = "Magdy"       ,Department = Departments[7]           ,Username = "Khaled_Magdy27"         ,Password = "Magdy_Khaled27"        , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=28   ,FirstName = "Mahmoud"   ,LastName = "Sherif"      ,Department = Departments[8]           ,Username = "Mahmoud_Sherif28"       ,Password = "Sherif_Mahmoud28"      , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=29   ,FirstName = "Mohamed"   ,LastName = "Abdelfattah" ,Department = Departments[9]           ,Username = "Mohamed_Abdelfattah29"  ,Password = "Abdelfattah_Mohamed29" , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=30   ,FirstName = "Hesham"    ,LastName = "Essam"       ,Department = Departments[1]           ,Username = "Hesham_Essam30"         ,Password = "Essam_Hesham30"        , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=31   ,FirstName = "Ahmed"     ,LastName = "Taha"        ,Department = Departments[1]           ,Username = "Ahmed_Taha31"           ,Password = "Taha_Ahmed31"          , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=32   ,FirstName = "Ahmed"     ,LastName = "Mohamed"     ,Department = Departments[2]           ,Username = "Ahmed_Mohamed32"        ,Password = "Mohamed_Ahmed32"       , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=33   ,FirstName = "Mahmoud"   ,LastName = "Hossam"      ,Department = Departments[3]           ,Username = "Mahmoud_Hossam33"       ,Password = "Hossam_Mahmoud33"      , Courses = new List<Course>(), Exams = new List<StudentExam>()},
        new Student{Id=34   ,FirstName = "Mohammed"  ,LastName = "Ahmed"       ,Department = Departments[4]           ,Username = "Mohammed_Ahmed34"       ,Password = "Ahmed_Mohammed34"      , Courses = new List<Course>(), Exams = new List<StudentExam>()},
    };

    static public Person CurrentUser;

    static public string Type;

    static void Main(string[] args)
    {
        while (true)
        {
            Authenticate();
            Console.Clear();
            if (CurrentUser != null) {
                if (Type == "Admin")
                    ((Admin)CurrentUser).PresentAdminMenu();
                else
                    CurrentUser.PresentMenu();
            }
        }
    }

    static public int Authenticate()
    {
        Console.Clear();

        string welcome = "\t\t\t\t***********************************************************\n" +
                         "\t\t\t\t*********** Welcome to ITI Examination System *************\n" +
                         "\t\t\t\t***********************************************************\n\n\n\n\n";

        string role = "";

        while (role != "1" && role != "2")
        {
            Console.WriteLine(
                welcome +
                "Please select your role: \n" +
                "1- Instructor\n2- Student\n\n");

            role = Console.ReadLine();
        }

        while (true)
        {
            Console.Clear();
            Console.Write(welcome + "Username: ");
            var username = Console.ReadLine();
            Console.Write("Password: ");
            var password = Console.ReadLine();

            Person tmp;

            if (role == "1")
                tmp = Instructors.SingleOrDefault((i) => i.Username == username && i.Password == password);

            else
                tmp = Students.SingleOrDefault((i) => i.Username == username && i.Password == password);

            if (tmp != null)
            {
                CurrentUser = tmp;
                Type = tmp.GetType().Name;
                return tmp.Id;
            }

            Console.WriteLine("Wrong username or password press ESC to cancel or ENTER to try again");
            var choice = Console.ReadKey();

            if (choice.Key == ConsoleKey.Escape)
            {
                return -1;
            }
        }
    }
}