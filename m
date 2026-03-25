Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C83CF678;
	Wed, 25 Mar 2026 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443600; cv=none; b=bWf166og7n9E1QwDcJdriZUcHyPw0IZtb4KtFckwGnO8MmUolmd9I9NnMjg1OUym9E8caChjUzxNoEejigTgtGg+2kjpSmXDvRNGXmiQyJGT0IpVzyRett/w7lBcIhEHhMcWZh6mRCAtIHv7TWhyg0qsXPDdpBpuBzl0lcI0fTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443600; c=relaxed/simple;
	bh=ruxdjCAbIC0CtK/LVzgRh3hvJWD7FUf2m7xOHUHYiXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LcaSdY1D2RJ26iHhrTPgRD1Qahjl+Gr6jkltf2cYEoXfJfIiQxFdLQccfFHG7ZUFniQsTN8RVtWP6rYB5uW0NIDOVfX5D5SrncEyKu4Nqg1PbbpgYrfADxcw3xCUAfTjYW+ohTDzTyQpU4J5Q7l5RYzDB5RxtXUxlUWMFpNl4MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9k23kwH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9k23kwH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B61C4CEF7;
	Wed, 25 Mar 2026 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774443600;
	bh=ruxdjCAbIC0CtK/LVzgRh3hvJWD7FUf2m7xOHUHYiXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a9k23kwHQ8QQ1Ji4xEW2FbPEUMweY9W3hGvk6/BolXAsdhw+zR8+5hMCLO8uGBM7k
	 YG35T1/dg0rjHtX0HfQ+Q3gqy7g9wiDbwU+W9GPSeuP9S56Ai5U9MOdRGqtvDuK9ue
	 y42x5PtUzBwjK3XRbOGrO3UfzubW5ts7Mk+Zb1JskDGp8QeVjCYZzVqolunGV2xQIo
	 ar7RUUlxHnupoZrP+Xgjs8ektmWqAAxhg7N3QKOtE13BoNFyxZ1eGE2uTxcBpbP4/i
	 ymXAHLjjNoJje8XLPzEOEMzfixVM9KTSSqUFGUKyB8+sZZ/pHHxZWk1jpeNhR6ZoL2
	 JYVAkXcID7S0g==
From: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>,
	stable@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y 2/3] rust: pin-init: internal: init: document load-bearing fact of field accessors
Date: Wed, 25 Mar 2026 13:59:42 +0100
Message-ID: <20260325125944.947263-2-lossin@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325125944.947263-1-lossin@kernel.org>
References: <20260325125944.947263-1-lossin@kernel.org>
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
 rust/kernel/init/macros.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/init/macros.rs b/rust/kernel/init/macros.rs
index 427875371682..d6f8d5ce61af 100644
--- a/rust/kernel/init/macros.rs
+++ b/rust/kernel/init/macros.rs
@@ -1205,6 +1205,10 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *mut T) {}
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
@@ -1244,6 +1248,10 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *mut T) {}
         // return when an error/panic occurs.
         unsafe { $crate::init::Init::__init(init, ::core::ptr::addr_of_mut!((*$slot).$field))? };
 
+        // NOTE: the field accessor ensures that the initialized field is properly aligned.
+        // Unaligned fields will cause the compiler to emit E0793. We do not support
+        // unaligned fields since `Init::__init` requires an aligned pointer; the call to
+        // `ptr::write` below has the same requirement.
         // SAFETY:
         // - the field is not structurally pinned, since the line above must compile,
         // - the field has been initialized,
@@ -1284,6 +1292,10 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *mut T) {}
             unsafe { ::core::ptr::write(::core::ptr::addr_of_mut!((*$slot).$field), $field) };
         }
 
+        // NOTE: the field accessor ensures that the initialized field is properly aligned.
+        // Unaligned fields will cause the compiler to emit E0793. We do not support
+        // unaligned fields since `Init::__init` requires an aligned pointer; the call to
+        // `ptr::write` below has the same requirement.
         #[allow(unused_variables, unused_assignments)]
         // SAFETY:
         // - the field is not structurally pinned, since no `use_data` was required to create this
@@ -1324,6 +1336,10 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *mut T) {}
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

