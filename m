Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C2413C81B
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 01:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753059796; cv=none; b=fNekGBo8dFnoNeJBOZM33xDH3ZRFBYCoVtIrX+iQnQ+eBNaLPn94CryvGIzqIKem5zdhsQU1CC/A04F88PA7mLiq4mEsUWWEb3a11bfm6/yzUSnUVrUvH8/z4uUXICdFJpor18PGj+PEphQDsRiBUHFtFzwddGYjnx/KbZZ609o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753059796; c=relaxed/simple;
	bh=n7tGnkipya6k3NliLrJGG2/eg7BTBQDUoO66XHRLm08=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJHje/H51JuG7UdGMO12wWZ2oZOc2+fvOyNBPB2PKnPfLhtiZCYcXlu3x7rBcO4Wg4eWCibx7Z+9SarpHukyhHWlbKlm9I7DrIEUvIVyk0sG1rwP4LHh/uLO44GlLoKrxZOj53/fWuLGh8DGv71zLnMPRJae/79JXbN8vh7UIvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFZeGZvR; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFZeGZvR"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-61593d51267so1732089eaf.0
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 18:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753059794; x=1753664594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S76G8dgyFVKhTbuEhC/Ci71tjKyRi6JcAwTXIvAHdN8=;
        b=LFZeGZvRYHy9kyEhJdk7xiuH68LJdTsTUNpgGGZPiFINFemu1sJgY4x2yeIos9vRHi
         DUxJb2Kvcdok/5OturDA11Lux3+AXYZM1xqSca03d+FgVKTNd3PMyE1Vwa73r+TWaDeC
         3nxuvD9/xkF1a5iFKQLadmenYioF62n4rnHShQsU6E7sN9dY1Tc9Vcdilb2F42a5yyMT
         O5ryeCffKBG3vi4KyuyZw8ZMLHTLsPhQ/tTI4kv8yZdQZTrGkTZ8BaLpb5c19hfdTss1
         J68UbJ0ZB5GufMMnPy1D15JbSD3WN9RphSB/NENnOCdqTZxziTUJzcfT8mIBgr7Sy6O1
         Zvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753059794; x=1753664594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S76G8dgyFVKhTbuEhC/Ci71tjKyRi6JcAwTXIvAHdN8=;
        b=fmHwZS7uemKpy3e0+/cm8MY0FOS0HiLwkFDaBuVCcsDeu1jGQAYFzR0RCYdXHny4Hp
         BeNYl3vz2GlvycSe6wvsdt5x5VzBTwPZEEecnmVqNT7HneOgpHOFK+6256R1nScPugcA
         IGkmKcF4ygQzt+TfVD0Jx4jTcXe7+oDEgMlycP83Vs1FCnqzWizGz/Wa7NA9lpN+Obgu
         cR/RVxCSWv6CC8AS1hpEGCHnKB+AdvYNCcPUCV3htGhNGqnPbv8CAWdJi6iS7hgCxX5W
         qq277ML/v0lFdviZBJwCjmMw0YV7qNlAxbQP7vdExyE3W0s9JX7R1C77L3D74bM+1gEg
         Cwrg==
X-Forwarded-Encrypted: i=1; AJvYcCXNtrVfYp9yIzUfwdCNrKDtPOVbGhQE6SYGETAxZL0hHXalvK84uF5zAictCS2+XZRLNHbhrqKllmeHmFQyHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqWZSaegaqR5oaPP0wDdLeq3eDXVR1WapKOJAaC97f4K21yDWm
	7/+O1bULykb4j3dFD0XDGmVBXsXqS9MKGJNxnL256X8v21YURfIQ3zsu
