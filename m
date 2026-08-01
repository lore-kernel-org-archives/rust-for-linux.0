Received: from flow-b7-smtp.messagingengine.com (flow-b7-smtp.messagingengine.com [202.12.124.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61BB3090E8
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Aug 2026 02:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785552545; cv=none; b=hpPXmVu8U/+dkRYBDiqECyM5ZGgCTKbK3NPxyqGZ0VwS0BdTuSxf2pzLApJ6UqSXLjetQ5vMrSRUMcggrFWjoduODKMgzwN2F3BujpbTwOvtLPIS9vhQJy/3AFnzYZFdqEvVOztsJHx19goieAElg9jRWb6R5mSUbV+7yGBobwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785552545; c=relaxed/simple;
	bh=2drGc3LZp0VYXnHBjd9CXE273spWplIT2IZJ1r8hjeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XaYfRQHYpbBpF86LIjUVANKa76kODPK6P28jqEMqGP01fECZBvhWu9qPuGR3CswOfcSz6ArT1g/+UXyrRxky0d3+WqzE17FvOuf89RiqJwx/LTQ36R9YYAMQ9lIqzsrHqfQEmRXtYqt6K4rGS0uo4FoD1A2nV1OeLb2z/dnyPCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=hroJ1+lK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OdzI+jkH; arc=none smtp.client-ip=202.12.124.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="hroJ1+lK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OdzI+jkH"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 9ECB3130011B;
	Fri, 31 Jul 2026 22:49:02 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 31 Jul 2026 22:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1785552542; x=1785556142; bh=oXx+3apRctao1SySCRmZ0
	DxGnfa/BM8nK5Ej/jnOxVs=; b=hroJ1+lKWTzO2Oztm81tUR+ZHcbl3al+o9mbf
	qc29NercHtDG7a3lqGk5dQsYCf7/rpqhEYtoXnukqhltcNz+zmSGx5IyRR27fc2K
	J1q2uMCqMZ9cyjERAfIxmWJuzN0ILJYR6gjljndfA77AhGs3W5+aP4gwxQ738qdT
	Du93IAvnjRKh6a7vsorkKzVXf5tLtGkDv1hfY5apQQZfD+IbgYZteiOqr7S7gCyO
	xmBy3hYVjcZMD8k1sVC0F7ke9Vkaw4ZVycWTwvVHYV/mgse8o1v2/vv9dBKlzFdL
	CLa8PNCyGhI5NkFYjlCI2LqXLt+6XqkpivJtnZcSdpoFTja+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785552542; x=1785556142; bh=oXx+3apRctao1SySCRmZ0DxGnfa/BM8nK5E
	j/jnOxVs=; b=OdzI+jkHwOml4c7qxfoHyLUqTR/WuNH4GSlkpCcue+rKCRfxXWz
	8GlrRUNXxl3kPmXgVmK31ajrGL47orXC5qSQWxTPeC2i0rWJkbzCpcu+ZVdPSb8S
	sld/8y6Apg6GDBGhx8D0iWZo2jWJA4FkwC2NXlhIl+hk0fT1GAFwroJHHPARcDBu
	8N4jtRhKR32MI2WRMYI351Lgboi4aJPFd41QVVIKyiNdooioCC9ZHuz3mI8qXdas
	/JIKwqFIpLBvq6n35bVgfYs1nguiA96L+g5dUkTBP2eYa7YeEocZ5ht52FoXr+0M
	h3TOk2NaaN0MO/PwAr4otdiOhoO8TJqBVXA==
X-ME-Sender: <xms:nV5tagiBTv7NZCK7umo5zsPsIgvFeKHVIhoWzuoRNtqNwp7hoSFedg>
    <xme:nV5talagmvPdr3rPa7CMfZAnukLSCSl2iBw3ZjSOya7gLDV9zF9qULDRrunkurgP3
    rHO8CHwiNwP3iOckKorkB7pEHcG0h1YDTmscxF0S4YOGUz0jAWfF9c>
X-ME-Received: <xmr:nV5tasgZ50o-JahePU-vtaLfYhTJJKZcVK07hDk6hOVly54auxRb4o_6HjQhCA7pz3NPh30cmrXlTLJwrOA>
X-ME-Proxy-Cause: dmFkZTFnWJ51n9pRmYwl/L4MRUvYTH+WjfDcjCcK28O3zd4qzWBdsQHToXo0DnJEWE8svM
    Ubf2OA/ZsWWi7Knu4VMEhRHfqkB9mhZ+Mvp5k5nuci4yBdwnU7cN5HY+0jjO+bBUxZI0xp
    vXv/yjY6lCVEXtevy68CFIlgOmacTadrFyD+LOhrWX8WFbg3IxW7Mjo+ClN6RZl281grC/
    y3mGqD93iR1OpbcXxBacvXDyCpSZvJY3tasFzutkulURC5Avu1ivrlFjif77BE/VqnQ/0N
    g8T0X8r25aucWgjKuCycepWxr64YsqtyKOPa8x8Idi0uIjk11j/K8z3xZtkPa4q7ipGHZk
    jFCKyDaT0/He6bG1NhLaYSJGLeh5LNHJDDbphnzYhHz388jE5MlT4Z77qXVkxJIk76MpGC
    otPcB2gJJRLXdmKIQKAPMpdIzJrhruafTF0q6rVpHM8qTGLULQRHOsu42JCezH2LKuU/Uc
    0V7dmS+lbsVAPBk/R1VzRjTt9uZNaQXTBF+64bajzy1wo8xsJz0TNPC7NL73W4zNOKqrKi
    fZ/gQNfRryGQ7APiBIXNdx75iv6zcrdRYvdHPpfeMYFDgfkGzO4etr1S4zXTD6m3AIaPc8
    GwgZ/OWDx6cBJx48yWqrXuZ5GAquN9zf2SHwaYaJRxUq+ZPEEuF5YrdEEdbA
X-ME-Proxy: <xmx:nV5tava-JEF3aXBQFTEC9PUxsfytarGPYjiqVSuhTlKRFV-Dvl0ZdQ>
    <xmx:nV5taqPyxMvbATOiPZw6RfdWtjAwIz5UNA6KwtCVXaYxWw3koZMz9g>
    <xmx:nV5taoblhNiNodG8XT-Xr6xnbFrqsT5xnafBwxB_5OH4mVy37gkinQ>
    <xmx:nV5taiUjf_YmXKLj59_5QZaqIF7IAcIn2WBr2N9Ub1Xo3tbAE-_4og>
    <xmx:nl5taiUwKveDL-jS2ydI7H_eAYqzzgI4aqIZtYaGVnayXQH4LE4yEVQp>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 22:48:58 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: ojeda@kernel.org,
	gary@garyguo.net
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	lossin@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v3] rust: bug: prevent dead_code warning from warn_on!'s flags constant
Date: Sat,  1 Aug 2026 11:48:41 +0900
Message-ID: <20260801024841.786664-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Fix the following dead_code warning on some configurations in an
atomic development branch:

warning: constant `WARN_ON_FLAGS` is never used
   --> linux/rust/kernel/bug.rs:126:19
    |
126 |               const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
    |                     ^^^^^^^^^^^^^
    |
   ::: linux/rust/kernel/sync/srcu.rs:106:12
    |
106 |           if crate::warn_on!(
    |  ____________-
107 | |             // SAFETY: By the type invariants, `self` contains a valid and pinned `struct srcu_struct`
108 | |             // and `srcu_readers_active()` only checks the active reader count.
109 | |             unsafe { bindings::srcu_readers_active(ptr) }
110 | |         ) {
    | |_________- in this macro invocation
    |
    = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
    = note: this warning originates in the macro `crate::warn_on` (in Nightly builds, run with -Z macro-backtrace for more info)

The warn_on! macro always defines a WARN_ON_FLAGS constant and hands it
to warn_flags!. On configurations where warn_flags! does not reference
its flags argument (the LOONGARCH/ARM variant, which only calls
WARN_ON(), and the !CONFIG_BUG no-op variant), the constant is left
unused and triggers a dead_code warning.

warn_flags! is the macro that accepts (and here discards) the flags
argument, so make it responsible for the argument it drops.

Also rename `_COND_STR` to `COND_STR` and consume `$file` for consistency.

Fixes: dff64b072708 ("rust: Add warn_on macro")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/bug.rs | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index ed943960f851..361e280b3614 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -53,6 +53,10 @@ macro_rules! warn_flags {
     ($file:expr, $flags:expr) => {
         const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
 
+        if false {
+            _ = $file;
+        }
+
         // SAFETY:
         // - `flags` and `size` are all compile-time constants, preventing
         // any invalid memory access.
@@ -76,6 +80,9 @@ macro_rules! warn_flags {
 #[cfg(all(CONFIG_BUG, CONFIG_UML))]
 macro_rules! warn_flags {
     ($file:expr, $flags:expr) => {
+        if false {
+            _ = $file;
+        }
         // SAFETY: It is always safe to call `warn_slowpath_fmt()`
         // with a valid null-terminated string.
         unsafe {
@@ -94,6 +101,10 @@ macro_rules! warn_flags {
 #[cfg(all(CONFIG_BUG, any(CONFIG_LOONGARCH, CONFIG_ARM)))]
 macro_rules! warn_flags {
     ($file:expr, $flags:expr) => {
+        if false {
+            _ = $file;
+            _ = $flags;
+        }
         // SAFETY: It is always safe to call `WARN_ON()`.
         unsafe { $crate::bindings::WARN_ON(true) }
     };
@@ -103,7 +114,12 @@ macro_rules! warn_flags {
 #[doc(hidden)]
 #[cfg(not(CONFIG_BUG))]
 macro_rules! warn_flags {
-    ($file:expr, $flags:expr) => {};
+    ($file:expr, $flags:expr) => {
+        if false {
+            _ = $file;
+            _ = $flags;
+        }
+    };
 }
 
 #[doc(hidden)]
@@ -118,14 +134,14 @@ macro_rules! warn_on {
         let cond = $cond;
 
         #[cfg(CONFIG_DEBUG_BUGVERBOSE_DETAILED)]
-        const _COND_STR: &str = concat!("[", stringify!($cond), "] ", file!());
+        const COND_STR: &str = concat!("[", stringify!($cond), "] ", file!());
         #[cfg(not(CONFIG_DEBUG_BUGVERBOSE_DETAILED))]
-        const _COND_STR: &str = file!();
+        const COND_STR: &str = file!();
 
         if cond {
             const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
 
-            $crate::warn_flags!(_COND_STR, WARN_ON_FLAGS);
+            $crate::warn_flags!(COND_STR, WARN_ON_FLAGS);
         }
         cond
     }};

base-commit: 11028ab62899e4191e074ee364c712b77823a9c4
-- 
2.43.0

