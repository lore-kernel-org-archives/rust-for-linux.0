Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939202BD00C;
	Thu, 22 Jan 2026 14:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093097; cv=none; b=O/YIzcLQPfb82N+pd2Ft33Gq/ddmkd87UMgf4LHHrUQLEFBCiIomtzUVTFTTcTVts257EqOYng9uoS9V38JHBW2JfgYU9YGUUuPv3X/ZQQLV/W2tLMTTh8t1QiZetov01gFRVFwOhHMAuuAWxXaT89lw09h3r+jovwUwQh9eVvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093097; c=relaxed/simple;
	bh=IEEd+n0IvheHBUmxA+lWEqAu2qKPQCDkPR8anepGPC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MJjootWAHt6aCheaGiOJ6+4kXhWJnGZfj5vd4K8JLhecHGC6g1bVLijpdJM20yMBLCCbY1VYjJyDnZq9MY4GevuOcULMbvqLvUD3waXpiwN8vLLJvYwxBjyTbIGlTJvs5uCwrgMxOn1Njnla+4uRivPwEdpiEbtn4Pngl+bmKPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHSOjJ/F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHSOjJ/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F7DC116C6;
	Thu, 22 Jan 2026 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769093097;
	bh=IEEd+n0IvheHBUmxA+lWEqAu2qKPQCDkPR8anepGPC0=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=SHSOjJ/FPjAFU3D84Ju9FIbffPwWIvtEUSZqGWDmAY+HMimnpnIugaMUD+dTssVFM
	 GwSgh4DW/8SlHr6/Im9PzuKOriWvKSEf4oGTDv/QQUXj0XpPVIeMHriCCVFTLA+6GU
	 fy0ux0GQtV6B3Eis5WxSXllvAn/DZ8+EaIu6lMzAo/tH3+w1oiTPn+7xCITT7bNokY
	 l7WOfoYLnpXgKixpw9W0vUqF6UiJnG5u5MRBkp5ywiYdUUaHNhyq7mNE32k2DZ2wtW
	 5OFXE4AYkHMY9YmXhnyZ1wW4lU3FMB8v8gv46J7GysI/+vvjYPS3XymqLH5rEbCk4q
	 fLhSeIHhT8RXw==
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
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: kernel test robot <lkp@intel.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] rust: task: use `as_char_ptr` instead of `as_ptr().cast()`
Date: Thu, 22 Jan 2026 14:44:09 +0000
Message-ID: <20260122144444.265412-1-gary@kernel.org>
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

`as_char_ptr` would provide the correct (unsigned char) type without
needing to convert to an intermediate type and cast the pointer.

The `as_ptr()` function is going to be disallowed by clippy warning, so fix
this usage.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601221157.89t3Sqbl-lkp@intel.com/
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/task.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index cc907fb531bc..7ccb20a8f813 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -9,6 +9,7 @@
     ffi::{c_int, c_long, c_uint},
     mm::MmWithUser,
     pid_namespace::PidNamespace,
+    str::CStrExt,
     sync::aref::ARef,
     types::{NotThreadSafe, Opaque},
 };
@@ -419,7 +420,7 @@ pub fn might_sleep() {
         let file = kernel::file_from_location(loc);
 
         // SAFETY: `file.as_ptr()` is valid for reading and guaranteed to be nul-terminated.
-        unsafe { crate::bindings::__might_sleep(file.as_ptr().cast(), loc.line() as i32) }
+        unsafe { crate::bindings::__might_sleep(file.as_char_ptr(), loc.line() as i32) }
     }
 
     // SAFETY: Always safe to call.

base-commit: 053966c344dbd346e71305f530e91ea77916189f
-- 
2.51.2

