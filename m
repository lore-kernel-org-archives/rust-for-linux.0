Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432B03AB27F
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761767; cv=none; b=BAYESQMz7LvTgwBy9a1NB15l6gtWcI8cFElcefUKrO5mYLJKEuOj9X0QbBtFgHLC09HuVMkIdEVA5J/6vFqi+nwtvaqStERzqQrvaei+N8LonEUyTo2ZGV0pF8wVeU+7WGIGG5wQR3C3XMCi9NklCnDiN03bd+2wN/zmjmvkdAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761767; c=relaxed/simple;
	bh=umWQcDWL+vKkAg6SI7BxeZrCQcDKXpYAG37pQ+lD/To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oup4HduK/ZKnoTjGFzmJv7fRYcDhbIH8xslAPZzB8co2CXiOsNwsMB46MX/vfubV8TRRMWl2CY7zP/gYmrRkl+lInRsx3zX5CgKgiHezHRtN44w9LGKEaf8m2xGycEyY3oCnPnfHvoe1C+lrV1iANFtk3q2quUXsqedF1dQ374U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=AC8kRLfE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="AC8kRLfE"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e1bfcc63so50377f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761758; x=1788366558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RC90Kt3yL2qKSR4SdatW3E2dscmtZrN96AZ/Od58+hU=;
        b=AC8kRLfEnooy0wTnEumuPOhP/qPoe+q5XgGGt3ETWWbhmn0ChK4BmzIWR1sPtU8/E/
         +1fIQn+32Xjwj/VLLsWBh3y2a+AdUxhNpjBLcsd/SiyX097awa/9JWo6H39/RrHaE2fg
         p8ELFMagJASeTeH44iFmaindmwMNMXlxKLPHVFbb3JgVu5/oVhEV0GjQWi0VM3J7ioOK
         +GE5MAb2AiA08zv+21+wD2KIYJOErRs96QQJBR0KzU+Y/KjBihvwwi/Vugx/Sk/EPVu5
         16bShvOAHUjNGnrgynNxgfsdDqKOFegTflxrOjnDLy3Vuw2qLO/y+la97nxdlQIF7bnd
         KZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761758; x=1788366558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RC90Kt3yL2qKSR4SdatW3E2dscmtZrN96AZ/Od58+hU=;
        b=K4DmTSvJXJni7l+hXYIIW0R7WUX6h5kyFA3X98o3idWWBvGGiB8UNixrxwqgsNmSev
         ruycw6MTmpC1JGEMYnT5a13WdqNvhsp7QXM8oiXHBGgy5TJRDOFOknL+OPMBndaUSht9
         qXd+0X9ZMxZB8JCd3JtDecHQEzIsWoZMW6cqhBJynhT5URJVTI0P6aCysoHTHJUPdgZ8
         1TJWU7qRDScs90m72fLzjpz7xX/RXiWLL1aY40SezcARp6OEqipEvVt60tuCtYpXuDXt
         OgOgM3zgtjfgaHOMhT/L6tQxnajOnhybk8eLgw8bdzjVMrGd64eGpnCazI9LzYJCD/O8
         e/AA==
X-Gm-Message-State: AFuF++kKqkERnwaFceNHpTucudE5wKepEpzBm2Jh5MbtEki1uDu59U4E
	M03x3OxU30wNuFtGxhToiC+NcdtZhNAmPlubEpbaSINN14pQmsHyFjp41vXIGrlpJywepGkLlSX
	qPdJxfULS
X-Gm-Gg: AR+sD12dyWMOY3F/nPJMtL6x5GB3tpQ5Adqg9RFyFTr4DRTKAGEHXjLk+AI+OZeN+I4
	zufRbztLzN3AyVMtTQIvSNq1jOLcNOAEgJVjaHeGZGO9JRrPHt/EsibmQWwn+RF+mIKy5/nofIW
	Bt9tP4UZaSXoI299K4dy6J7TdGoNLyKalbWlMxhsgfnY9GZEu5Kf0sDGzE43U8mHIjBsQa9vv+K
	Ot5M7kELFRLO3CMbF3SKhQFrcccTWCdbfmr9tlm2+SrNKU0uDCZmNqM204P8c9AHw1rzT+21CUc
	ZHnf2wltlg3XSFOUkBz7KRf/VB/Pj6uvJZiByGPFjHx+fp2XHnSPB9KbKWygSIaO2UhccQHGvFe
	qPmDNsSzBDt4vTruS0O0yByCZAi7UTgI74uMP928ahSWBX+S3ZSUHM5p2fUSVVEgmmTEA1F05Q+
	SRBcre2dgdXLfavPnQFS/Mhc5cH1q3O+mknenZlSpFW+RvGPR2RbwUGBFvawTMCDM5kZhnJUXF/
	5N6JDM8TdXtR0cmgRO2jGnLmt02NJYPkMc2
