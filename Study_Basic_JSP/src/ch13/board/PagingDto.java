package ch13.board;

public class PagingDto {
	private int startRow;
	private int endRow;

	public PagingDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PagingDto(int startRow, int endRow) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	@Override
	public String toString() {
		return "PagingDto [startRow=" + startRow + ", endRow=" + endRow + "]";
	}

}
