Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E1C4EBACC;
	Tue, 29 Sep 2026 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704703; cv=none; b=f9MGdzQQUd/iiVfJnv/qHsfC97vfcM9IC9Or9moK3Gx1svCSN7JRMKQSIc7Z29YZsD1FqZwdubyvMR7PadVeIdbFxNbbyMiuQzUj6DtwiNQWdLTh5TZJWhPNXGw5acsJlMKSOCYBCydjU+NqRUxXyW1d0IYfx5gzAlmq7njq8bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704703; c=relaxed/simple;
	bh=hQiBBD+N6hNe7LPuYbmu0WBJEzRAu5ac4EUOHQnux68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VfFyWNuH2JUGSrArm6nJ3ed6/azmp8jLnOOxHWEnjdJeQSiuXaABsGj/ixvEXSTtAtqYBKsX//FqYURtJlAvI1q7DcKT7FRxWYvyTlXcU20uaL879LR3W9YVrgQL9a9RxrELNhyUQdAuH+FdX5Sp/9LN4RQgtsohhTwHfKXvylE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VP/FfZoJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VP/FfZoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEC71F00893;
	Tue, 29 Sep 2026 17:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790704701;
	bh=I1bUe4x3SXN8VtwVdMCb6OWD8DSmsoNCsDJ6LeSZTdM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VP/FfZoJNDj+6IKDjmhnMgg4klXy1Bcb6F0rQxtyEpOHwxdU2N6IzkVlLLeO8pN/7
	 RJV2cYxA8w143+1rhg2pNLH7+zVzOaLHwqsc35/g39kvR2jW4M0fkovH4He6NZPtSJ
	 XfwYyRTKMvynnuBTXuVUrl8S4OJ0+w5ajCVhpfkG4pxYRcjXjFm22H3rhgXcYx0rVk
	 vylxDvLpwnMESBTDdWanc9iOVR6OgVkwMmg5nQr9OqQhms9bJL7/z9V3sjnQsDtGU+
	 X9yBjffBhvwljZ095BfHb3QTAH62tpqB1mKIJaIyUsOJogSKy+30QW6308TOVHiw4S
	 PFTwDcE0Uoifg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 29 Sep 2026 19:56:50 +0200
Subject: [PATCH v3 3/3] rust: alloc: move `NumaNode` to the `numa` module
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-cpu-helpers-v3-3-e968ce5ee613@kernel.org>
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
In-Reply-To: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5520; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=hQiBBD+N6hNe7LPuYbmu0WBJEzRAu5ac4EUOHQnux68=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqu/wclWaw1bNAHcQXLzwdiVWpJPHv63kqFZr/m
 5EQ8eoHMBiJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCarv8HAAKCRD6UCkIqsW9
 0GaaD/9I1mjX5LnY3jgK6Yh9WtGB2+3/fy/ywzAdMQShh1GOSEf0VsqCvPFA2BZmtnqnaolO7nj
 AQ636nWJEoR9DWy4zzWc6wcM8LeJOaeIwJmy0xbVc5cBDVs76PMyN+hZ5mCpMCWmZPRMtPHYVKJ
 fOtLOXsFZXUZuE4ravcoIPkSq+HaxP41waADk4w900ELPgNCeTSbCshxHHRUuOj4SXCbtiPowdS
 3paI0bF5esCWBrliTdEK52flV5KxYTkN+VXqEQMyhcRgQvkUiwKxYJfxHqh8CxGPPSYLmPziE8/
 VTEzEfaoaSuclcFZOdP0gBV9F4ocP1Kipdv2E2t+EQc/AMgDKSXJz0+THPRfqlz3nt+XhVpNoSA
 qbAcO1n9WDhnOFrI/TS45zaUXljdEE3mMj2TLMfGt7wQEZIUMKrZZ2wG1ms9qePSb8nTdcoukgw
 Irci5WZEZvJ6gV5mjYG1+bHZs3AgXNPUHxwinapeEkYrcMC8nQSSwfWQLyFws8bXBFAvgHtFZ1P
 QDQMX44Ff7tbkSpt2lKQT0gLDN9sy4USXgUEG/w3vl59WbDwqRXzvGucx6T/eQ6zk1cwPU8UccA
 8G5qKbTgViak5besJc543yQh2SR91yibfkBU+IG0bLRSWfLZ8H3qE7nGglVLI/QJ7eriyDurEw2
 aZ99kR5SJ7654mA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

`NumaNode` identifies a NUMA node and is not specific to the allocator API.
Move it from the `alloc` module to the `numa` module so that NUMA related
items live together.

No functional change.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://lore.kernel.org/all/aiZvKPFCkqJUsP0a@google.com/
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/alloc.rs           | 30 ++++--------------------------
 rust/kernel/alloc/allocator.rs |  6 +++---
 rust/kernel/alloc/kbox.rs      |  4 ++--
 rust/kernel/alloc/kvec.rs      |  4 ++--
 rust/kernel/numa.rs            | 35 ++++++++++++++++++++++++++++++++++-
 5 files changed, 45 insertions(+), 34 deletions(-)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index 21067bde6860..9daddf540e7d 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -22,7 +22,10 @@
 #[derive(Copy, Clone, PartialEq, Eq, Debug)]
 pub struct AllocError;
 
