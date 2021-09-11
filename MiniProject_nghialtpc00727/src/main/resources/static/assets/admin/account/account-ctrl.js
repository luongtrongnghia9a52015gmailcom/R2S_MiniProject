app.controller('account-ctrl', function($scope, $http) {
	$scope.accounts = [];
	$scope.form = {};
	$scope.orders = [];
	$scope.authorities = [];
	
	$scope.initialize = function() {
		// load accounts
		$http.get("/rest/adminaccounts").then(resp => {
			$scope.accounts = resp.data;
			$scope.accounts.forEach(item => {
				item.birthdate = new Date(item.birthdate);
			})
		});
	}
	
	$scope.initialize2 = function() {
		// load orders
		$http.get("/rest/orders").then(resp => {
			$scope.orders = resp.data;
		});
	}
	
	$scope.initialize3 = function() {
		// load authorities
		$http.get("/rest/authorities").then(resp => {
			$scope.authorities = resp.data;
		});
	}

	// Khởi đầu
	$scope.initialize();

	// Xóa form
	$scope.reset = function() {
		$scope.form = {
			photo: 'useradmin.png'
		};
	}

	// Hiển thị lên form
	$scope.edit = function(account) {
		$scope.form = angular.copy(account);
		$(".nav-tabs a:eq(0)").tab('show')
	}

	// Thêm accounts mới
	$scope.create = function() {
		 var account = angular.copy($scope.form);
		 if(account.photo == null){
			 account.photo = 'useradmin.png';
		 }
	     $http.post(`/rest/adminaccounts`, account).then(resp => {
	    	 $scope.accounts.push(resp.data);
	    	 
	    	 var role = {
			    id: 'USER',
			    name: 'Nguoi Dung'
			 };
			 
	    	 var authority = {account: account, role: role};
	    	 
	    	 $http.post(`/rest/authorities`, authority).then(resp => {
	 		 }).catch(error => {
	 			console.log("Error", error);
	 		 })
	    	 
	    	 $scope.reset();
	    	 alert("Thêm tài khoản mới thành công");
	     }).catch(error => {
	    	 alert("Lỗi thêm tài khoản mới");
	    	 console.log("Error", error);
	     });
	}

	// Cập nhật accounts
	$scope.update = function() {
		 var account = angular.copy($scope.form);
	     $http.put(`/rest/adminaccounts/${account.username}`, account).then(resp => {
	    	 var index = $scope.accounts.findIndex(a => a.username == account.username);
	    	 $scope.accounts[index] = account;
	    	 alert("Cập nhật tài khoản thành công");
	     }).catch(error => {
	    	 alert("Lỗi cập nhật tài khoản");
	    	 console.log("Error", error);
	     });
	}
	
	// Xóa accounts
	$scope.delete = function(account) {
		$http.get(`/rest/orders/${account.username}`).then(resp => {
			if(resp.data.length == 0){
				
				$http.delete(`/rest/authorities2/${account.username}`).then(resp => {
					console.log("Xóa authority");
		   	 	 }).catch(error => {
		   			alert("Lỗi xóa authority!");
		   			console.log(error);
		   		 });
				 			
			     $http.delete(`/rest/adminaccounts/${account.username}`, account).then(resp => {
			    	 var index = $scope.accounts.findIndex(a => a.username == account.username);
			    	 $scope.accounts.splice(index, 1);
			    	 $scope.reset();
			    	 alert("Xóa tài khoản thành công");
			     }).catch(error => {
			    	 alert("Lỗi xóa tài khoản");
			    	 console.log("Error", error);
			     });
				 
			}else{
				alert("Tài khoản đã đặt hàng không thể xóa");
			}
		});
	}

	// Upload hình
	$scope.imageChanged = function(files) {
		var data = new FormData();
		data.append('file' , files[0]);
		$http.post('/rest/upload/images', data,{
			transformRequest: angular.identity,
			headers: {'Content-Type': undefined}
		}).then(resp => {
			$scope.form.photo = resp.data.name;
		}).catch(error => {
			alert("Lỗi upload hình ảnh");
			console.log("Error", error);
		})
	}
	
	
	$scope.pager = {
		page: 0,
		size: 10,
		get accounts(){
			var start = this.page * this.size;
			return $scope.accounts.slice(start, start + this.size);
		},
		get count(){
			return Math.ceil(1.0 * $scope.accounts.length / this.size);
		},
		
		first(){
			this.page = 0;
		},
		
		prev(){
			this.page --;
			if(this.page < 0){
				this.last();
			}
		},
		
		next(){
			this.page ++ ;
			if(this.page >= this.count){
				this.first();
			}
		},
		 
		last(){
			this.page = this.count - 1;
		}
	};
});