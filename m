Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38E12C21CB;
	Tue,  3 Feb 2026 13:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770124085; cv=none; b=Gved80uDMH8T6UF/LbnoL1sG4Sk9cq8QzS0ASzqtmW9vHbM29mDrxKhs8GEQKeants+G6QKUibbwDw2La/lz8RgmnD5LjyJpwBndaUaYVFmMnXrgz+RSIFyQ5MDo/iOwYncatFwJWEBfVtr7rp3eenHxFFi1N/o9ql+oPtrhvmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770124085; c=relaxed/simple;
	bh=0xRt38CZD2C4RmnG0a7aFjYwo2u6D7oej281oAB9j04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V0H+YUPn/paq0GvglxDm1dx1+TC6kX9Ld/JwqwEXn/7B6sZrLS+rUdQ7AGAE4S+HZpiDOwmVJzEsa2Elz9XRuaw6BneQY9/+AcqRm80nvoD9aD38iOtIVX6LbU/c7srdzcTtzxJbLVghD3sS+9fwzEVmeHpP3rdx2rMaUC31pdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRHew+QA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRHew+QA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CC9C19421;
	Tue,  3 Feb 2026 13:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770124085;
	bh=0xRt38CZD2C4RmnG0a7aFjYwo2u6D7oej281oAB9j04=;
	h=From:To:Cc:Subject:Date:From;
	b=TRHew+QAUdguSrxLTHUap1YzfgfNnlqQ1G7O/+tLFKUtE/CmN5Ix0xMcC8w8JExmG
	 ZSyWLMxp4x0EnpbuIN+/S9eoxceNeTvLjY636OQz34P+tDq1W1oZAxuPxJ0IcDmEsS
	 gwqlzxYp2tjGGQTBoO6HyzX3QwxoecmBScmc3L5dhD/oMl+Y21AWImM4lXh3bERg53
	 7Vmhit7RU/fJCz5lOJcBYO1//OFi03HYGa3FcgQTUZ7j+NhAzxRkNi3swoPA+5GBkV
	 PRKK89+v/lgrr+b5nPjq61E1v659CVNhQshf/d3k3UivHleRHy8w4uOEp6V2NoNzUx
	 2LSU1wgHBtjzQ==
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
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: kernel test robot <lkp@intel.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] rust: task: use `as_char_ptr` instead of `as_ptr().cast()`
Date: Tue,  3 Feb 2026 13:06:26 +0000
Message-ID: <20260203130745.868762-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
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

This is used only if CONFIG_DEBUG_ATOMIC_SLEEP=y. Instead of conditionally
importing `CStrExt`, import it via prelude instead, and remove other
imports that are already available via the prelude.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601221157.89t3Sqbl-lkp@intel.com/
Signed-off-by: Gary Guo <gary@garyguo.net>
---
Changes since v2:
- Use CStrExt from prelude, as the use of it is conditional on
  CONFIG_DEBUG_ATOMIC_SLEEP
Link to v2: https://lore.kernel.org/rust-for-linux/20260122144444.265412-1-gary@kernel.org/#t
---
 rust/kernel/task.rs | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index cc907fb531bc..049c8a4d45d8 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -6,16 +6,15 @@
 
 use crate::{
     bindings,
-    ffi::{c_int, c_long, c_uint},
     mm::MmWithUser,
     pid_namespace::PidNamespace,
+    prelude::*,
     sync::aref::ARef,
     types::{NotThreadSafe, Opaque},
 };
 use core::{
-    cmp::{Eq, PartialEq},
     ops::Deref,
-    ptr,
+    ptr, //
 };
 
 /// A sentinel value used for infinite timeouts.
@@ -419,7 +418,7 @@ pub fn might_sleep() {
         let file = kernel::file_from_location(loc);
 
         // SAFETY: `file.as_ptr()` is valid for reading and guaranteed to be nul-terminated.
-        unsafe { crate::bindings::__might_sleep(file.as_ptr().cast(), loc.line() as i32) }
+        unsafe { crate::bindings::__might_sleep(file.as_char_ptr(), loc.line() as i32) }
     }
 
     // SAFETY: Always safe to call.

base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
-- 
2.51.2

