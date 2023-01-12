//
//  ProductRow.swift
//  exPIERed
//
//  Created by Vito Gallo on 12/01/23.
//

import SwiftUI

struct ProductRow: View {
    var name: String
    var date: Date
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 2){
                Text(name)
                    .font(.system(size: 17))
                Text("\(formatDate(date: date, format: "DD MMMM YYYY"))")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)

            }
            
            Spacer()
            
            Text(checkDates(date: date))
                .font(.system(size: 17))
                .foregroundColor(.gray)
        }
        .padding(.vertical, 3)
    }
    
    func formatDate(date: Date, format: String) -> String{
        let dayFormatter = DateFormatter()
        let _ = dayFormatter.locale = Locale(identifier: "it_IT")
        let _ = dayFormatter.dateFormat = format
        
        return dayFormatter.string(from: date).capitalized
    }
    
    func compareDates(date: Date) -> String{
        let expirationDate = Calendar.current.dateComponents([.year,.month,.day], from: date)
        let currentDate = Calendar.current.dateComponents([.year,.month,.day], from: Date())

        let difference: String = "\(Calendar.current.dateComponents([.day], from: expirationDate, to: currentDate))"
        
        return difference.filter("0123456789.".contains)
    }
    
    func checkDates(date: Date) -> String{
        
        if date <= Date(){
            return "Expired"
        } else{
           return "In \(compareDates(date: date)) Days"
        }
                
    }

}

//struct ProductRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductRow(name: String, date: <#Date#>)
//    }
//}
