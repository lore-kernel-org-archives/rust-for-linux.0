Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0294D90D7;
	Mon, 11 May 2026 21:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535729; cv=none; b=m0CksjbpKzZ0P9jpFxGHkQXuu3unqS5UCGjhZN4s8T3bOiV7Q5ZxGyx+jPFZwAdinm3evQWPr6ek4867sOJexfeUIFkA1GTcaVz5CclZn8xjQijuuvAuSUARn0LHM8Yj1KN7y/giutujMlzEQxwhkiKxIOuB9TTnZh9dQplY49o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535729; c=relaxed/simple;
	bh=DM+5HIGYBvfa+Sm8DQ/MVZW9Pt4H32VFQjnYq0DFu4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nAkPVoiVW3MgdgPc+2QjiUESbsOA4xggS8N8Juh7H6dpqjBbED738nNTJ8UKz9crqMEJJ32mifIrdxv0kQwzRi1hyAt8vjinHDq2/4UIWt47FjOdkfha01Ldyg3R7I6uHu5Sn6djF47GTn8YlRm1al3bjeLJCnF0qtUJfXYKj+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bpmjhm+G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bpmjhm+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0530BC2BCF7;
	Mon, 11 May 2026 21:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778535729;
	bh=DM+5HIGYBvfa+Sm8DQ/MVZW9Pt4H32VFQjnYq0DFu4U=;
	h=From:To:Cc:Subject:Date:From;
	b=Bpmjhm+GgQNE+djtETn98hp0dXbTXs4vbYD25JEHjwDB0X9OEGYy3o1axfbIpaAHU
	 lsQZ44Y/RbGMQGmXWT6mCTJJ2dyTxioMmHBZ9CXEETIDNiWpav946vUpT+pLhEA51H
	 uAdJ+kzXliaCYctTfxffu+Pr0XJD7q7MXQEF9N/Z3pdBM4B4F0NrfpKLbyxEjzE6qC
	 pStNKrlCuwzbYyetigaawX9BmQ0q2jPSXUvqYDqfC6V2K0ZVtTh9faCHNse7M1q45n
	 edewtCILzegsFx557i2zplBgljo9LWYegS7QfQgqjySB/03ZxoOrRMEmBrpzzUsy+j
	 pwYFSL5wYqsng==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rust: alloc: cleanup imports and use "kernel vertical" style
Date: Mon, 11 May 2026 23:41:34 +0200
Message-ID: <20260511214154.3569305-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change all imports in the alloc module to use the "kernel vertical"
import style [1].

While at it, drop unnecessary imports covered by prelude::*.

Link: https://docs.kernel.org/rust/coding-guidelines.html#imports [1]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/allocator.rs      | 27 ++++++++++----
 rust/kernel/alloc/allocator/iter.rs |  8 +++-
 rust/kernel/alloc/kbox.rs           | 58 ++++++++++++++++++++---------
 rust/kernel/alloc/kvec.rs           | 49 +++++++++++++++++-------
 rust/kernel/alloc/kvec/errors.rs    |  6 ++-
 rust/kernel/alloc/layout.rs         |  5 ++-
 6 files changed, 109 insertions(+), 44 deletions(-)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 63bfb91b3671..af20332d59f7 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -8,14 +8,25 @@
 //!
 //! Reference: <https://docs.kernel.org/core-api/memory-allocation.html>
 
-use super::Flags;
-use core::alloc::Layout;
-use core::ptr;
-use core::ptr::NonNull;
-
-use crate::alloc::{AllocError, Allocator, NumaNode};
-use crate::bindings;
-use crate::page;
+use super::{
+    AllocError,
+    Allocator,
+    Flags,
+    NumaNode, //
+};
+
+use crate::{
+    bindings,
+    page, //
+};
+
+use core::{
+    alloc::Layout,
+    ptr::{
+        self,
+        NonNull, //
+    }, //
+};
 
 const ARCH_KMALLOC_MINALIGN: usize = bindings::ARCH_KMALLOC_MINALIGN;
 
diff --git a/rust/kernel/alloc/allocator/iter.rs b/rust/kernel/alloc/allocator/iter.rs
index e0a70b7a744a..02fda3ea5cae 100644
--- a/rust/kernel/alloc/allocator/iter.rs
+++ b/rust/kernel/alloc/allocator/iter.rs
@@ -1,9 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use super::Vmalloc;
+
 use crate::page;
-use core::marker::PhantomData;
-use core::ptr::NonNull;
+
+use core::{
+    marker::PhantomData,
+    ptr::NonNull, //
+};
 
 /// An [`Iterator`] of [`page::BorrowedPage`] items owned by a [`Vmalloc`] allocation.
 ///
diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index bd6da02c7ab8..0de45d8d235a 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -3,24 +3,46 @@
 //! Implementation of [`Box`].
 
 #[allow(unused_imports)] // Used in doc comments.
-use super::allocator::{KVmalloc, Kmalloc, Vmalloc, VmallocPageIter};
-use super::{AllocError, Allocator, Flags, NumaNode};
-use core::alloc::Layout;
-use core::borrow::{Borrow, BorrowMut};
-use core::marker::PhantomData;
-use core::mem::ManuallyDrop;
-use core::mem::MaybeUninit;
-use core::ops::{Deref, DerefMut};
-use core::pin::Pin;
-use core::ptr::NonNull;
-use core::result::Result;
-
-use crate::ffi::c_void;
-use crate::fmt;
-use crate::init::InPlaceInit;
-use crate::page::AsPageIter;
-use crate::types::ForeignOwnable;
-use pin_init::{InPlaceWrite, Init, PinInit, ZeroableOption};
+use super::{
+    allocator::{
+        KVmalloc,
+        Kmalloc,
+        Vmalloc,
+        VmallocPageIter, //
+    },
+    AllocError,
+    Allocator,
+    Flags,
+    NumaNode, //
+};
+
+use crate::{
+    fmt,
+    page::AsPageIter,
+    prelude::*,
+    types::ForeignOwnable, //
+};
+
+use core::{
+    alloc::Layout,
+    borrow::{
+        Borrow,
+        BorrowMut, //
+    },
+    marker::PhantomData,
+    mem::{
+        ManuallyDrop,
+        MaybeUninit, //
+    },
+    ops::{
+        Deref,
+        DerefMut, //
+    },
+    ptr::NonNull,
+    result::Result, //
+};
+
+use pin_init::ZeroableOption;
 
 /// The kernel's [`Box`] type -- a heap allocation for a single value of type `T`.
 ///
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 6438385e4322..4340525f2672 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -3,29 +3,52 @@
 //! Implementation of [`Vec`].
 
 use super::{
-    allocator::{KVmalloc, Kmalloc, Vmalloc, VmallocPageIter},
+    allocator::{
+        KVmalloc,
+        Kmalloc,
+        Vmalloc,
+        VmallocPageIter, //
+    },
     layout::ArrayLayout,
-    AllocError, Allocator, Box, Flags, NumaNode,
+    AllocError,
+    Allocator,
+    Box,
+    Flags,
+    NumaNode, //
 };
+
 use crate::{
     fmt,
     page::{
         AsPageIter,
         PAGE_SIZE, //
-    },
+    }, //
 };
+
 use core::{
-    borrow::{Borrow, BorrowMut},
+    borrow::{
+        Borrow,
+        BorrowMut, //
+    },
     marker::PhantomData,
-    mem::{ManuallyDrop, MaybeUninit},
-    ops::Deref,
-    ops::DerefMut,
-    ops::Index,
-    ops::IndexMut,
-    ptr,
-    ptr::NonNull,
-    slice,
-    slice::SliceIndex,
+    mem::{
+        ManuallyDrop,
+        MaybeUninit, //
+    },
+    ops::{
+        Deref,
+        DerefMut,
+        Index,
+        IndexMut, //
+    },
+    ptr::{
+        self,
+        NonNull, //
+    },
+    slice::{
+        self,
+        SliceIndex, //
+    }, //
 };
 
 mod errors;
diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/errors.rs
index 985c5f2c3962..aaca6446516a 100644
--- a/rust/kernel/alloc/kvec/errors.rs
+++ b/rust/kernel/alloc/kvec/errors.rs
@@ -2,8 +2,10 @@
 
 //! Errors for the [`Vec`] type.
 
-use kernel::fmt;
-use kernel::prelude::*;
+use crate::{
+    fmt,
+    prelude::*, //
+};
 
 /// Error type for [`Vec::push_within_capacity`].
 pub struct PushError<T>(pub T);
diff --git a/rust/kernel/alloc/layout.rs b/rust/kernel/alloc/layout.rs
index 9f8be72feb7a..b629da4aed07 100644
--- a/rust/kernel/alloc/layout.rs
+++ b/rust/kernel/alloc/layout.rs
@@ -4,7 +4,10 @@
 //!
 //! Custom layout types extending or improving [`Layout`].
 
-use core::{alloc::Layout, marker::PhantomData};
+use core::{
+    alloc::Layout,
+    marker::PhantomData, //
+};
 
 /// Error when constructing an [`ArrayLayout`].
 pub struct LayoutError;

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.54.0

