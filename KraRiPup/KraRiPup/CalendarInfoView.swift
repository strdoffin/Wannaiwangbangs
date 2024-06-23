import SwiftUI

struct CalendarInfoView: View {
    @Environment(\.dismiss) var dismiss
    @State var comparedate = "22/06/2567"
    @State private var selectedDate = Date()
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            Color.teal
                .ignoresSafeArea()

            VStack {
                // Display selected date as an integer (day of the month)
                HStack{
                    Button("back") {
                        dismiss()
                    }
                    Spacer()
                    Text("Select Wan Wang")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white )
                        .fontWeight(.bold)
                }.padding()

                List {
                    Section(header: Text("Detail")) {
                        Text("ชื่อคนใช้อ้ะ : ")
                    }
                    VStack {
                        // Calendar
                        DatePicker(
                            "Select a date",
                            selection: $selectedDate,
                            displayedComponents: .date
                        )
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding()

                        Spacer()

                        Text("Wanni Wang: \(formattedDate)")
                            .font(.title2)
                            .padding()

                        Spacer()

                        Button(action: {
                            printSelectedDate()
                            self.isActive.toggle()
                        }) {
                            Text("ส่งวันที่ว่างจุ้บๆ")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                                .background(isActive ? Color.gray : Color.blue)
                                .cornerRadius(50)
                        }
                        .padding()

                        Spacer()
                    }
                    .padding()
                }
                .listStyle(GroupedListStyle()) // Apply list style
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: selectedDate)
    }

    var dayOfMonth: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: selectedDate)
        return components.day ?? 0
    }

    func printSelectedDate() {
        print("Selected date is \(formattedDate)")
    }
}

struct CalendarInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarInfoView()
    }
}
