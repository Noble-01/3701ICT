import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var tasklist = TaskList()
    @State var newTask : String = ""
    
    var searchBar : some View {
        HStack {
            TextField("Enter in a new task", text: self.$newTask)
            Button(action: self.addTask, label: {
                Text("Add New Task")
            })
        }
    }
    
    func addTask() {
        tasklist.tasks.append(Task(id: String(tasklist.tasks.count + 1), Item: newTask))
        self.newTask = ""
        //Add auto generated id in the future.
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List {
                    ForEach(self.tasklist.tasks) { task in
                        Text(task.Item)
                    }
                }.navigationBarTitle("Tasks")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
