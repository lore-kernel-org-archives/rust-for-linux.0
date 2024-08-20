Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BEE16BE33
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.84.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724138832; cv=none; b=SzVi8mdmp7psjYa5B7QRWtd/cu1zZ3sVQfdd4/ER5NxBVsurN34SRADzf31V0x+XQi3WwOxosO9MUbwhZvrun1+U8TkttaRG3LyJqTd8J3bqe8/n5P3XgBypRGcHN1oI6smhLnk+v3H7H614BUNAYy0lFdViy20tNw3ESQ4u+wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724138832; c=relaxed/simple;
	bh=+wapyr7ECieHbHJCKu3YN7/P4+V1Pt93KZEiORdhTQM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cspt4iAOaSb5HjDopbIvqXYE5UDvX8ziFEs3k0tmg0MoHEA3DGA80gDqyXR7355nJ/j5c3m8YteX1oiBp2RL/bI5CB/8YNuMN1t1o2i/ODDB/D0le8uayv/d7cbgFLE1S09MaGp2Equl1DXZDPBCc9qT5SVO1cyBG2HZipntmSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iodoru.org; spf=pass smtp.mailfrom=iodoru.org; arc=none smtp.client-ip=176.9.84.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iodoru.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iodoru.org
Received: from localhost (localhost [127.0.0.1])
	by mail.desaster-games.net (Postfix) with ESMTP id 877A012004;
	Tue, 20 Aug 2024 09:27:02 +0200 (CEST)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
	by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GvfPrZtVQ4YC; Tue, 20 Aug 2024 09:26:49 +0200 (CEST)
Received: from ymir.nue2.suse.org (unknown [81.95.8.245])
	by mail.desaster-games.net (Postfix) with ESMTPSA id 3EB0212001;
	Tue, 20 Aug 2024 09:26:49 +0200 (CEST)
From: Michael Vetter <jubalh@iodoru.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	Michael Vetter <jubalh@iodoru.org>
Subject: [PATCH] rust: link docs.kernel.org in documentation
Date: Tue, 20 Aug 2024 09:26:43 +0200
Message-Id: <20240820072643.29210-1-jubalh@iodoru.org>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Link to docs.kernel.org instead of kernel.org in the documentation.
The links are shorter and cleaner.

