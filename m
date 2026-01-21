Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3072F1EB5E1;
	Wed, 21 Jan 2026 16:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014730; cv=none; b=rGaY9kPWRyoeEERXNhnnUMjJDwVyDEepnMSiDZO02KtqHBMni9uD0ileVW10RzmCEM0UeKpQWndz3BixPoh0E7B5/2P+kwCQL0b7wH7SKKtzIyFyeyo2ZmP2Vn4Z8iRyqzqsVjVl1i9AvhlHNJf7WFngRVgwmejqmkukq3Q2h0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014730; c=relaxed/simple;
	bh=pGjO6nUBaeVPb+thz7ajIJXo48azRML1bLDHCdYKUPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ooxy7+e3x0hUq9yB6ZwsKHcUsRFKhMv0LAjY+l8+KHC4UbPs9VuJbDDVo9d57VGwtKpvetRJBpbOofP0PK5DULE1Km8H8MFrtqHEnz+05rOJ3sy8mSgq9kHaxIzijLA+2YWx/aVIOqdS7QAx+/ZOPjk/yfeBs9z081U8wOzQRuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQJE4yG+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQJE4yG+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB011C116D0;
	Wed, 21 Jan 2026 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769014730;
	bh=pGjO6nUBaeVPb+thz7ajIJXo48azRML1bLDHCdYKUPw=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=bQJE4yG+5xjXqVZ538/NaG2qgdGNNKoP+n19Y922xNKAtzZCtjXeF0h1pqoC7riaW
	 hL9dxtu/sDR5nboW1md7vRf3dnIRNBl46tB1hM4ImeQwIdb1825PPwO5yVM9WnrXIk
	 DvPIjS59PAWoHOFFp4aprFbjDjvqYTH/VS3JCO0nFZUIbpSR0F+JqrdGuyaRhhrqtK
	 0tSA83ZNnzMGnzqPXEnSlLDyvpVpVRmUFJX5TeLgf6J5poUcD5RTB4qPfIr7nK2jkJ
	 r0emTfmdK/IW7MWUep6c9oY+5NTUe8YsHUVNrVyh9qa34DubfUIvSjWAdbawtnrNiW
	 yyUNGowXNnaQg==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: disallow use of `CStr::as_ptr`
Date: Wed, 21 Jan 2026 16:58:14 +0000
Message-ID: <20260121165835.4097975-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

As kernel always use unsigned char and not the platform ABI's default, an
user should always use `as_char_ptr` provided via `CStrExt` instead.
Therefore configure `disallow-methods` feature of clippy to catch incorrect
usage.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 .clippy.toml       | 5 +++++
 rust/kernel/str.rs | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/.clippy.toml b/.clippy.toml
index 137f41d203de..fd934bc04242 100644
--- a/.clippy.toml
+++ b/.clippy.toml
@@ -9,3 +9,8 @@ disallowed-macros = [
     # it here, see: https://github.com/rust-lang/rust-clippy/issues/11303.
     { path = "kernel::dbg", reason = "the `dbg!` macro is intended as a debugging tool", allow-invalid = true },
 ]
+
+[[disallowed-methods]]
+path = "core::ffi::CStr::as_ptr"
+replacement = "kernel::prelude::CStrExt::as_char_ptr"
+reason = "Kernel's `char` is always unsigned. Use `as_char_ptr` instead."
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index fa87779d2253..08b8e2ebc8ad 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -189,6 +189,7 @@ macro_rules! b_str {
 //
 // - error[E0379]: functions in trait impls cannot be declared const
 #[inline]
+#[expect(clippy::disallowed_methods, reason = "internal implementation")]
 pub const fn as_char_ptr_in_const_context(c_str: &CStr) -> *const c_char {
     c_str.as_ptr().cast()
 }
@@ -334,6 +335,7 @@ unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut Self {
     }
 
     #[inline]
+    #[expect(clippy::disallowed_methods, reason = "internal implementation")]
     fn as_char_ptr(&self) -> *const c_char {
         self.as_ptr().cast()
     }

-- 
2.51.2