X-Gm-Gg: ASbGncuge5WrqldbUkRG+TXQeqOdyQb2uYGcAVNx6kbLJ5XlsTLgE6mmgJEsPXlZYew
	DyFuvlXRfD+thvAhO1LWUGZzXNjydJhLD026pta+n46TB8LLwD1G64Ku1jvo37v4ANnSgrWPTM8
	jyvAu2wjfbS0j4JSUistqELPpblS0oTRYIA/VyQgdExWcLrt9kFOlRBtjniIPGwWnkI018IQU4I
	Z5VeALOOB5vQNYEmSLYV5g+ym2TYON/20LMtlsF5UJe2/b7m8xSwJgIRvEIAPXkdQ09l4p9kRY+
	mrluCo0r9gOOT+bo/pPWIiO+U8GMZss9Bv5Hp+Md2LJBMdAv3/i6asLYRjoU+Cdjv5UV6MrNZ/L
	isdcoUABs
X-Google-Smtp-Source: AGHT+IF7M+MA5HwwJG0gBrxSdc03hhzBgY4QsAlmnLc3zt46guiPqEd8bmGZiyfAqPmQraDWWKdp9g==
X-Received: by 2002:a05:6820:201a:b0:615:c2af:de7 with SMTP id 006d021491bc7-615c2af11b9mr6510991eaf.4.1753059793976;
        Sun, 20 Jul 2025 18:03:13 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-615bcc8c2dbsm1436959eaf.20.2025.07.20.18.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:03:13 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v7 1/3] rust: revocable: Clarify write invariant and update safety comments
Date: Sun, 20 Jul 2025 22:01:53 -0300
Message-ID: <20250721010258.70567-2-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
References: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clarifies the write invariant of the `Revocabl` type and
updates associated `SAFETY` comments. The write invariant now precisely
states that `data` is valid for writes after `is_available` transitions
from true to false, provided no thread holding an RCU read-side lock
(acquired before the change) still has access to `data`.

The `SAFETY` comment in `try_access_with_guard` is updated to reflect
this invariant, and the `PinnedDrop` `drop` implementation's `SAFETY`
comment is refined to clearly state the guarantees provided by the `&mut Self`
context regarding exclusive access and `data`'s validity for dropping.

Reported-by: Benno Lossin <lossin@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1160
Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 1cd4511f0260..2dfee25240a0 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -61,6 +61,15 @@
 /// v.revoke();
 /// assert_eq!(add_two(&v), None);
 /// ```
+///
+/// # Invariants
+///
+/// - `data` is valid for reads in two cases:
+///   - while `is_available` is true, or
+///   - while the RCU read-side lock is taken and it was acquired while `is_available` was `true`.
+/// - `data` is valid for writes when `is_available` was atomically changed from `true` to `false`
+///   and no thread that has access to `data` is holding an RCU read-side lock that was acquired
+///   prior to the change in `is_available`.
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
     is_available: AtomicBool,
@@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
     /// object.
     pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
         if self.is_available.load(Ordering::Relaxed) {
-            // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
-            // valid because the RCU read side lock prevents it from being dropped.
+            // SAFETY: `self.data` is valid for reads because of `Self`'s type invariants,
+            // as `self.is_available` is true and `_guard` holds the RCU read-side lock.
             Some(unsafe { &*self.data.get() })
         } else {
             None
@@ -214,9 +223,10 @@ fn drop(self: Pin<&mut Self>) {
         // SAFETY: We are not moving out of `p`, only dropping in place
         let p = unsafe { self.get_unchecked_mut() };
         if *p.is_available.get_mut() {
-            // SAFETY: We know `self.data` is valid because no other CPU has changed
-            // `is_available` to `false` yet, and no other CPU can do it anymore because this CPU
-            // holds the only reference (mutable) to `self` now.
+            // SAFETY:
+            // - `self.data` is valid for writes because of `Self`'s type invariants:
+            //   `&mut Self` guarantees exclusive access, so no other thread can concurrently access `data`.
+            // - this function is a drop function, thus this code is at most executed once.
             unsafe { drop_in_place(p.data.get()) };
         }
     }
-- 
2.50.1

