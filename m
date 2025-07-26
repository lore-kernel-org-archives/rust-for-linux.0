Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84661B4248
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753554970; cv=none; b=TthDTlNZy9QG3KvzOYRkXRnB7oupVtX/SHgto2vgMJ5eHJKD1H2ZkLOu2dkCX99YdwDN441ti68ZeIBzlUlZxUSqkftnY7VWAN/gLdODz+k7l5hpOdOcCWKvHe5TQRvFzGlhpE6FWxdXmv4JenEtPzfavHLRu5oPcIqMDkx2YiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753554970; c=relaxed/simple;
	bh=n7tGnkipya6k3NliLrJGG2/eg7BTBQDUoO66XHRLm08=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uYLzb2VthjXTpdVQAiOkfYMpEzcsVnDE7eUej4Z9VlQKp7ulcuqZphlRWGlVjiMAkrzvAH6JNJT5C1fBbHv4sBclLOnuaAW+ZtNtbsiC68OXK1w6G+XaDRlTrcAEbG353pkEPrBIGum77VC+Y/ITu3jnRNltsUOD/bXiFsAl3r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0x8CVS0; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0x8CVS0"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-75ce8f8a3cdso2083344b3a.0
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 11:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753554968; x=1754159768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S76G8dgyFVKhTbuEhC/Ci71tjKyRi6JcAwTXIvAHdN8=;
        b=C0x8CVS09xJT+c5Nrnxgpf3ZZi0ce7oYW3rw7hHLHLbSpep6g0JK8yPx+Orbi8bfOg
         8DYbknl6Md9IJAjES8AZlpKDD2OEG8x8KupekY5l6qCnfIi9+OzOLREuKJ6ozewv3/7I
         eU/wxdCxMjjMW24UuabEhVEFZ1cws4Hw6ZEFgfp4RmyvPfQmrgPRlPeWNrpUN/agMKgO
         m/50Gc2SqeTKSlU6H+nYRB2PBNEnxDgfCqcXKy+Oh/wjRHokns2P8CW1wCouqvEiy0O5
         yNfd7tWQJO6aDV1exckOM4z58aBpLog2kLQa5R0Hay05oYY5y4c2z3c+7AGR579MaB9n
         sC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753554968; x=1754159768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S76G8dgyFVKhTbuEhC/Ci71tjKyRi6JcAwTXIvAHdN8=;
        b=RViD4D26EeBciFyAj0lQMhpOMCd9JXGh7ix4rh1+cKIjWflkeU/MO1aSKdmBNf9Jfu
         LlTy9TphLevW2OWW2qBi+mtREdFaM3Q8mIj4zKweiHes8FoEkFEGaMXajDZZvAd2S8mf
         sdvF3idb+DnblP3zF/uk2+hW4W1zZmGesgCXkuyqPBg1v5BebaddWWIH/E7w/kuGJUDq
         42b/v97zpf8t+DgceFG7v5RU4P8oFAaGGy1QEZZ06O1UdJnLWRL5MIpjoU95eDEcuYcp
         x+rBkc8RxEzJ34IgiJMVmJR3q/g40nR5P+CkZ83nLRNQ1o+67pHExR7YrhHgDzSMCMqD
         IdIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoZNX1D8NZ+o4xaWkrFlWWToCo7OIM/zVPOnHkEL+3UEkHZW+R23mYW+J+N3Zi04R9abyuccajO7auZNV6bA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxad9r04xdIfHsruhyPG3u3onBUFlO/3tK7PGzP7UOUOo4m02z/
	Da1zEEVT3zs/NnIdBcj5qaKjbwvmMJNuEbhxD4IEF7XRSAvST8CTjmKc
X-Gm-Gg: ASbGncvjB8n1j+1ToJ3ydOXkz45JYBDMnWtewLv2vMoma6dvolyGm0evaTLXcvoeBcB
	nR7Im6BFrvGbBKqdaI7X8+UTbfZAX2VWsn9CpQZ8OMKM2fqZa+vuiiwsDJLZZYMaVd/xTvqY1IX
	lW69fLc3vJicEurPzQh/Nra52p4D7xS3d1ac52U53ITedthhaP03JEXyyzTitAI13Wy7ukg8D2P
	NzCqjx2UmOgzZ4R6ePoLDcwn7bZw0XDXIYGIWCaZJtW1Xi7iqvdZDksn9ZnJLURZsI9BGUG+kjs
	CJja/ufs25uBF3rzFFutiLD0riS2VxoHnGBIn94V8YjPEWZ9pd60xlkl61RHtf69p3p9n9mpQiR
	B0Eco5IJA
X-Google-Smtp-Source: AGHT+IEdnZhaD742thOMOTP2dul/XREH0xH+vZS1mJTRSN+edUVelaNKGOxLyPGgS40yoANrgzqVzg==
X-Received: by 2002:a05:6a20:2d2a:b0:23d:7b87:2c88 with SMTP id adf61e73a8af0-23d7b872d3emr5663097637.9.1753554968252;
        Sat, 26 Jul 2025 11:36:08 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640881ee75sm2169295b3a.2.2025.07.26.11.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 11:36:07 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v8 1/3] rust: revocable: Clarify write invariant and update safety comments
Date: Sat, 26 Jul 2025 15:35:01 -0300
Message-ID: <20250726183552.23098-2-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250726183552.23098-1-marcelomoreira1905@gmail.com>
References: <20250726183552.23098-1-marcelomoreira1905@gmail.com>
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

