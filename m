Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BF83F4856
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 23:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786145465; cv=none; b=Du9QlaWizNBSO4NtqfhP7XjbwlOJ9gRUeCeKTX/eLsz2KFZaWtNoSCmBkfY/9vs4M4uKKzCswPWi0M0tUr93KjACcqiANH8cxllqZGgKebeLZ5qFE4vzFXrglgM4vaCsYWbQdn5RgSXmAV1Y6cGK3f1pChGAHptK2uAmviV8Ocg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786145465; c=relaxed/simple;
	bh=Q+7x/w2szBLPEcEfrtKAsO3sm5xyMJb2IqNr13/uy8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWYfpwWhDes74uDmAHkcvemTzaeehY56Ft0CxABgOSqwwYtzvy81Lr4k5ps2KtAXhrjn2a3Q0B8yQd6DTsJzJnLIlcYdm8ZGjKbiwlzprk/SuZ1wMB9gr0f1+vCOZVgXl7x0vxR7B7JeHqOU5GxGXSujFMcFSEIdIIbw3gka908=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=WQhm6Hl2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BxsgEWag; arc=none smtp.client-ip=202.12.124.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="WQhm6Hl2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BxsgEWag"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.stl.internal (Postfix) with ESMTP id 999D313002E1;
	Fri,  7 Aug 2026 19:30:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 07 Aug 2026 19:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786145456; x=
	1786149056; bh=8l4ClKet4ld6igTuKC58gPk5ORgU7wkufT1yA3LUNR8=; b=W
	Qhm6Hl2cer5qfDm+ot7MfEzIF+bxwMRiN/NZZu2yNkI5hSI/ap1T00Z9oQus9/Es
	rckm63doKhSs5pg0uX7Yi0TDQRg59gB8LcDiE+0QXKHvNqIO12D1rIP6Krti5Rdk
	lAgNgLK+RfE8ksVTlzD0J/kGBvSZH8E2MvXF2d5hm4FPboKwj5s8ZfS31YMFcfOY
	mEHRJz3a0RKp8aPThGY7FvBCefvUCDIqECSBCNJxikqbmGJu+DhMExOuxbVxf+8a
	0D+IZZ3rDCk9Q9pquVyT0myr0c/7y3bssscS1Y6ywd/oNyf4FJ6U0aIXMJtOjANy
	qwWyD2Vk1lOEd9JdU22ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786145456; x=1786149056; bh=8
	l4ClKet4ld6igTuKC58gPk5ORgU7wkufT1yA3LUNR8=; b=BxsgEWagsGBROUnR0
	lVXpw8vgD4VGhKODAlAzWO4VcnHGuQXohYDSJFnV8hT+FTlwc7D/QCf8ZMjEc9Vf
	VczCWKLMaKqUIN31asIYYs7RkCExDHlHA7FrRPXpH5/BlcbScWE29zawYAO56TMt
	bYTLCGevAwBedt0ai73Hr19qXDjJmHK3bawQlLPO3iId8JLz5qrMB2HYsabGV0k2
	p3bkTyEjN4LTxqH6uiYAGQymM1vDA3Puvfz7RhxtkTrnwhrXvTWMwO9VuBEZ/jy1
	Rdy354jtd7ErxMtCyDBj07mBENBs2Bt0ONn/UAdqU6c+l/EeQfZNvG2esG4noP+w
	4optA==
X-ME-Sender: <xms:r2p2aqoPgE2PntqVoG5aVXs7JNBIE2EDrIlzHXMP8Cy0j_Okt1PvAQ>
    <xme:r2p2anBRxD1-HvVxdYNnzyy5sqGQNjRUBaSjBBu5SGAr2kgWgNv0LjaC4381exMee
    A9yuPvecyvFwgJW28Eq3SuJxVeAxTUbPPxY-BZpsBU9T8A67g1qnp0>
