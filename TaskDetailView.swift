//
//  TaskDetailView.swift
//  doItList
//
//  Created by Ahmad Fadel on 01/12/2024.
//

import SwiftUI

struct TaskDetailView: View {
    @Binding var task: Task
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Form {
            TextField("Title", text: $task.title)
            TextField("Description", text: $task.description)
            Picker("Priority", selection: $task.priority) {
                Text("Low").tag("Low")
                Text("Medium").tag("Medium")
                Text("High").tag("High")
            }
        }
        .navigationBarTitle("Edit Task", displayMode: .inline)
        .navigationBarItems(trailing: Button("Save"){
            presentationMode.wrappedValue.dismiss()
        })
        
    }
}



struct TaskDetailView_Previews: PreviewProvider {
    @State static var task = Task(title:"Sample Task", description: "Description", priority: "Low", isCompleted: false)
    static var previews: some View {
        TaskDetailView(task: $task)
    }
}
