package com.okbs.document;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Document(collection = "user1")
@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserDocument {

		@Id
		private String _id;
		private String name;
		private String pw;
}
