Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E893BB138;
	Wed, 13 May 2026 19:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699391; cv=none; b=t7CW1SadxbyWTMrFsOPsCwnM1ZMArDveaZJIaDUATMoCeiqFJft8TDD6DaKpCly0hQtecpfcW0LYnRbTpFw006qe3JrOfePDQbPQynaawfnn22d7O7a7oGk1Tao9iOLbgGj+HENF81xmty18Bry4876Sh4WSLkUjEvgAAS00SbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699391; c=relaxed/simple;
	bh=3so3qaEqT1WaGhkOrbp6gWUBBYdomuiP7cXgAQd0FKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUSaLBLHRsqrUpKcMvc1Hr9NUqquPyQA6/7F1Ha8N+I8kahcCJkdgs7xgipLy38hrvuPyIRbjmk4Mg70hy7n4gvd/rp4DPz5xVef33wm/tloVgWtJSjut0BqNNAIUq4+p6o8NeyheaYTG+5P7a9OGb9zTDpHqG6ZaguCXdAYmVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbI2ANBB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbI2ANBB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73620C2BCC9;
	Wed, 13 May 2026 19:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699391;
	bh=3so3qaEqT1WaGhkOrbp6gWUBBYdomuiP7cXgAQd0FKs=;
	h=From:To:Cc:Subject:Date:From;
	b=EbI2ANBBorvMzEKhiq6K4Jdw/L8Nw4Uj9wsodefK//12opJP4OW17wHDmAWOHz1RH
	 fZfC7wTalg75qHOtSroo671mcn7yTGhPMgDs3aP4FHMjf7R718CZQKTyXEMqwJr+un
	 /fVQ1YeFzedS51/lcHr9EBNjMWu+cRFiMmt8+7ebLPUFe6TJZW80Cnzl2m9oEbhAi1
	 LtDbWABQjJOmoNdXz3himGxEbk32ixER25vs0vwu8+TqP0/rliiUlItClU564yTwH/
	 d7K9WgRWixMOZof/ZgNwWiI9ppfF0cKlD1cptFi9XFVeViIkCGiOgWWVxXI4/Az3MW
	 izlxKYAsv1X8A==
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
	linux-kernel@vger.kernel.org,
	Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v2 1/2] rust: alloc: cleanup imports and use "kernel vertical" style
Date: Wed, 13 May 2026 21:09:15 +0200
Message-ID: <20260513190946.619810-1-dakr@kernel.org>
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
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
Changes in v2:
  - Adjust rust/kernel/alloc.rs as well.
  - Don't change scope of allow(unused_imports) in kbox.rs.
---
 rust/kernel/alloc.rs                |  8 +++-
 rust/kernel/alloc/allocator.rs      | 27 +++++++++----
 rust/kernel/alloc/allocator/iter.rs |  8 +++-
 rust/kernel/alloc/kbox.rs           | 59 ++++++++++++++++++++---------
 rust/kernel/alloc/kvec.rs           | 49 +++++++++++++++++-------
 rust/kernel/alloc/kvec/errors.rs    |  6 ++-
 rust/kernel/alloc/layout.rs         |  5 ++-
 7 files changed, 116 insertions(+), 46 deletions(-)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index e38720349dcf..21067bde6860 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -22,8 +22,12 @@
 #[derive(Copy, Clone, PartialEq, Eq, Debug)]
 pub struct AllocError;
 
-use crate::error::{code::EINVAL, Result};
-use core::{alloc::Layout, ptr::NonNull};
+use crate::prelude::*;
+
+use core::{
+    alloc::Layout,
+    ptr::NonNull, //
+};
 
 /// Flags to be used when allocating memory.
 ///
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
index bd6da02c7ab8..b8097dec3869 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -3,24 +3,47 @@
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
+use super::allocator::{
+    KVmalloc,
+    Kmalloc,
+    Vmalloc,
+    VmallocPageIter, //
+};
+
+use super::{
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
index ee6361a29942..ad1839f1375b 100644
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

base-commit: f497aae6ded43f91b1dbf29a35d7062823635640
-- 
2.54.0

