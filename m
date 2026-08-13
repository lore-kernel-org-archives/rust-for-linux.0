Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30233474261
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628959; cv=none; b=L5at3TVnMTkzn1Vt33IeAQRdBKGC5kNNr20AEjcOknsbG4Ia+le2+UuPA+nAhXatlzamJw6nevP8u3gleQM7Qi30TpWGDkyrfLtvHowUcSRbIB35uMNpF3JPK4lezZx0fCtjDFDv95vCjOcMBQm/zDUBaJnbcDy+XGfojp/g3wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628959; c=relaxed/simple;
	bh=Kv5dlOOc/paFY6itC/e2aegQio8gp2MT/kpCo+ku5ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aEJAPn/tBP51ws1pp7Q4pgwCnH1Z8M8XUbqf5hgNhugxENmCBqHVl5cLO7jnqcmEq/1+gbMeatWC4jAemt0OqZBZPAvmg+1ER7OrYWfNZX0WJ7+Vheej9XuUAM/1xEADfn6SekiGQrj3wIWoXNtAi3r7EP3I7jD0gxT/xbE6834=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=mB4B6HmH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K/AeBgJf; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="mB4B6HmH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K/AeBgJf"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.stl.internal (Postfix) with ESMTP id E0E5A13004C4;
	Thu, 13 Aug 2026 09:49:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 13 Aug 2026 09:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1786628956; x=
	1786632556; bh=mWiZh8PyAaf2VUCC7sVtXHpVJD3Vxm+QMPRTKXURUS4=; b=m
	B4B6HmH3SSMAggD5DRq/W2o7LW+zbTXGO65By7grgD7Hrdimqd6pMAnV/WUE63Or
	8sc3IXbZYkNfXmnxM6IH0VpQjTqoKLDAAJaz5qvA/9yYtjajnvvuQEk+nZhpyck1
	KllkD7vg6pTp0tzMo9Woqs1YVm2TNyvCsXWlw2mTtrwP81yp+YfJzqyyGV+Pe/I4
	PpZ3BxiKGaFa3p7z+OF66S85lKGghWLkcGyFx0H4p8HHK4tUiM0N+Cwnpok0YLOC
	aGdretF0C7kcJCT3sefVGhR5xc8WATSrs8zFrqJy3OmTk7VtL2YjKpL3vttXcqVB
	cshqPCFgrphoXDzJHQm4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786628956; x=1786632556; bh=m
	WiZh8PyAaf2VUCC7sVtXHpVJD3Vxm+QMPRTKXURUS4=; b=K/AeBgJf4kRzhlyCs
	kFAkWooUG8dbkP7g4lX/boXK+CEiMrSWId2HFnEPbLO0OSgBkFvV5E9CEXONiEjy
	GQ2mD+eBvklJR9dqdTVMBeXezZk/Hj9qJUh5Kx0+Cu7REz3uHLhBXtPlz41JjrVc
	Id3HcJZS00KBFlxFhu42DtaRJXL5reouiTtZNsH6juZlgHiEhZqscs8i8MAGAUFe
	d8FHA5B2tly4NnmQMn5rGNn73GSeNGT5UpSnYPzceM2eEBaxemn3PEeryjkZp59V
	wWVDEGcv1Qe5kYmWMpqT3PSEq9sKV68ow5nBVRzo/gd+D93O8uIFWWBcJLa23mhj
	40gUQ==
X-ME-Sender: <xms:XMt9avlORQFz1P9SaZJmaC9LgxehaJYVbjsSbVtJZQFJNtE7XULuLg>
    <xme:XMt9auukBWfjMAM3zafkj_jZdezUQgAAsRRxg6h9sy00emB-NOa01iwzl9cCspcgm
    L1xJL90SXviLbJhbcZ21iOWSbLnZidQ8OTAtAsHPCVLXEVeLo3KRH9C>
