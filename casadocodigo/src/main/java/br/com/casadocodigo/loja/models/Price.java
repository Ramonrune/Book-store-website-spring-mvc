package br.com.casadocodigo.loja.models;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.hibernate.validator.constraints.NotBlank;

@Embeddable
public class Price {

	@Column(scale = 2)
	@NotBlank
	private BigDecimal value;
	@NotBlank
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
