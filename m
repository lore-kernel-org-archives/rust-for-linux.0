Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0AD2343BE
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 08:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769415033; cv=none; b=rLO6z1YGd71xFdm828SeevZT79lveJDpnQGU5l2MNW6epy+43yXn/WWIfOXWbfepwQPVvRhP0yY2xIVsGbBdZy3jWirfMRgNGbPJVWo2cBlwZPpCYtlKLToSjyui/7uD1tYks2HtRI6bqhTDdPB70FR5vA3OCPA3I0bAC1UszcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769415033; c=relaxed/simple;
	bh=R5EBGRnmK3ONp+jT0IGjHYx3veAq/WjXxzxTUJN0XN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g1AD7Al/I2n3z4Wna8ah1rcdXYTFYmfo7qCyjIIjhXyCw7DG141CqZkqEZ0CVcQuOStdnnumR03OnLgcSFTf66b4q0oQQ7fW2KF1JJb3oQvU/uLQKd4vWG8bi9XliSl45QDITSwP2QzOCdEVjusenyViITsvwA8kjglfdFFtDNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUNfZRRH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUNfZRRH"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a1388cdac3so32260495ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 00:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769415032; x=1770019832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCVx/+4onon5Rps8ewPMIbOZ9VlOYp8bAF5YtERJrMM=;
        b=aUNfZRRHRK+2u4hGcNtQiOTc2+3Oi7PyGoJisOhs0SHV57oiNqa+BctspriTnMKWfl
         1HfxUCTfnbSM3cPH9s9LqU/okQlPVuu+cYfgyvX7kYWesOt1WtNiyeWaTT49dRGbjO5l
         YdMSYk2Cc95vv8XSyyKh8Yxp/L+a7AhJFGCFhQLBi/0K+hTkJnEp+wxlJItSuRMI82q+
         nGr8DXVqWA+Xu3tphPf+QGvrdsN+0InbPA3VoZp1rrzpRwWOOFsx5fEAemhWa09RhDk4
         RuAi+Fn31PjSD1ynXw7J6TuCw/peWG330OlAqxU8wWWJncgtwNLv/cR4Kbs0G1JNPz9p
         i9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769415032; x=1770019832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DCVx/+4onon5Rps8ewPMIbOZ9VlOYp8bAF5YtERJrMM=;
        b=dyu5YS13ZKj5mBkqWle8B8tRqPoHyPEaN9SP/1xvwdVfUkCn/g+rgq+Ye0lMSE66w4
         o4fR0KkWCzVaMqQeQxmTswRDzOaXuJ47CY0kdZ0OX3jTr506qy6ogHivIsjgO9d+lYe3
         yvQLEf3ISJc/6IEAALeqm0td4Bgto7uKYDa4SMiHSyAuJDFkLaKas7Qh7Q9i0u1EPtUz
         +5CdLcqK0KyKnwcVc2e9EIs68ZxCrwnaiqphKE+RHb3BysDl+EfFmbutKWG2D+XDj/2e
         +d5h6cKKVKp9vQ4H4pr48rdivadMVby6qfJf7jKdDTw8cc0rpIcJCmZreRQVNEEWA/cF
         mBAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyL978XbrAZl3SJ/blI1O0wUX/s3xQ/LMtpZ72+WHYP9jPR9b93wb8h83XtA66KZCeyVRHf+xuIZk4+1vlpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz97tlNczFz3XNpbM/Lly0frctvNOo7Yzj9PMeFt35CD9RfwyK
	3uzjwm2I2SLrUfQnzuFtZNucJucobfLvvPj34JMG4xXMSByeD5/MvlK8
X-Gm-Gg: AZuq6aKMLXgv7eshcHvh6x6S3lIQQ+ylG6K+Nd1rTvPyc2daMquA8KWgh5K/uExwCRy
	L3OhmKIEel6PGC8IuhHrV6uFQqQMb27KUuoXkMlL4YSMZYCW4dN2Z/jFHsW9ADCpV0Z/VdmWvLw
	MSxgffMAUzzDfeF2BVvry0jfEHrx2LD6rMSBqObYbTzpy3wtOZjtOkc0ioslBomfPPJwWgMnAqZ
	rq7ZJC9A5XSvN3EQj4ccfS3aokOptX9NufRoeE/S2bfLGn0VQHulnrtM8LXmyKE//kacT/SUL2M
	t3TWQKvshiC1ONnvdTTByrcshqQZK5ZonhZDMDnfdIEO8+Mh2bKVFaVj3f29093BQBc6me37qg5
	btK5+2At39lFTc8UKXlzVbj+34axmZe9W2INpw/jGMw7daoNWbSAqMboU4xqFmlTaZ/l23v/YLg
	L00/dOyTEg1XNwTMWGhgCXi8pik3ING+3/AtIgfy5kF9df9HaM5QjuOIx8E0qUVA==
X-Received: by 2002:a17:902:dacc:b0:2a0:9e9d:e8cf with SMTP id d9443c01a7336-2a845332006mr34093295ad.57.1769415031770;
        Mon, 26 Jan 2026 00:10:31 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978c7sm83498565ad.65.2026.01.26.00.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 00:10:31 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org,
	gary@garyguo.net,
	aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 2/2] rust: list: Use AtomicFlag in AtomicTracker
Date: Mon, 26 Jan 2026 17:10:13 +0900
Message-ID: <20260126081013.3616346-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126081013.3616346-1-fujita.tomonori@gmail.com>
References: <20260126081013.3616346-1-fujita.tomonori@gmail.com>
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
 rust/kernel/list/arc.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index 2282f33913ee..5e84f500a3fe 100644
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
-- 
2.43.0

