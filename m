Received: from dwarf.ash.relay.mailchannels.net (dwarf.ash.relay.mailchannels.net [23.83.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7C522687B
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Feb 2025 12:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738845680; cv=pass; b=Ozfc48wb9M+wLz9rdtrrDNZZu4eqUGOBGb2pafTzHD+fAr6qFXI5MTr+FXyeBXuAlcR4RsCWJdUDajcyeWz/A66tiUumLnDaITIm9bTsNEQYyZqk3BjwAjOZvJMxMmLNzBGaDOMgMRdRmHGJrkgG6T25cdP3s4TBfqdo2cSUTRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738845680; c=relaxed/simple;
	bh=ikuJI9d7NYbBP9AJbz+HQRpDYdZ4A9/4mgGU2EUL57k=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=WbqVwzr2sK1Y15q8L4X2vYvC4xyYmMCS98mV+ZIBem/9HPu1m9ji42zsnoIfqQhVYOsCoiW4fi3ML1Dtgd+NCwjCqsBSlmU9qkkvKPJdhZQ9rZjSFXsXCqE4XTBe6ETlAJV6b3K+P8WZTnmdb5e/zyPtPukb0NMxBpS0UzvwZXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=Hs7ZI+Ce reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="Hs7ZI+Ce"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6BA819028AE;
	Thu,  6 Feb 2025 12:32:42 +0000 (UTC)
Received: from uk-fast-smtpout10.hostinger.io (trex-9.trex.outbound.svc.cluster.local [100.122.225.139])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E84669028C0;
	Thu,  6 Feb 2025 12:32:40 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738845161; a=rsa-sha256;
	cv=none;
	b=muGJnNOlStwOOcsknG5N4RNGC6m/zsSVwtCoXo/eokhtxGzYZkuqKng53VB8Lo0xZIxkDm
	0wUI4VUT+rNx01m4az13bOW2LUwEyDrrq7COqkJD6T4zW1nRA+pDnLhOfSgA2Q5hlVnwz3
	N9pJCDRmOEZUUCWvdOaCKHRzJyhB66xLCc8DKrvkMQs/SindKlpUVSZQr9W1Ps8uOCTGMj
	1AcbKPR4O8/sPtzA1mulQH4Iiu7WrwGgRg7Avt/x6DvbSw9BeDoQzikPwLoJ1qI0JIxcSM
	QtXz/rVPMY1xPYsW07/ZEV18pvtYLFUz+srUvet6SK5McP9naLgOozqkvmYDog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738845161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=ofDBJ1eZe8CcywrueI65/HmffVCZ510Iy7XoNMGxwEc=;
	b=9t/bbF56QePjm/3DMdTw+pfBEdWvxNGF8kulq81tvsUamSvhza+LDTER5TWV8CHbdVTalE
	MBIjQpsIj69eEHgXeD/4ut7iWC/PhcQtaoXba2p7qSeROe80mgoTCGPFCFD//NeoACkpTm
	DBuyswjCIbFYY1HmMMSg4LaIYwsoypIfAjZdYZ5kHZySggkrzEiQK2v8jaF+rO2lo640tN
	n0kyq5k5s8XtVuSnD4UMdQ6Zx/NEr+QpT0VPqpS6ktDkUiNpS+msTHVpXZqUKnNJVvo1kP
	ZYH3TCjSPqsQFPtVbZRHl8AKEAK+O+vtDjNd6IeGkZ/fnGSvIMPTDbSkyVrcmQ==
ARC-Authentication-Results: i=1;
	rspamd-854f7f575d-lrjtl;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Exultant-Bottle: 442166485083a51f_1738845161731_2889564505
X-MC-Loop-Signature: 1738845161731:1640156402
X-MC-Ingress-Time: 1738845161730
Received: from uk-fast-smtpout10.hostinger.io (uk-fast-smtpout10.hostinger.io
 [145.14.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.122.225.139 (trex/7.0.2);
	Thu, 06 Feb 2025 12:32:41 +0000
From: Alban Kurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738845159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ofDBJ1eZe8CcywrueI65/HmffVCZ510Iy7XoNMGxwEc=;
	b=Hs7ZI+CeGY4ovtq3StskmnrRrTtxoO0OKOqx0ThX59367YgFFmyxN1QhudQuny40CZlscm
	/7zf0HzuibYg4x8LgViP6tJC8PRoUW5wBVz+Pt8xJ1Ww4kRZQn9yjEHA4kPwyLpGrbmCii
	1Z1pT5nz484udQ4Xg2EXGk+Y5vKeyCBZ67PR21GRtegKCzCN9CIOLhhkC4HJKdNoVBjqU0
	AI+HkgLlNNRCpLv3z/8V4PDanI+o/3SPqgTQriAYZWvHh5WWjSho5+xdwzpOYTCwyXPcNe
	4qCCR+NNXCQpYQmqWgQr28YPL02UwVEN4zACtnYS1tH8hezho4PGVv80crtFJw==
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alban Kurti <kurti@invicto.ai>
Subject: [PATCH v2 1/1] rust: printing macros: add missing newlines
Message-ID: <20250206123238.201415-1-kurti@invicto.ai>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Thu, 06 Feb 2025 12:32:38 +0000 (UTC)
X-CM-Envelope: MS4xfI9vCZdDn2WmPByQ5hnbU2s7Q7t7O5mE55rSmY9qnSoouL6NwV2cdpufC1ijUsHFtrJ5FcpYacpqS3/EmBn/o+EpiVlT/lYZRmuSa3/4q5+psPbu0COn v74cpvnvBAfP7r4PqZNL/7a6h4KB6oCDmIDGLvTuEIxg/JGUtKiwiX9gGWIZjJ8ZlYooRGtR0G/2kk/nAVaMBoF/jXmIImGgPsFt1DWSwkfalcp3ieoUjg+V VE1YcIHpzkPAvhHtQLLvvv9IDMSHpg6RO/gJ633We2g=
X-CM-Analysis: v=2.4 cv=FNtJxPos c=1 sm=1 tr=0 ts=67a4abe7 a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=eQiyfebm6NEgZbzsHqIA:9
X-AuthUser: kurti@invicto.ai

Fixes calls to pr_*! to include \n

Reported-by: ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Alban Kurti <kurti@invicto.ai>
---
Changelog since v1:
  - Caught more examples and also fixed commented out lines of pr_* to
    include \n as well
 --cc                            |  0
 Documentation/rust/testing.rst  |  2 +-
 rust/kernel/error.rs            |  2 +-
 rust/kernel/init.rs             | 12 ++++++------
 rust/kernel/init/macros.rs      |  6 +++---
 rust/kernel/sync/locked_by.rs   |  2 +-
 rust/kernel/workqueue.rs        |  6 +++---
 samples/rust/rust_print_main.rs |  8 ++++----
 8 files changed, 19 insertions(+), 19 deletions(-)
 create mode 100644 --cc

diff --git a/--cc b/--cc
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
index 568b71b415a4..180b886e0f1e 100644
--- a/Documentation/rust/testing.rst
+++ b/Documentation/rust/testing.rst
@@ -97,7 +97,7 @@ operator are also supported as usual, e.g.:
 
 	/// ```
 	/// # use kernel::{spawn_work_item, workqueue};
-	/// spawn_work_item!(workqueue::system(), || pr_info!("x"))?;
+	/// spawn_work_item!(workqueue::system(), || pr_info!("x\n"))?;
 	/// # Ok::<(), Error>(())
 	/// ```
 
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index f6ecf09cb65f..a194d83e6835 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -107,7 +107,7 @@ pub fn from_errno(errno: crate::ffi::c_int) -> Error {
         } else {
             // TODO: Make it a `WARN_ONCE` once available.
             crate::pr_warn!(
-                "attempted to create `Error` with out of range `errno`: {}",
+                "attempted to create `Error` with out of range `errno`: {}\n",
                 errno
             );
             code::EINVAL
diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 3f9236c1c9d5..8f57d164cdec 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -259,7 +259,7 @@
 ///     },
 /// }));
 /// let foo: Pin<&mut Foo> = foo;
-/// pr_info!("a: {}", &*foo.a.lock());
+/// pr_info!("a: {}\n", &*foo.a.lock());
 /// ```
 ///
 /// # Syntax
@@ -319,7 +319,7 @@ macro_rules! stack_pin_init {
 ///     }, GFP_KERNEL)?,
 /// }));
 /// let foo = foo.unwrap();
-/// pr_info!("a: {}", &*foo.a.lock());
+/// pr_info!("a: {}\n", &*foo.a.lock());
 /// ```
 ///
 /// ```rust,ignore
@@ -352,7 +352,7 @@ macro_rules! stack_pin_init {
 ///         x: 64,
 ///     }, GFP_KERNEL)?,
 /// }));
-/// pr_info!("a: {}", &*foo.a.lock());
+/// pr_info!("a: {}\n", &*foo.a.lock());
 /// # Ok::<_, AllocError>(())
 /// ```
 ///
@@ -882,7 +882,7 @@ pub unsafe trait PinInit<T: ?Sized, E = Infallible>: Sized {
     ///
     /// impl Foo {
     ///     fn setup(self: Pin<&mut Self>) {
-    ///         pr_info!("Setting up foo");
+    ///         pr_info!("Setting up foo\n");
     ///     }
     /// }
     ///
@@ -986,7 +986,7 @@ pub unsafe trait Init<T: ?Sized, E = Infallible>: PinInit<T, E> {
     ///
     /// impl Foo {
     ///     fn setup(&mut self) {
-    ///         pr_info!("Setting up foo");
+    ///         pr_info!("Setting up foo\n");
     ///     }
     /// }
     ///
@@ -1336,7 +1336,7 @@ fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<Pin<Self::Ini
 /// #[pinned_drop]
 /// impl PinnedDrop for Foo {
 ///     fn drop(self: Pin<&mut Self>) {
-///         pr_info!("Foo is being dropped!");
+///         pr_info!("Foo is being dropped!\n");
 ///     }
 /// }
 /// ```
diff --git a/rust/kernel/init/macros.rs b/rust/kernel/init/macros.rs
index 1fd146a83241..b7213962a6a5 100644
--- a/rust/kernel/init/macros.rs
+++ b/rust/kernel/init/macros.rs
@@ -45,7 +45,7 @@
 //! #[pinned_drop]
 //! impl PinnedDrop for Foo {
 //!     fn drop(self: Pin<&mut Self>) {
-//!         pr_info!("{self:p} is getting dropped.");
+//!         pr_info!("{self:p} is getting dropped.\n");
 //!     }
 //! }
 //!
@@ -412,7 +412,7 @@
 //! #[pinned_drop]
 //! impl PinnedDrop for Foo {
 //!     fn drop(self: Pin<&mut Self>) {
-//!         pr_info!("{self:p} is getting dropped.");
+//!         pr_info!("{self:p} is getting dropped.\n");
 //!     }
 //! }
 //! ```
@@ -423,7 +423,7 @@
 //! // `unsafe`, full path and the token parameter are added, everything else stays the same.
 //! unsafe impl ::kernel::init::PinnedDrop for Foo {
 //!     fn drop(self: Pin<&mut Self>, _: ::kernel::init::__internal::OnlyCallFromDrop) {
-//!         pr_info!("{self:p} is getting dropped.");
+//!         pr_info!("{self:p} is getting dropped.\n");
 //!     }
 //! }
 //! ```
diff --git a/rust/kernel/sync/locked_by.rs b/rust/kernel/sync/locked_by.rs
index a7b244675c2b..61f100a45b35 100644
--- a/rust/kernel/sync/locked_by.rs
+++ b/rust/kernel/sync/locked_by.rs
@@ -55,7 +55,7 @@
 /// fn print_bytes_used(dir: &Directory, file: &File) {
 ///     let guard = dir.inner.lock();
 ///     let inner_file = file.inner.access(&guard);
-///     pr_info!("{} {}", guard.bytes_used, inner_file.bytes_used);
+///     pr_info!("{} {}\n", guard.bytes_used, inner_file.bytes_used);
 /// }
 ///
 /// /// Increments `bytes_used` for both the directory and file.
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 1dcd53478edd..ebc4b5b4b06d 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -60,7 +60,7 @@
 //!     type Pointer = Arc<MyStruct>;
 //!
 //!     fn run(this: Arc<MyStruct>) {
-//!         pr_info!("The value is: {}", this.value);
+//!         pr_info!("The value is: {}\n", this.value);
 //!     }
 //! }
 //!
@@ -108,7 +108,7 @@
 //!     type Pointer = Arc<MyStruct>;
 //!
 //!     fn run(this: Arc<MyStruct>) {
-//!         pr_info!("The value is: {}", this.value_1);
+//!         pr_info!("The value is: {}\n", this.value_1);
 //!     }
 //! }
 //!
@@ -116,7 +116,7 @@
 //!     type Pointer = Arc<MyStruct>;
 //!
 //!     fn run(this: Arc<MyStruct>) {
-//!         pr_info!("The second value is: {}", this.value_2);
+//!         pr_info!("The second value is: {}\n", this.value_2);
 //!     }
 //! }
 //!
diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_main.rs
index 7e8af5f176a3..7ef3cecc65a1 100644
--- a/samples/rust/rust_print_main.rs
+++ b/samples/rust/rust_print_main.rs
@@ -23,10 +23,10 @@ fn arc_print() -> Result {
     let b = UniqueArc::new("hello, world", GFP_KERNEL)?;
 
     // Prints the value of data in `a`.
-    pr_info!("{}", a);
+    pr_info!("{}\n", a);
 
     // Uses ":?" to print debug fmt of `b`.
-    pr_info!("{:?}", b);
+    pr_info!("{:?}\n", b);
 
     let a: Arc<&str> = b.into();
     let c = a.clone();
@@ -42,7 +42,7 @@ fn arc_print() -> Result {
 
         use core::fmt::Display;
         fn arc_dyn_print(arc: &Arc<dyn Display>) {
-            pr_info!("Arc<dyn Display> says {arc}");
+            pr_info!("Arc<dyn Display> says {arc}\n");
         }
 
         let a_i32_display: Arc<dyn Display> = Arc::new(42i32, GFP_KERNEL)?;
@@ -53,7 +53,7 @@ fn arc_dyn_print(arc: &Arc<dyn Display>) {
     }
 
     // Pretty-prints the debug formatting with lower-case hexadecimal integers.
-    pr_info!("{:#x?}", a);
+    pr_info!("{:#x?}\n", a);
 
     Ok(())
 }
-- 
2.48.1

