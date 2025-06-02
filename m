Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7E02C3254
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 23:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748906932; cv=none; b=KD9xv2/FZwqZSbNgbEFXIYEN+HmCSk2EL9QySAFlG50LL0OAAraRD9cz5m6gA8EXjhtVwV0ZFit1H+zltqZverGV5QkiHBxxK7zwXP+sCN82n38XpbjC9OsqCgcgoxS+kcr4vjZ/HY2ekCVWp2fo7Z2NfkoqG16deNYA2ujrJ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748906932; c=relaxed/simple;
	bh=8YiH47mBvhM8T4eHsYNmGvtYodf/ij/ko3pn8BGv74A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMfFRBBrbqvgPTpmESraQJxgKzKsCSTyBDhvoYm4xFW8c4nhX5U8jyqu2nwPXSdAO0Mo88Lt3X/Q8i6YyB5RCH4IPhr3+P7CVxqBIKVRwTncKXh4x0BcduKmEdFBTspZfbKg7ALAMrTD2rq0uFDVtPWoVDJzXBEhC+1AliC2OyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdmlUpx3; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdmlUpx3"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87dfde2aea2so1135842241.2
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Jun 2025 16:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748906929; x=1749511729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAI6wAKJyNcvB0GBjNCKRrM/BiS1UgH7rkbsuv1BwJs=;
        b=gdmlUpx36Hb36shUP99FOVNIUj7ppIHJL1Yw2HH398A4+DICHYhGNgOVtH3Zs479RD
         p9h/JOXtM3VW++6ipC6h5jdxz62inYI/oTfGlyGcFIc/XyMrirU9sP+des8aiFzquWyM
         cpjgXVsizR4JipPAU1bkZcJXJOjENlCNndJe0veLbFGS1jnZ8dtRv/HZRmigToy505L8
         irSiytGBSLfoYiOQ/aBXeJZFBI0awc2orLbWJ2h47K28TDY9UstNN5gAg/kAQ88TOw/m
         dD5VcCFR44sx2xhpkflgIjiycvy5YQd70XRM2uO6qyBWgNNzj2NsQZSg1bNDLwrBU1xo
         FG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748906929; x=1749511729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAI6wAKJyNcvB0GBjNCKRrM/BiS1UgH7rkbsuv1BwJs=;
        b=mTsHCGGuuY0b0ZWyYzg+B8IUZXoPXpUgyY5nAi9LiOA0uldH6rw2z9hULEc8Dhlqya
         yTaKQ1YR+oOxe98wvqU5ccPwbTBSjI7h1JNWyD2jaGo2ti3PxFDnJQ+L14ZbVlfLM/Ku
         kZDb9iCwqsciB7BtXS2laF64i4zIKp+nE8A736zg2IpBxVcJCLKyoL8frl9xYaGOPSFN
         XI+Je91amoXQeMpVjGTNfRBRJq7Ckl8J4jt4yQiX1o27tkTPr7RXw0V2/CtUMiL/+31z
         /Vq4tHmJf6iMuurYeVHhQxvvFfDDUHHqn6sV7vMOuHY8Z3S9hkqiO4G73oIypl7WgbuU
         ZhZw==
X-Forwarded-Encrypted: i=1; AJvYcCWH7gj1vBrEPIP0C8DLBovPGFH8ykyecbGrRVjEv8ZAaxP/r+1acPvDI8QDXLrTdHgtSNpT5eQ7YMcueaCwNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUk4H+sQ+xlt0fQhn21AsxDgGIZ2No9G8kJb3b2UjPTxNWe/MD
	dKFTw+5/RV4wALLX0lGnzuUV0+p/YK8N6mOHUfDaktxdQDYHV3KAyQJb
X-Gm-Gg: ASbGncvI9tS2E+j6NFCsajDT9RsooaJS0/CcxiUoJhtwU99lunsv651JlL7mPxclWG0
	rQvqMUecClbtPaDV91wqfmATxbwzH+xmH2vAJ3j6vb1kJSMbtlo0nOv7PlUYc3Ug+HpASqw8Hwk
	mXSDG3A4gGhxDzL2t5ltbsRfQ/v728sihARNo8TMEVX8sH1ohegCUy7w3TdCB8ys6C9fV+QZVZt
	cPE80+YeQiCL8FutQn4LqAVHvxW8ZjBpcMbFQQ6t+DHtWlQ4PN8LFT/iHmT6Stq08aGOHHVbfh1
	RbJYk0TmJQcfISR1mq/UNbGEPK0DTp4SZvUo4JZp
X-Google-Smtp-Source: AGHT+IEWwJ2WbYGAyqBj4AaTJGg/EJNmB0wKssJ+QWVd0Pry4sfKxxAyeKHGrTphg2UdPkQ3n9JRAA==
X-Received: by 2002:a05:6102:2925:b0:4e5:9ede:c834 with SMTP id ada2fe7eead31-4e6e41dc78bmr13116739137.25.1748906929591;
        Mon, 02 Jun 2025 16:28:49 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a39014csm6891262241.24.2025.06.02.16.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 16:28:49 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v4 1/3] rust: revocable: update write invariant and fix safety comments
Date: Mon,  2 Jun 2025 20:26:22 -0300
Message-ID: <20250602232842.144304-2-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit clarifies the write invariant of the `Revocable` type and
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
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 1e5a9d25c21b..d14f9052f1ac 100644
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
+///   and no thread that has access to `data` is holding an RCU read-side lock that was acquired prior to
+///   the change in `is_available`.
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
     is_available: AtomicBool,
@@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
     /// object.
     pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
         if self.is_available.load(Ordering::Relaxed) {
-            // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
-            // valid because the RCU read side lock prevents it from being dropped.
+            // SAFETY: `Self::data` is valid for reads because of `Self`'s type invariants,
+            // as `Self::is_available` is true and `_guard` holds the RCU read-side lock
             Some(unsafe { &*self.data.get() })
         } else {
             None
@@ -176,9 +185,10 @@ fn drop(self: Pin<&mut Self>) {
         // SAFETY: We are not moving out of `p`, only dropping in place
         let p = unsafe { self.get_unchecked_mut() };
         if *p.is_available.get_mut() {
-            // SAFETY: We know `self.data` is valid because no other CPU has changed
-            // `is_available` to `false` yet, and no other CPU can do it anymore because this CPU
-            // holds the only reference (mutable) to `self` now.
+            // SAFETY: `Self::data` is valid for writes because of `Self`'s type invariants,
+            // and because this `PinnedDrop` context (having `&mut Self`) guarantees exclusive access,
+            // ensuring no other thread can concurrently access or revoke `data`.
+            // This ensures `data` is valid for `drop_in_place`.
             unsafe { drop_in_place(p.data.get()) };
         }
     }
-- 
2.49.0