X-ME-Received: <xmr:r2p2arMFbVyT8R4W6ePtvzwCFoAr4eLq8bcvhomFtQKX59tGJJBGWmNfeGQblu8YkfoVpYusOukzq_drgIM>
X-ME-Proxy-Cause: dmFkZTESOMYRgnpr7FsdJ5F6PFI7mPbqFDHNJ1m/uj2Yy5uGNfrQwZCkNLubXjZ5YRyB46
    6Be6Nz9wNxUiuZpmMzkhp8I0OOh5ad2PbmKXV2f8c+GI8WSTAHtp4K3SrjE7a5zbTS7G45
    7lYR/M/mjhO0Ud/K9t1eSY03W0DgrTUaS7ewivLYF92pk0u/1O8u3zIjyiEHQ7LWRzlxxU
    +Bhwb4hYPuxZyTNAYyfxH2qYImqVLo9Qt28EZKcq3Pjx/dKmRsGsDKY+d6bNUKoGJAsN8H
    5zsJBYoUndTrZQV1Etkk6UIrg1hIZfEi1jNrtxWvCVdj1YCJo2MVFo9gZ/soQ2iejAdZpm
    /DKmsDiJJu5ZwkbFmAlEa/o9fzW6TBJ3quRLyO05alq5ea75LStzeSNuJYBWYpozKtLuLa
    +VBCHA0WKEBHpYKzJwBq0U0/4pHLGL1HIjKWjfGK1EwyjhVfZ7WuxNH5QPuyqCgumTyWV4
    xLIGPUL0+0pRw0CiHoIkjcQOI2SokXOwdXyzcF+2if72R22i3vOv8N6C8XEGARjzjPFOrC
    OtLGe+eiaP5diZQZ7iPUGfZBkvjrFE/1WJyiVBRvYk+9c2BQck8fIL8qAhzLMDgHdde6l0
    2QnToSyldmmJlxklDKKImFqzdf76R7uKmEHfvsv+x3XqcUOb+iNmrGBTRP5g
X-ME-Proxy: <xmx:r2p2atDV6YgPH4TamBH1oStnQq4mLS948-z-JMwl_zlDZOb-sqI4KQ>
    <xmx:r2p2ah8LM-c1EQzSv-ZcIX_5XdW0QMYYehADArhP9RS2z2onhPrOaw>
    <xmx:r2p2amFKXDlCtVci2nR3sxjlcN4JJ8cu5MvdrfqccmOyx3sgMx_QkQ>
    <xmx:r2p2agLfRIVKagQQK_AUbe4YybuhXuAi7iZ0X_1TlRo77ax717CQaQ>
    <xmx:sGp2atwTkqFHTXlloz3vEdRPmmzd_uGWEqS7hSNcvUgO2ImUlFH5q8kI>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 19:30:51 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v4 2/2] rust: hrtimer: Make HrTimer repr(transparent)
Date: Sat,  8 Aug 2026 08:30:39 +0900
Message-ID: <20260807233039.1091842-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807233039.1091842-1-tomo@flapping.org>
References: <20260807233039.1091842-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

HrTimerCallbackContext acquires a &HrTimer<T> from a
NonNull<HrTimer<T>> while a &mut HrTimer<T> can exist at the same
time. This is sound only because HrTimer's sole field is
Opaque<bindings::hrtimer>, which puts every byte behind an UnsafeCell.
Adding a field to HrTimer that is not Opaque would make acquiring that
shared reference unsound.

Make HrTimer repr(transparent), which prevents multiple fields, so that
such a refactor fails to compile instead of silently introducing
unsoundness. This does not guarantee the remaining field stays behind
Opaque, but it rules out the likely way of getting there.

