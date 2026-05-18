Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F2430DD22
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 22:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779145065; cv=none; b=VuhogDs4WbjLjiczNs+q99zlMDu2CYa3Bn/lEh9svNGMmJrad72ilWyazWQt7CEmeg2jzF5WALiQuJlX/US8HNb/A0j6wAA80kNJK1RR3HMJqKH2lol3jo2b98FUEyGu1U3Gh3OdwXLoUTA/vDQpZ2AJfRBmfMUn8EoezuUCUas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779145065; c=relaxed/simple;
	bh=ySRY66nSnLJ894P2zqP7ZLcA7kcJUTiHLzgD7I4e5Qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/srET5k+44RCMqZqCMyU0Yj2sK6eITKM7QwboHCEewkDlT77NhbwEKdWQ9uHt+/GcT9g/PEubGCXxK+LIDMplJq3V8K2OQmC7pfAv9hc6/exNHEJhH5Cdex21CVGCAaocL7tFfvmm+8kYTKwTHw/g8lUww7yS3AVEVUUCOfvW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pi717Lsv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pi717Lsv"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ba0fc8b1f0so18061355ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 15:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779145063; x=1779749863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THG9OJzV+LtfSwAunPizZKZf+R+Gt9xcwfOpsKDWbCo=;
        b=pi717LsvwF4g6WCAbKE2BHss+tykXiZHHZsb02WNFfTDeDCbS2WeTJzxi5cS30mOTg
         4xUoxbqeL70T9LRWl/rmUsEbhJVuGmk6015x25TA6U2ksnLSrc2eJvehvRkHdEWZCE7K
         2PZzoX3OexxdoDwTVRSO4n9vLt8AbRl8MgbfJ+5UjeFzSUc6/OQ8/pddaApK2HSYAe1o
         K/LcPRi1MGjz4T/gbYatK7AYdjJ/rsjaOBw/v4CfPDdDns4iBnknKtkzo7tpC2B7XP2x
         JIEu7UN66Ru8yTiwQ9YHI5iHxg63mfM/BVn8QW5A3R8bUe5Til2H1wybwuNX5vM8VGva
         tR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779145063; x=1779749863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=THG9OJzV+LtfSwAunPizZKZf+R+Gt9xcwfOpsKDWbCo=;
        b=gQo/Sh2IxvGPG3gmBgGGREDiWE1eNAC29GkFoh9b/IYDdOxa3nkwrGjOk8sugssNt4
         gVz8Or2NkI3wTbUnP/j2Vti2EvyOHBUbfpsRqzXUNEnCeGXtlg4QLhgYrsRH34avsm7D
         cBpJm6lpORcfLVf4RuDka4GWF9N2qRWkCLBW4Ic6AgLApvTrqr8BZB+AE31E0f5fe1lm
         6ho4nnOCxeH+R85yqi0kITcl0YW9+sfXvfKzU4K7GYUd3neiNsPcdE8etySPcLqvrHfB
         oiwkbtH52fmm++JSt1erMmE6Z3eK+nzIkC3K8kmlBgkyjGxHUlosn1CikVBPUHWiNRlF
         f5fA==
X-Forwarded-Encrypted: i=1; AFNElJ8bpcpcG7YyrFD3uCXGXqDEZ0fDLRV7+4dBJYEQmAcZlbO3L7r/TGsQAeD/Hoa5wWqLdkICQufGYd2mebUcyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsg0hwBd9STpxB1pP1A2XkhFmdqSJPToYk39352nkpoEGMAsqF
	JTPkQ2otFFpzoRKVXlPtv0cw9VXrdkaBRN/zJgCs+Dk3ehehGvTOzS3d
