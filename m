Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AE63203B7
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701707; cv=none; b=up8Jv9UwIwntVzpvufNTFSDBnIJo/z6AZO8w3jAdyPZTGVawv2IjGOGXTZit6sYMxw3w2mCtIRDidSG6NI16nCAkJ68HLfakR0hcQOek7gXzIbAfgdjyp3L8vr4R1ObcNaTTgsn994BeNEC0BIGmceAKNHGmelDSl4Ui9wcEvHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701707; c=relaxed/simple;
	bh=05u+NlKkBmWWj7eOhq/8VqaBrF/LA77cJj2o3kbDEH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQZccOaHOPi7eJMNZiWps3GrHOIpGbyQhwsgK+pfOMRcboA4mSuf1L6Wv/Egg87yE8iaQGRhYR//YsVo06jZst9gOYAIABALDI2evX0RRjA1Gvu+fkmGzmmOgcfkJ0qY38/uU6BQ5XN2JUKuY7gkLyAzhRL8rIysRdjsOPiyw5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=upd4OasB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="upd4OasB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210CBC4CEE7;
	Wed, 20 Aug 2025 14:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755701707;
	bh=05u+NlKkBmWWj7eOhq/8VqaBrF/LA77cJj2o3kbDEH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=upd4OasBrIUum8Q/Ii9OsQ+22poYjNHtr+wqxwLOzmhRHdbrCZrPGYRwkZlN9CgSq
	 /WiO6c0lwWqF8McrR/Q92iqS5hh4akP2cPRSfXN43tInKG/2s/oRGdf//2de7w+3zV
	 Rgr0W8Wn9lQqQyy1oswzJLfU4AHt103E7+RnOWI0KuGqBo2Rvh8RZdRBwed+kK2udF
	 sKnmEmmOmIJycoavSv/j8hUM1Hk66sDKsDNhuy9vyelrMm4ZS0xDMcStL2kWZn3VMg
	 aYdYK3XqvI/LEM1q/5784c7SzEQTI+skqaDv/shyxzveJZIIswfxGoXPQTmDxTIk9d
	 2uimbiTN+3cFw==
From: Danilo Krummrich <dakr@kernel.org>
To: lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	abdiel.janulgue@gmail.com,
	acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v5 6/7] rust: alloc: layout: implement ArrayLayout::size()
Date: Wed, 20 Aug 2025 16:53:42 +0200
Message-ID: <20250820145434.94745-7-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820145434.94745-1-dakr@kernel.org>
References: <20250820145434.94745-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a convenience method for ArrayLayout to calculate the size of
the ArrayLayout in bytes.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/layout.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/alloc/layout.rs b/rust/kernel/alloc/layout.rs
index 93ed514f7cc7..666accb7859c 100644
--- a/rust/kernel/alloc/layout.rs
+++ b/rust/kernel/alloc/layout.rs
@@ -98,6 +98,11 @@ pub const fn len(&self) -> usize {
     pub const fn is_empty(&self) -> bool {
         self.len == 0
     }
+
+    /// Returns the size of the [`ArrayLayout`] in bytes.
+    pub const fn size(&self) -> usize {
+        self.len() * core::mem::size_of::<T>()
+    }
 }
 
 impl<T> From<ArrayLayout<T>> for Layout {
-- 
2.50.1

