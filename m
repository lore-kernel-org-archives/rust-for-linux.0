Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DCE217673
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Dec 2024 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733402214; cv=none; b=cSiV5dKF1hZSTo8Vm9hNk/5Y2qg82Ye/0xZDyqv/VwAoTHkNTOFYIhq2vwVRB+SB/PKNhr4OV7lzcSMA9r9lH/pmG1IxhkjQcokJ75iUH3t6u+gT5XpqvNN61i+T/e8si6b4EyHSHjAR1kxjYSY/0JlwLVwH2CeWTpofDXRGH84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733402214; c=relaxed/simple;
	bh=7iQZviBWsipCWsckJ1L2w9D6utBoX7XmVaFR1kH1NlM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=oTccMZpyDR9CQmefT/zHdGYpqcWu8hf3nVLf8+pOpdWYPv0J/c39JzYyzZpiN+QmvNuW6fbiuqLE0/OV8JK7NtxC+SHHK4kgEMth9o/I3jbi3Q1jTS1GG+8gbK1P1BCHQ3noksO61ILQHWx7cItuT6UAl8d5RqmSCTOPP2MEraA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xuHLzA05; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xuHLzA05"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-434a9861222so7583905e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Dec 2024 04:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733402211; x=1734007011; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vd2e/+7e53PEmvCulx9h5rdqdJTtvKXM/ReO3/927u8=;
        b=xuHLzA05P8WkAyqP51U0dAe/HKz9MZDK0M3bXeD1Js6GMNjA2YjpUnwkk/RT41EIHY
         8LSEt6sE4Cr5juL58Elq4B+xiR8E6c4uXX8TCUm/6zXwOyzUl4MjmyHi9EhPwus1FGzx
         N364NxEoC42jj4/db/xjUDEc3rSOJIkgk4WoZqSoy7wV4VfSvZCRxe1yjx7cxjELAHqW
         OSDOr16e5YSK1HApY29pRkcwjdDYx8bg+Im6pKtGnA5uJWNvaloovrwPKySSzIciLHlA
         3RUbH9dMJ6++sZ5PjBcnR8+XMfDBd/14EtmY2/6b+/cYtdNLDLhAQe9eTeQGYtupfrx6
         xv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733402211; x=1734007011;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vd2e/+7e53PEmvCulx9h5rdqdJTtvKXM/ReO3/927u8=;
        b=cHoDXUDRDHGXkxsDGuEAZnZV6vcQYh1wjOqz5TTehbm5M68XYZ+vQ0BVwaZOI1jReK
         ZtFNqJQoRY0dMwYqoQEXzvyzRnNxsVGaBH7lzunbXl13w0z/r9v9qqobYGlgWTGdqgDg
         UOkamXCPaXXVnUaCLLN9TtRNAOGP8FsS+GOivTGIZ6uYP48ve6kRcEepI0kPTC2HSyPd
         ggShyehK3s1jX3UUJnD1do+5Vw4k7ZlF7MotoZXQyClmLLxiLav4ZrfDP0+VRI3uTtFJ
         cO0bbAvTMO1pVmjHNYevIkUEfND6Ng+xDP/lLxiUw9Juym/GryEL18czgJ4bGIXWmodK
         f2Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWYziDdBPhUV3uwhcYY7PfOXX9xOim64+GIhLjmRA07wjN2imoroPhohlUX51A9B1AR7zBdrM4gZuoC0gADQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbzk99qFRFaUoJZBQiudeWxnN5K9NQ688tSnGztYv56qSDk+fx
	Fr41QSrzEXnrpOkARPZebltzEcIAKNweS/4jAwbDftXyugVTQgSK8lLh3NgLrT6lAGyTdojReHK
	IkTJxNWz+HCUKyQ==
X-Google-Smtp-Source: AGHT+IFStT3/JjmB+ZduzLED9m5mcG/6ApdoyjMwuoRZ3NBOmr/f6c52FU11sp9uLvVjDAHF+X0r73Z9cmx8MnQ=
X-Received: from wmbhi24.prod.google.com ([2002:a05:600c:5358:b0:434:9939:10da])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a87:b0:385:e4a7:df0a with SMTP id ffacd0b85a97d-385fd436393mr7502559f8f.54.1733402211456;
 Thu, 05 Dec 2024 04:36:51 -0800 (PST)
