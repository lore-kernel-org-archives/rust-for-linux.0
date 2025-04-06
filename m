Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.77.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A457133987
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Apr 2025 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.77.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743942046; cv=none; b=sMK0PMvqC1o4Mv+YVNxkaYedAHQi4dii5BMdNPLwz7h9nsWxeXSa8/wsIH7yp8j0uYnnXkfoQhVHjbPHeArnsdp4XgYn9vO+EZC8fl2JxmkPKQS+dPQK/AVoHytZty1ah+jk6L22HlzgN5uYcVA4PBOLvETuzQWGzx7LFAeHAL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743942046; c=relaxed/simple;
	bh=ERPqbLDXIgdn1Eq1yt9xTuzCbHf8+EI9xioJFIzecHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=usIC6iFOeL7jtaVKodZZUW1CzkiGpwbFHeBHZgzmCyFmdP+FOGBbkyKg7/LqWfCNBcTLruWeX/dilyClmxu3TP7khrcbIdehcukb7I3Qx9NEN6u2LhAbbs5PUah3b9Uohp4WSYTcpnGHHtx2rstIFeQn6FUz1YEWZDlHcb9vLbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; arc=none smtp.client-ip=114.132.77.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
X-QQ-mid: bizesmtpsz12t1743942010twwjji
X-QQ-Originating-IP: D7nIlaKgtyE6bgrxpWGoaQNL5Eir0hMjgU6k4W0pkh4=
Received: from localhost.localdomain ( [153.3.21.167])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 06 Apr 2025 20:20:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5633474999447589099
EX-QQ-RecipientCnt: 12
From: Xizhe Yin <xizheyin@smail.nju.edu.cn>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	xizheyin <xizheyin@smail.nju.edu.cn>
Subject: [PATCH v3 1/1] rust: convert raw URLs to Markdown autolinks in comments
Date: Sun,  6 Apr 2025 20:16:56 +0800
Message-ID: <2F653D0EC21DAB8D+20250406121656.31901-1-xizheyin@smail.nju.edu.cn>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Nv1Zs1ssfOILrv4N4hj/hd+UP9IsM59NWwEIwyK0T7NUpQkZl5klrC4o
	8bDBmxbENRsSF3cCXN8JiK9N4muxc6a5YmgWgN88jguL+IBwRyFIhCZ5BGWu0Nz+TiECBbc
	jjXusQ5UrZOPV7bXkuTWiafjXhowyv68NLiyhzeh8D8NvMG6xGjRHeJFoYBlJFdjl7FhjEW
	rFw+fBp0J9OiwImW+C2HFylmUQjlpwYWyU7UHvXNtSdHwjN5M2Smb9BLeNBJ2nCmXanGjZs
	wQ69ICbBGRbWFW0Rl7Qv36qN2UTcEQyu34e7Mb6srvUJAdyJpshxkCmyJdpSf2XDC+h9ovL
	tQOWrQbzQmBgt14J5TDD8FAYtoVfupnNYW5FmE7wtVNHyozdKaGcQhgJrZE5Kh7g8LT0Xld
	5z18HspvEzIONeE/WOBPXABm+3Ey4hFdurepazfJXq8kGXrRhWOOh+YNC48+/9IuEJWQDVF
	DDSAcmUyvyxDeGntV1FD5Hztuf7EvLS4iRz3O6VzP7Cwi1cdVhopnjf4U5A5iRnmbYcGPqL
	fSJBmUJ/oimsNARlf2qClh05RogsFN+Hz8lI8CNbn6lHC7ULvZahOyaV5fxcy20kvts+DGl
	Tf2ARglPZ95WsuMZTN2pcrJYKJvmycOqLsbpy37j5kQButCMPGMir75WjvD/1xLhgx0qmCr
	uXkoCw6747wX25Pjx7Dv8Fuqrhv2WWMBmb+8pdkmZ6Ns2Eoy9ojhiK4OlbJOBNvycyhIN14
	qIo1c8AmB8lnSWLr0qKCSNNmH9aA8eJD/hR7xIJ7KRCc9M58qLCygihPe/bQFZ6x1eYpTYs
	42tBEHMz7qJpICr+ciMmUnOzz8StuMcWxUUt0IQP9IilJhDAgmkURk0h+NDqRsG6DXsT5bw
	HjXTOJK/AhBwRVET1YShuik6mln7kCa6rWwp41dUDYhLYjTUcKShPmo7gi3y0iQz3oPKLL7
	FsSKgFHBKNDF08lb+Wvs8JslsB/BWZJvLmSf+FuCpFcVkvkQpmub1Ah/xlQRIn4Vb0a9XOV
	ysVbT7Og==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

From: xizheyin <xizheyin@smail.nju.edu.cn>

