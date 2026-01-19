Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAD9223DC6
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 23:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768864690; cv=none; b=gH8cJxBVjyj5b2OPuumJoxg/Q+zEIQI68C0OB6PXVwDwjzzI3dvREeyZ7mlriTM3IqdMF8EKJonplUkJaDIvvSCq55r3twiZtrBrfy3FDwmqPLbE9LAGmSxVpJi1yRjb3vn1r/VpzvydBy+fxT6HiAtxu3NlbUFzwsVGX4RpFWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768864690; c=relaxed/simple;
	bh=UFsW+3QstYle9EL8oUhryRjH3Z3m5Wo+zoFWZ2rir1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p1KFJP3OXbG9z4iLCDmJMorzJ6DVsbJF7mXhtKOfeJHLdnkiM2kcqxXKo/1S1JWvDASNR6blUdPr/JhlWjyGihS9iYfIpQ9w3e4fvN3xzWPOM+ig3oFc8TGFkqSvR0fsA0cpCKEYHE9agoLRdmVMU8NIlwiCZY4BrjTBlXKINtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HC86NSEm; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HC86NSEm"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81f4dfa82edso2183551b3a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 15:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768864688; x=1769469488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D6rRnhez30W1Rc7Z2ray7t5ypQzPa6PPD3vc6bfwWmw=;
        b=HC86NSEmz3xxTjhP/g+Xcm/DmGdhm6QPlGguwJrL7MsIzt6uiRDdhMSqTG+5wJR7Py
         GHsk+V10gXfGd2/cq+SsUSnjS1Ro64sIMCQjNo+7B+kCtnstASddEoMwTUj/GkTVPTT7
         jKLnhBl11JzH9muTDUDTCTHJmpgv4asO9VzB/lkHlDXZdDb0gtZLtmBQ1jIGSxLhmV7o
         KbddG8ziN9o57Agw4l9rfflClDvgSwEIGzz354xt6Fzt8/el1mRF6INimnheN0Q/QvMt
         vFaQ7ZsjkWL56gugmn/UrzSw6HDIW3e9D/q/FxdeWUDcbdEJn/BLxvuw6g6mIxDTkEWT
         hDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768864688; x=1769469488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6rRnhez30W1Rc7Z2ray7t5ypQzPa6PPD3vc6bfwWmw=;
        b=NlYJI9CYqldQtKzAx5UabvhAiTq6ve68tKmZVdgj5fr9Fd+oU879XyWCFD4GwF6u/O
         4aYmUMNIOLdkqbPJU/lPJfmkja/mEkat9mnS9ATUjbuAOJ3B5br7lfKE+YdOS8rhoz/6
         4wlyd3Phf6CsMRR1wNCJolgMZpJ250dHnTRsCLe9CNX9q//v1LA6C49MqVrJXnyOplnG
         a8a2TwjInysDs3Qlq3R25joutFhfMlzwEMhrEfk3CXJzo78TmkSevuQf3Gq/CHGGS0dZ
         M0s2lvK3M28oNef/NNNk7sWf3JPGotwOy4WigVixI/LzyzsRG+7sBcn7BBz+pHrF1md4
         vVXw==
X-Forwarded-Encrypted: i=1; AJvYcCWKATFi0FdztwlBowKsVVFosJ61HQUfQIEwTgcI4ZuXyMX1Yw2OzPU+5tEntC/TdKLPE8+7rgQ0AIL3djrjww==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjsp3Lki0CFNKUkYoKYTu//X9gELcTnwiRZBuAcSNWHcX9CrYj
	GZocA/2KC/jWegqoEZ2eWOmgggTaOEyCbT/s7MbE9Ae4a3yUUGVkhKM8
