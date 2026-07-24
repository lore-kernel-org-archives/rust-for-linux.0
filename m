Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC40835E943
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 05:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784869205; cv=none; b=jJkM3+3b/pN/WIRKLX1rlMW085CF2irFoo3n3zNli9gB3skYfgPSBy37DQvmjTgbLEUjXTgerpAQP9UvQswWWB5N3r0xVgWELaLiKZ8TIjDUfBM7DnXxB2ddHIozHBCF3FaTwcLKRGS/BtwgFUlVxyLqWKWsmTAxQdsIzIEovZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784869205; c=relaxed/simple;
	bh=uQTf0Qjb8/SgupRjJKfQIizYhbSFWoW4bhvbHewqSSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hnl0kzON4GBq9fv7qJY6B4Art2OdEcBZyp3ZyNJHJjh6+5GeW+cdIoKu8qhCxPj/X/NR9OKyeN9Che097+jUJ5c7aXFjHbeUo8Nd2WfXO9LgJLk0J5ofqRO+lAwdY/q1cDdZxg8uCl36+td2rmDTlC4GIhCO1dtiq7PTu9FELGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=kbWyPrJt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mnh5q4ha; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="kbWyPrJt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mnh5q4ha"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 5EE3613800E8;
	Fri, 24 Jul 2026 00:59:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 24 Jul 2026 00:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1784869190; x=1784872790; bh=ld/k7GW3YAANerka/ESmq
	i/ckO2ptZko8592pLd67TA=; b=kbWyPrJtVMyHsr+GZ/kEdndSKMRVgTN77uTCJ
	5OwdpfbIZqJwVW2vYvPT5HI4CVfpHd1w99jSuW7D6VOF2Z4Y48XPojFrC/fH8d66
	Ou/6QkjBIQ56J+Iwlgw1qgSclSRUGEilUWUC3QmbxMKWWA11v0dguWoBK0m+6Dj6
	5nEmCQeBjbQ9p8eDNOm1qwPqriPUIZ5+Y8w0TqdmaBwglRcahQ8oeGVjNJa/h4LW
	Wotm7SNftCF2iLdNTVk3FN3kVzjPUNGZzbYmyy0AO5AHNn6ZjAR8u75p1bu6mBQu
	0ASHq8W3siLJ8u5YJ/D09540XYapzO3hHBKUAr1sF9cVZzslg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784869190; x=1784872790; bh=ld/k7GW3YAANerka/ESmqi/ckO2ptZko859
	2pLd67TA=; b=mnh5q4havoQthxk79JN+J2a2fq9FViH56k7vTY4PDqlyPlWPIKj
	AJ3DUQRmT3Pmo3DGnW0K5yRJR4SZ36ik+OgBHpCeeJr9VXdvY4UC4Z2g8+WR+vw9
	k6lZbRQ0a/IygtM85MAL/fNB2MEH1hz8JNrtIyrV4VgY0PwuQL86M/hbzIgcqu6n
	JkgwLwnJgZZSR1JktXf0PoGCwyEqcEZSLRTMrZXhSIvDq9061BZhNZqEigiVY3Ym
	wWsbkBeU3ARuqIfvYLCOxY3lX/nROUTwR8mWqI+1oMS3Fkg3pIk+ZuSz0c/p0PZL
	07BoKCMKo1z9YKM23SaVUzqZBmCDRjJ51yg==
X-ME-Sender: <xms:RfFiauyWfWafsV7n_Kfmoq-EJaoinNlPMpXvl3_6aMLRy5B4YCQYQg>
    <xme:RfFiaqu9S3bM6IsbYreouyKtKsB3VDMAyuYGRAay7ioNprDt03XQfHWV0GqcPJNyD
    lfC-34Et9oZkDp1fMkCz921GO9-wGQsINrKaCWF1U2-fqJyj6SdwKI>
