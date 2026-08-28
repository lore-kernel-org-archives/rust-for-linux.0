Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08EE364052
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931766; cv=none; b=OxU13eX5gfLrcFEdOYB2PYVx1X2AlwvjHBEDt9d+ktRgGFiRxw5NyK6udN9cnQCUjrPNE0ogVS9+v/2CvLnfjW1WydXxtmNqFCx+0Nqpp71s1a3WjliSHzbd7cdVbhDZ3lcgOdhDZ3vK4jLKBKqppSfodAqQJpnzfppmJJJ9vJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931766; c=relaxed/simple;
	bh=CBOYWU5KwtzTq95ftVPMi+1AX/qvyPysCgyFMT0deyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZrLtvgxXD4aS6Ha6alfgTsTZ+saPagdkeWTNWuOyfjNCO72Zg6MR2kXit/WeKoPEOkIAwuQIMikDjjl0cLNnO9Xzgl7abxjVWN5hCGLDUsxDY43+y/nAljlpGn0dTQLhhAsUgipT6rK/5ls6ATWXOC+G7nlmdRlPqb3KdCYuiII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKVwE47+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKVwE47+"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482e2fdf5abso491536f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 08:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931763; x=1788536563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Il1nKTj4PJSO6PrUY+686DiZ64VrBPAafI4EqiNmen4=;
        b=cKVwE47+UjYZ4DWk/hThBCkFvuINKuFNPNcbNS6W5WcIRMjPPW1UkTDGoO/BD1q2CG
         hcyybFx3AFdObMCf/m1rqbm0o2QyK9ELsh8nZcLGz4WFw3VMYuFUXV5fLQUjW910bLXE
         DFX+RjPvhIdG8IbVFrnbtNwf6pqZ332nBFGS9W9lQZ0rNuEcVBAQtYfRAujj1Gar7woE
         8qjj3itTC0JRVUw+WRmUCxeC1/BqVkkZiYaGc/ICLonvnUs8QF4dRRndbvfeKq+4/ZTi
         hlv0ySPMBHFSS6fxivxkBy0Vz9FaQAGljbMuctuyiEhualILDTpdISWGG98ho6nAYtdZ
         Ld1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931763; x=1788536563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Il1nKTj4PJSO6PrUY+686DiZ64VrBPAafI4EqiNmen4=;
        b=nhNhS/tljyskNoX2zVVSxu8TfTFJQyBN7JdmAn9NN6HMBsFBBrY08iWOVT9zeRL6aJ
         j8Y9/Sa5YtNWpvllFeYjkD8TwEcqbvcZMxc4DpTtmW/xrzfpGua4JupC+JXXMFohkOYU
         p2020piZwJqCP5JbbeFPZW/bCqYE+hsE8yCTqOAE8eYm+mhSiNOos8eosNjy5XcOmKw3
         r/c4aT5fbefPpZ1S0fe+PqT0u24Hvw2I69FHYBHg1cpxSRLO3lLDrVWPuSKZqVcCq0DU
         EDc2rhB6GvAMqXXUcvpjWocy2QmGgTR0VjszslNJgmJaxAbf9eKA68WdldM5AcfzukRT
         0UWA==
X-Gm-Message-State: AFuF++lb7CPlXyMCEDl3MrXycoi87WuCMQnDBcMSjIp94uRFyYs+udPx
	ArXWL+pnSZG/za1hYEwCYS1xfiG+oPCNUTbzvD15uQyM2UP8h/iLSqlH
X-Gm-Gg: AR+sD11qIA69sdWj+IxVDded97h1oerrQ7wt0nEDY7gxu+6/+oV5aEpMV3XVEX3jLwg
	WlRbnuddv47En1CZFmGpb0thV1kjAXcz7p4eavh6adwJ0y5sIgrOYo23ObAAuNbAaiBuskriie3
	NqdUHlkOr7CCnKA2X6nA3rC4zSjZn+zceqR33ZdLHv698cpsV6FCZUeCcxBo0gyEck/p4g/ex/N
	O4MM0KI6ZMsF+ljGomw0WONwmNC+6SgnRTYUdNFkYOxAm/fgCiFtKqviHz2BPhPLTdt1AekQsZT
	r18MnfPMG5KH4Y0nHKnd7WJvFlNJLf74SwzeXz6+i67zBMz64ceFvTkpSNwJw/CYNdJKf2MsuWh
	b2GW4mMS+PlLKHkyfElNluXLhCLIf7z1dQfbmOOwUtDz1EZmHG6p05BxU4CeybF9HkA98Ta2thJ
	Kw5zIVCxnugsWAeL5PUBiTbVT2qZXjJiK7//54VnU7OIGK9EuVLHfNx7Q5CEghAw==
X-Received: by 2002:a05:6000:25e5:b0:482:fe64:1717 with SMTP id ffacd0b85a97d-482fe641751mr5140630f8f.7.1787931762527;
        Fri, 28 Aug 2026 08:42:42 -0700 (PDT)
Received: from main ([176.237.234.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb278f7sm5610793f8f.26.2026.08.28.08.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:42:41 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH] rust: cpufreq: reject NULL from cpufreq_cpu_get()
Date: Fri, 28 Aug 2026 18:41:32 +0300
Message-ID: <20260828154235.17315-1-mehmet.mkoseoglu@gmail.com>
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
available on request. Validated on a VM as well.

Fixes: 6ebdd7c93177 ("rust: cpufreq: Extend abstractions for policy and driver ops")
Assisted-by: LLM
Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
---
 rust/kernel/cpufreq.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index affa2b9490ef..1c0b6d6a9773 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -14,7 +14,7 @@
     cpumask,
     device::{Bound, Device},
     devres,
-    error::{code::*, from_err_ptr, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
+    error::{code::*, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
     ffi::{c_char, c_ulong},
     prelude::*,
     types::ForeignOwnable,
@@ -29,7 +29,7 @@
     marker::PhantomData,
     ops::{Deref, DerefMut},
     pin::Pin,
-    ptr,
+    ptr::{self, NonNull},
 };
 
 use macros::vtable;
@@ -687,12 +687,13 @@ fn clear_data<T: ForeignOwnable>(&mut self) -> Option<T> {
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

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
-- 
2.55.0

