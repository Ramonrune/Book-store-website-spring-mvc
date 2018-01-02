package com.casadocodigoboot.loja.models;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Embeddable
public class Price {

	@Column(scale = 2)
	@NotNull
	@Min(0)
	@Max(400)
	private BigDecimal value;
	@NotNull
	@Column(name = "bookType")
	private BookType bookType;
	
	
	public BigDecimal getValue() {
		return value;
	}
	public void setValue(BigDecimal value) {
		this.value = value;
	}
	public BookType getBookType() {
		return bookType;
	}
	public void setBookType(BookType bookType) {
		this.bookType = bookType;
	}
	
	@Override
	public String toString() {
		return "Preço [value=" + value + ", bookType=" + bookType + "]";
	}
	
}