Some comments in Rust files use raw URLs (http://example.com) rather
than Markdown autolinks <URL>. This inconsistency makes the
documentation less uniform and harder to maintain.

This patch converts all remaining raw URLs in Rust code comments to use
the Markdown autolink format, maintaining consistency with the rest of
the codebase which already uses this style.

Link: https://github.com/Rust-for-Linux/linux/issues/1153
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: xizheyin <xizheyin@smail.nju.edu.cn>
---
 rust/kernel/alloc/kbox.rs               | 2 +-
 rust/kernel/block/mq/gen_disk.rs        | 2 +-
 rust/kernel/std_vendor.rs               | 2 +-
 rust/kernel/sync/arc.rs                 | 2 +-
 rust/pin-init/examples/pthread_mutex.rs | 2 +-
 rust/pin-init/src/lib.rs                | 2 +-
 scripts/generate_rust_target.rs         | 4 ++--
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index b77d32f3a58b..604d12c6f5bd 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -101,7 +101,7 @@
 pub type KVBox<T> = Box<T, super::allocator::KVmalloc>;
 
 // SAFETY: All zeros is equivalent to `None` (option layout optimization guarantee:
-// https://doc.rust-lang.org/stable/std/option/index.html#representation).
+// <https://doc.rust-lang.org/stable/std/option/index.html#representation>).
 unsafe impl<T, A: Allocator> ZeroableOption for Box<T, A> {}
 
 // SAFETY: `Box` is `Send` if `T` is `Send` because the `Box` owns a `T`.
diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index 14806e1997fd..cd54cd64ea88 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -129,7 +129,7 @@ pub fn build<T: Operations>(
             get_unique_id: None,
             // TODO: Set to THIS_MODULE. Waiting for const_refs_to_static feature to
             // be merged (unstable in rustc 1.78 which is staged for linux 6.10)
-            // https://github.com/rust-lang/rust/issues/119618
+            // <https://github.com/rust-lang/rust/issues/119618>
             owner: core::ptr::null_mut(),
             pr_ops: core::ptr::null_mut(),
             free_disk: None,
diff --git a/rust/kernel/std_vendor.rs b/rust/kernel/std_vendor.rs
index 279bd353687a..abbab5050cc5 100644
--- a/rust/kernel/std_vendor.rs
+++ b/rust/kernel/std_vendor.rs
@@ -148,7 +148,7 @@ macro_rules! dbg {
     };
     ($val:expr $(,)?) => {
         // Use of `match` here is intentional because it affects the lifetimes
-        // of temporaries - https://stackoverflow.com/a/48732525/1063961
+        // of temporaries - <https://stackoverflow.com/a/48732525/1063961>
         match $val {
             tmp => {
                 $crate::pr_info!("[{}:{}:{}] {} = {:#?}\n",
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 8484c814609a..350c380bb8d4 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -135,7 +135,7 @@ pub struct Arc<T: ?Sized> {
     // meaningful with respect to dropck - but this may change in the future so this is left here
     // out of an abundance of caution.
     //
-    // See https://doc.rust-lang.org/nomicon/phantom-data.html#generic-parameters-and-drop-checking
+    // See <https://doc.rust-lang.org/nomicon/phantom-data.html#generic-parameters-and-drop-checking>
     // for more detail on the semantics of dropck in the presence of `PhantomData`.
     _p: PhantomData<ArcInner<T>>,
 }
diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/examples/pthread_mutex.rs
index 9164298c44c0..5ac22f1880d2 100644
--- a/rust/pin-init/examples/pthread_mutex.rs
+++ b/rust/pin-init/examples/pthread_mutex.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-// inspired by https://github.com/nbdd0121/pin-init/blob/trunk/examples/pthread_mutex.rs
+// inspired by <https://github.com/nbdd0121/pin-init/blob/trunk/examples/pthread_mutex.rs>
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
 #[cfg(not(windows))]
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 05c44514765e..0806c689f693 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1447,7 +1447,7 @@ macro_rules! impl_zeroable {
     {<T: ?Sized + Zeroable>} UnsafeCell<T>,
 
     // SAFETY: All zeros is equivalent to `None` (option layout optimization guarantee:
-    // https://doc.rust-lang.org/stable/std/option/index.html#representation).
+    // <https://doc.rust-lang.org/stable/std/option/index.html#representation>).
     Option<NonZeroU8>, Option<NonZeroU16>, Option<NonZeroU32>, Option<NonZeroU64>,
     Option<NonZeroU128>, Option<NonZeroUsize>,
     Option<NonZeroI8>, Option<NonZeroI16>, Option<NonZeroI32>, Option<NonZeroI64>,
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 4fd6b6ab3e32..03abfa693cbf 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -207,7 +207,7 @@ fn main() {
             // target feature of the same name plus the other two target features in
             // `clang/lib/Driver/ToolChains/Arch/X86.cpp`. These should be eventually enabled via
             // `-Ctarget-feature` when `rustc` starts recognizing them (or via a new dedicated
-            // flag); see https://github.com/rust-lang/rust/issues/116852.
+            // flag); see <https://github.com/rust-lang/rust/issues/116852>.
             features += ",+retpoline-external-thunk";
             features += ",+retpoline-indirect-branches";
             features += ",+retpoline-indirect-calls";
@@ -216,7 +216,7 @@ fn main() {
             // The kernel uses `-mharden-sls=all`, which Clang maps to both these target features in
             // `clang/lib/Driver/ToolChains/Arch/X86.cpp`. These should be eventually enabled via
             // `-Ctarget-feature` when `rustc` starts recognizing them (or via a new dedicated
-            // flag); see https://github.com/rust-lang/rust/issues/116851.
+            // flag); see <https://github.com/rust-lang/rust/issues/116851>.
             features += ",+harden-sls-ijmp";
             features += ",+harden-sls-ret";
         }
-- 
2.49.0

