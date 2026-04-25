Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2CC3624C1
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 13:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777125457; cv=none; b=gzs92PSQmYkSkNJJ+0ipNKuoTJDyLuYSLCPHkaWVKtdzdKQS1lRB2r74oEPNoRr4Lw+0D2c58chHvLZZWP+1UCVjDT/qkRhH3Us5eMLvAT/WQ3YQ+VjKq2T51zGN0HHPow5SBKzarGnGuSCl1HeMnGVogQB0KmJBa7/M061qLXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777125457; c=relaxed/simple;
	bh=6q6QibfaDrRNRHt69KoOIAl2M88nD324TRC+BfeOpWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SumAT8hz9kHZ623j2Sdc7pXE+qqtBZIW9rE7CtPIF584dxjtuWSZ8iukiyOWi4sfujbITh7D+mEIoFlMRWyHzYWY//YnqayJ4EdQiPo6WofyOgN+VhhVO52LAwD6IHML9ADv3J7J4SXLrbC7b5+aUiRugxuhq8A1//s3z7A4TUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrRUWvnk; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrRUWvnk"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f83bd32efso6668108b3a.2
        for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 06:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777125456; x=1777730256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=je/OfPs9aQIQ5RP7OJEYodKDzXQthrzLsRzK6wB2b4Q=;
        b=VrRUWvnk3MXV15nu0Qu1oCGpik1KGZ1dSDRZNWIraevofMTJ5HstFn45m5H3MNHtt6
         MpMGXhXOuGgjkDmkwDFEXGPopu5kPPmYa84jg77RshIGdlkA9TqrTnj+j/hMiGzDznWO
         l2gyCckm42HQA0CHQ1xGCOR2CwSABuZylCOXmVkZbjj6kijiWiObi8zYn4AKDi+ixQqv
         YJnZ5G+9ya4jKwIPzeQ8EBVyu+lhYw3uYCy5SydcaIXqkukhf3WFEVMBk3hDPEbxHzme
         BMhBsa3qHHu5WWUHERS8x3elCELBFtFlNq0oCzzMXpJ1xeBFKBOP3xRMS6kXOm9NzJcm
         mm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777125456; x=1777730256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=je/OfPs9aQIQ5RP7OJEYodKDzXQthrzLsRzK6wB2b4Q=;
        b=dw9DQ3CJ5efPVKMxjOUv0IxHWiPWXTrS679KyjBdSr1TY3v6fYaMBlAHxe4PX+RYd3
         EnlCjhXvBx/PrrSPhIVldWPluYHSvlVGDEHiHQ+CFbhqOgwS2eNlX+sl9DPqAD820uGM
         oCL6gP1LArvVHCOVBRHFthRr0Om9RxsGwzgxzxMkGtgBUt6EvoKkx0peaOMmNU8CqzYC
         6PUlw3MtkF4FBoAd3FiWbql4Smlw10hKcuZvZZhHevO7pgibIlZkDgo6R0xgu0e4QVHB
         DCn8cNfxEEkFXxd5t8GdN0jyKxYbEtKRmb24n66UX0NEEokJ07lIgdMKaJDUv9hdI6ma
         vxmA==
X-Forwarded-Encrypted: i=1; AFNElJ8gQ3GAHCRM4fvl4jsWMrz25QQo10qu5rZC0pgU4eJhM2d/dSsfVtCKKSFBZ3aiJKlkPAQGsvbS/0YfQHwIPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8WDClwmuynhqPQ+ZIrMcdxL1VdlK8xTahSmfJEzeOx5ha7110
	hQ8pUIADmvG0a5NgS9melJ6qdFD/bQMWhpnJA5TOKi9tDKVR43/I+X0clk2Dv1hnv1bHzA==
X-Gm-Gg: AeBDiesUbvA1HDNDYeZufpWf0NieXPpM4LhtfFefhridWqcX8RFDiVI6l24/HNi0cqO
	CHZy1y6aLMBi6BDMDJW5PQ+/Gx47UMwcVebRdgqRHWLhf5HDMbtYRoI2E7M8Y1PVeVXvP0ivnMW
	Znc+DHlBFizUXMkBwH5rRRl5maOjJ0gmReFVH7QeRl7BkZBFocbfnqTB1Co2iGo80ueW3csrDVc
	SLKxWTk1bIdgMJdZSs+r/slrdIa3t2zR3fMlTZVscPq8WwoFD9Xpv6SXzMU94vxY8lPLNmpHGM7
	DYMBO6bczM2vD8WDutfjA6ti36WHuuiyj+niD/T3AAwbakycDhjwVwPSnXc4tbHU28Cs2U0CAZo
	eeTPqbEOLOtj+l0eDthGbwAAIGsc+5w6ituGn6bU7IqULE8Pi7SM9AYXKxp0pAtPcJ6wC/MJyU4
	WKX4TuoMJaKhd+ELNlLlcdX2H5BrcQfyvFmSP2GWbgIQMr0n5VEO4=
X-Received: by 2002:a05:6a00:3cc8:b0:82f:1b50:d2f2 with SMTP id d2e1a72fcca58-82f8c8335fbmr38917499b3a.18.1777125455828;
        Sat, 25 Apr 2026 06:57:35 -0700 (PDT)
Received: from Nighthawk.localdomain ([223.178.220.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0307esm27071088b3a.53.2026.04.25.06.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 06:57:35 -0700 (PDT)
From: Sagar Taunk <sagartaunk2@gmail.com>
To: ojeda@kernel.org
Cc: aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	contact@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagar Taunk <sagartaunk2@gmail.com>
Subject: [PATCH] rust: workqueue: fix SAFETY comment Arc refs in Pin<KBox<T>>
Date: Sat, 25 Apr 2026 19:27:01 +0530
Message-ID: <20260425135701.34010-1-sagartaunk2@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The `WorkItemPointer` implementation for `Pin<KBox<T>>` contained SAFETY
comments that incorrectly referenced `Arc::into_raw` instead of
`KBox::into_raw`. This implementation uses `KBox`, not `Arc`, so update
the comments to accurately reflect the actual ownership transfer.

Suggested-by: Onur Özkan <contact@onurozkan.dev>
Link: https://github.com/Rust-for-Linux/linux/issues/1233
Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>
---
 rust/kernel/workqueue.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..74c59f2b1c09 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -890,9 +890,10 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
     unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
         // The `__enqueue` method always uses a `work_struct` stored in a `Work<T, ID>`.
         let ptr = ptr.cast::<Work<T, ID>>();
-        // SAFETY: This computes the pointer that `__enqueue` got from `Arc::into_raw`.
+        // SAFETY: This computes the pointer that `__enqueue` got from `KBox::into_raw`.
         let ptr = unsafe { T::work_container_of(ptr) };
-        // SAFETY: This pointer comes from `Arc::into_raw` and we've been given back ownership.
+        // SAFETY: This pointer comes from `KBox::into_raw` and we have been given back ownership,
+        // as the workqueue guarantees `run` is called exactly once.
         let boxed = unsafe { KBox::from_raw(ptr) };
         // SAFETY: The box was already pinned when it was enqueued.
         let pinned = unsafe { Pin::new_unchecked(boxed) };
-- 
2.54.0

