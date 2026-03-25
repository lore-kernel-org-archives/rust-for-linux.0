Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519CA3CF678;
	Wed, 25 Mar 2026 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443562; cv=none; b=tEHjzGYVUhasJI/AvcBgmCVTo8pfpyAkPuG50/1z5jCdHW/AnEzA0gN00js5Rd8Frj63JQ/p35m7st8BpGkp7zNlagfxGD18gqQBAx3EZqG83LvYEtobpxblp+yM0Fo178QSa6ZKmJVDRB123rWMgXjDz8RKMi7xP5TSrZsc32s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443562; c=relaxed/simple;
	bh=raLZxnl1II5SLYJD4/BqT67TZIlLnyBBrtJ2CUc+s7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFDeVw615I+71AHqscZj5/GAJLkRYvEDHuDKXEITzAJsG+pNQHl/+Nrf5MuRxWj2xXsOXeyYVrWqlLo7FBDQ8b1gg/SlND06QKXvZbsEhWkm+rFlaL20wnpAoGGd08gQ+eOTpvU2Cdu5UAIDplN92aYhwQ80u6oROvytJNIYWHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcPeT11Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcPeT11Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D180C4CEF7;
	Wed, 25 Mar 2026 12:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774443562;
	bh=raLZxnl1II5SLYJD4/BqT67TZIlLnyBBrtJ2CUc+s7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lcPeT11ZvCorqCytQ1dSe9jUmeDixlRF3OgARuTZPXVEs/q1u42veAh8/Uz+E5m+S
	 YjZ9dl1nionn8hCZBUlTvckS5grnmU1FG5EYqqx5f25yQmyeHQZyGVPGxOEfEVB+zc
	 sYtmSc9GO7Er4DeTjvsJniC6J5OIap3FB3OVh6j5F6BvS1BedtAWZWBMvPfl14gath
	 8rc6rmvmNm6Q3FZVfNlPIeRINMvbnqjw31+bqZbFdJ+9v3tzvOpAVo9DSCt/Hno/jr
	 DYVzzfYfpwDYT9qkvSADDwsvwtj2Z+YqH/n7wAbKd0C9h8ek1fa8hlARh+si88q7SR
	 oVJwxynOItxig==
From: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benno Lossin <lossin@kernel.org>,
	stable@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.12.y 2/3] rust: pin-init: internal: init: document load-bearing fact of field accessors
Date: Wed, 25 Mar 2026 13:58:15 +0100
Message-ID: <20260325125816.945578-3-lossin@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325125816.945578-2-lossin@kernel.org>
References: <20260325125816.945578-2-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ Upstream commit 580cc37b1de4fcd9997c48d7080e744533f09f36]

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
 rust/kernel/init/macros.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/init/macros.rs b/rust/kernel/init/macros.rs
index 54c0b255a9ce..e477e4de817b 100644
--- a/rust/kernel/init/macros.rs
+++ b/rust/kernel/init/macros.rs
@@ -1231,6 +1231,10 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *mut T) {}
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
@@ -1270,6 +1274,10 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *mut T) {}
         // return when an error/panic occurs.
         unsafe { $crate::init::Init::__init(init, ::core::ptr::addr_of_mut!((*$slot).$field))? };
 
+        // NOTE: the field accessor ensures that the initialized field is properly aligned.
+        // Unaligned fields will cause the compiler to emit E0793. We do not support
+        // unaligned fields since `Init::__init` requires an aligned pointer; the call to
+        // `ptr::write` below has the same requirement.
         // SAFETY:
         // - the field is not structurally pinned, since the line above must compile,
         // - the field has been initialized,
@@ -1310,6 +1318,10 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *mut T) {}
             unsafe { ::core::ptr::write(::core::ptr::addr_of_mut!((*$slot).$field), $field) };
         }
 
+        // NOTE: the field accessor ensures that the initialized field is properly aligned.
+        // Unaligned fields will cause the compiler to emit E0793. We do not support
+        // unaligned fields since `Init::__init` requires an aligned pointer; the call to
+        // `ptr::write` below has the same requirement.
         #[allow(unused_variables, unused_assignments)]
         // SAFETY:
         // - the field is not structurally pinned, since no `use_data` was required to create this
@@ -1350,6 +1362,10 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *mut T) {}
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
-- 
2.53.0