X-Received: by 2002:a05:6000:25ee:b0:482:ea3e:882a with SMTP id ffacd0b85a97d-482eab75e7dmr419934f8f.6.1787761758366;
        Wed, 26 Aug 2026 09:29:18 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:29:17 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] rust: hrtimer: expose interrupt state in hard callbacks
Date: Wed, 26 Aug 2026 17:28:41 +0100
Message-ID: <20260826162851.2497-8-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162851.2497-1-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hard hrtimer modes guarantee that their callbacks run with local
interrupts disabled. Carry that guarantee through HrTimerCallbackContext
so users of IRQ-aware locks do not need to assert the callback
context themselves.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/time/hrtimer.rs | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 2d7f1131a813..a55b3ce53735 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -404,7 +404,7 @@
 //! [`Arc`]: kernel::sync::Arc
 
 use super::{ClockSource, Delta, Instant};
-use crate::{prelude::*, types::Opaque};
+use crate::{interrupt::LocalInterruptDisabled, prelude::*, types::Opaque};
 use core::{marker::PhantomData, ptr::NonNull};
 use pin_init::PinInit;
 
@@ -900,6 +900,11 @@ pub trait HrTimerMode: private::Sealed {
     type Expires: HrTimerExpires;
 }
 
+/// A timer mode whose callback runs with local interrupts disabled.
+///
+/// This trait is sealed by [`HrTimerMode`].
+pub trait HardHrTimerMode: HrTimerMode {}
+
 /// Timer that expires at a fixed point in time.
 pub struct AbsoluteMode<C: ClockSource>(PhantomData<C>);
 
@@ -982,6 +987,7 @@ impl<C: ClockSource> HrTimerMode for AbsoluteHardMode<C> {
     type Clock = C;
     type Expires = Instant<C>;
 }
+impl<C: ClockSource> HardHrTimerMode for AbsoluteHardMode<C> {}
 
 /// Timer with relative expiration, handled in hard irq context.
 pub struct RelativeHardMode<C: ClockSource>(PhantomData<C>);
@@ -991,6 +997,7 @@ impl<C: ClockSource> HrTimerMode for RelativeHardMode<C> {
     type Clock = C;
     type Expires = Delta;
 }
+impl<C: ClockSource> HardHrTimerMode for RelativeHardMode<C> {}
 
 /// Timer with absolute expiration, pinned to CPU and handled in hard irq context.
 pub struct AbsolutePinnedHardMode<C: ClockSource>(PhantomData<C>);
@@ -1000,6 +1007,7 @@ impl<C: ClockSource> HrTimerMode for AbsolutePinnedHardMode<C> {
     type Clock = C;
     type Expires = Instant<C>;
 }
+impl<C: ClockSource> HardHrTimerMode for AbsolutePinnedHardMode<C> {}
 
 /// Timer with relative expiration, pinned to CPU and handled in hard irq context.
 pub struct RelativePinnedHardMode<C: ClockSource>(PhantomData<C>);
@@ -1009,6 +1017,7 @@ impl<C: ClockSource> HrTimerMode for RelativePinnedHardMode<C> {
     type Clock = C;
     type Expires = Delta;
 }
+impl<C: ClockSource> HardHrTimerMode for RelativePinnedHardMode<C> {}
 
 /// Privileged smart-pointer for a [`HrTimer`] callback context.
 ///
@@ -1065,6 +1074,16 @@ pub fn forward(&mut self, now: HrTimerInstant<T>, interval: Delta) -> u64 {
     pub fn forward_now(&mut self, duration: Delta) -> u64 {
         self.forward(HrTimerInstant::<T>::now(), duration)
     }
+
+    /// Returns proof that local interrupts are disabled for a hard timer callback.
+    pub fn local_interrupt_disabled(&self) -> &LocalInterruptDisabled
+    where
+        T::TimerMode: HardHrTimerMode,
+    {
+        // SAFETY: `Self` can only be constructed while running this timer's callback, and the
+        // `HardHrTimerMode` bound guarantees that the callback runs in hard interrupt context.
+        unsafe { LocalInterruptDisabled::assume_disabled() }
+    }
 }
 
 /// Use to implement the [`HasHrTimer<T>`] trait.
