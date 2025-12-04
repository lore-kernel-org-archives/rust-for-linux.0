Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0485019F40B
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 22:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764887680; cv=none; b=YVtdkAwVbmIPe9HgeJhm7l4zVSKucG8S1UYLxLX0vtOnI59F9FhNPPcKOKdl0qG10ME7uwIX4HiyzDwCuEXdQum1KRCxzxvor39uvBDuQE1ugki5GM7Vh+0n/5UesvxLvMsRw4Rgzz62cI3OlP5MsDfbTl1iCN6ONV1qBoaMpQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764887680; c=relaxed/simple;
	bh=72LnbM7KCZ/oGfeHqtTQMvOwjq/SndxTUhSqJiyCq50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ImW2Y9FPlRy0wc0fDb/FofODzv4JbGIw75uwhkZbBIDya5kpCgIBkH/MCmO8L7Q62ehU8mOS7dlzsIcfGMtyWikYQ2GzKBztEYAbLrA7ASwYPED8CT7+otCDS2D/jHLnkMBkEsojbl4F8RckA98frhKXuYx4KUNa12Ro3w+M7O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAKxzdh6; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAKxzdh6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-298287a26c3so18543765ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 14:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764887678; x=1765492478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YC/LG1hcVvWIm1a7VD+kVpIwg64WK68Yo/CpiarV5ok=;
        b=cAKxzdh6R9Xd/uL8oEN5+EPOJbhlAWnnG+ObPHxoC7AV2KZBYGYZhbJZEDMdzkE1Xp
         Z8I7/rQrDOh2cG41BSqlVq3Thc17ixqdJdUdZCEyocPa4xSR9RTQcAD9GDhuj7aOxFaF
         6D4M51lLe8zXCmZmm7FsoWztM0vKKogOncaXPv1gQGQbFlLai+VBW1YavJQSL/ACZkqe
         DjDOmoAE66PpAA9MpsCFY6qTbTeAn9vQ7fJz5vCy9EEs8GYQ5eeRrnWi4RWs3xvgpmKl
         h0FsARWuXMuIwozJAQcfn8YxCQxhAv5B7ld5hH6AUz5y5mmsf628c6D9YOY3FXI5eBKH
         4FFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764887678; x=1765492478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YC/LG1hcVvWIm1a7VD+kVpIwg64WK68Yo/CpiarV5ok=;
        b=g7PtKe6wO2wZo9kzk5/j6oe8tiMAAonhNL/QAqoD0Di/cdzT/FE+tFszPrbmDqd9gs
         iYg02F26HM4Ivvr1bxm/zpOMweE1F2nU0zEsY3CfrhiEKwb8zPaVIUAgpycTYzLoHVuy
         cEdFsntOXpLCneRqTHGiwBHhX4ljX6hnqHlGcFGfnTFMtLciIG0TfjZo3l11C7PdKl/P
         rXEWTEF21uEU4w5gTCdcpw5OH2vsyzn9ZSg/rTYwhXurVIf/vWDBqEtek9Qvoyt84F9B
         Qif/Al8Lt+8G0j7NixvuZpEaipGa2CoUcBimU9IDaW1fue5kM0PslNt8r2wMeA6+sxOK
         tSOg==
X-Forwarded-Encrypted: i=1; AJvYcCVG9XzOu8n8AMVz1qnvAAp0DlEi0JVm7MQ4KppGKjKCGp7OqVoEjzmwVlw2ASrFmE8Mc2MkVz2/EGgwrdNsXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv73uTCwrmJindq9dioDtdfh6oh/Yh0GXxQ15fnhigX9QZK2NU
	sdn1HgtKV8TODhKQ3jT3J1iquthzijIruExJ7RoQxzAjLE2cC4S0KanK5Wenqg==
X-Gm-Gg: ASbGncurO76Svzqi+7XMNcOA5CsQQNtgg9pQSThNlvdNdMdgdeXlTFLWU08NcLeh4VH
	BPphiwNX58LS83AnZM0HuHbhVMy4GIbF89+sLocFwHNghsS9kjNBoDMiAbnIjOn8fD3Ky4v88Wz
	WIjvqdIcwOzGdajrBpSaBeWNj9fwLWQep+m5px1Hr84MgAozv3EF++sYS8v0rckk/Qo+5KnO4Op
	jXO/WFEunlYOp67uR2DEc3MQ4nDFPzXuYKX0qROmW4pJjxPe5b+ZaimwtbK9gMLAFE+VLWv4SH5
	j5xrrL9rbULqkT8JaDAWjEV0a2AmEYTKpPsD3cF0OP2mSdKo8gBkbWf0KvG51PVZ0IKngQ5cwme
	q2Ak4z02KZja6DgST/lHJiVWMn+UY94EV2DD8YMvLk4S9wX3ytGiMKSOG13FgLArLfWlhkMuwgG
	Fp95vCcx5XfRIS4qfCLRQaGpx1f0nWG/fhhRW79cc7llHs2EtJjkRMHaJtdww=