X-ME-Received: <xmr:XMt9ahJBSstfIKdxyZ7bz5_8mcjvHJ86DnylU9ECsm3dDwbetAZ3iCS5oVitL6xFcYJ04rrvtWNs0rsnE04>
X-ME-Proxy-Cause: dmFkZTF3I+rSpJ81EPexp21Wh+EHaUEKnZU1S/1oYMO86q5LHzT7UCvtsgZuI2h7KrhSmN
    viWUNpLvYqOt9vPzFtleF+1BVZc+B+jqvHJjKClCt5DcCNyvn4KYkdH1Z1AmPvnEyqefSK
    adWfLqu5lDHotgQNd05+0GFncQI17PWVLlYjFrrEsmaWzkjgb3iXRRWShxt0ItPv3HzIBn
    iR1FAukIByzEBs6V3GWQ/z1+2bZpgKNKUDDR/w95NDDKHPoAbULWVuMx/3mLmHjgPZ7TaT
    N3ZbWRBx9Y3QaLMI0o3QKKw+eGO2rfjRfJ83SpYOpei4aGjkFZ0yMMoOE1fjud5VgPKWlK
    hV2OoR2/FqHcEvWRvkLT9Mn3yRH9xkaSxTdMhlpQkUekWei4VHsc+uXNi81eXBpUHY+7WO
    Q/PLA1RxY+MOB49/s5wfnrmw0YxvsLLXlDa9dWGger7GIgQNax87fqcFzjwXlCh0xWxsJ7
    7WUamj8G5b1eEjHNqZGHO0bV1G/Pa9FwsYdxIG6Q1wpEJ4kYlVtAQktEyoLTGnjj6sW8E3
    bqfaq5AJvxdjScI5p2p/sp+1hAs7LOBe8komLUcDuzjtXpugBWFB6feQ1jjcRjAWDXz1Qx
    2e7cAgzQXjIEllkFB+MzjnheEMRvZVoJF6Jx6cjj1++8EfjPo0Hbql8RbzxQ
X-ME-Proxy: <xmx:XMt9arjKHjGBuQkZJgfK0ATzASZVWQ8BqTj7q7waZtc_tDSikY380g>
    <xmx:XMt9altZSYHXmEmkiV6JcqXoDt1WnH91WyaMZ2y6WRVcdTHYVYDavQ>
    <xmx:XMt9alhkwvxyWJ4ekQ_7fmlb_KXNB7X-UPC29fx2rgq61skE5vCncQ>
    <xmx:XMt9agfr1R81Zcd506UpqYGekyB6CEOz-Sn4lvdjpK4o4kJHyl1N0g>
    <xmx:XMt9alUkAtAgG-xYTnn6Q9LIe5WPyNPqEZpigN_efm_mstPl_MS9ungG>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 09:49:11 -0400 (EDT)
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
Subject: [PATCH v1 4/4] rust: hrtimer: Make HrTimer repr(transparent)
Date: Thu, 13 Aug 2026 22:48:34 +0900
Message-ID: <20260813134834.1562995-5-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813134834.1562995-1-tomo@flapping.org>
References: <20260813134834.1562995-1-tomo@flapping.org>
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
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs         | 6 +++++-
 rust/kernel/time/hrtimer/arc.rs     | 2 +-
 rust/kernel/time/hrtimer/pin.rs     | 2 +-
 rust/kernel/time/hrtimer/pin_mut.rs | 2 +-
 rust/kernel/time/hrtimer/tbox.rs    | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 59e9559e7099..2130dd24cccb 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -415,8 +415,12 @@
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
index 2134d12d558c..ce7cff7efe29 100644
--- a/rust/kernel/time/hrtimer/arc.rs
+++ b/rust/kernel/time/hrtimer/arc.rs
@@ -143,7 +143,7 @@ impl<T> RawHrTimerCallback for HrTimerArc<T>
     type CallbackTarget<'a> = ArcBorrow<'a, T>;
 
     unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
-        // `HrTimer` is `repr(C)`
+        // `HrTimer` is `repr(transparent)`
         let timer_ptr = ptr.cast::<super::HrTimer<T>>();
 
         // SAFETY: By C API contract `ptr` is the pointer we passed when
diff --git a/rust/kernel/time/hrtimer/pin.rs b/rust/kernel/time/hrtimer/pin.rs
index f44ac07cb722..6a0ac4d7dedf 100644
--- a/rust/kernel/time/hrtimer/pin.rs
+++ b/rust/kernel/time/hrtimer/pin.rs
@@ -128,7 +128,7 @@ impl<'a, T> RawHrTimerCallback for HrTimerPin<'a, T>
     type CallbackTarget<'b> = Pin<&'a T>;
 
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

