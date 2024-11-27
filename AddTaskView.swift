//
//  AddTaskView.swift
//  doItList
//
//  Created by Ahmad Fadel on 27/11/2024.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var tasks: [Task]
    @State private var title = ""
    @State private var description = ""
    @State private var priority = "Low"
    let priorities = ["Low", "Medium", "High"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                Picker("Priority", selection: $priority){
                    ForEach(priorities, id: \.self){
                        Text($0)
                    }
                }
                
            }
            .navigationBarTitle("New Task", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save"){
                let newTask = Task(title: title, description: description, priority: priority, isCompleted: false)
                tasks.append(newTask)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    @State static var tasks = [Task]()
    
    static var previews: some View {
        AddTaskView(tasks: $tasks)
    }
}
