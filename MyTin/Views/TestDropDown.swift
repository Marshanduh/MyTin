import SwiftUI

struct TestDropDown: View {
    @State var selection1: String? = nil
    
    var body: some View {
        VStack {
            DropDownPicker(
                selection: $selection1,
                options: [
                    "Apple",
                    "Google",
                    "Amazon",
                    "Facebook",
                    "Instagram"
                ]
            )
            
            DropDownPicker(
                selection: $selection1,
                options: [
                    "Apple",
                    "Google",
                    "Amazon",
                    "Facebook",
                    "Instagram"
                ]
            )
            
            Spacer()
        }
    }
}

enum DropDownPickerState {
    case top
    case bottom
}

struct DropDownPicker: View {
    @Binding var selection: String?
    var state: DropDownPickerState = .bottom
    var options: [String]
    var maxWidth: CGFloat = 180
    
    @State private var showDropdown = false
    
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State private var zindex = 1000.0
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            VStack(spacing: 0) {
                if state == .top && showDropdown {
                    OptionsView()
                }
                
                HStack {
                    Text(selection == nil ? "Select" : selection!)
                        .foregroundColor(selection != nil ? .black : .gray)
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: showDropdown ? "chevron.up" : "chevron.down")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 15)
                .frame(width: maxWidth, height: 50)
                .background(Color.white)
                .contentShape(Rectangle())
                .onTapGesture {
                    index += 1
                    zindex = index
                    withAnimation(.easeInOut) {
                        showDropdown.toggle()
                    }
                }
                .zIndex(10)
                
                if state == .bottom && showDropdown {
                    OptionsView()
                }
            }
            .clipped()
            .background(Color.white)
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray)
            }
            .frame(height: size.height, alignment: state == .top ? .bottom : .top)
        }
        .frame(width: maxWidth, height: 50)
        .zIndex(zindex)
    }
    
    @ViewBuilder
    func OptionsView() -> some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                HStack {
                    Text(option)
                    Spacer()
                    if selection == option {
                        Image(systemName: "checkmark")
                    }
                }
                .foregroundStyle(selection == option ? Color.primary : Color.gray)
                .animation(.none, value: selection)
                .frame(height: 40)
                .contentShape(Rectangle())
                .padding(.horizontal, 15)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        selection = option
                        showDropdown.toggle()
                    }
                }
            }
        }
        .transition(.move(edge: state == .top ? .bottom : .top))
        .zIndex(1)
    }
}

struct TestDropDown_Preview: PreviewProvider {
    static var previews: some View {
        TestDropDown()
    }
}