X-ME-Received: <xmr:RfFiagHULu-wwbZLy9PfIrXcJKHm1A4DMEj4lt0EKveJwIX8di08QtSekpzh-SFF-DcjZs87NT2L0V2N3_s>
X-ME-Proxy-Cause: dmFkZTGKH8jjDiqwwagtCsdw9Eu1JIrahV1pE6YMskpedr0UMBSs5F3N/1nM5yo5WQnTk8
    J29BSDq3wuaDDOwx1e3ApMRywKZYLL2Tq2AEhxnbJQdEvhU1eUJlixrblZFFdgkaVWg64e
    hb0FNp3EMC0McGMBIPXEK7Z25Vyg61gr8CYzqaFbLqlQR3udtPwyr/Bbu8gA4UQfEAX8yY
    ChZkJBJoPpjtw3WQYmEC83skBobHWdDjVZqTak7SCYFW81NBPd0U5PCsFXbhOA3a5+KAfn
    mx2nQ3d3X1L8vZ9uu59qACRbfOBjVegNIb+iqvE/raFN6yvhh5gpl/w7hxu084Rt+XwJSd
    4xNfdliENGUd/JBB6EVnRWMIeqpkkOzd/CnHzZcLUg8vNomWt81yndKdWF42evwCYDJBCY
    RZmqoLQWdxgFFl+gm9rM73IGhfCTS2YfRE0HW+JJkplhr/qumHjbRu2ZVJG0tzO87AltTB
    PW0ptqGe39OaJJHWYzEruN0DYRkUNA1igMNGHpFAP6hd53iQsi4/ehI1ukoJQuWzc3cjE/
    gaNyKihfe0NVplN5LWA8WoOhbIP7Q7fjzFQ2loJm2dfSSELk2wELKtTpI4zIBUAx3GH6nB
    LZSc80s4At1y3JNFyQwY1qfc9cC8ktIuoADRJhUZGXmQUCTjy33n5ZGh0csg
X-ME-Proxy: <xmx:RfFiag765o71QsYeTG4-H4xQ844KiizxrNMluG8jjCYXt35qtiIJig>
    <xmx:RfFiapwWlCCQUwZ8OBR-Q9-nozPrJCUBVGdhvHrT9l9WGartsAG9kg>
    <xmx:RfFiau0n4b5jBi1pPL2ZVGkd3TiY47St9xESlgmqQMSMXXOytryAeg>
    <xmx:RfFias51ivgZRk00e4yaBeGaVowsJst_WykhRsPgOvcoLgEZ08pO1w>
    <xmx:RvFiahmE6EXy8VprkwMCwIi9mqf1zFg9_GKa1arMxPUQ-mHqRB4f49So>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jul 2026 00:59:46 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: ojeda@kernel.org
Cc: paulmck@kernel.org,
	a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v2] rust: bug: prevent dead_code warning from warn_on!'s flags constant
Date: Fri, 24 Jul 2026 13:59:36 +0900
Message-ID: <20260724045936.291623-1-tomo@flapping.org>
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
   --> /linux/rust/kernel/bug.rs:126:19
    |
126 |               const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
    |                     ^^^^^^^^^^^^^
    |
   ::: /linux/rust/kernel/sync/srcu.rs:106:12
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

Fixes: dff64b072708 ("rust: Add warn_on macro")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/bug.rs | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index ed943960f851..4df55093359c 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -94,6 +94,9 @@ macro_rules! warn_flags {
 #[cfg(all(CONFIG_BUG, any(CONFIG_LOONGARCH, CONFIG_ARM)))]
 macro_rules! warn_flags {
     ($file:expr, $flags:expr) => {
+        if false {
+            _ = $flags;
+        }
         // SAFETY: It is always safe to call `WARN_ON()`.
         unsafe { $crate::bindings::WARN_ON(true) }
     };
@@ -103,7 +106,11 @@ macro_rules! warn_flags {
 #[doc(hidden)]
 #[cfg(not(CONFIG_BUG))]
 macro_rules! warn_flags {
-    ($file:expr, $flags:expr) => {};
+    ($file:expr, $flags:expr) => {
+        if false {
+            _ = $flags;
+        }
+    };
 }
 
 #[doc(hidden)]

base-commit: 880c43b185ca52239e75bc546cc4f4d9154d0fed
-- 
2.43.0

