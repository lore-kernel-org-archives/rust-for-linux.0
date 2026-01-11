Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BAF33D6CE
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132994; cv=none; b=f2porCqFtjOpZKbthLwJEshSum5XoNNsQWQTxhq+STXCAN+GKiWr2BidtIy4iqIAv6X4AC3G+zewa7RYz8pz4CY/kVb/yvPsSKIMYkjjWdxu020/dpdd/1e4sx7BLa5qdr+mewiaIIRHJL3jvYBPkIw8NJE21Aa64Jb78gb/Rdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132994; c=relaxed/simple;
	bh=Zlds8Hu+/k291iVMLCNqpHzdU+S+n201Z4rlrVYZf24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avUy6C5OzNR4DTPy+N49LMNae3pAyY0E9ezlMEWXb470nnteS5igpbux5Zy4xBOpKb6hTAg+u5gxKconF+le70W82FWGSery5tiuXhrTDUPDu6DBAGRdFMGTWzH9/A/hgdg70fvpqSDPJmzgkhmH5gT+eZV/jFkRjzjiTi+6bqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAfksswA; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAfksswA"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8887f43b224so86246826d6.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132992; x=1768737792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aQ/e+h+hkqDEzhXKiDx7re0S13TYPs2v3A82ynqkto4=;
        b=SAfksswAIkHqQOafNSmhkqn/IvaWmFbNnpgKaK+L7F5fVOHMtShf0poCpJOt1/7yAq
         rTB/I95hvduEdr0/cZmcfQIoN+/+cWJ5v9PB9yt9eJSZaVkh+rm/rXya/jYQwVs8OSee
         37oiac7rkPaBLW+Jblk1I5gwfCjulElDwFTzG5V+77GRglf2xFNWbzVv1ZumnQ83dKbu
         EX4x4h0DHzCEZ3XOJr+O1u7zLtYIINW6kDgygiKDQ7BKlUfE40/hqvUExykIWX85ylrg
         qw2evdmMCENyVgLGko/6EOyJzXm+AkvlWym2STyc8Klc/2HbQ1z/RUjb72i/iyioh0XS
         HEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132992; x=1768737792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aQ/e+h+hkqDEzhXKiDx7re0S13TYPs2v3A82ynqkto4=;
        b=BWNBO3NhFYcv0VGBKP650pWk8MFV5FrmhOMEr/obtRh0RterNS22vmZEsd6YKr/t73
         HJy50cQW8nk21/NbKFpC3OzeOTjrDcQDQFqCssks4cMfe/PXF/SJTC51+R00Rz/OSkmW
         K9XoBGdfijKi1Z/gPTTq2Quzn7MrAbIxQ66+G8kJr5Lp8yzvIJAtN8SsxPRwfJZqa7Nd
         iXPLktFhBT1W6TPr0cDpSGG+HCBNHJAr2LkxnuUxlkWqTNIRK+Vp6Nf9co9/l1CAXQNh
         K/XXUkwJNKpuN2KJKyS8SJSnRZH4+UEyFiH26ey0CdrGEN3d2ZYljNfsxODqB5sYbgnM
         I6qg==
X-Gm-Message-State: AOJu0Yw7HbjuTq1VumRrgK2WYfHl4MV5BmhWRXnjku0Rjfs4KAvuBckM
	XBFGexpQBPcwjeORyBBgi4uCBSi/WBkBgW/r4KComvCeBn0mPgSwg8Sc
X-Gm-Gg: AY/fxX4Q5BmjcOcpa86YBt2vXY/ujCMgHjKuw9xPh5VcCTYGTd4TcKGyAl2rTxUZ/BC
	51inSGy8a7OeSNy80DGES5bkVTvpSxmqXfLVpcrOsWSkX6ZEUDvrahVB7YknNOiriMg/orlLAwc
	gZUdfpHovP/eEymNCFpfpXIylbJ4tuSXZrNC3eQPBlPdfM8QLG5nW8s952Sr0/fLU/DhquQ0a6k
	5dp0I1wJlWwrWiUru587DU+J+rgJMQPJCg1xQ/f7YB+OcHNYlsqnMddSZWLdA3IOALyBO4fQWOD
	HmnEQLHsp36DfWR3ZAfWbHSX/SZ0zEHYKFretFKcyr0guBD40hgXvebE/GEIX4WuGpBW25a9PMG
	WVMWzqcs1EQpcwGsRSCb7WE351sUWE8GbMaYBYQ8QEPzYEqfRuKifMZ2DnhQW/obWv99Ozcd+rJ
	xV3DQqIu1RenM0wrEFVOXdsC6apGAJJwlrhNGSA+h/8C8HqDdltCCH+HV+vReZvbOYMLxv1OMV4
	TYNn1GpP8juw3AYVuMQuaBaUA==
X-Google-Smtp-Source: AGHT+IFlZ51Y94D1XmNdXIA5e9p+zxvFlZWqGRJiCjF9etK6ARO67dEYTjjUJCMSv0mnPUMpddaojA==
X-Received: by 2002:a05:6214:1cc1:b0:88a:2eed:486f with SMTP id 6a1803df08f44-890841e4635mr193286816d6.9.1768132991739;
        Sun, 11 Jan 2026 04:03:11 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772674fdsm129405266d6.47.2026.01.11.04.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:11 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id E3847F40068;
	Sun, 11 Jan 2026 07:03:10 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 11 Jan 2026 07:03:10 -0500
