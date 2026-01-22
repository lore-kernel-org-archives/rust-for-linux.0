Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA7352FBC;
	Thu, 22 Jan 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093104; cv=none; b=u2e8jPZQi4UYW5mRqnGX06GV8+32+rfomY793UeLEOABNJy729qtVjc/ATdztKOTtLD0T1VuqDZFLcq4hys1gcGMxojuagspmCeQs12gLQIg9vinCUYktzEFaBga9/rrMslrSM0AwVWPa3b5IBgI2C87cqNcMquSN3O7qjO/M+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093104; c=relaxed/simple;
	bh=FsT81Hpm/fPxXNt3VFM6Tyg/k4VICLhOrJ59mlux93c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XAw7BPRHm2jTEnHYRrgQWDcJIL7YSXjDX6ZqZQFFaCzRMaL4YvoxodM6CN+8fVfRskvUSL34sKyhmvYkYgDNQ31qCBTaj7WAf4/9+/AO7apcEJGMpL9x0NPoU6Nd32KfRz90Jzu9RTEySTcOhU0SrvXHISnkQFeSapbchmqUVXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pt9PwCn+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pt9PwCn+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E75C116D0;
	Thu, 22 Jan 2026 14:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769093103;
	bh=FsT81Hpm/fPxXNt3VFM6Tyg/k4VICLhOrJ59mlux93c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=pt9PwCn+Q2DM1+rUk8eD1OgtxBU10Zj//oBzIDe3dgmm+TMEAInEoHH1iGOZnWQOk
	 WI+xVLrTAtuFxZsJJswx1WwIekI9CVXLoQyEJXkNklAwyXwSWkFQnPBewOfPFFop/b
	 euTxiGD46J3r8rVxMzUCy2dV0Pw4BkE4iP7woWahCeNg1l2TgCdW43uPthtv79Oiev
	 UvbtNFEWWr0NggngLWDpIUmZ4oYytfk8ok3X6pZYUL62zs7AKosZ2Dslf2dXNoYbYt
	 Gg8GjOYqrEb6ux23BdW2ngzIvOikdRs4G7Gw82lVOxH2DB/bwLIxelqRpOGsshRh06
	 DdRTfXNIiX3NQ==
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
	Panagiotis Foliadis <pfoliadis@posteo.net>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>
Cc: kernel test robot <lkp@intel.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH v2 2/2] rust: disallow use of `CStr::as_ptr`
Date: Thu, 22 Jan 2026 14:44:10 +0000
Message-ID: <20260122144444.265412-2-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260122144444.265412-1-gary@kernel.org>
References: <20260122144444.265412-1-gary@kernel.org>
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

Acked-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 .clippy.toml       | 5 +++++
 rust/kernel/str.rs | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/.clippy.toml b/.clippy.toml
index 137f41d203de..4654b522ae03 100644
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
+reason = "kernel's `char` is always unsigned, use `as_char_ptr` instead"
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

