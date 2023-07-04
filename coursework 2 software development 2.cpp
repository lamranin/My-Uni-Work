#include <iostream>                       //include different libraries
#include <iomanip>                        // Import library thay will control the output
#include <string>                         // Import cin and cout from the library to be able to take input and print output
#include <unordered_map>                  // Import library that will manipulate the output
#include <fstream>                        //Import fstream package


using std::cout;                         //establishing what we are going to use by creating identifiers
using std::cin;
using std::getline;
using std::endl;
using std::setw;
using std::string;
using std::unordered_map;
using std::ifstream;
using std::ofstream;

struct employee //the structure of employees and the data types of each employee information
{
    int num = 0;
    string name;
    string dob;
    string tel;
    string postcode;
    int checksum = 0;
};

void print_employee(const employee& emp) // function  prints the employees and sets limits to each variable
{
    cout << setw(10) << emp.num; //Print output of the employee number and in a cell of 10 charachters wide
    cout << setw(20) << emp.name; //Print output of the employee number and in a cell of 20 charachters wide
    cout << setw(12) << emp.dob;//Print output of the employee number and in a cell of 12 charachters wide
    cout << setw(13) << emp.tel;//Print output of the employee number and in a cell of 13 charachters wide
    cout << setw(10) << emp.postcode;//Print output of the employee number and in a cell of 10 charachters wide
    cout << endl;
}

void print_employee_table(const unordered_map<int, employee>& employees) //printing the employee table and setting the length possible for each variable with headers containg all informations required
{
    cout << setw(10) << "|| Number" << setw(20) << " || Name" << setw(12) << "|| DOB" << setw(13) << "||Telephone" << setw(10) << "|| Postcode" << endl;
    for (const auto& emp : employees)
    {
        print_employee(emp.second); // Print employee data information
    }
}
// Creat a function that takes the user's input
employee read_employee_user() //read what user says and save employee information to employees
{
    employee emp; // structure employee
    cout << "Enter employee number: "; // print the output
    cin >> emp.num; // input a number
    cin.ignore(); // ignore cin
    cout << "Enter employee name: ";
    getline(cin, emp.name);
    cout << "Enter dob: ";
    getline(cin, emp.dob);
    cout << "Enter tel: ";
    getline(cin, emp.tel);
    cout << "Enter postcode: ";
    getline(cin, emp.postcode);
    return emp;//return to employees
}

void capitalise_name(employee& emp) //funvtopm that capitalises the name of employee
{
    auto data = emp.name.c_str();
    auto len = emp.name.length();
    _asm
    {
        //load length into ecx register
        //used for loop counting
        mov ecx, len
        //load the memory location into ebx register
        //used to access correct element in array
        mov ebx, data

        start_loop :
        //move byte in memory location ebx +exc -1 into al register
        mov al, byte ptr[ebx + ecx - 1]
            // compare al register to z
            cmp al, 'z'
            jg end_loop
            //compare al register to a
            cmp al, 'a'
            jl end_loop
            sub al, 32
            mov byte ptr[ebx + ecx - 1], al

            end_loop :
        loop start_loop
    }
}

int generate_checksum(employee& emp) //function that generates a check sum for name

{
    auto data = emp.name.c_str();
    auto len = emp.name.length();
    int count = 0;
    __asm
    {
        // Load lengh into ecx register
        // Used for loop counting
        mov ecx, len
        // Load the memory location into ebx register
        // Used to access correct eleement in array
        mov ebx, data
        start_loop :
        // Move byte in memory location ebx + ecx - 1 into al register
        mov al, byte ptr[ebx + ecx - 1]
            // Compare value in al register to A
            cmp al, 'A'
            // If al is less than A then jump to end_loop
            jl end_loop
            // Compare value in al register to z
            cmp al, 'z'
            // If al is greater tham z then jump to end_loop
            jg end_loop
            // Now we need to check for values between Z and a
            // Compare value in al register to Z
            cmp al, 'Z'
            // If less than Z jump to increment
            jl increment
            // Compare value in al register to a
            cmp al, 'a'
            // If greater than a jump to increment
            jg increment
            // If we are here then not a letter
            // Jump to end loop
            jmp end_loop
            increment :
        // If we are here, value must be a letter
         // Move value of count into eax register
        mov eax, count
            // Increment eax register
            inc eax
            add eax, ebx
            // Move value of eax register
            mov count, eax
            end_loop :
        // If ecx>1 then loop
        loop start_loop
    }
    return count;
}

void read_employees_file(unordered_map<int, employee>& employees) //read employee file and output from file
{
    string filename; //setting data type for file name
    cout << "Enter filename: ";
    cin >> filename; //input file name
    ifstream file(filename); //read file
    while (file.peek() != EOF)
    {
        employee emp;
        string buf;
        getline(file, buf);
        emp.num = atoi(buf.c_str());
        getline(file, emp.name); //getting lines from file
        getline(file, emp.dob);
        getline(file, emp.tel);
        getline(file, emp.postcode);
        capitalise_name(emp);
        generate_checksum(emp);
        employees[emp.num] = emp;
    }
    file.close();//close file
}

void write_employees_file(const unordered_map<int, employee>& employees) //function to write to file employee information
{
    string filename;
    cout << "Enter filename: ";
    cin >> filename;
    ofstream file(filename);
    for (const auto& emp : employees)
    {
        file << emp.second.num << endl; //writing to file
        file << emp.second.name << endl;
        file << emp.second.dob << endl;
        file << emp.second.tel << endl;
        file << emp.second.postcode << endl;
    }
    file.close();//close file
}

int menu() //selecting choice for menu to display it (FUNCTION)
{
    int choice = -1;
    while (choice < 0 || choice > 4)//while choice isnt between 0 and 4 it will display the menu
    {
        cout << "Main menu" << endl;
        cout << "1. Add employee" << endl;
        cout << "2. Print employees" << endl;
        cout << "3. Read employees from file" << endl;
        cout << "4. Output employees to file" << endl;
        cout << "0. Exit" << endl;
        cout << "Enter choice: ";
        cin >> choice; //getting choice from user
        if (choice < 0 || choice > 4) //if chioce isnt between 0 and 4 display error message
        {
            cout << "Please enter a number between 0 and 4" << endl;
        }
    }
    return choice; //return choice
}

int main(int argc, char** argv)//main function to connect other functions together
{
    unordered_map<int, employee> employees;
    int choice = -1;
    while (choice != 0)
    {
        choice = menu();
        switch (choice)
        {
        case 0: //if choice 0 stop program
        {
            cout << "Goodbye!" << endl;
            break;//stops program
        }
        case 1: //input employee information if choice 1
        {
            employee emp = read_employee_user();
            capitalise_name(emp);
            generate_checksum(emp);
            employees[emp.num] = emp;
            cout << "your checksum is : " << generate_checksum(emp) << endl;
            break;//Use brake statement to end the code after it is executed

        }
        case 2: // print the emplyee table if choice is 2
        {
            print_employee_table(employees);
            break;//Use brake statement to end the code after it is executed

        }
        case 3: //if choice is 3 read from file and print the information
        {
            read_employees_file(employees);
            break;//Use brake statement to end the code after it is executed

        }
        case 4: //if choice 4 write to the file and save it
        {
            write_employees_file(employees);
            break;//Use brake statement to end the code after it is executed

        }
        }
    }
}