X-ME-Sender: <xms:fpFjaVI8krOyuNpRLaN4voVomd1v1QGTFJviuRup0xW3aaKSotg5sQ>
    <xme:fpFjabhvQhZGR42klOht55gVasUNZpATVbvL6m_Of_DIeP0vLxl5p6CsfKJEbq_-y
    PQ-y4dL0Qf_Ta_lPYigwwJbCZPTMdkbUopOTAOOYcPmMfVUticKkJI>
X-ME-Received: <xmr:fpFjaT2BD2Xol-X1ZuvKYYQ3Kd4G31M_KNI3JJlEIP0ZDgea_L20mJUz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeffheffudfgffehkedtveettddvleevgffgfeefveejleelffduteffhfduleeg
    ffenucffohhmrghinhepmhhsghhiugdrlhhinhhkpdhinhhnvghrrdhsthhorhgvpdhinh
    hnvghrqddrtghomhhprghrvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhith
    ihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgr
    ihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehruh
    hsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgr
    nhgusegrrhhmrdgtohhmpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidrug
    gvpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgr
    rhihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:fpFjaRj5WRuxqeOd4IzZ_wfwtNTwNI0HsMNiDeyOArd3kDk433r68Q>
    <xmx:fpFjaU-kZYFpuL0ggpvWPQV7u4CiOD6838V_grVdKGE8jI9f9M5FuA>
    <xmx:fpFjadJiZJiFa808SUjjHp8LSQEaQDwYiHtr5yY8o08jNh-OJs6lmg>
    <xmx:fpFjaZwvAqoQ9YU2c5g0sYKbxeEV9ZjRcAsJqklVwjGlDOt7B2AGhQ>
    <xmx:fpFjaQ09FtwyBW07Q2xUoQfBEIF0CqZqkWcWEwijNgs1Fi_LkiJriiCi>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:10 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>,
	"Ingo Molnar" <mingo@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Will Deacon" <will@kernel.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 22/36] rust: list: Switch to kernel::sync atomic primitives
Date: Sun, 11 Jan 2026 20:01:55 +0800
Message-ID: <20260111120209.6133-20-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111120209.6133-1-boqun.feng@gmail.com>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
 <20260111120209.6133-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Convert uses of `AtomicBool` to `Atomic<bool>`.

Note that the compare_exchange migration simplifies to
`try_cmpxchg()`, since `try_cmpxchg()` provides relaxed ordering on
failure, making the explicit failure ordering unnecessary.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251230093718.1852322-3-fujita.tomonori@gmail.com
---
 rust/kernel/list/arc.rs | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index d92bcf665c89..2282f33913ee 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -6,11 +6,11 @@
 
 use crate::alloc::{AllocError, Flags};
 use crate::prelude::*;
+use crate::sync::atomic::{ordering, Atomic};
 use crate::sync::{Arc, ArcBorrow, UniqueArc};
 use core::marker::PhantomPinned;
 use core::ops::Deref;
 use core::pin::Pin;
-use core::sync::atomic::{AtomicBool, Ordering};
 
 /// Declares that this type has some way to ensure that there is exactly one `ListArc` instance for
 /// this id.
@@ -469,7 +469,7 @@ impl<T, U, const ID: u64> core::ops::DispatchFromDyn<ListArc<U, ID>> for ListArc
 /// If the boolean is `false`, then there is no [`ListArc`] for this value.
 #[repr(transparent)]
 pub struct AtomicTracker<const ID: u64 = 0> {
-    inner: AtomicBool,
+    inner: Atomic<bool>,
     // This value needs to be pinned to justify the INVARIANT: comment in `AtomicTracker::new`.
     _pin: PhantomPinned,
 }
@@ -480,12 +480,12 @@ pub fn new() -> impl PinInit<Self> {
         // INVARIANT: Pin-init initializers can't be used on an existing `Arc`, so this value will
         // not be constructed in an `Arc` that already has a `ListArc`.
         Self {
-            inner: AtomicBool::new(false),
+            inner: Atomic::new(false),
             _pin: PhantomPinned,
         }
     }
 
-    fn project_inner(self: Pin<&mut Self>) -> &mut AtomicBool {
+    fn project_inner(self: Pin<&mut Self>) -> &mut Atomic<bool> {
         // SAFETY: The `inner` field is not structurally pinned, so we may obtain a mutable
         // reference to it even if we only have a pinned reference to `self`.
         unsafe { &mut Pin::into_inner_unchecked(self).inner }
@@ -500,7 +500,7 @@ unsafe fn on_create_list_arc_from_unique(self: Pin<&mut Self>) {
 
     unsafe fn on_drop_list_arc(&self) {
         // INVARIANT: We just dropped a ListArc, so the boolean should be false.
-        self.inner.store(false, Ordering::Release);
+        self.inner.store(false, ordering::Release);
     }
 }
 
@@ -514,8 +514,6 @@ unsafe impl<const ID: u64> TryNewListArc<ID> for AtomicTracker<ID> {
     fn try_new_list_arc(&self) -> bool {
         // INVARIANT: If this method returns true, then the boolean used to be false, and is no
         // longer false, so it is okay for the caller to create a new [`ListArc`].
-        self.inner
-            .compare_exchange(false, true, Ordering::Acquire, Ordering::Relaxed)
-            .is_ok()
+        self.inner.cmpxchg(false, true, ordering::Acquire).is_ok()
     }
 }
-- 
2.51.0

