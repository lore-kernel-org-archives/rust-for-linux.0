Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41CF13D53C
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 00:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776557507; cv=none; b=AKop2Ow+fijy2ivXwEt9wwMfdksjmDWCsfLstlcVNO9djYMcuf/J/jU9yAAYfNhDBL0Im21ezv0sZRENk3L/tMY3aDsoB3wR5S8f9E2iwR9ZzythFn7ERgTHhkh4vdMp+oimDUUQWwo/fR1iM+obIb7f73HD2x+bY8sImuv559g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776557507; c=relaxed/simple;
	bh=Z0wdn4nJ2N0dfCW8ntRd8nkQMY6O1kejdCkZ6jlPQUY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AMdS8HqdNs9P70wndXhEm+0fvhiqZ2/ziIUUCrKUQnUiURlbQC/IV0tL2Z+6VSfXJXalevKw6FhSlJVuAhZqpgELQe6uC9+js44oz+ICAunMNqUel4IpLMchtaXnp88okK4tb4eWewB4BH29kH5LivVn83QNpNL0ktaYqhRIdgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lo06x7Zm; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lo06x7Zm"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50baafd6c4aso22609111cf.1
        for <rust-for-linux@vger.kernel.org>; Sat, 18 Apr 2026 17:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776557504; x=1777162304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uB8jFncCKEiB5ZAD6Q612C23o2c/bEg7RfuQUlFgPu0=;
        b=lo06x7ZmudcrOotE6JORN6vy5CE4RuJIO80dLZJGGtqzf3wbgcGNeYB1fsjWnMOn9S
         xRFfnOoh9KLRymVOSgfR7js6+7qbh8k3+YDPYchNzUyyoLL9+J5Il2JqNPqIymqYUfzS
         xEDdAtr0K7PUJPleA/nBK4We91QXShBBBGdloBP639SPj53RcAc5WAveR/idUDxnIzWB
         dkDJ1thr+3fdjHFSqBnkIzaAgYEyIZ1j4j3VXa0ngmYG/8ngdNFOlEoeezksgriqXp5V
         eo9OPRJwsKrikaxrsivWRWtPTdZICK8EgTKUdrz3B5GsetJrS15zycz8tpcjl58y4qlE
         MlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776557504; x=1777162304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uB8jFncCKEiB5ZAD6Q612C23o2c/bEg7RfuQUlFgPu0=;
        b=J3JHdv47qwhezcFk1qY1Wg1JlUMvoC26pPhwSbU7Iw9mJtdrWjHUQ1bEc0sK2WRIID
         cR/5XxQouYXAfTvRhvQ2/eTa8ur1GD6x5XgLrwOoZU79KjfjoojAZOPRCnwyj330on7t
         EVXGvz40VPABm4ZfIMWEYQ/YKKUfYV2o7as7G8zRZdhx5TFlsAYqprLTy9SXkQglxv+u
         lHphjnIfDgCiJ5wzWnC8U53fw9tM/0lxiGK8gqXwQS3G/09oi6FpN/Mr8ts6OZFLTMs9
         th6x9O/lWOuGaCER/3xlsT40xwlCFZtpbZ6+N/ic7xnF9Y3PgrhVGZG/h7FCk16Uou5h
         rSuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wtMO2iIy/QKltI/8D+EWZj4JUMJD7uMHysIlTiphNyRhmywdzPE+13oeNrPMgv9eEOpifFjFCs4WjfpWZQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOurlONHX2KTisw/AykfE92q9P0fUNtqrRHKFddCyJPabEF1fu
	9p52fbMMc4nGqdkFfQdnt35PXMRz3sMn6mtE392itSgPSXbW5KajVeJzhbj+gEOWykoY0A==
X-Gm-Gg: AeBDievbqaLpURxiCkFj45H5Iqi9ZU34KtPFZ+RvZZhkvhENlkYUPrtfXZP9eqRDdBB
	zk9TMRwoKj1raUXLGefmoek6eL2YyQ0SrOmxThAahu7ONN77/GwjdoeIK5c4SqDjhWKiMRZX/33
	2YKluDUWY7mse7enp4iPuYKzd+H5dMhz/x6rJZW7NTFCtIuKfRrUAsm8+NpaaXAxdeGtcHVifvW
	EzUxW5vCx2VcvA6/5xUCSuiHl7V/attxX1uOv3KYOrEjRydRImGSZ53J9rmkNjQlxUCWFvivUJC
	0AXSZHBzxvP1v5jsvatnjxzimw54f6NCOyG/8kfQ/+TSXDTnpB1fnLq6yjkakspIilqKES6iP1c
	YBDpttzfgiX25aiMEQbWMgBBCbL3Ouf8FyWAyRsBhFNDBbaNuXJkxEBy5hHFIFMPVcJKKA7vYAb
	6R37ZlzdC6nbJlrA3Zmp1obmM4T+lPh+70oXiPhz3keLGBqJ9NEikBj7rShumoyWh9Gq7VxN65u
	FcCvdPkOOm8m9Dad6YAYaH0K+6ZADhWU3+Hbb8=
X-Received: by 2002:a05:622a:429b:b0:50d:8049:2f22 with SMTP id d75a77b69052e-50e36b865f5mr117283941cf.3.1776557503734;
        Sat, 18 Apr 2026 17:11:43 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02aec3a3bsm43460456d6.49.2026.04.18.17.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 17:11:43 -0700 (PDT)
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	boqun@kernel.org,
	ojeda@kernel.org
Cc: longman@redhat.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Ashutosh Desai <ashutoshdesai993@gmail.com>
Subject: [PATCH] rust: sync: add #[must_use] to GlobalGuard and GlobalLock::try_lock
Date: Sun, 19 Apr 2026 00:11:41 +0000
Message-Id: <20260419001141.211935-1-ashutoshdesai993@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Guard is marked #[must_use] since dropping it releases the lock. GlobalGuard
wraps Guard with identical semantics but was missing the annotation, so
discarding it would silently compile without warning.

Similarly, GlobalLock::try_lock was missing #[must_use]. Option<T> does not
propagate #[must_use] from T, so the attribute needs to be on the function
directly - same reason Lock::try_lock has it. Add the explanatory comment
there too.

Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
---
 rust/kernel/sync/lock/global.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index aecbdc34738f..7067bdcca9c2 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -85,6 +85,8 @@ pub fn lock(&'static self) -> GlobalGuard<B> {
     }
 
     /// Try to lock this global lock.
+    // `Option<T>` is not `#[must_use]` even if `T` is, thus the attribute is needed here.
+    #[must_use = "if unused, the lock will be immediately unlocked"]
     #[inline]
     pub fn try_lock(&'static self) -> Option<GlobalGuard<B>> {
         Some(GlobalGuard {
@@ -96,6 +98,7 @@ pub fn try_lock(&'static self) -> Option<GlobalGuard<B>> {
 /// A guard for a [`GlobalLock`].
 ///
 /// See [`global_lock!`] for examples.
+#[must_use = "the lock unlocks immediately when the guard is unused"]
 pub struct GlobalGuard<B: GlobalLockBackend> {
     inner: Guard<'static, B::Item, B::Backend>,
 }
-- 
2.34.1