X-Gm-Gg: Acq92OEhiZ0llNMGggedY/iA8hlzvMf5+QRJ84NLf2aVm4tmxL6RzSHtDYX6pc8m1HX
	mMK/Y/iVIQ7DjUbI7hwWt1PguPFJQrU5J6e6ZFKF6Cj7g2H+cv0FaUFgEOy4aw0l6T3jAgudZGc
	MrbjzSvDd8YL+INJecjK6fafgZKm9QlQG2oPR5KfOhVyC74G1ugPjW9CDW2ijFpwt1IP9KzpCxc
	mj7y0g7XYrZ9bq9ADGY9WVxoUSJ68MULOsxORgPQ8LmcgjFktk7GphiIMFQQSbQHW0+zHECBRpQ
	QLQzOXyvnfC12o2LFUQVEoJ6sDtnhqrLlpxgulI85El4aIwY5GvJQW0fmB9t+de/pT5ucNHUYQu
	+HO98+udJcfCXpZnOubpsK2leBmRuEGPgVI22K3jk2w6A6cs+GLW5LjtTBI3R/xvNcsFtp+PSe/
	xMFM9E27n+QQ38fPt03fiZFPI8nPf8h3F+7Vw7cOzzvDzI4Q==
X-Received: by 2002:a17:902:d512:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2bd7e86c6a4mr190741415ad.5.1779145063111;
        Mon, 18 May 2026 15:57:43 -0700 (PDT)
Received: from fedora.localdomain ([2405:201:5501:4861:a13b:83fe:88b1:ec13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c2631basm158285745ad.34.2026.05.18.15.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:57:42 -0700 (PDT)
Received: by fedora.localdomain (Postfix, from userid 1000)
	id B4E006524A0; Tue, 19 May 2026 04:31:25 +0530 (IST)
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: tglx@kernel.org,
	peterz@infradead.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v2 2/2] rust: cpu: use `unsafe_precondition_assert!`
Date: Tue, 19 May 2026 04:31:25 +0530
Message-ID: <20260518230125.476165-3-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518230125.476165-1-ritvikfoss@gmail.com>
References: <20260518230125.476165-1-ritvikfoss@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace `debug_assert!` invocations with
`unsafe_precondition_assert!` in `from_i32_unchecked`
and `from_u32_unchecked` unsafe functions.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1232
Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
 rust/kernel/cpu.rs | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
index cb6c0338ef5a..57bad2d8c788 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/cpu.h`](srctree/include/linux/cpu.h)
 
-use crate::{bindings, device::Device, error::Result, prelude::ENODEV};
+use crate::{bindings, device::Device, error::Result, prelude::*};
 
 /// Returns the maximum number of possible CPUs in the current system configuration.
 #[inline]
@@ -54,8 +54,14 @@ impl CpuId {
     /// The caller must ensure that `id` is a valid CPU ID (i.e., `0 <= id < nr_cpu_ids()`).
     #[inline]
     pub unsafe fn from_i32_unchecked(id: i32) -> Self {
-        debug_assert!(id >= 0);
-        debug_assert!((id as u32) < nr_cpu_ids());
+        unsafe_precondition_assert!(
+            id >= 0,
+            "`CpuId::from_i32_unchecked` requires a non-negative `id`"
+        );
+        unsafe_precondition_assert!(
+            (id as u32) < nr_cpu_ids(),
+            "`CpuId::from_i32_unchecked` requires a valid `id` (i.e., `0 <= id < nr_cpu_ids()`)"
+        );
 
         // INVARIANT: The function safety guarantees `id` is a valid CPU id.
         Self(id as u32)
@@ -78,10 +84,16 @@ pub fn from_i32(id: i32) -> Option<Self> {
     /// The caller must ensure that `id` is a valid CPU ID (i.e., `0 <= id < nr_cpu_ids()`).
     #[inline]
     pub unsafe fn from_u32_unchecked(id: u32) -> Self {
-        debug_assert!(id < nr_cpu_ids());
+        unsafe_precondition_assert!(
+            id < nr_cpu_ids(),
+            "`CpuId::from_u32_unchecked` requires a valid `id` (i.e., `0 <= id < nr_cpu_ids()`)"
+        );
 
         // Ensure the `id` fits in an [`i32`] as it's also representable that way.
-        debug_assert!(id <= i32::MAX as u32);
+        unsafe_precondition_assert!(
+            id <= i32::MAX as u32,
+            "`CpuId::from_u32_unchecked` requires the `id` to not overflow `i32::MAX`"
+        );
 
         // INVARIANT: The function safety guarantees `id` is a valid CPU id.
         Self(id)
-- 
2.54.0

