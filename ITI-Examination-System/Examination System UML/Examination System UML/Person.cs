namespace Examination_System_UML;

public abstract class Person
{
    public int Id { get; set; }
    
    public string FirstName { get; set; }
    
    public string LastName { get; set; }

    public string Username { get; set; }

    public string Password { get; set; }

    public abstract override string ToString();

    public abstract void  PresentMenu();
}