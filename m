Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283B2471434
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 16:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860130; cv=none; b=iHKIhIv3S49Sa3g/AtQXUOk5qrM9R697nIQ72Me2jgxNP8yXzU1OUpZGhvfrdlYPP5D6kwwwWhbDEpv6pbtHvhktYYLekC2K1XTi/mESBPx4TEZIm6jzFP7Chjzg3P0pBg4ViRNgBOWXugWtJq8Dq2R/Z/1DB4AWr0WF4H6cpRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860130; c=relaxed/simple;
	bh=1B574WZxr85tEXgvJ/lsuCd24hw6r0EvD8jaMRrm6yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAs09fBe046uEE9WnfV/GzJRSQ/ePVJZSPuZCgpTFxtCLJi6+wr++RoFOEjHE24e932KiT71baQ/IYoaa4lyR8m2M2NttX9ZMuyQ2ps8kf+/+kzXHJcdDZjY6kEqkQcoolbglPzuu+4k21p2kldrwVHJZc8EdHP/rh2q7t/REXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5pJ+ckn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5pJ+ckn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00E31F00AC4;
	Tue,  4 Aug 2026 16:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860121;
	bh=Ehxr5VUxk0jCrAQvRW8oaPBfKD8Ta2YHENyPPAE1YHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k5pJ+cknPV9guqpPjGzLh1qVLzyCz9aJ4bRQXRfhzZlJKC1whKvxDZmkadHvZ6Vw5
	 7lIIgNZ1W11597tOYdqA9sUoibfcX9dhRLWnrRZAJlpkGYQMfxJYvWelHZbq72D9hf
	 tvXvMw7M7lIAZY0U+mFaY0kklFp64Q9crJw25/R7XDSxQkJ5zEjPqjzr5H2PEdJKsr
	 BkylBhHbic9cr0lFnEZdEPmq00SyoBq7R6pBj6S9gSE5pHeJSyT6/g2G7h7ZUxi4ed
	 6Su8oJnUKUVMbqoJt+ZFSrFLHupM7c4ieZz74R5h19ve7+8Pf2p/NPoQuk0nxo4MKQ
	 bw/mUtm34D5kw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id ECC1BF40066;
	Tue,  4 Aug 2026 12:15:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 04 Aug 2026 12:15:19 -0400
X-ME-Sender: <xms:FxByaiwMZFfKFg_6Ptie1CcmkMvbWRQNN5DxZ-iWTh_PbXAicL6ppw>
    <xme:FxByajf-mKkThv8pH3RAulD-1z8JKqtRSAJoMvZxFBwt78ylq6fJPg2UyUMyS5zuP
    4W-GqyY12GV979G7hCvzZABJkyFMNgSc8hlyozXn4FUx0kSbPX0>
X-ME-Received: <xmr:FxByansvqNbDrbZtfMrxgBEtLSJucFXnKC4a3KAqBoqDVl6nYZ5QZEabjTATcfyGbAJaGoytBAQfF0jy2XNUG0vA1sHzOYck>
X-ME-Proxy-Cause: dmFkZTEjNALs/vHMOloma/FioWgq38LEDphqLbi/MDKjZ+skyek9CBm72qNR6fF0uZPdGp
    TNcnAR4AQwTabPyqXb4b8VVQVFCNoT48fsLJV/4jNEVJ0A9eFv0ovpeauV2dgztP0aY1Y0
    jIaZAzpZKJmSr5bjx5yubrqLJ++dH6uDgWLI4XXVkSa8jJqAXQgEQlXOv7WGccuHPTRlER
    Ylu8rJket0jbyQhGWZ+weYiCIeD4wr9LDagDzAHrKU27qzYbzXZIXOYWeFfQKFS5QVbMSU
    NlfDPJ2QDHkDrdBA1iUAq2dsmA2mOrsNEsIEQsqJKBWsANZHLO8XMG8BasrOULdBqAdbPC
    0Y+rycPLPuV1FKoKiCpkBeZSEDMwM7l1MZM+HjJRJVWyduAfzslhvebXdopARms4VNgoxb
    VPxqS/ibVICmklGBL3QsyYGEjYTNyM6TXqUiAroTBD0FISvOhCS+BPZfMUUO+28SL+aMh2
    /gyC5bMHNE+nFrG4uqq9LACee3tcCp9f9b2COVhAYtBGEFTumjY13sXpoRqh0kPxNs12ir
    gA7kU0UWLYMS7sfoIKzFOdyMTjnWhRJylElsFocEOYyyzYy9n8pU3EfQrUsRJEvL7/Lo6h
    lT2Vk/Dvtkj1kyygKhL2b+cuxIA90gAwQrkbfaIw8PVvTDWS9Zk3UIJUNZ5A
X-ME-Proxy: <xmx:FxByaoD4xo1U9Veqk7Q5G1CojcT8bUCvCrgESdiqdTsDqqSCgPF0LA>
    <xmx:FxByavFhdhlY9QX5btSlYa3bXkzBmQh1N9u7az8ITUddkjepRsbkkA>
    <xmx:FxByaou5crzF9GeBou_sgHVmnkwnEovrVrRXgTuVUbF2BcT2yGGreg>
    <xmx:FxByallzayi8H8zYq7XNmRxhSN7i7BUlUv4wql5eMrxtYZ9LHxtesg>
    <xmx:FxByarMno8pKbtz_oJElCIMStQBLcPNXMdGP6Dtv-f02uzkJhqlVtTeS>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:15:19 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 15/17] rust: sync: Use super::* in spinlock.rs
Date: Tue,  4 Aug 2026 09:14:37 -0700
Message-ID: <20260804161447.84806-16-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260804161447.84806-1-boqun@kernel.org>
References: <20260804161447.84806-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lyude Paul <lyude@redhat.com>

No functional changes.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 rust/kernel/sync/lock/spinlock.rs | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index ef76fa07ca3a..d75af32218ba 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -3,6 +3,7 @@
 //! A kernel spinlock.
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
+use super::*;
 
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///
@@ -82,7 +83,7 @@ macro_rules! new_spinlock {
 /// ```
 ///
 /// [`spinlock_t`]: srctree/include/linux/spinlock.h
-pub type SpinLock<T> = super::Lock<T, SpinLockBackend>;
+pub type SpinLock<T> = Lock<T, SpinLockBackend>;
 
 /// A kernel `spinlock_t` lock backend.
 pub struct SpinLockBackend;
@@ -91,13 +92,11 @@ macro_rules! new_spinlock {
 ///
 /// This is simply a type alias for a [`Guard`] returned from locking a [`SpinLock`]. It will unlock
 /// the [`SpinLock`] upon being dropped.
-///
-/// [`Guard`]: super::Guard
-pub type SpinLockGuard<'a, T> = super::Guard<'a, T, SpinLockBackend>;
+pub type SpinLockGuard<'a, T> = Guard<'a, T, SpinLockBackend>;
 
 // SAFETY: The underlying kernel `spinlock_t` object ensures mutual exclusion. `relock` uses the
 // default implementation that always calls the same locking method.
-unsafe impl super::Backend for SpinLockBackend {
+unsafe impl Backend for SpinLockBackend {
     type State = bindings::spinlock_t;
     type GuardState = ();
 
-- 
2.50.1 (Apple Git-155)

