using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MaiAmTruyenTin.Common
{
    public class NameToCode
    {
		public string[] VietNamChar = new string[]
		{
			"aAeEoOuUiIdDyY",
			"áàạảãâấầậẩẫăắằặẳẵ",
			"ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",
			"éèẹẻẽêếềệểễ",
			"ÉÈẸẺẼÊẾỀỆỂỄ",
			"óòọỏõôốồộổỗơớờợởỡ",
			"ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",
			"úùụủũưứừựửữ",
			"ÚÙỤỦŨƯỨỪỰỬỮ",
			"íìịỉĩ",
			"ÍÌỊỈĨ",
			"đ",
			"Đ",
			"ýỳỵỷỹ",
			"ÝỲỴỶỸ"
		};
		public string LocDauTen(string name)
		{
			//Thay thế và lọc dấu từng char      
			for (int i = 1; i < VietNamChar.Length; i++)
			{
				for (int j = 0; j < VietNamChar[i].Length; j++)
					name = name.Replace(VietNamChar[i][j], VietNamChar[0][i - 1]);
			}
			return name;
		}
		public int spaceCountAction(string name)
		{
			int spaceCount = 0;
			name = LocDauTen(name);
			for (int i = 0; i < name.Length; i++)
			{
				if (name[i].ToString().Contains(" "))
				{
					spaceCount++;
				}
			}
			return spaceCount;
		}
		public string getLastName(string name)
		{
			int indexLast = name.LastIndexOf(" ");
			string lastName = name.Substring(indexLast);
			return lastName;
		}
		
	}
}