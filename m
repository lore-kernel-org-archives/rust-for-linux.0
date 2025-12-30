Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6458E27FD49
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 09:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767087488; cv=none; b=hSY0UMAM4vS3tD8rYho0l0Rw8Qa3prekzlc2wpLZDOOySb1eHj8kFnLo5WK2inXJ35+NE1hy6gnu5wkMY3pTNeh4cuu8GIADVXWYVdECq8wQU5ZHOgO+KTfppSyoEtMflTMtpCg/E5tECwTSglp/vfnLnifN/rvryfV289jDI1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767087488; c=relaxed/simple;
	bh=13OOPGyQesIt0YZYsNxKVmBfzbJq3xrAI2Eati6oIYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qq8xByMEdnzBWaUibih4UsalOG5Ow6bLQUO1voeyHajjwzukSX6TZamz8qEOdS/imPzDAA9OqdQ6A2FWmPzlVgH+M/0/h48zKan3Aj1eRRPLf+bBdYzV5i+tY9YNs0OLohLusM+KjD4r+4G91rO0u4+3vQ1/Fc85Oue1d8kzBxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwIojAcM; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwIojAcM"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bbf2c3eccc9so3597283a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 01:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767087484; x=1767692284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ekqd71xyK9uXVDJwPsIe1nExAvKQrkA6oo38oCpBiY=;
        b=dwIojAcMkRMH3nC52p17qO0kdxlnV78OrfXrUM1XISyN/w/BoW6hLcAde89eoORU9X
         3N7ZjvXLt+T8BTDJwReBA2nC2+4TTPFUXqvPigB6gMXO3BwGui4SV5FdB9I8N/AnWp1y
         XgCj3AC8/RCN8PT/JQ/X6YsHVSvkWqAQqfLlP66tuDsoIGeJqBwID5hR7I6RsRKr6WAs
         2boSxIR5z2mqXfYEnyyqNiInR47XxhAJVbWlpr1aSpcJ3wq3y13YDBb8E9e2DbPEhxLu
         Z1BNYapnKgHrpC3hVHzoJsg0i49zJaJSo8sdGoj6nqokAfHi71MnChoS5aP4vsz3MWsq
         NpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767087484; x=1767692284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Ekqd71xyK9uXVDJwPsIe1nExAvKQrkA6oo38oCpBiY=;
        b=fDfXiKR7qwhQ+4IIeWiI8CmFRb78lVjRLFgvZ6+7JsDS+sUs14hJHQwkLVv6TSgmM6
         yGmUSazE4opZ+4XZ5y0Sznx2DPOgWCd8hABVLQkByMzBHeS6Ei/m5vgF8//8/Z5A9Yjf
         1vreh5sS4HDu8UR5+VYpfZ3ycey6uM4/YtS75l0p6ce/RQd9oBjOddXz9qWlht1QSiBY
         2o3CYSQYpPDhun8Ccau8YBG4hveVHZzgoczXfgvNqDFZ4RsbT1effSWfsmTIL9LNtfWn
         3M6Ue8TUoNlzFIOyE2tO7Z2hDW02T5zpr7sq8DT/G/ul2W2vQZ3d6E7B1YcBMNLqZOFN
         96WA==
X-Forwarded-Encrypted: i=1; AJvYcCX1WrILbFFX0GqIKbuDUzKJV+FKWw3Iwfh40MmMWrEkTTi82Z2yK093cKNyqy8C1NXo77QI1ES+Ff7ieRQM8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgHyYGDKkbJ6A0m99Pkuaq634WBe/IdspI5VDbTaB2g96RhjSN
	gcIJe+xpdWeSNsnkIYaPzVMtrq7FYiyHf/s9TJZZFgEGDf+ISEegmLAg
