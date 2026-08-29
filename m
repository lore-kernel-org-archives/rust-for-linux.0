Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFEE34CDD
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Aug 2026 16:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788019833; cv=none; b=FhniDPnCBkFQYiq8zaHPJ5Any4XcMC5rMMtuxJCI16T1I06zZ6sIz05efV222jx7mFudLYv01FDMrQCATqs5Tm3yMQ0fZs6dbLTX78zJ28VfKl4/xR0DReYi0BR9K4ZNdTwkeZei++J+riPw1AmIPUX6WPCi+SFoEQW0k++rPdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788019833; c=relaxed/simple;
	bh=tz0jWWQTpodY19HeFvg6WNoeFkXiXO6opCc4a24Hdz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rGWU1spI5q2wDS2+xRyAliNQntthO5EgXNta68pdxjzJH2bu76WW3GEqo8E4J9g2wKblxsI1ouWYDnBEJDbV+qRojIM72eVWiuI5I6gDynU75ss2uJD8yad3Y/lioRrGhCcZmCvslAFK2dqeJvAnVoIJZs+8Z78oPHV9UcV4JyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFBvJ++J; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFBvJ++J"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so846123f8f.1
        for <rust-for-linux@vger.kernel.org>; Sat, 29 Aug 2026 09:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788019830; x=1788624630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QgJ9jtAoeYlks4PDRyS9bvaYSTRudzDH89X7ZOwziXY=;
        b=mFBvJ++JJwu1tx/dcGd2i8HJ9jTIGzCwcd+Si2UTfe7azta4QhcqV6wO4CjdV/XjH4
         TcznmIdYWhuv7jYd+uc7jEgQO6Y68SxkN84DCatWS+T77zfHkx4k5MBY+yRP1rWY+roF
         u+OqkgJYnyXXrcwvpcfHClKxZa2DZvtYzSqptLs3lmipsbKop4ngmt2H8SvoajO9BR7X
         McH7gB6HcUdjXrMtCa/Vdn4kZhA91gRHVRoUZyJOt/9CraacYR03k6lu7NPYwi3mdCzZ
         JIgWP+54PCli/5ER6gmzLqk7PU9rPqkeM0Fqqhn77i77CklOe8bpngfwEiCKxyO+rfIR
         YeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788019830; x=1788624630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgJ9jtAoeYlks4PDRyS9bvaYSTRudzDH89X7ZOwziXY=;
        b=EDAQN8zhjA7BfA2yLvuWFbcAeI8rztfIvzHR/yMho4p7EXCPnjeJI1Zstvxztp10V2
         Elow+xrJ4/5qRG+gMn+4cI+7znrBzNqU62EcTgxAYeFRIpZCEFLAITPbssvnPSsWCyj9
         WpArGWIr2dI6CSjiy3U6cm8dYTJnIimfOy24dgQzC3gatqZeLJt2GfpC/S4U2G99BHuu
         weO47WPV0NjqYy32HFOMoDsf+bMHYbr/9eBk//CV6PzcBcn47YRkeg6qILrZ0751r6XY
         JnFwtQGOIwU93LCCwEo+uqB3PO+0ws8RYWr0Ec9PcZVgm8psFJlKXsPNvIzfKbz70FWE
         0IDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnYVbUtJi9S9V8trGa8llbBr3cKjsOGWeSKxQbiqbQILY1N9UqrKfsir2mgngiAEaQUyehZTXkvqGmg4Z7bA==@vger.kernel.org
X-Gm-Message-State: AFuF++mKrFIOP3fAGwLE+P1qcJXsW9ro0O+YGmrT1c4v0KAQe1y3Z+MT
	C5No5UsZgjr9wMB92lFictsb/ohCxjsH8J7wzoZo/mtMr/bw7H7kJmbm
X-Gm-Gg: AYBFou3Nv6ttCDZE+yJEPE+Ay4Elru4rc0abJwoostRwu0be2EUl+5ze1wfCPbgXlUK
	1cvrBWVOlr7mFxMdGSkFWcMLaduEvBGc5/giIhjOcjMlg1O4WHWx9wYwi4ZxPtlI7NcGSA7MjoQ
	QQHeTwPel1f4JPF60P4zrRWsgxzf94JGkljYubILWB8VjjA2ZWPCu9DIPOYwHsADJC714UM1vPG
	Qrxav71Xd9uUSjA0abNLjx2gPp1tlZEI+0UkRdrOTUYNZnjBZlie/pFPN5zi6MaO6O6m/rlAv9L
	zC/New49T7s0zRiIkirplIz/uVcQzowN+mo49Lz9avc223d8C4Ca4Ix0A9ZTJPjDpOlrcAB1XyL
	clqDsFqtoSdGrH3CHGXf2fRY9i5wMuuVi1cVJ/5OL2dKQXYQNHbdRBYPq7K1nFV7QWpJ9aozYc5
	MlcYJSRf2yht8znKCf/DSGy0gWEff4fPMvVYbRsts3mxYo43qJ6hBo+s+Z7rFIfg==
X-Received: by 2002:a05:6000:38f:b0:484:3317:a1a with SMTP id ffacd0b85a97d-48433170bb5mr5978519f8f.27.1788019829637;
        Sat, 29 Aug 2026 09:10:29 -0700 (PDT)
Received: from main ([176.237.234.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843310ab41sm3581883f8f.7.2026.08.29.09.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:10:28 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	ojeda@kernel.org
Cc: boqun@kernel.org,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] rust: cpufreq: reject NULL from cpufreq_cpu_get()
Date: Sat, 29 Aug 2026 19:10:13 +0300
Message-ID: <20260829161013.102967-1-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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
---
Changes in v3:
- Add Cc: stable@vger.kernel.org.

Changes in v2:
- Format modified imports using the kernel's vertical import style.

v2: https://lore.kernel.org/r/20260828161834.29539-1-mehmet.mkoseoglu@gmail.com

 rust/kernel/cpufreq.rs | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index affa2b9490ef..4b992ea9a0f0 100644
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
             // SAFETY: The `ptr` is guaranteed to be valid and remains valid for the lifetime of
             // the returned reference.
-            unsafe { Policy::from_raw_mut(ptr) },
+            unsafe { Policy::from_raw_mut(ptr.as_ptr()) },
         ))
     }
 }
-- 
2.55.0
