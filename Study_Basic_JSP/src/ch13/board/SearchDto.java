package ch13.board;

public class SearchDto {
	private String searchType;
	private String keyword;

	public SearchDto() {
		super();
	}

	public SearchDto(String searchType, String keyword) {
		super();
		this.searchType = searchType;
		this.keyword = keyword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchDto [searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}