Date: Thu, 05 Dec 2024 12:35:51 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACeeUWcC/x3MQQqAIBBA0avErBtQqYiuEi3MmWwgKrQiEO+et
 HyL/xNEDsIRhipB4EeiHHuBritwq909o1AxGGUabVSL/raBMF523hjpcMiLpa7XhpSboWRn4EX efzlOOX//X3clYgAAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2238; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=7iQZviBWsipCWsckJ1L2w9D6utBoX7XmVaFR1kH1NlM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnUZ4ptyh0m08QFCk2CLCvc6ekmeolvC6xwJJmk
 zJyrwSRTHWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ1GeKQAKCRAEWL7uWMY5
 RohGD/9hgHc0FMDO7Bk0Ysves93jeDpXLwhJe5VEfErnuksTCYpblaUxw+xokgWFpQEEHlXs+3z
 wwgc8tMZL4AC3b6OrIQ/kR5sFKKMievvs3kHrHAFnDfDjjEbry+llhUNuhQc/Tk3ZMg1ko39Ica
 lGWpMDJYPzlo175jqz8kotzQGcwPR3HtiOrqM0aZCJDrb7N63O9pl1B7/bnQoFSv3IwmfLrR+Zp
 AmlO7uSbfdLCP7DXtBz8D4QMBpHnFnDl5HYsmNotRyV4yy39VIBkhvjbMkXiz9N72sutjmmI4tt
 fVOp25hNU4r6CfhkdprQJutbzqSiZgUgrETOIhS4XhLMeNg11hh3XbdiYxYrTaIM+WcDu1ZANE9
 jQ5NhZYGsjQ3wmmksy5dahx4s89V98iFVZFbFCknA6ayth9QNIWzy5AM3g7u8cuc2ZrZbgHzVIv
 zI/r4cTiDUYYtKeanAI4NfUJjZ7cctbBabFAeo6nbC4hIJmFY4hxuVHPAlaeQ6DRNqfdDWRCmk8
 5TAih+8oevM/nDOt2QnavabGy01XIWlw83g2WguxFDBZbD7i3bmQJsjpzY0gFLd7H3d6rt9IMUV
 p8K84SyAsgbOwoNnxbj2qfJaOKw6qZTB0lANW0tjyFbOYzIs+hEivCZoda9g1pzG9eW5R4hydVY c6H3yHRRt1IY54Q==
X-Mailer: b4 0.13.0
Message-ID: <20241205-guard-stable-doc-v1-1-a3f8249cf4d4@google.com>
Subject: [PATCH] rust: sync: document that Guard is not a stable lock guard
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Most locks in the linux kernel are stable, which means that holding the
lock is sufficient to keep the value from being freed. For example, this
means that if you acquire a lock on a refcounted value during rcu, then
you do not need to acquire a refcount to keep it alive past
rcu_read_unlock().

However, the Rust `Guard` type is written in a way where it cannot be
used with this pattern. One reason for this is the existence of the
`do_unlocked` method that is used with `Condvar`. The method allows you
to unlock the lock, run some code, and then reacquire the lock. This
operation is not okay if the lock itself is what keeps the value alive,
as it could be freed right after the unlock call.

If we want to support stable locks, we'll need a different guard type
that does not have a `do_unlocked` operation.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/lock.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 41dcddac69e2..7eab46d4060a 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -159,6 +159,17 @@ pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
 /// Allows mutual exclusion primitives that implement the [`Backend`] trait to automatically unlock
 /// when a guard goes out of scope. It also provides a safe and convenient way to access the data
 /// protected by the lock.
+///
+/// This guard may be released and reacquired with [`do_unlocked`]. Note that this implies that
+/// this `Guard` type is _not_ stable, that is, holding this lock is not sufficient to keep the
+/// underlying [`Lock`] alive. That must be done by some other mechanism such as a refcount or
+/// ownership.
+///
+/// # Invariants
+///
+/// This `Guard` owns the lock as defined by the [`Backend`] trait.
+///
+/// [`do_unlocked`]: Guard::do_unlocked
 #[must_use = "the lock unlocks immediately when the guard is unused"]
 pub struct Guard<'a, T: ?Sized, B: Backend> {
     pub(crate) lock: &'a Lock<T, B>,

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241205-guard-stable-doc-efad6812d0cb

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

