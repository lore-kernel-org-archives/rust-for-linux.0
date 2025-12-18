Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E4C2FE048;
	Thu, 18 Dec 2025 16:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766077004; cv=none; b=LAGpchnyTh7bB568dDpz9TiwvGqdnTJUne4z2rr+l2jRreOZHZcwdftLBWf+6QLCPG31ul4CG96cI1B2+/B5hft9TvWbSkOQ6NdmCgRIgGwf0alwC5h9hVsvbnmh0gYiOyx636hiV/9y2rkDCjCid6913qqa0jbe/TzHg98ptJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766077004; c=relaxed/simple;
	bh=fzCX334U+2+caUTzVP5mDBpC5Mf3oBEidjgBWA60uZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lg2/UG/qS7UYLq0kBIbcmCYvfj49P7lAgiHLA/ARzu9SzssykzZHtTRhW16H5fJyXzM1iSBC6CYREJIKaL4Bgp9xJOyKdazRzndRgC5IRK3N+u52FJPJGsK6vnDMmAoPEPhqo4fbquUXgYPFyWQGe3RJphGCPmTq4Oowg3xW3Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhfeUTla; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhfeUTla"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F7BC4CEFB;
	Thu, 18 Dec 2025 16:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766077003;
	bh=fzCX334U+2+caUTzVP5mDBpC5Mf3oBEidjgBWA60uZY=;
	h=From:To:Cc:Subject:Date:From;
	b=FhfeUTla/9Dk2yy+aAQu4/9hX1VXYxdDy2fSMzFRDi2BanMd/oUaw0BA81pqY8rA1
	 4fMk16uzQHkC3VtJ5wuAHAY4lpNW5u/XMLB3SDiK9AP2/VS/SfglFIqdIfiRGZNhZz
	 ho4qcsx4xoNH2vImgIGC32dx4XLuVuw8/Wwv2N33QMnCiDgCvOQWlssz0we1CT8O22
	 v/MIhcyVl40D/+BRvQ+eG8f9zbZQtufNB7ZTVXCZfdQEncC9gUpK78tZYp5qS93EoF
	 9iUsdTdWqXaWh4CjC8PnUfVU+eJGXvXBFwQ6SEMzoyMzbV1b2z/GmdEar8scnKy1HT
	 SgJtRJcJKyVoA==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	mmaurer@google.com
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] rust: debugfs: use "kernel vertical" style for imports
Date: Thu, 18 Dec 2025 17:56:11 +0100
Message-ID: <20251218165626.450264-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert all imports in the debugfs Rust module to use "kernel vertical"
style.

With this subsequent patches neither introduce unrelated changes nor
leave an inconsistent import pattern.

While at it, drop unnecessary imports covered by prelude::*.

Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/debugfs.rs                   | 46 ++++++++++++++++++------
 rust/kernel/debugfs/callback_adapters.rs | 21 +++++++----
 rust/kernel/debugfs/entry.rs             | 14 +++++---
 rust/kernel/debugfs/file_ops.rs          | 25 ++++++++-----
 rust/kernel/debugfs/traits.rs            | 43 ++++++++++++++++------
 5 files changed, 109 insertions(+), 40 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index facad81e8290..536a320334bf 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -8,28 +8,52 @@
 // When DebugFS is disabled, many parameters are dead. Linting for this isn't helpful.
 #![cfg_attr(not(CONFIG_DEBUG_FS), allow(unused_variables))]
 
-use crate::fmt;
-use crate::prelude::*;
-use crate::str::CStr;
 #[cfg(CONFIG_DEBUG_FS)]
 use crate::sync::Arc;
-use crate::uaccess::UserSliceReader;
-use core::marker::PhantomData;
-use core::marker::PhantomPinned;
+use crate::{
+    fmt,
+    prelude::*,
+    str::CStr,
+    uaccess::UserSliceReader, //
+};
+
 #[cfg(CONFIG_DEBUG_FS)]
 use core::mem::ManuallyDrop;
-use core::ops::Deref;
+use core::{
+    marker::{
+        PhantomData,
+        PhantomPinned, //
+    },
+    ops::Deref,
+};
 
 mod traits;
-pub use traits::{BinaryReader, BinaryReaderMut, BinaryWriter, Reader, Writer};
+pub use traits::{
+    BinaryReader,
+    BinaryReaderMut,
+    BinaryWriter,
+    Reader,
+    Writer, //
+};
 
 mod callback_adapters;
-use callback_adapters::{FormatAdapter, NoWriter, WritableAdapter};
+use callback_adapters::{
+    FormatAdapter,
+    NoWriter,
+    WritableAdapter, //
+};
+
 mod file_ops;
 use file_ops::{
-    BinaryReadFile, BinaryReadWriteFile, BinaryWriteFile, FileOps, ReadFile, ReadWriteFile,
-    WriteFile,
+    BinaryReadFile,
+    BinaryReadWriteFile,
+    BinaryWriteFile,
+    FileOps,
+    ReadFile,
+    ReadWriteFile,
+    WriteFile, //
 };