X-Gm-Gg: AY/fxX7b41aYVbWFE7Sg2KYkQSmK/9VuZP3s4pqTpAOzvdYfuyOEM73H+5n/0kHNOTZ
	bSylwnEMyRqNIAyjLfdX5ElT2TCtPlBT4gD2I6YbUwZ/kCPakYgUQVZaz9gR42nEVBK/xHpLN/+
	iiapV3ov3Ixl3nkP1BwVojmGFiABU400IJ82RUT6dJ9xx8EtQG8DvTIgj+KIhNeeX6vTqReCQYK
	VTEyvdR6vqsPLNyt/qguRKL+vVpPZ0CLR00mG3acp6kkpkKha8w/1yNksVW1MIJcJ2Tfk4k9V+t
	3fHFC5OZO2926TjUuOnVqxJxEd2snU+OkeBAtyHtXof/7jxBQviyHgNakoU4p8QtQlbJczG8yhF
	72Z5fovhFwahjcXZGDYnrTZkntwkVqvju0vhoA3keUbuOBXYXozbLGN9Vph+/3OftmNFgrsdRoX
	k4ksk2/c/NZOREVC1/vrglayBfJuq75o5nxqyEr/kiRZyatyrIWg51T6EQz0g8v870OcFOPSed
X-Received: by 2002:a05:6a00:181e:b0:81f:4ce8:d64b with SMTP id d2e1a72fcca58-81fa182748cmr10994588b3a.44.1768864688245;
        Mon, 19 Jan 2026 15:18:08 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa1292034sm7848409b3a.56.2026.01.19.15.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 15:18:07 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: aliceryhl@google.com,
	boqun.feng@gmail.com
Cc: ojeda@kernel.org,
	a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1] rust: list: Use AtomicFlag in AtomicTracker
Date: Tue, 20 Jan 2026 08:17:57 +0900
Message-ID: <20260119231757.3460885-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Make AtomicTracker use AtomicFlag instead of Atomic<bool> to avoid
slow byte-sized RMWs on architectures that don't support them.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/list/arc.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index 2282f33913ee..3296726e07d9 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -6,7 +6,7 @@
 
 use crate::alloc::{AllocError, Flags};
 use crate::prelude::*;
-use crate::sync::atomic::{ordering, Atomic};
+use crate::sync::atomic::{ordering, AtomicFlag};
 use crate::sync::{Arc, ArcBorrow, UniqueArc};
 use core::marker::PhantomPinned;
 use core::ops::Deref;
@@ -469,7 +469,7 @@ impl<T, U, const ID: u64> core::ops::DispatchFromDyn<ListArc<U, ID>> for ListArc
 /// If the boolean is `false`, then there is no [`ListArc`] for this value.
 #[repr(transparent)]
 pub struct AtomicTracker<const ID: u64 = 0> {
-    inner: Atomic<bool>,
+    inner: AtomicFlag,
     // This value needs to be pinned to justify the INVARIANT: comment in `AtomicTracker::new`.
     _pin: PhantomPinned,
 }
@@ -480,12 +480,12 @@ pub fn new() -> impl PinInit<Self> {
         // INVARIANT: Pin-init initializers can't be used on an existing `Arc`, so this value will
         // not be constructed in an `Arc` that already has a `ListArc`.
         Self {
-            inner: Atomic::new(false),
+            inner: AtomicFlag::new(false),
             _pin: PhantomPinned,
         }
     }
 
-    fn project_inner(self: Pin<&mut Self>) -> &mut Atomic<bool> {
+    fn project_inner(self: Pin<&mut Self>) -> &mut AtomicFlag {
         // SAFETY: The `inner` field is not structurally pinned, so we may obtain a mutable
         // reference to it even if we only have a pinned reference to `self`.
         unsafe { &mut Pin::into_inner_unchecked(self).inner }
@@ -495,7 +495,7 @@ fn project_inner(self: Pin<&mut Self>) -> &mut Atomic<bool> {
 impl<const ID: u64> ListArcSafe<ID> for AtomicTracker<ID> {
     unsafe fn on_create_list_arc_from_unique(self: Pin<&mut Self>) {
         // INVARIANT: We just created a ListArc, so the boolean should be true.
-        *self.project_inner().get_mut() = true;
+        self.project_inner().store(true, ordering::Relaxed);
     }
 
     unsafe fn on_drop_list_arc(&self) {

base-commit: 47f079b9ac97c4b0c673bbbf57245952e9edf8a2
-- 
2.43.0

