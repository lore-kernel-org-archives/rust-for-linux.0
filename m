Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5345C757EA
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 01:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767836076; cv=none; b=aJG/SMXlX6ihqvjPOWI0Yg0durGqGMSB0EWxm3mzJpPQs+XmdIXjqEznvzOTAflaqY6ITSpHvct/BiIDWz1haBEA4TO6N/ckiJpX5NtAeAGhJP6kbj3C9SZfKbK8HuZ8fuyEAvgdPaIbqx9zJPixzUFA7fJIF3nLiiJXUWdnZug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767836076; c=relaxed/simple;
	bh=IxAH2v6B1ZoFcW6Mz3a/u8xBWMEfF9uosZ7PA6GEdzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PEaT3PuADLM1MwB6lplbLXOUlRO18C3TWmgX/L3/tx24o3apLZsGbq58h0zfC7ORdSariHIAI42CkLTOrqiri8M7l/7I6enD6RaKXQWoJ7pnoPfM9+97p2m216sde72GoSWd4Wmkr0b3D8xZAq/GXB/1E9Dj0LQCOqpSOESZYHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCJL7gdx; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCJL7gdx"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a09d981507so11770555ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 17:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767836074; x=1768440874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+fI6Q8zGsqR2d61/DSNy+MNmPUvZPSqvj5cbqbjP84Q=;
        b=MCJL7gdx5qmJUHuwtsW1aXt0ePLxNVLi8t5DEQfIfG87tdtgiHZnOcsmRkRPmFI8IU
         U7iK8nHGufdSR1yh0GNJezgugR5fcoA8QqOS6MuOVJc1UHxqHpQSWRgcdKCSK8v3i8bP
         lJWSLYx1k3TJWT8tGzYFYfk88v/e2Nt1ZMRLy0uxmwzSz3gJ+B71bIVvnkSDotuPj9JX
         KerVpXiVZDyCGPTf7wZmemrjOpf9gIcxw6SD2HHcXNCwY1f8IdtbUCvdQMiz3yAbuo5a
         RUCqLvfuo/b8sAPbdm1mzmIgAvhsBst4ykPZvdxVlLTKYwwxFiU4GivxCCUfoAIi3UBD
         Ua0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767836074; x=1768440874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fI6Q8zGsqR2d61/DSNy+MNmPUvZPSqvj5cbqbjP84Q=;
        b=QbCiStgCkiU8TCvHLmtvqdidmc+RAxLyhzHrSqIGEESCOS4X2Oq4O7PZrnLlPtV82U
         aXufCIN7uEEUWUEHx7qvNrhuYnzaf+Hnnu6reAGjP6XO3QoiDy1+zzNNLdiO4ZJSCCu8
         JG8oTm82Lg2ltDR/POu7sjozmmjiELZ+elWvBH5EA19s1p4Yn7+n4o2rMXhlhhlps+sl
         1bznUDeWOgzdusYlMYHIuv2IxNNPhMSqjve5DqoO3g1M5eTs3d/ycSvd5vdvf9y91r7g
         m0vt6RU2zr6bzKCm7/zYjjREPjeUWRYiqp33FXT2TpaX8doE5fYixhxv7I2BWfRT6iXz
         6QvA==
X-Forwarded-Encrypted: i=1; AJvYcCWt78wUJGHpj/ojzBA6ce7kwstqUHrqyyf4DrIqIZptIshwReyzc1m3AgsKLGoGQcAHhAp9yCJrafEz/5M9Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56Sfjrt3Qm9xG6KqxpO/7/uoFlsbWYcN6jcZ+HpE3xSMkU7yf
	GhegEx/MssmqvmWw3xYLQoidUAOP0vibAbmCTLUcjxXLYmkn+EixW/fY
X-Gm-Gg: AY/fxX4TVuXczgOkizAQmW3rR9KlrFy8T1Nr0pUuX0eBARZfDjZGI4oMo2SDzqBBI0b
	0o91KPWx1BGIn/mkjlDH3gOtyDWVTsg6McOoEutqkBBSJW4rOpcMhLzIjWmU4hW+Hefxe/3PuZm
	1rGioDcpYRGhVV4ODgPvC9kpnCLK6uGwLZ5ZFlxSpFcxEUnmWf9StcXoFtS/VtJn+Y9WcV/pWK8
	ggYYmV9mY/vFifqlwnZd+SLf3cVTNhZ+pUoHiULTUUcmrjGjmWWT6reoCitX3thJTJ0dKAa9dpy
	hVfeDrwaFLo+8+i6Jb7iFcGMtIb+UeE1tCwj8/1EHkFmjUgo0dvOcZu3+0ci9F17SQFMS5hxP3g
	2Xn9UqZGfWbux8n+GACjhv2GHu9H3bTPsc8+6A6rNI0exLGunxOObmjdM9RPcpIXZWfJp9fbReL
	K5cT2VzdqTVa8WE3W8Kli6YyJz1EvcIvaLa3B4QyAbWeJFNQohZnlwZpqgWkmdhQ==
