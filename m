Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803CD801
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Jul 2025 00:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751934887; cv=none; b=TdlCiveL5mBtDCdvfKFzX5911wNFZ1ewQC0/K6S1A5pAYB93Mxt9uLhcmGX4mvwJhQ6BHbTA8mWMl5Gtkh+0o6TGRVx+Tc+3XBkgMZ6bpDyTafvH7e076kHLB51HiffdbqrUQpEn56J2MI9BTArg2JlLt09N5y9GZCjSVAdB3UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751934887; c=relaxed/simple;
	bh=aXhDrncXzkz9GHMnyXCn2fmSGiV/F9Lu6qT6QWS8w98=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HzS324zXIKzqY7dfvFOkZ5IOCpwq3InIvICaMpIE+U7Id/dgAUmNAFaQgzAoM64dpwnJY8gqutjT+PosbqdT8B2tXU/T9UwEgWhtauE+PsvwYkRJRg0r2ptmzOtwcqIfnywgvzqq821NZQaxY9GYJBmvFsKLLKgU9CVUZHM0DSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUfZfkou; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUfZfkou"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-702b5559bbdso19300856d6.3
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Jul 2025 17:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751934884; x=1752539684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qd6P2w9fPpKBQyi2ji3yJRm3qP/22EH3YT6dc+sW6rw=;
        b=dUfZfkouUUoicb+HsuYco0jluqsDTMrVvSBOx4VOenZUBnNEMr/ypCOA2BJehFbnNI
         XIHLTct0JZfAZezUeiEZz2T7EBD+EkGDbpHvsIFY0FS37QoH6T5TyL98I/oWdhsIOob1
         wfEgAYRKKqdMJ9YNZVHo4ZIOr9i99o/FMuvvLw5CH+ndvoZY8cn+YiI2+50YTr3k4qsC
         kvHTa0slIqcuYEo0NCsC4OTeC+823CFP6ssK5g134HRcmSMojeOT27vF1xOYH3MbcKDG
         9YfleWJPDB6dWRACE1v8EE3OT5wsHQzxV09B7CQron+9hd1+dlqZZF42lZeueZzsFUEU
         lm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751934884; x=1752539684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qd6P2w9fPpKBQyi2ji3yJRm3qP/22EH3YT6dc+sW6rw=;
        b=PFsJFmHyKmUUkW7Hve1d6e0mVaWG67E26rMjDkzBC5PKZs24/xSJF2SaZ9qYRYY5yW
         bVr8POyHoj1zoMqqKwuw1OKcx8i788Un2NWq22Hmu2pVHYn83nYBA8z2Tb4Cp+r/jahm
         NX8F0CB+7NcpXuh05ylqUBVhb+nRsdTRhz51va+Pif30pBPOnENu0HdsiegCjj9kB/2c
         LdORTrh/0lGgtaX122KQ/l9bR4HVA+dsAlCbkcf+qqbDDebFtRi5bMRcOGUJIEtHu5GA
         ZYSIjLrrWoTzYkfKx7JgECgbFtbjGgIqM5I8nHNm0mfdVwXedbsX8j4hgGJbAWD/454T
         3+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKhSzS37i64xHfhvor1sezS23XB/Z0OSMGxexI4PwkWAJvhAYBlHvvfssR1WkapGhbK8i4w7dFMHaPEcaFWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2VhdsWDuPtmBaD5Qfcuhakx9mtQALhNuwD+r+nLvJKlhyLipW
	SodSZP+SbHs9fo4fGjH9KT09TFzePaJlkru4vHCcth+sR5eLDSVC3nXT
X-Gm-Gg: ASbGnctyzm6lWhIGRz8iFDnQEB725KzDcL4BLRw4KCiH5JnC7BqUxucBvZJbVE5wvTg
	3Lbd3eIh4N8FZZTWeCoLNdXmPhKkdMZCAX9QvBDZ3RHQxx4XdQqq61TQKtorT+qYt9aIlSIcmQz
	gJ43I8/B6sdscoIApymYSu0yG0/ER1+g8C51BBTstUfnWZMQhkDALsFcW9/QJtY85TAqA1wL9Uq
	cIdLfArsQlhFvcPf/zOsEKUgR1W67MNH0PCAgZW4bQy16P5MEhbnzNm5LME8PGf1OzcFvxbFs+3
	2JevkQQ+S57XuIwq8SEfgPhpJlhURBF7IU9IBZDsevbbV/zy63OJ49V3hlE=
X-Google-Smtp-Source: AGHT+IF1O0rpHx+j0LQN8YnOqKI77l+ZdzGqFr9r93O8DHqnNwpxFns/PzK2RM9QLI9ozKgIFI6Ymw==
X-Received: by 2002:a05:6214:5d90:b0:6fb:107:f618 with SMTP id 6a1803df08f44-702c8ce6e7emr168278526d6.40.1751934884312;
        Mon, 07 Jul 2025 17:34:44 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cc751esm68746076d6.23.2025.07.07.17.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 17:34:43 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v6 1/3] rust: revocable: Clarify write invariant and update safety comments
Date: Mon,  7 Jul 2025 21:33:37 -0300
Message-ID: <20250708003428.76783-2-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
References: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
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
2.50.0

