package goodman.Models;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;

public class QueryGenerator {

	public static PreparedStatement getElementById(Connection con,
			String tableName, String IdColumnName, String value) {

		{
			PreparedStatement preparedStatement = null;
			String query = "SELECT * FROM " + tableName + " " + "WHERE "
					+ IdColumnName + "=?";
			try {
				preparedStatement = con.prepareStatement(query);
				preparedStatement.setString(1, value);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.print(e.getMessage());
				return null;
			}
			return preparedStatement;
		}
	}

	public static PreparedStatement getEditRowStatement(Connection con, String tableName,
			String attributeName, String pk, String value, String IdColumnName) {
		PreparedStatement preparedStatement = null;
		String query = "UPDATE " + tableName + " " + "SET " + attributeName
				+ "=?" + " " + "WHERE " + IdColumnName + "=?";
		try {
			preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, value);
			preparedStatement.setString(2, pk);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
			return null;
		}
		return preparedStatement;
	}
}