repr(transparent) cannot be combined with repr(C), so drop the latter.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs         | 6 +++++-
 rust/kernel/time/hrtimer/arc.rs     | 2 +-
 rust/kernel/time/hrtimer/pin.rs     | 2 +-
 rust/kernel/time/hrtimer/pin_mut.rs | 2 +-
 rust/kernel/time/hrtimer/tbox.rs    | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 1db84cd4cbe8..04f47af3541b 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -418,8 +418,12 @@
 /// # Invariants
 ///
 /// * `self.timer` is initialized by `bindings::hrtimer_setup`.
+// `repr(transparent)` is not merely about layout. `HrTimerCallbackContext` acquires a
+// `&HrTimer<T>` while a `&mut HrTimer<T>` may exist, which is sound only because every byte of
+// this type sits inside `Opaque`. Being transparent rejects a second field at compile time,
+// but it does not enforce that the remaining field stays `Opaque`.
 #[pin_data]
-#[repr(C)]
+#[repr(transparent)]
 pub struct HrTimer<T> {
     #[pin]
     timer: Opaque<bindings::hrtimer>,
diff --git a/rust/kernel/time/hrtimer/arc.rs b/rust/kernel/time/hrtimer/arc.rs
index 7be82bcb352a..09f748f2f28c 100644
--- a/rust/kernel/time/hrtimer/arc.rs
+++ b/rust/kernel/time/hrtimer/arc.rs
@@ -80,7 +80,7 @@ impl<T> RawHrTimerCallback for Arc<T>
     type CallbackTarget<'a> = ArcBorrow<'a, T>;
 
     unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
-        // `HrTimer` is `repr(C)`
+        // `HrTimer` is `repr(transparent)`
         let timer_ptr = ptr.cast::<super::HrTimer<T>>();
 
         // SAFETY: By C API contract `ptr` is the pointer we passed when
diff --git a/rust/kernel/time/hrtimer/pin.rs b/rust/kernel/time/hrtimer/pin.rs
index 4d39ef781697..e86dfc63eb97 100644
--- a/rust/kernel/time/hrtimer/pin.rs
+++ b/rust/kernel/time/hrtimer/pin.rs
@@ -83,7 +83,7 @@ impl<'a, T> RawHrTimerCallback for Pin<&'a T>
     type CallbackTarget<'b> = Self;
 
     unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
-        // `HrTimer` is `repr(C)`
+        // `HrTimer` is `repr(transparent)`
         let timer_ptr = ptr.cast::<HrTimer<T>>();
 
         // SAFETY: By the safety requirement of this function, `timer_ptr`
diff --git a/rust/kernel/time/hrtimer/pin_mut.rs b/rust/kernel/time/hrtimer/pin_mut.rs
index 9d9447d4d57e..65172c9e55e9 100644
--- a/rust/kernel/time/hrtimer/pin_mut.rs
+++ b/rust/kernel/time/hrtimer/pin_mut.rs
@@ -86,7 +86,7 @@ impl<'a, T> RawHrTimerCallback for Pin<&'a mut T>
     type CallbackTarget<'b> = Self;
 
     unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
-        // `HrTimer` is `repr(C)`
+        // `HrTimer` is `repr(transparent)`
         let timer_ptr = ptr.cast::<HrTimer<T>>();
 
         // SAFETY: By the safety requirement of this function, `timer_ptr`
diff --git a/rust/kernel/time/hrtimer/tbox.rs b/rust/kernel/time/hrtimer/tbox.rs
index aa1ee31a7195..1dd68fcf2bd6 100644
--- a/rust/kernel/time/hrtimer/tbox.rs
+++ b/rust/kernel/time/hrtimer/tbox.rs
@@ -103,7 +103,7 @@ impl<T, A> RawHrTimerCallback for Pin<Box<T, A>>
     type CallbackTarget<'a> = Pin<&'a mut T>;
 
     unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
-        // `HrTimer` is `repr(C)`
+        // `HrTimer` is `repr(transparent)`
         let timer_ptr = ptr.cast::<super::HrTimer<T>>();
 
         // SAFETY: By C API contract `ptr` is the pointer we passed when
-- 
2.43.0