-use crate::prelude::*;
+use crate::{
+    numa::NumaNode,
+    prelude::*, //
+};
 
 use core::{
     alloc::Layout,
@@ -114,31 +117,6 @@ pub mod flags {
     pub const __GFP_NOWARN: Flags = Flags(bindings::__GFP_NOWARN);
 }
 
-/// Non Uniform Memory Access (NUMA) node identifier.
-#[derive(Clone, Copy, PartialEq)]
-pub struct NumaNode(i32);
-
-impl NumaNode {
-    /// Create a new NUMA node identifier (non-negative integer).
-    ///
-    /// Returns [`EINVAL`] if a negative id or an id exceeding [`bindings::MAX_NUMNODES`] is
-    /// specified.
-    pub fn new(node: i32) -> Result<Self> {
-        // MAX_NUMNODES never exceeds 2**10 because NODES_SHIFT is 0..10.
-        if node < 0 || node >= bindings::MAX_NUMNODES as i32 {
-            return Err(EINVAL);
-        }
-        Ok(Self(node))
-    }
-}
-
-/// Specify necessary constant to pass the information to Allocator that the caller doesn't care
-/// about the NUMA node to allocate memory from.
-impl NumaNode {
-    /// No node preference.
-    pub const NO_NODE: NumaNode = NumaNode(bindings::NUMA_NO_NODE);
-}
-
 /// The kernel's [`Allocator`] trait.
 ///
 /// An implementation of [`Allocator`] can allocate, re-allocate and free memory buffers described
diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index cd4203f27aed..4af50e20933b 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -11,12 +11,12 @@
 use super::{
     AllocError,
     Allocator,
-    Flags,
-    NumaNode, //
+    Flags, //
 };
 
 use crate::{
     bindings,
+    numa::NumaNode,
     page, //
 };
 
@@ -122,7 +122,7 @@ unsafe fn call(
         // - Those functions provide the guarantees of this function.
         let raw_ptr = unsafe {
             // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
-            self.0(ptr.cast(), size, layout.align(), flags.0, nid.0).cast()
+            self.0(ptr.cast(), size, layout.align(), flags.0, nid.as_raw()).cast()
         };
 
         let ptr = if size == 0 {
diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index c63d6acdbb6f..0fa736c81287 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -13,12 +13,12 @@
 use super::{
     AllocError,
     Allocator,
-    Flags,
-    NumaNode, //
+    Flags, //
 };
 
 use crate::{
     fmt,
+    numa::NumaNode,
     page::AsPageIter,
     prelude::*,
     types::ForeignOwnable, //
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index c7546b9da4fa..b669ca10b3f7 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -14,12 +14,12 @@
     AllocError,
     Allocator,
     Box,
-    Flags,
-    NumaNode, //
+    Flags, //
 };
 
 use crate::{
     fmt,
+    numa::NumaNode,
     page::{
         AsPageIter,
         PAGE_SIZE, //
diff --git a/rust/kernel/numa.rs b/rust/kernel/numa.rs
index 164e622d325f..4a3a880308f3 100644
--- a/rust/kernel/numa.rs
+++ b/rust/kernel/numa.rs
@@ -4,12 +4,15 @@
 //!
 //! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodemask.h)
 
-use crate::bindings;
 #[cfg(CONFIG_NUMA)]
 use crate::sync::atomic::{
     Atomic,
     Relaxed, //
 };
+use crate::{
+    bindings,
+    prelude::*, //
+};
 
 /// Returns the number of online NUMA nodes.
 #[inline]
@@ -27,3 +30,33 @@ pub fn num_online_nodes() -> u32 {
         bindings::nr_online_nodes
     }
 }
+
+/// Non Uniform Memory Access (NUMA) node identifier.
+#[derive(Clone, Copy, PartialEq)]
+pub struct NumaNode(i32);
+
+impl NumaNode {
+    /// Create a new NUMA node identifier (non-negative integer).
+    ///
+    /// Returns [`EINVAL`] if a negative id or an id exceeding [`bindings::MAX_NUMNODES`] is
+    /// specified.
+    pub fn new(node: i32) -> Result<Self> {
+        // MAX_NUMNODES never exceeds 2**10 because NODES_SHIFT is 0..10.
+        if node < 0 || node >= bindings::MAX_NUMNODES as i32 {
+            return Err(EINVAL);
+        }
+        Ok(Self(node))
+    }
+
+    /// Get the raw representation of this node identifier.
+    pub(crate) fn as_raw(self) -> i32 {
+        self.0
+    }
+}
+
+/// Specify necessary constant to pass the information to Allocator that the caller doesn't care
+/// about the NUMA node to allocate memory from.
+impl NumaNode {
+    /// No node preference.
+    pub const NO_NODE: NumaNode = NumaNode(bindings::NUMA_NO_NODE);
+}

-- 
2.54.0


