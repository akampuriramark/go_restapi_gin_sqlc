package db

import (
	"context"
	"testing"

	"github.com/gin-rest-postgres/util"
	"github.com/stretchr/testify/require"
)

func TestCreateCustomer(t *testing.T) {
	arg := CreateCustomerParams{
		CustomerRef: util.RandomCustomerRef(),
		FullName:    util.RandomCustomerName(),
		Email:       util.RandomCustomerMail(),
		Address:     util.RandomCustomerAddress(),
	}
	customer, err := testQueries.CreateCustomer(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, customer)

	require.Equal(t, arg.CustomerRef, customer.CustomerRef)
	require.Equal(t, arg.Email, customer.Email)
	require.Equal(t, arg.FullName, customer.FullName)

	require.NotZero(t, customer.CreatedAt)
	require.NotZero(t, customer.ID)
}
