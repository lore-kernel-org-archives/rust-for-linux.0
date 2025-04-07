Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8505979FD
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Apr 2025 03:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743997093; cv=none; b=Lc7esmwMQa6zUjbAMX/XsZTmzjVzaCvi08f0Zi6uEwyaaFsDpuDpu+qBDpPYyCZXWYHMgeCxJ/R0BOYomljlJY+XXGElU6nFT3TszfKwk5MhXy1QnGM3dbuczmBlTpqHsQfbDrCEgQgFq8tP0zJ0WK1ljSFC9F+xqBcQPFq7lhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743997093; c=relaxed/simple;
	bh=V/Ykpw8P4yhQ9CwrRbWN/WMZO4guToTtAZx0SVR8X7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MPmIZFA8ajHNol2fOY5AfbPdx9K1J3Nm5t09VdcWrKmkM5oVWI298hn43WjV4UDsfJ0TcEoKZb7bNtMgzC27O2Zi9V/38SNq4Dap6tkGbV+Ut1Kc62zTguc1JDbDHaFV+JS2tbyIpeNiJV66r8PIpPS5yrDykgUpyALtCLjFDf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
X-QQ-mid: bizesmtp79t1743997045t066abe5
X-QQ-Originating-IP: xjiHviIIGRoWRLun/by444idXTq0bQGdh528PhfX9XI=
Received: from localhost.localdomain ( [36.152.24.149])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Apr 2025 11:37:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2314805540959903674
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
Subject: [PATCH v4] rust: convert raw URLs to Markdown autolinks in comments
Date: Mon,  7 Apr 2025 11:34:41 +0800
Message-ID: <509F0B66E3C1575D+20250407033441.5567-1-xizheyin@smail.nju.edu.cn>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N3geWPlRGZBxKNucMqvrBkeYnv7lpxsTBf4/NqpKggwd39w+G7kjUhjB
	mJG58kQ3CP3AiGbDW7WU0Yo03NTHVSjDZ9k9/niWhtMSMS7fiu+Mf2R/LLs6op9dBk1D7Nk
	U8gp+pjPVQ9G4GV7G6f5bNMlKnApSV4TnB7nocjCSqEGrsgmiTeDwFSrLZME9UIgZWK3a02
	eKXunIbuQdvFTY43GqVfUkc4ji3IO6VhoOD0bQlBYUUjQjR/iVWwMt6TYvAnNKghhycIJyq
	2STK8ftLtV5bYShsYyRjzeHk/cgj7CBBZjiTgMiXp+YdK8aCKJTFvHG61P1qhtV92TkUnux
	S33E1b8vm6FuxYwFciqn8GL1LcyogrK65Kq7eS94F900U5f3IaEbZbWH6kWwv3BSzc0QkJj
	L3VEWoG+p1izQI6wMVBa54xwtFRy+o0Vadak8cOSEMox+YZ/qIJTXQ72o4h2ftjOMmwVIje
	To34o0XpqlY8C26jJCWyx30ve43DKWO8oRc1XQa04SEgf1pVPzIBOUiUvxZMnkdLT36DZwq
	TeTeKaUMPV0tHiIqjt4c+5d/0LkoLOFewZTsspDA7m/KzMJ44ohXS5BBT/51Uovkl0ftXYq
	XE563PJfcFUPNgacsL2GN5lGqdzak5563RKIh2c5hvoGWwd/F/CvFEoa+8YWQfA24YBwTAi
	iVT0mffrNeCvm+BYmV59rBTEwqMdd+iCC3rauJTn2C1aTWdBnl1xH4polXNlx4cp5pCweXX
	PovEqpqZP5lYnkzWnmQKbrGQA0z65a+DFvZE6n96FJBoJshP6aV+gv0q61A4Ijd8uGbKmSN
	59cZHTNLh/5pr3He/GCqA0kUtIUD1GU7gwJMH6ZmJnb7E/uzo0MthW0jsw0crR0u3bNIRtG
	14HIiKqO1ez8hFP6FBGL/2doYg835gUdr4SN2p84me4SP/4oLtDuQHmLsTWxFokxuZ4rvD+
	UFbsxmUCFnR5Tx6JJy2pB7BJMsVrdV0UlhtA=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
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
 rust/kernel/alloc/kbox.rs        | 2 +-
 rust/kernel/block/mq/gen_disk.rs | 2 +-
 rust/kernel/std_vendor.rs        | 2 +-
 rust/kernel/sync/arc.rs          | 2 +-
 scripts/generate_rust_target.rs  | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

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