X-Gm-Gg: AY/fxX7MmvIBZjxzdmQ20q/V9ruLxcTzG+v81MRKbVz0a/RiPaALAh6zTv66uw/AyrE
	zUTOx0Yis8EKSgH9H2VeMc+IoC1Z8xv812tgBDDeZ5wVMBQtqZSNYJWids/kSPdXWM8Ts/h+vbS
	EGOZnofWkSXE/sUwale5iWLsZZHLCgYaGwHzu8aIj6h0wJa1fF30Yzqo2qOvZNZ4BtkXYvpvqYg
	9laQ4wJJrwQHD2qUi4i2ZOPPOvd9giryEF3y5UWlA/Dkb9zuNDkIBKuPSUGxKQklkoWlLhj836G
	9WLJhg0JElgHzn2VEYN51ak50copvf4d9K72B3L7hCKSCflSt0b42rtHJo1gxyj7QT8BSNs8brr
	u0Q6cyt0N04VKEeTPZR5SNmjhcp2/K1VMnAhwJgvbrlVEknx9Vi/mhkPqnfU4Es6gxCR1rW0ryU
	4oNaLedRpngUW5mtA+o4EcICJPxZE1B9TEOgWvcy8+2uucCBrXINcHDDyacBg9qHYoFfyCRCCJ
X-Google-Smtp-Source: AGHT+IG9WAGzkIj+gR2IWmMpEmKuRWTcN3Bn/hL/2BPJkOe8LcD21ZE+HWnF2rEPXVgkxRYMCYmy1g==
X-Received: by 2002:a17:903:2291:b0:29f:1b1f:784 with SMTP id d9443c01a7336-2a2caa9bdccmr380916705ad.4.1767087484593;
        Tue, 30 Dec 2025 01:38:04 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac1acsm13378158a91.9.2025.12.30.01.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 01:38:04 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: aliceryhl@google.com,
	arve@android.com,
	brauner@kernel.org,
	cmllamas@google.com,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com,
	boqun.feng@gmail.com
Cc: a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 1/3] rust: revocable: Switch to kernel::sync atomic primitives
Date: Tue, 30 Dec 2025 18:37:16 +0900
Message-ID: <20251230093718.1852322-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230093718.1852322-1-fujita.tomonori@gmail.com>
References: <20251230093718.1852322-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Convert uses of `AtomicBool` to `Atomic<bool>`.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/revocable.rs | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 0f4ae673256d..47cd2b45eada 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -7,12 +7,20 @@
 
 use pin_init::Wrapper;
 
-use crate::{bindings, prelude::*, sync::rcu, types::Opaque};
+use crate::{
+    bindings,
+    prelude::*,
+    sync::atomic::{
+        ordering::Relaxed,
+        Atomic, //
+    },
+    sync::rcu,
+    types::Opaque, //
+};
 use core::{
     marker::PhantomData,
     ops::Deref,
-    ptr::drop_in_place,
-    sync::atomic::{AtomicBool, Ordering},
+    ptr::drop_in_place, //
 };
 
 /// An object that can become inaccessible at runtime.
@@ -65,7 +73,7 @@
 /// ```
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
-    is_available: AtomicBool,
+    is_available: Atomic<bool>,
     #[pin]
     data: Opaque<T>,
 }
@@ -84,7 +92,7 @@ impl<T> Revocable<T> {
     /// Creates a new revocable instance of the given data.
     pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, E> {
         try_pin_init!(Self {
-            is_available: AtomicBool::new(true),
+            is_available: Atomic::new(true),
             data <- Opaque::pin_init(data),
         }? E)
     }
@@ -98,7 +106,7 @@ pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, E> {
     /// because another CPU may be waiting to complete the revocation of this object.
     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
         let guard = rcu::read_lock();
-        if self.is_available.load(Ordering::Relaxed) {
+        if self.is_available.load(Relaxed) {
             // Since `self.is_available` is true, data is initialised and has to remain valid
             // because the RCU read side lock prevents it from being dropped.
             Some(RevocableGuard::new(self.data.get(), guard))
@@ -116,7 +124,7 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
     /// allowed to sleep because another CPU may be waiting to complete the revocation of this
     /// object.
     pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
-        if self.is_available.load(Ordering::Relaxed) {
+        if self.is_available.load(Relaxed) {
             // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
             // valid because the RCU read side lock prevents it from being dropped.
             Some(unsafe { &*self.data.get() })
@@ -157,7 +165,7 @@ pub unsafe fn access(&self) -> &T {
     ///
     /// Callers must ensure that there are no more concurrent users of the revocable object.
     unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
-        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+        let revoke = self.is_available.xchg(false, Relaxed);
 
         if revoke {
             if SYNC {
-- 
2.43.0