X-Google-Smtp-Source: AGHT+IE4xMONVAij6hUD7/dHadBsZtoNV1WFGDYQBThHNsUBEiIZnsTE3jgXcVNy1z9jjS8Mh6ykFg==
X-Received: by 2002:a17:902:d043:b0:299:e215:f61e with SMTP id d9443c01a7336-29d68413ec6mr60570835ad.36.1764887678168;
        Thu, 04 Dec 2025 14:34:38 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabf7csm28785345ad.79.2025.12.04.14.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 14:34:37 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v1] rust: bug: Support DEBUG_BUGVERBOSE_DETAILED option
Date: Fri,  5 Dec 2025 07:34:05 +0900
Message-ID: <20251204223405.454920-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make warn_on() support DEBUG_BUGVERBOSE_DETAILED option, which was
introduced by the commit aec58b48517c ("bugs/core: Extend
__WARN_FLAGS() with the 'cond_str' parameter").

When the option is enabled, WARN splats now show the evaluated
warn_on() condition alongside the file path, e.g.:

------------[ cut here ]------------
WARNING: [val == 1] /linux/samples/rust/rust_minimal.rs:27 at _RNvXCsk7t4azzUqHP_12rust_minimalNtB2_11RustMinimalNtCs8pcx3n4
Modules linked in: rust_minimal(+)

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/bug.rs | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index 36aef43e5ebe..a60db1ef4b48 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -11,15 +11,14 @@
 #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
 #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
 macro_rules! warn_flags {
-    ($flags:expr) => {
+    ($file:expr, $flags:expr) => {
         const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
-        const _FILE: &[u8] = file!().as_bytes();
         // Plus one for null-terminator.
-        static FILE: [u8; _FILE.len() + 1] = {
-            let mut bytes = [0; _FILE.len() + 1];
+        static FILE: [u8; $file.len() + 1] = {
+            let mut bytes = [0; $file.len() + 1];
             let mut i = 0;
-            while i < _FILE.len() {
-                bytes[i] = _FILE[i];
+            while i < $file.len() {
+                bytes[i] = $file[i];
                 i += 1;
             }
             bytes
@@ -50,7 +49,7 @@ macro_rules! warn_flags {
 #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
 #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
 macro_rules! warn_flags {
-    ($flags:expr) => {
+    ($file:expr, $flags:expr) => {
         const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
 
         // SAFETY:
@@ -75,7 +74,7 @@ macro_rules! warn_flags {
 #[doc(hidden)]
 #[cfg(all(CONFIG_BUG, CONFIG_UML))]
 macro_rules! warn_flags {
-    ($flags:expr) => {
+    ($file:expr, $flags:expr) => {
         // SAFETY: It is always safe to call `warn_slowpath_fmt()`
         // with a valid null-terminated string.
         unsafe {
@@ -93,7 +92,7 @@ macro_rules! warn_flags {
 #[doc(hidden)]
 #[cfg(all(CONFIG_BUG, any(CONFIG_LOONGARCH, CONFIG_ARM)))]
 macro_rules! warn_flags {
-    ($flags:expr) => {
+    ($file:expr, $flags:expr) => {
         // SAFETY: It is always safe to call `WARN_ON()`.
         unsafe { $crate::bindings::WARN_ON(true) }
     };
@@ -103,7 +102,7 @@ macro_rules! warn_flags {
 #[doc(hidden)]
 #[cfg(not(CONFIG_BUG))]
 macro_rules! warn_flags {
-    ($flags:expr) => {};
+    ($file:expr, $flags:expr) => {};
 }
 
 #[doc(hidden)]
@@ -116,10 +115,16 @@ pub const fn bugflag_taint(value: u32) -> u32 {
 macro_rules! warn_on {
     ($cond:expr) => {{
         let cond = $cond;
+
+        #[cfg(CONFIG_DEBUG_BUGVERBOSE_DETAILED)]
+        const _COND_STR: &[u8] = concat!("[", stringify!($cond), "] ", file!()).as_bytes();
+        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE_DETAILED))]
+        const _COND_STR: &[u8] = file!().as_bytes();
+
         if cond {
             const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
 
-            $crate::warn_flags!(WARN_ON_FLAGS);
+            $crate::warn_flags!(_COND_STR, WARN_ON_FLAGS);
         }
         cond
     }};

base-commit: 500920fa76819b4909a32081e153bce80ce74824
-- 
2.43.0

