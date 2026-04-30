Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FD6175A95
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 00:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777510193; cv=none; b=T47LrOKYpMLSwzk/j+THLRbHl2dKSuLpKdgCXW5loy+h2LpVPg5pYl2bwdVJCq7SGdc+UktNqDqDs9K3T+MVSaay1x7ya5Qxo3SvaBkT7ZQI7SKKyvXh4RnW8zRdH96oBeX/vD0hFn/YNGfM4gN+yrtZU+RR+kk/RCV3NulGLCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777510193; c=relaxed/simple;
	bh=mKzrcvddoEBLoLAxv6IbWjadFKzrsk7xDstB8thFXC8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=e32za3oiBDp/9EshAXSBmRikLWiH8Kog/SqqXDqw0s305rplh2aI/F2SaFCb/YBTm+8hnQ51phhsFRKe3R/9ek5q5e5/1ars3apB2+Abzd3uS5dlPt5GRykBkVr4QubjKIyE+Ho8rYWLDB7Cu4qZg3jaJ434bl9uQAYgrg0H/rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeDgeaif; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeDgeaif"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso120763a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 17:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777510192; x=1778114992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wVPXlO+qn0l+OSmwg7LhkgsAr5axNICfzufY4UApWCE=;
        b=JeDgeaifCZCdHJIrDZu2pWsv6gUQ5FVmHwv5YqPTCRtRdJHCcNPiyLPhPrFp4WsjoC
         jAbDO3yYGBBa6Jp7zwntdftXmxDsQ3p4V7N3GmqG0b5bfjoSecro0B8tokUXEjMepnXg
         MnEwq/LGft6rHmRuQ4qx1sNkSSZK3BKaU5mUZmsD1oOoHP/VKydcoTTk+w15TfDLFSrL
         dpAPBj/N6HhVZFyWbupw1LtsdduHO3wTCfL56X5k+Z0UfqJosM4lpAkLKCmMzFzJMENZ
         7u/7wZ7WCTkikSwZXpujlY2v8oPCezDrUeLhpUT75TUJZILPj1I/WVJ07yWeEF448YKG
         WO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777510192; x=1778114992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVPXlO+qn0l+OSmwg7LhkgsAr5axNICfzufY4UApWCE=;
        b=oLXUVwtiuM9KdET0z7h1aBWv8AX2fQ2CtIPiJfFzNOZg6wXYqOhVwMRCgRrlK/fPIo
         xRcbhQrhrSHBT8hAVZIJ3B5Zjp9toG6yFn3IQao6CUVPteyTNqhQiMLsBsNmI0f7hBB6
         2mHI0K9AGMlrVqpHLRI4vMyFHgt33uQIVoQoPwkVPZpWuHjOrdIXrdbKWtp0Yq3r5Hpq
         5z9GaBkHc1dqUZRoMI5haqZQ5qavutfPi/wb/vFOMpGreJyc9f3sZAT576grudM6XtDv
         5zf9ZIFQD4iANdKlotTspmV0wrG8ZbjCqFzfvbaEc8L/zQ4iwYZ3/2Z1JxWkUSXVzGXL
         ECzA==
X-Forwarded-Encrypted: i=1; AFNElJ+2ha0Z6Q2Cf8uH/n3vcVY0DLI1GIowHSYA0EG7GWGwiNMDtEKJEpOkGAg0s9VJd0VwY9qT7vhZvVduA7T6GA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8uGgQ89kCFY44w6bgTzGHEKi160rsMmTkboNsgQ0A6p22o9/R
	xpP+4epVZVF5teUoOtezW0XojMYIG9a2tOOZ0NDsb+ckcOt5sTgePVrkhEVu8HrN
X-Gm-Gg: AeBDievftJYnD9+0JtyJ6PjZ98XPsDKrBoYSQEsVaG6navBfvgZZMFrXp2Twk0jnZO+
	5VxWezRZD/UXus9OVwORvkeIZb0YKz9q1MnrkdjfDLRXt9aeG3huTZoXyPkHoPmqv5EFsZqMG5a
	XXno/sXMdEuvNKEjyxI7AbRVSFicpAjGdQftZYdCM0JkLFUWxARPVXvKE+eK/NDZmoA+Mouzh4Y
	rjoqEgK/h+TG8GF0enQJ3tD2c+zpL/icX4r4a/wCPZyMIkSB7Z5dOPM9fzXtZ6f0OMbbig4XVG2
	TpeJOrXHIMtpdkm0XvfCfZ8ir2uEmGggYX+oloSM73IZQhxinLaaIUsKJv0aVuHIhLl61GjLx8m
	XJJXqh107oXVyUe/6FHunFLQVaPyc2LsYQufJCv6tSzy8X+FotlUEd5pZBadkUPa0vpNxyJcdMA
	57NXYS0eBpjlFAQUEbbFWIXwtv7T/A4+taY/85fXYP2wjN97nDFio=
X-Received: by 2002:a05:6a20:a11d:b0:3a2:dabf:feed with SMTP id adf61e73a8af0-3a3cf561bf0mr794737637.3.1777510191841;
        Wed, 29 Apr 2026 17:49:51 -0700 (PDT)
Received: from Nighthawk.localdomain ([223.178.220.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd64f09fdsm3075997a12.17.2026.04.29.17.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 17:49:51 -0700 (PDT)
From: Sagar Taunk <sagartaunk2@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Sagar Taunk <sagartaunk2@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: workqueue: replace SAFETY TODO for `WorkItemPointer` impl on `Pin<KBox<T>>`
Date: Thu, 30 Apr 2026 06:18:56 +0530
Message-ID: <20260430004857.38281-1-sagartaunk2@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original implementation left a `SAFETY: TODO` comment on the
`WorkItemPointer` implementation for `Pin<KBox<T>>`. This patch documents
the safety requirements that make this implementation sound.

The safety argument relies on three guarantees: `__enqueue` strips the
`Pin` wrapper via `Pin::into_inner_unchecked` and leaks the box via
`KBox::into_raw`, producing a `*mut T` whose allocation remains live for
the duration of the queued work; `work_container_of` safely reverses the
`raw_get_work` offset arithmetic to recover the exact `*mut T` that
`__enqueue` produced; and the workqueue guarantees `run` is called exactly
once, making `KBox::from_raw` sound.

Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>
---
 rust/kernel/workqueue.rs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 74c59f2b1c09..f31412fca303 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -881,7 +881,12 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Arc<T>
 {
 }
 
-// SAFETY: TODO.
+// SAFETY: The `work_struct` pointer passed to `run` originates from `__enqueue`,
+// which strips the `Pin` wrapper via `Pin::into_inner_unchecked()` and leaks the box
+// via `KBox::into_raw()`, producing a `*mut T`. `work_container_of` then safely reverses
+// the `raw_get_work` offset to recover that exact `*mut T`. The workqueue itself guarantees
+// that `run` is called exactly once, so `KBox::from_raw()` correctly reclaims ownership
+// of the leaked box.
 unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
 where
     T: WorkItem<ID, Pointer = Self>,
-- 
2.54.0

