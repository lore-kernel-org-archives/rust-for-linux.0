Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA1834AAE3;
	Tue,  3 Feb 2026 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770124090; cv=none; b=mNqwdRrvtJtwIEX0zw05RqreJgVn7xmp84CVnGWRAy6bQPBbFa3wQODGfRSwSeU5NYb9gEVmGMCrGyMIy2W3Y5AY4VaBuqUedf+PgpFTzRzyckzEhy+UxJZV18ZiuTfsvwO/2FjkQGAok/1bdlML7xQgKbYgiuk7Vb8TuYFmohM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770124090; c=relaxed/simple;
	bh=hEXExQ+Aaoy9aGEVE6ZgHuM+rrh7xW8e6dPrzQGdruo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iime2eRdOvO+sOoHKqNubL7rVx7kw59i7as5/JtR0dG9E52jWOXLjrB5ZKnmSMWBEzFF2MpKMvLqebe2TSOdlU1DgUqA2hYy+ejh2eHDABYGwvY/91acr0NrdOj60yabRkDSfoOkCbZv7VOafirt2q0q2uI0TCdQQmjRI12l9BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyoqnNOQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyoqnNOQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0BEC116D0;
	Tue,  3 Feb 2026 13:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770124090;
	bh=hEXExQ+Aaoy9aGEVE6ZgHuM+rrh7xW8e6dPrzQGdruo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eyoqnNOQ7i8Q3F1mCEEiG8xTvBIufNOiDZ1FuQAc7z59LUhu+EcUiwU4JD5cZXVlW
	 lXXtUFoBqvtptIMkriHFibLi52Yl57+6Ssud2Ji+qxP8GChE3lkiGJUX+qGDjJ5/WY
	 H6fHhUycIChLBsLNru0T9WNWl/Zwfcd29x4aujtLU/eYg3/iTe6q5b4bjqw3bHt3KL
	 5ZxXGS89xX/pZ4wwKv3YXu+pB6SJmUQlX6J/RrLRw/WqM4SxPyykkzGzFCE/BH1n76
	 r8oEdzTIoZsmMP7bwQ5pYylgWkkK3zJ7cf4v6OayiJF1kRKkv+dRsrWgcdD9hozoI8
	 ZtO1VOeJe8/6g==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] rust: disallow use of `CStr::as_ptr` and `CStr::from_ptr`
Date: Tue,  3 Feb 2026 13:06:27 +0000
Message-ID: <20260203130745.868762-2-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260203130745.868762-1-gary@kernel.org>
References: <20260203130745.868762-1-gary@kernel.org>
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

Similarly, the dual `from_ptr` is also disallowed.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Changes since v2:
- Also disallow `CStr::from_ptr`
---
 .clippy.toml       | 10 ++++++++++
 rust/kernel/str.rs |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/.clippy.toml b/.clippy.toml
index 137f41d203de..a51de9a46380 100644
--- a/.clippy.toml
+++ b/.clippy.toml
@@ -9,3 +9,13 @@ disallowed-macros = [
     # it here, see: https://github.com/rust-lang/rust-clippy/issues/11303.
     { path = "kernel::dbg", reason = "the `dbg!` macro is intended as a debugging tool", allow-invalid = true },
 ]
+
+[[disallowed-methods]]
+path = "core::ffi::CStr::as_ptr"
+replacement = "kernel::prelude::CStrExt::as_char_ptr"
+reason = "kernel's `char` is always unsigned, use `as_char_ptr` instead"
+
+[[disallowed-methods]]
+path = "core::ffi::CStr::from_ptr"
+replacement = "kernel::prelude::CStrExt::from_char_ptr"
+reason = "kernel's `char` is always unsigned, use `from_char_ptr` instead"
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index fa87779d2253..97bf9427af59 100644
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
@@ -319,6 +320,7 @@ unsafe fn to_bytes_mut(s: &mut CStr) -> &mut [u8] {
 
 impl CStrExt for CStr {
     #[inline]
+    #[expect(clippy::disallowed_methods, reason = "internal implementation")]
     unsafe fn from_char_ptr<'a>(ptr: *const c_char) -> &'a Self {
         // SAFETY: The safety preconditions are the same as for `CStr::from_ptr`.
         unsafe { CStr::from_ptr(ptr.cast()) }
@@ -334,6 +336,7 @@ unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut Self {
     }
 
     #[inline]
+    #[expect(clippy::disallowed_methods, reason = "internal implementation")]
     fn as_char_ptr(&self) -> *const c_char {
         self.as_ptr().cast()
     }
-- 
2.51.2

