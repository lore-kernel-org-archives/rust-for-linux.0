Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFFC3BBFC9
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 10:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850150; cv=none; b=T/Ut/PBiKHkkyse9pCW6iWwP6uScJ1lMVpZvJGsWQZzNb3TilwENXDto3oXSn/ZYEbQ/vRoaTWlU1Rt55KHh+uGRq7o1FeWXjNNzh7KluCnQZgjBG/p5ho0HbcDsWp+zCidNQ/gRZn+Pj1kFfdTAha3eNfbiKwPyTinO5xTJwks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850150; c=relaxed/simple;
	bh=VnVU8bPLJLWfbtAdNiLdfbQJCPObLTqpHbQuXDlr2xU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kxtyz/h0u1xiJV2Wszs2Cj86Lp9ce3fVw3XUR77susXr1Xe8OecFvPDVWkQ0o9NZwChFpbQiZIaM65LnYG06w4ZueEAXkkWa+cF6MZAwA0qf1jonxS2pGu5P9kum9A7SHktGzoF3YMwURgtIZcKg+DK8/ouVNjLnGHwBorBebzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcoasWwK; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcoasWwK"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so35389515e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Oct 2026 03:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790850146; x=1791454946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nFzLuRrxO1MNqfhxtzwDFW5LDm+149ISNFd1xuYHuCg=;
        b=YcoasWwKANqhJAT6ITRJApGZlPhldlCa3xeDRxEfwNSU7DdcpSvcZbECqojDb+i15L
         iTz2NxaLca/myE23nQbmPyIMSRIthvctpPeXyyxfi8r1qmMc4zC/alrLzYLdN3ouN5D2
         U4iTFWDDoj7ixO4ig1FDmEZ9qfc5myNxyc8kq9DjFl8/BqobYHyE2x/01WxvzLUZjZ3O
         Jzl48w2XjO4J4HAerMfCJ1+OKjrbJulAhazaEQuzk4XQiwDdO2SKTC5azlLMoQnNlSJh
         K8IgfpJ8xoftjXCuBTDZ5P83xNg9cMCi+bbTQriNhuGkHGaEWUXaFY4F/qUBDs/MX2Yr
         Ihzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850146; x=1791454946;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFzLuRrxO1MNqfhxtzwDFW5LDm+149ISNFd1xuYHuCg=;
        b=SrWjv4CSFIT5fh0ErfkT0fHBewb9mvCFyP4ml5aabmQ3Z7M4cYk/EGA07TV6btcg37
         FxaESm8PL8JRzZhT2pt1JikT6gdcSwDyTHsu3H2IGKBFp8NjXv9KLB6f5aJXpD4VVPV/
         Qp2LlVJtwVZcZuOtgRavRrTjupXl/JAMFr6JSpTHBkxbDFsKUi9EuNZz1dfnbdriy3Y3
         +utkN7B/3EbCNme1zzIPSZq0pZnLmhaTbLKBtmtWPndJOKyVMmwLbuWtMKQohT35Z+8X
         +K4cefe3VdoaPfcfUVnilITk8RjzqtsjqYOHPDnPuExfFSXOsX3U6ErLs2v6bINQm10a
         i/aw==
X-Forwarded-Encrypted: i=1; AKwUvBzDirVaAaYSucaCFxT00mBXoLrD1heXDkB60giku80MAYnj9BoBlyiksvKOy1rM8Y+lJ+cdQZL8Ri3q/P/tOw==@vger.kernel.org
X-Gm-Message-State: AFuF++nRjqBEWyj2j/44zOLMyb9ESn6PrBr2QmaXUiIkC7p+neNaJPva
	PKn4F11F02HC/eOFgAQ6bGsGd1KmcLEsmWc8HL9QAozBwIWloEBuzmrn
X-Gm-Gg: AYBFou2D8u9Uxb42OK5K4SCrg45fHmSe0GZy6xrfQ7Ly6L39+jV7CZneJLj0XfrCDUB
	I+sxwQEsY74Jp7BA7MwTjLyOCf5ZLIXtLuQhxxkCYXET34R+Pp7ODSeVAUXsX6tK2LNNRVAJHkb
	qoqie55q9GXq2c8jty7cdLOJ3XThFRPiJk2Y0JV3rPmQ/AT1bLErksUikj4AUv9AfNwA9f9NT21
	GhUclZr2GHNi74UFBszAm4Jib1PX5tHRjdDB3/FRfjpVsKqTjgtc7sb9hqEhjjY8aGVJvkAVbw+
	KfILPkrb8Zb+q2ZCHJ01qNZ8541oEVHzEUehFblWibiRruFdI3LX+sE0YJQlMxhec9tpPGvpXxt
	gDozwVpkp+W+4SCyG/7DkcZ3BhUFaZGVJrz+BrhOjF8HUrLrDzaz+CzmLi9mVvdDgmCfsE2mCCW
	8wRYSKmhSd4SYzXV8TuHqa/lJGJaOe4ChtoUDxrZcWATQ2Jpsb/pvt2xXSKkNxk0svY0U=
