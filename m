Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376527;
	b=JIR52x0ZD4A9on//f7TnsAyyi0Y7jDMwLoed4OWtekeO3jZ/JzCnTZbv2Trz7/CUwY18
	 qEIwImzt04C8g2FI4XB5seFYvtW1gcduxUCBVJ2wtM8/XZwvO/Bw3npgXbOr/f9FHjy1q
	 0o9JmI23kwLfOd+3EWEQVQRob1DZ9jFoLOCuB6JGrWq77Hmec56Zr4puXfcPz3oPSW9uM
	 elq0VwqJwj07K85EYGdG+q15hyFQIFwxZ/DuKr3JHczmwKN3payy9Rr7i1tSL71vX67X2
	 sthWaxny5BG9J/AdbQYi3BbhwpWHwl+P2SQXAgM3qpKnwyJ1R7Lzhd4fZbduhOd+5ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376527;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TEoBzydLhAWoxE6JUj9FRAegtYtzr4vhwwBHbq7ZyAE=;
	b=y0HFHpCPEFIvO8ZUham91rR5foWYGYf0SiuAI+2kB2Iry5EXcNCp2yOacbO1amCdZ/n+
	 mjd7PeT94QkDP6fYBawRHWpMzkgoQGKx9X/IKcBkG4gGgSrdIFQpEYkRVZf2RUDl4mAx9
	 VF/CWU1FHg/n4XA7sLqaiNpUVrCg3d6RVQyeUgpTNmyjPVJaMtCf6mzHtqnLjAIk91Fib
	 Qk2Sgyqr1COhySNo0Ds/6g/kHwOxMDKPkSzZv9v3nFZRXcacgT9Qs1cOG0ITTZVml+qcB
	 yJ0768lHagBu7ruE0REYeEW6qTYEzsDowGlsO1NEauIzm4dzkbtC7FNfslvziy7WwoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQ6E2J5f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D6B606A31A;
	Fri, 30 Oct 2026 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQ6E2J5f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB351F000C1;
	Fri, 30 Oct 2026 16:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376526;
	bh=TEoBzydLhAWoxE6JUj9FRAegtYtzr4vhwwBHbq7ZyAE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VQ6E2J5fBcqUMJHxr8bO2dxN+Z6ipPSNZ1LTkwq93t2gL6/Ss1zV/pML5gZ1p/xGH
	 /F71hx+C9CatqSuSX6XljhY149R/J3O3+fxmjH0ofwLm0VShVa//08Vrhm2TIMfyW9
	 r6Q/g6XeRy5V+Q4sPQfDtoYvZhE494nMf68RYJE2KjDS5SAOG2WD6ozflKRpf4aUBY
	 GrWAL2xSHifCdxRGRlhiSRKxlBZByNFTMxbtzvgnwqmc79T4gct648fUoxl4D/UGnM
	 r3YNg1whPEbGuF741QJE20+uYX1tAkd/HcLZYeU5wNZ55DV0gsaQhfmpuvhbAEDqmi
	 B3QHX2KMmr9cw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 30 Oct 2026 17:08:04 +0100
Subject: [PATCH v4 2/2] rust: alloc: move `NumaNode` to the `numa` module
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cpu-helpers-v4-2-a8d840d34837@kernel.org>
References: <20261030-cpu-helpers-v4-0-a8d840d34837@kernel.org>
In-Reply-To: <20261030-cpu-helpers-v4-0-a8d840d34837@kernel.org>
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
 "Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Yury Norov <yury.norov@gmail.com>, Yury Norov <ynorov@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5583; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=KD3jiA8PB7u+cdp08Fd6vVtn/2TqMtouWbVeRQ7Vg3Q=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq5MDpZs0vTnnYLx/gSJ6gNp2Z5/kihDzco/3AH
 H7LzPck3/yJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCauTA6QAKCRD6UCkIqsW9
 0EAUD/4sMjw4PzHpnAuc4FATQY6yu73zk/YNKMGSTcHPxj7Ig1CgvbIIr/BtJl17FArToJmj0gx
 RGZ6nQJlLLYAEXnhDsAflpz1uXJVfITVHS9L47v8ZG05FWp7DmmhXhZiCtC2Lq45qLyfV1GvpYs
 u47MbYRCg+immljxU+oetszPZETxHz+yqB+swIL+uWMqKXW/QRK0/CF1JjENuTs/SC7UvKKdK4l
 +/7KC40Ay4pL98ZFLVve5Vm8vLMijK/cvGVGAAkdeLZb1l78GlI+JxDV+TIPxy5SghCgch6XWqY
 636YxVXAtLs7JopP+TRcVNpAC0bt7nLrLL883RyA/6bhxeoTxbnO5ZGbIqnz1gnjunFYviQXikP
 CoyZ39qmA9de/hhE3oDHgGmuSv55ehaNQO7XFz7R8Kj8o92aJ7SS8FtHuqgW73mFDWolynKMhm6
 hXfuHWlv58iyENUujO11gKKp2iGe4CAA2D+77Ny8T7N/85IHHRFfLbqkQ8OXDyVdOwWIMepJtu4
 DVIBtIuDKahUxCZMhACJ7M38bj5Zj9m2i8gNem9UQJLWxMy+Px3ULOTxrIFOEVnZSeM5R++vvNH
 1r86L2nn91tKhIne5ZWFB96ZMRI5DDXIPHX+ACGLp7IoF5R4JeV/OdhcCJEwsoGe1DhqV7a1GFN
 SFDg///KM0lXZ1A==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

`NumaNode` identifies a NUMA node and is not specific to the allocator API.
Move it from the `alloc` module to the `numa` module so that NUMA related
items live together.

No functional change.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://lore.kernel.org/all/aiZvKPFCkqJUsP0a@google.com/
Reviewed-by: Yury Norov <ynorov@nvidia.com>
Assisted-by: LLM
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


