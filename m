Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5081A3C5530;
	Wed, 25 Mar 2026 12:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443482; cv=none; b=eMRsGAhPUPnB6VLgmKKsvKMWQnI2ipXOrC5gFTzpJ0RTnA3JdccnjJqeD7gUWGyK+gLmrncgoiIRbOv9dCfsGU1B37KqX7sRWH4u65P91LczGCb8OTmYqMvJSlIA3iWxHLmVFsw+O+iH4f9+HFp2kje2aPo9ZP9gZI4SRzHZRlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443482; c=relaxed/simple;
	bh=UfnWN285MUfmVLKA6MU77kon2/LGoWZDM0gUkI/WdZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A5d8Z5vAm8ilGHbVWC70Ou0kkQ15chbKMOLowpCwqCMhzjuNjHQSaS0WnLsph9AClOUCNDE/ZR+gcsqmKAj46/nY5t2wWPI6ONare0iIj6vcK9Fs4/C3OQaTX4q2igze24jVmcqC7GG4NEdJGDQWw2Xd1bfTqFwR7R6KK4urXG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sTulG/6S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sTulG/6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF0CC4CEF7;
	Wed, 25 Mar 2026 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774443482;
	bh=UfnWN285MUfmVLKA6MU77kon2/LGoWZDM0gUkI/WdZ4=;
	h=From:To:Cc:Subject:Date:From;
	b=sTulG/6SOO0DK+PXudE5JGao6Lp1K7IeslX+1Y8mRZvfxxItOWA6bYzOyFAjY+0vy
	 3CKAeoVJ35hnCLPR8CQEJULgESzmYbMY/z2dCd/DWKSVXVdT+C5uyh2eNTJStPVwyd
	 oO2iyVsoTlXHe1zqD6VdDGjQiXDXK3awqmoROQKt0AJ402ZhVg4PG/xJX12gtS2Jd3
	 9uAwLjGq1vJ7IhjIp3Lugv1d6JtAotcUCjZnG+xsIBYoXIkJd3/e3DjUkI88gjLKnM
	 eJre8fPmxlGCSLAfdh7okr39XUt2Q7VoxeJB9acsj79uRRYbKhbV2FEB5z/V7SJnfU
	 7d3g1rTmA9s7Q==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: stable@vger.kernel.org,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.18.y 1/2] rust: pin-init: internal: init: document load-bearing fact of field accessors
Date: Wed, 25 Mar 2026 13:57:50 +0100
Message-ID: <20260325125753.944918-1-lossin@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ Upstream commit 580cc37b1de4fcd9997c48d7080e744533f09f36 ]

The functions `[Pin]Init::__[pinned_]init` and `ptr::write` called from
the `init!` macro require the passed pointer to be aligned. This fact is
ensured by the creation of field accessors to previously initialized
fields.

Since we missed this very important fact from the beginning [1],
document it in the code.

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-init/topic/initialized.20field.20accessor.20detection/with/576210658 [1]
Fixes: 90e53c5e70a6 ("rust: add pin-init API core")
Cc: <stable@vger.kernel.org> # 6.6.y, 6.12.y: 42415d163e5d: rust: pin-init: add references to previously initialized fields
Cc: <stable@vger.kernel.org> # 6.6.y, 6.12.y, 6.18.y, 6.19.y
Signed-off-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Link: https://patch.msgid.link/20260302140424.4097655-2-lossin@kernel.org
[ Updated Cc: stable@ tags as discussed. - Miguel ]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
[ Moved changes to the declarative macro, because 6.19.y and earlier do not
  have `syn`. Also duplicated the comment for all field accessor creations.
  - Benno ]
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/src/macros.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
index d6acf2cd291e..fdf38b4fdbdc 100644
--- a/rust/pin-init/src/macros.rs
+++ b/rust/pin-init/src/macros.rs
@@ -1310,6 +1310,10 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
         // return when an error/panic occurs.
         // We also use the `data` to require the correct trait (`Init` or `PinInit`) for `$field`.
         unsafe { $data.$field(::core::ptr::addr_of_mut!((*$slot).$field), init)? };
+        // NOTE: the field accessor ensures that the initialized field is properly aligned.
+        // Unaligned fields will cause the compiler to emit E0793. We do not support
+        // unaligned fields since `Init::__init` requires an aligned pointer; the call to
+        // `ptr::write` below has the same requirement.
         // SAFETY:
         // - the project function does the correct field projection,
         // - the field has been initialized,
@@ -1349,6 +1353,10 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
         // return when an error/panic occurs.
         unsafe { $crate::Init::__init(init, ::core::ptr::addr_of_mut!((*$slot).$field))? };
 
+        // NOTE: the field accessor ensures that the initialized field is properly aligned.
+        // Unaligned fields will cause the compiler to emit E0793. We do not support
+        // unaligned fields since `Init::__init` requires an aligned pointer; the call to
+        // `ptr::write` below has the same requirement.
         // SAFETY:
         // - the field is not structurally pinned, since the line above must compile,
         // - the field has been initialized,
@@ -1389,6 +1397,10 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
             unsafe { ::core::ptr::write(::core::ptr::addr_of_mut!((*$slot).$field), $field) };
         }
 
+        // NOTE: the field accessor ensures that the initialized field is properly aligned.
+        // Unaligned fields will cause the compiler to emit E0793. We do not support
+        // unaligned fields since `Init::__init` requires an aligned pointer; the call to
+        // `ptr::write` below has the same requirement.
         #[allow(unused_variables)]
         // SAFETY:
         // - the field is not structurally pinned, since no `use_data` was required to create this
@@ -1429,6 +1441,10 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
             // SAFETY: The memory at `slot` is uninitialized.
             unsafe { ::core::ptr::write(::core::ptr::addr_of_mut!((*$slot).$field), $field) };
         }
+        // NOTE: the field accessor ensures that the initialized field is properly aligned.
+        // Unaligned fields will cause the compiler to emit E0793. We do not support
+        // unaligned fields since `Init::__init` requires an aligned pointer; the call to
+        // `ptr::write` below has the same requirement.
         // SAFETY:
         // - the project function does the correct field projection,
         // - the field has been initialized,

base-commit: 4aea1dc4cad17cd146072e13b1fd404f32b8b3ef
-- 
2.53.0