X-Received: by 2002:a05:600c:6815:b0:49f:ff32:803c with SMTP id 5b1f17b1804b1-4a01b0031a5mr65592665e9.16.1790850145677;
        Thu, 01 Oct 2026 03:22:25 -0700 (PDT)
Received: from main ([5.27.43.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01fa15e51sm58094425e9.2.2026.10.01.03.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:22:25 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	ojeda@kernel.org
Cc: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xuyiwen14@gmail.com,
	miguel.ojeda.sandonis@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4] rust: cpufreq: reject NULL from cpufreq_cpu_get()
Date: Thu,  1 Oct 2026 13:19:15 +0300
Message-ID: <20261001102213.45437-1-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260829161013.102967-1-mehmet.mkoseoglu@gmail.com>
References: <20260829161013.102967-1-mehmet.mkoseoglu@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpufreq_cpu_get() returns either a referenced policy or NULL.
PolicyCpu::from_cpu() passed its return value to from_err_ptr(), which
rejects ERR_PTR values but accepts NULL.

If the lookup fails, Policy::from_raw_mut() therefore constructs a mutable
reference from NULL. Dropping the resulting PolicyCpu then passes the
invalid pointer to cpufreq_cpu_put(), causing an oops in kobject_put().

Reject NULL with NonNull before constructing the Policy reference. Return
ENODEV instead.

A KUnit negative-control run reproduced the oops with the original
conversion. The same test passed with this change. The reproducer is
available on request.

Fixes: 6ebdd7c93177 ("rust: cpufreq: Extend abstractions for policy and driver ops")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Reviewed-by: Onur Özkan <work@onurozkan.dev>
Reviewed-by: spidermana <xuyiwen14@gmail.com>
---
No worries at all, here is a v4 update with the comment update and
review tags.

Changes in v4:
- Clarify that the policy pointer is non-NULL and cpufreq_cpu_get() holds
  a reference for the lifetime of the returned reference.
- Add Reviewed-by tags from Onur Özkan and spidermana (using the corrected
  tag from spidermana's follow-up).
- Resend at Viresh's request to replace the previously applied v3.

Changes in v3:
- Add Cc: stable@vger.kernel.org.

Changes in v2:
- Format modified imports using the kernel's vertical import style.

v3: https://lore.kernel.org/r/20260829161013.102967-1-mehmet.mkoseoglu@gmail.com
v2: https://lore.kernel.org/r/20260828161834.29539-1-mehmet.mkoseoglu@gmail.com

 rust/kernel/cpufreq.rs | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index affa2b9490ef..b75d692846a2 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -14,7 +14,13 @@
     cpumask,
     device::{Bound, Device},
     devres,
-    error::{code::*, from_err_ptr, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
+    error::{
+        code::*,
+        from_result,
+        to_result,
+        Result,
+        VTABLE_DEFAULT_ERROR, //
+    },
     ffi::{c_char, c_ulong},
     prelude::*,
     types::ForeignOwnable,
@@ -29,7 +35,10 @@
     marker::PhantomData,
     ops::{Deref, DerefMut},
     pin::Pin,
-    ptr,
+    ptr::{
+        self,
+        NonNull, //
+    },
 };
 
 use macros::vtable;
@@ -687,12 +696,13 @@ fn clear_data<T: ForeignOwnable>(&mut self) -> Option<T> {
 impl<'a> PolicyCpu<'a> {
     fn from_cpu(cpu: CpuId) -> Result<Self> {
         // SAFETY: It is safe to call `cpufreq_cpu_get` for any valid CPU.
-        let ptr = from_err_ptr(unsafe { bindings::cpufreq_cpu_get(u32::from(cpu)) })?;
+        let ptr =
+            NonNull::new(unsafe { bindings::cpufreq_cpu_get(u32::from(cpu)) }).ok_or(ENODEV)?;
 
         Ok(Self(
-            // SAFETY: The `ptr` is guaranteed to be valid and remains valid for the lifetime of
-            // the returned reference.
+            // SAFETY: `ptr` is non-NULL and `cpufreq_cpu_get()` took a reference on it, so it is
+            // valid for writing and remains valid for the lifetime of the returned reference.
-            unsafe { Policy::from_raw_mut(ptr) },
+            unsafe { Policy::from_raw_mut(ptr.as_ptr()) },
         ))
     }
 }
-- 
2.55.0