Link: https://github.com/Rust-for-Linux/linux/issues/1101
Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 rust/kernel/print.rs      | 20 ++++++++++----------
 rust/kernel/std_vendor.rs |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index a78aa3514a0a..508b0221256c 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/printk.h`](srctree/include/linux/printk.h)
 //!
-//! Reference: <https://www.kernel.org/doc/html/latest/core-api/printk-basics.html>
+//! Reference: <https://docs.kernel.org/core-api/printk-basics.html>
 
 use core::{
     ffi::{c_char, c_void},
@@ -197,7 +197,7 @@ macro_rules! print_macro (
 /// Mimics the interface of [`std::print!`]. See [`core::fmt`] and
 /// `alloc::format!` for information about the formatting syntax.
 ///
-/// [`pr_emerg`]: https://www.kernel.org/doc/html/latest/core-api/printk-basics.html#c.pr_emerg
+/// [`pr_emerg`]: https://docs.kernel.org/core-api/printk-basics.html#c.pr_emerg
 /// [`std::print!`]: https://doc.rust-lang.org/std/macro.print.html
 ///
 /// # Examples
@@ -221,7 +221,7 @@ macro_rules! pr_emerg (
 /// Mimics the interface of [`std::print!`]. See [`core::fmt`] and
 /// `alloc::format!` for information about the formatting syntax.
 ///
-/// [`pr_alert`]: https://www.kernel.org/doc/html/latest/core-api/printk-basics.html#c.pr_alert
+/// [`pr_alert`]: https://docs.kernel.org/core-api/printk-basics.html#c.pr_alert
 /// [`std::print!`]: https://doc.rust-lang.org/std/macro.print.html
 ///
 /// # Examples
@@ -245,7 +245,7 @@ macro_rules! pr_alert (
 /// Mimics the interface of [`std::print!`]. See [`core::fmt`] and
 /// `alloc::format!` for information about the formatting syntax.
 ///
-/// [`pr_crit`]: https://www.kernel.org/doc/html/latest/core-api/printk-basics.html#c.pr_crit
+/// [`pr_crit`]: https://docs.kernel.org/core-api/printk-basics.html#c.pr_crit
 /// [`std::print!`]: https://doc.rust-lang.org/std/macro.print.html
 ///
 /// # Examples
@@ -269,7 +269,7 @@ macro_rules! pr_crit (
 /// Mimics the interface of [`std::print!`]. See [`core::fmt`] and
 /// `alloc::format!` for information about the formatting syntax.
 ///
-/// [`pr_err`]: https://www.kernel.org/doc/html/latest/core-api/printk-basics.html#c.pr_err
+/// [`pr_err`]: https://docs.kernel.org/core-api/printk-basics.html#c.pr_err
 /// [`std::print!`]: https://doc.rust-lang.org/std/macro.print.html
 ///
 /// # Examples
@@ -293,7 +293,7 @@ macro_rules! pr_err (
 /// Mimics the interface of [`std::print!`]. See [`core::fmt`] and
 /// `alloc::format!` for information about the formatting syntax.
 ///
-/// [`pr_warn`]: https://www.kernel.org/doc/html/latest/core-api/printk-basics.html#c.pr_warn
+/// [`pr_warn`]: https://docs.kernel.org/core-api/printk-basics.html#c.pr_warn
 /// [`std::print!`]: https://doc.rust-lang.org/std/macro.print.html
 ///
 /// # Examples
@@ -317,7 +317,7 @@ macro_rules! pr_warn (
 /// Mimics the interface of [`std::print!`]. See [`core::fmt`] and
 /// `alloc::format!` for information about the formatting syntax.
 ///
-/// [`pr_notice`]: https://www.kernel.org/doc/html/latest/core-api/printk-basics.html#c.pr_notice
+/// [`pr_notice`]: https://docs.kernel.org/core-api/printk-basics.html#c.pr_notice
 /// [`std::print!`]: https://doc.rust-lang.org/std/macro.print.html
 ///
 /// # Examples
@@ -341,7 +341,7 @@ macro_rules! pr_notice (
 /// Mimics the interface of [`std::print!`]. See [`core::fmt`] and
 /// `alloc::format!` for information about the formatting syntax.
 ///
-/// [`pr_info`]: https://www.kernel.org/doc/html/latest/core-api/printk-basics.html#c.pr_info
+/// [`pr_info`]: https://docs.kernel.org/core-api/printk-basics.html#c.pr_info
 /// [`std::print!`]: https://doc.rust-lang.org/std/macro.print.html
 ///
 /// # Examples
@@ -367,7 +367,7 @@ macro_rules! pr_info (
 /// Mimics the interface of [`std::print!`]. See [`core::fmt`] and
 /// `alloc::format!` for information about the formatting syntax.
 ///
-/// [`pr_debug`]: https://www.kernel.org/doc/html/latest/core-api/printk-basics.html#c.pr_debug
+/// [`pr_debug`]: https://docs.kernel.org/core-api/printk-basics.html#c.pr_debug
 /// [`std::print!`]: https://doc.rust-lang.org/std/macro.print.html
 ///
 /// # Examples
@@ -395,7 +395,7 @@ macro_rules! pr_debug (
 /// `alloc::format!` for information about the formatting syntax.
 ///
 /// [`pr_info!`]: crate::pr_info!
-/// [`pr_cont`]: https://www.kernel.org/doc/html/latest/core-api/printk-basics.html#c.pr_cont
+/// [`pr_cont`]: https://docs.kernel.org/core-api/printk-basics.html#c.pr_cont
 /// [`std::print!`]: https://doc.rust-lang.org/std/macro.print.html
 ///
 /// # Examples
diff --git a/rust/kernel/std_vendor.rs b/rust/kernel/std_vendor.rs
index 39679a960c1a..67bf9d37ddb5 100644
--- a/rust/kernel/std_vendor.rs
+++ b/rust/kernel/std_vendor.rs
@@ -136,7 +136,7 @@
 ///
 /// [`std::dbg`]: https://doc.rust-lang.org/std/macro.dbg.html
 /// [`eprintln`]: https://doc.rust-lang.org/std/macro.eprintln.html
-/// [`printk`]: https://www.kernel.org/doc/html/latest/core-api/printk-basics.html
+/// [`printk`]: https://docs.kernel.org/core-api/printk-basics.html
 /// [`pr_info`]: crate::pr_info!
 /// [`pr_debug`]: crate::pr_debug!
 #[macro_export]
-- 
2.35.3