+
 #[cfg(CONFIG_DEBUG_FS)]
 mod entry;
 #[cfg(CONFIG_DEBUG_FS)]
diff --git a/rust/kernel/debugfs/callback_adapters.rs b/rust/kernel/debugfs/callback_adapters.rs
index a260d8dee051..dee7d021e18c 100644
--- a/rust/kernel/debugfs/callback_adapters.rs
+++ b/rust/kernel/debugfs/callback_adapters.rs
@@ -4,12 +4,21 @@
 //! Adapters which allow the user to supply a write or read implementation as a value rather
 //! than a trait implementation. If provided, it will override the trait implementation.
 
-use super::{Reader, Writer};
-use crate::fmt;
-use crate::prelude::*;
-use crate::uaccess::UserSliceReader;
-use core::marker::PhantomData;
-use core::ops::Deref;
+use super::{
+    Reader,
+    Writer, //
+};
+
+use crate::{
+    fmt,
+    prelude::*,
+    uaccess::UserSliceReader, //
+};
+
+use core::{
+    marker::PhantomData,
+    ops::Deref, //
+};
 
 /// # Safety
 ///
diff --git a/rust/kernel/debugfs/entry.rs b/rust/kernel/debugfs/entry.rs
index 706cb7f73d6c..5ed1303f2fe6 100644
--- a/rust/kernel/debugfs/entry.rs
+++ b/rust/kernel/debugfs/entry.rs
@@ -1,10 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2025 Google LLC.
 
-use crate::debugfs::file_ops::FileOps;
-use crate::ffi::c_void;
-use crate::str::{CStr, CStrExt as _};
-use crate::sync::Arc;
+use crate::{
+    debugfs::file_ops::FileOps,
+    prelude::*,
+    str::{
+        CStr,
+        CStrExt as _, //
+    },
+    sync::Arc,
+};
+
 use core::marker::PhantomData;
 
 /// Owning handle to a DebugFS entry.
diff --git a/rust/kernel/debugfs/file_ops.rs b/rust/kernel/debugfs/file_ops.rs
index 8a0442d6dd7a..ad19360540ba 100644
--- a/rust/kernel/debugfs/file_ops.rs
+++ b/rust/kernel/debugfs/file_ops.rs
@@ -1,14 +1,23 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2025 Google LLC.
 
-use super::{BinaryReader, BinaryWriter, Reader, Writer};
-use crate::debugfs::callback_adapters::Adapter;
-use crate::fmt;
-use crate::fs::file;
-use crate::prelude::*;
-use crate::seq_file::SeqFile;
-use crate::seq_print;
-use crate::uaccess::UserSlice;
+use super::{
+    BinaryReader,
+    BinaryWriter,
+    Reader,
+    Writer, //
+};
+
+use crate::{
+    debugfs::callback_adapters::Adapter,
+    fmt,
+    fs::file,
+    prelude::*,
+    seq_file::SeqFile,
+    seq_print,
+    uaccess::UserSlice, //
+};
+
 use core::marker::PhantomData;
 
 #[cfg(CONFIG_DEBUG_FS)]
diff --git a/rust/kernel/debugfs/traits.rs b/rust/kernel/debugfs/traits.rs
index 3eee60463fd5..8c39524b6a99 100644
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@ -3,17 +3,38 @@
 
 //! Traits for rendering or updating values exported to DebugFS.
 
-use crate::alloc::Allocator;
-use crate::fmt;
-use crate::fs::file;
-use crate::prelude::*;
-use crate::sync::atomic::{Atomic, AtomicBasicOps, AtomicType, Relaxed};
-use crate::sync::Arc;
-use crate::sync::Mutex;
-use crate::transmute::{AsBytes, FromBytes};
-use crate::uaccess::{UserSliceReader, UserSliceWriter};
-use core::ops::{Deref, DerefMut};
-use core::str::FromStr;
+use crate::{
+    alloc::Allocator,
+    fmt,
+    fs::file,
+    prelude::*,
+    sync::{
+        atomic::{
+            Atomic,
+            AtomicBasicOps,
+            AtomicType,
+            Relaxed, //
+        },
+        Arc,
+        Mutex, //
+    },
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
+    uaccess::{
+        UserSliceReader,
+        UserSliceWriter, //
+    },
+};
+
+use core::{
+    ops::{
+        Deref,
+        DerefMut, //
+    },
+    str::FromStr,
+};
 
 /// A trait for types that can be written into a string.
 ///

base-commit: 1b89d4a6bb4cd7cfd7eb2e3621f04fda956e4ef3
-- 
2.52.0

