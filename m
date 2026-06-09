Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE9E40DFA0;
	Tue,  9 Jun 2026 12:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006625; cv=none; b=sQvMZJvw3MIOF4Kgq/g5ne8F1bRw7pWIbZkLmLaC+lmXG6XbsJToIp05mg0ic7YC45UY57/BlrqVq+itrLTM8aGjAp5OqS29j+3t9QKYnBSlAierwvmWBHDA2BUe0qWGqLs1zGuvwbsnljyNDLgDR9sS6jw0aOFIWTbTyL/dVH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006625; c=relaxed/simple;
	bh=0jDzoXbXA5y7sigPfJn3xlfnN+//USUGkyC73x6fxBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mN8fRhFnG5vdyjCaQnLOwz14iYaiN+GXEqdB75fAhKWCbZBncqOVfEJhJuWgCji4j9kbY4wf/qHpGKR8EnzFgapB7o9cN3FRzzZYIayaoT6moZJ3oIhtH7zQ50ju92g9WNId0zAJx3aKCOErFge6PJNgOswFBk04ogCfaTdOrpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEouUqJz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEouUqJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB99F1F00893;
	Tue,  9 Jun 2026 12:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006622;
	bh=zXaBrnRtySX1IlFYJBjrEKfdZ5VI4iuevTm3NEEmxIE=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=XEouUqJzJfjEs9scUHXDMuNi+eUnQF8oLNIaXZAcnm5aeo5mkbIx4Wp0TXBuJM3lO
	 BqL0MFtIgfqtDZJnG0YLvR3j7cjJWkK05XiJc0bTvw7oK+txAEYWQXxXWu4Dx9BiGA
	 J43e3Nn+9gbu6esxpnn3bM7KyPOQuBNv6Eb180mxxa8uQlq2wZ+dlEQ3d+RNVCScEu
	 68BUgKEaD8RacvpWQYUr0Ac7lABn6qeyO0/1C/HUClSbvJm0CxrwEkuugfyr8IIbxK
	 Sj6RFeobm9TAFVSwiYqd0mTP/mY5jC7VoMBRwsDthQVDxgFF1a/th2vbSr/RU8TMvJ
	 oPXnB7YDOsxNw==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: mem: add `Align` type
Date: Tue,  9 Jun 2026 13:03:24 +0100
Message-ID: <20260609120325.233721-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Rust's `repr(align())` only works with integers. Add an `Align` type so it
can also be specified via const generics.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/lib.rs |  1 +
 rust/kernel/mem.rs | 59 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 rust/kernel/mem.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9512af7156df..0a12c3011c61 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -92,6 +92,7 @@
 pub mod kunit;
 pub mod list;
 pub mod maple_tree;
+pub mod mem;
 pub mod miscdevice;
 pub mod mm;
 pub mod module_param;
diff --git a/rust/kernel/mem.rs b/rust/kernel/mem.rs
new file mode 100644
index 000000000000..32e2fe547cfd
--- /dev/null
+++ b/rust/kernel/mem.rs
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Utilities handling things related to memory layouts.
+
+// TODO: `Alignment` should be moved here as well, Rust moved it upstream in 1.96.
+pub use crate::ptr::Alignment;
+
+/// Trait indicating that [`Align<N>`] is a valid alignment.
+pub trait ValidAlign {
+    #[doc(hidden)]
+    type Repr;
+}
+
+/// Zero-sized type that provides the alignment specified via the generic parameter.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::mem::Align;
+/// const ALIGN: usize = 128;
+/// struct MyStruct {
+///     align: Align<ALIGN>,
+/// }
+/// assert_eq!(align_of::<MyStruct>(), ALIGN);
+/// ```
+#[repr(transparent)]
+#[derive(Default)]
+pub struct Align<const N: usize>([<Self as ValidAlign>::Repr; 0])
+where
+    Self: ValidAlign;
+
+impl<const N: usize> Align<N>
+where
+    Self: ValidAlign,
+{
+    /// Create a new [`Align<N>`].
+    #[inline]
+    pub const fn new() -> Self {
+        Align([])
+    }
+}
+
+macro_rules! impl_align {
+    () => {};
+    ($a:literal $($rest:literal)*) => {
+        const _: () = {
+            #[repr(align($a))]
+            pub struct Repr;
+
+            impl ValidAlign for Align<$a> {
+                type Repr = Repr;
+            }
+        };
+
+        impl_align!($($rest)*);
+    }
+}
+
+impl_align!(1 2 4 8 16 32 64 128 256 512 1024 2048 4096);

base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.54.0