X-Google-Smtp-Source: AGHT+IEmbvtBizdz/cTSY/Fu9PlFmnmG0oIqRB5lMr3DSL8SHcM50gGQ4//BCrqd+Wy5N5ThkBlakw==
X-Received: by 2002:a17:902:ec85:b0:2a0:a05d:d4a2 with SMTP id d9443c01a7336-2a3e39e5c4amr75845365ad.23.1767836074451;
        Wed, 07 Jan 2026 17:34:34 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88c2sm60957665ad.79.2026.01.07.17.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 17:34:34 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2] rust: bug: Support DEBUG_BUGVERBOSE_DETAILED option
Date: Thu,  8 Jan 2026 10:33:50 +0900
Message-ID: <20260108013350.2880613-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Make warn_on() support DEBUG_BUGVERBOSE_DETAILED option, which was
introduced by the commit aec58b48517c ("bugs/core: Extend
__WARN_FLAGS() with the 'cond_str' parameter").

When the option is enabled, WARN splats now show the evaluated
warn_on() condition alongside the file path, e.g.:

------------[ cut here ]------------
WARNING: [val == 1] linux/samples/rust/rust_minimal.rs:27 at _RNvXCsk7t4azzUqHP_12rust_minimalNtB2_11RustMinimalNtCs8pcx3n4
Modules linked in: rust_minimal(+)

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v2:
- make warn_flags! convert the passed file string to bytes
v1: https://lore.kernel.org/rust-for-linux/20251204223405.454920-1-fujita.tomonori@gmail.com/

 rust/kernel/bug.rs | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index 36aef43e5ebe..ed943960f851 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -11,9 +11,9 @@
 #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
 #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
 macro_rules! warn_flags {
-    ($flags:expr) => {
+    ($file:expr, $flags:expr) => {
         const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
-        const _FILE: &[u8] = file!().as_bytes();
+        const _FILE: &[u8] = $file.as_bytes();
         // Plus one for null-terminator.
         static FILE: [u8; _FILE.len() + 1] = {
             let mut bytes = [0; _FILE.len() + 1];
@@ -50,7 +50,7 @@ macro_rules! warn_flags {
 #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
 #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
 macro_rules! warn_flags {
-    ($flags:expr) => {
+    ($file:expr, $flags:expr) => {
         const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
 
         // SAFETY:
@@ -75,7 +75,7 @@ macro_rules! warn_flags {
 #[doc(hidden)]
 #[cfg(all(CONFIG_BUG, CONFIG_UML))]
 macro_rules! warn_flags {
-    ($flags:expr) => {
+    ($file:expr, $flags:expr) => {
         // SAFETY: It is always safe to call `warn_slowpath_fmt()`
         // with a valid null-terminated string.
         unsafe {
@@ -93,7 +93,7 @@ macro_rules! warn_flags {
 #[doc(hidden)]
 #[cfg(all(CONFIG_BUG, any(CONFIG_LOONGARCH, CONFIG_ARM)))]
 macro_rules! warn_flags {
-    ($flags:expr) => {
+    ($file:expr, $flags:expr) => {
         // SAFETY: It is always safe to call `WARN_ON()`.
         unsafe { $crate::bindings::WARN_ON(true) }
     };
@@ -103,7 +103,7 @@ macro_rules! warn_flags {
 #[doc(hidden)]
 #[cfg(not(CONFIG_BUG))]
 macro_rules! warn_flags {
-    ($flags:expr) => {};
+    ($file:expr, $flags:expr) => {};
 }
 
 #[doc(hidden)]
@@ -116,10 +116,16 @@ pub const fn bugflag_taint(value: u32) -> u32 {
 macro_rules! warn_on {
     ($cond:expr) => {{
         let cond = $cond;
+
+        #[cfg(CONFIG_DEBUG_BUGVERBOSE_DETAILED)]
+        const _COND_STR: &str = concat!("[", stringify!($cond), "] ", file!());
+        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE_DETAILED))]
+        const _COND_STR: &str = file!();
+
         if cond {
             const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
 
-            $crate::warn_flags!(WARN_ON_FLAGS);
+            $crate::warn_flags!(_COND_STR, WARN_ON_FLAGS);
         }
         cond
     }};

base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
-- 
2.43.0

