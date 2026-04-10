Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468833DA7E0
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856984; cv=none; b=g0ESmdtPgU0gjvAKADV5eP/eJsJhLeKo4x5VTDAzmrfXgDySEzxvGZ5IHlnHViP37XkJCUpuS1QJkbuQ8Kxq3rk8g2CWfnX3hHbFtZkCpKCFGGPEsrFGTNk9z2KPaPstwkGE5BEViYQ/0B51nxV3IoO7SIHAZ4f3Fzj37SIJ0yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856984; c=relaxed/simple;
	bh=nFa6XzGa0lobebiKoERWPKmf/z75UhcpF+sR2BSl5r8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=igw+Ae55AWlDX0iLdrrpobEJj1/AM9MnGxVhbvLvGYpDdSWOyh4fT+voM3bdJgTE6WHHeACGl3tuuhGq4MV3ALWDtKbO1JdiFMJkgDoAaE/KdFl4aaELGLWPUE5OhVvdki+KBFMvsJ+vZ4R6rti76ntRfGBHU2jGikg1uFQOezQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt36GyVA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt36GyVA"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82cdb4ab547so1339763b3a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 14:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775856983; x=1776461783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/ZkXAjTN+MjWCqsB5McracnlHQTzul2ROdtvOpaZMM=;
        b=Vt36GyVAsPe2qsFibdE3FvvnN245tXrYImgt5Pn9F6X9vzohN1y1ZDGuw5okBh6ebg
         kRURf45/4xg1uKKWkHE93ZV64FNKcYjw2rXD/62bFO02VYSAGUJkAjxDExCwdbcw0aNc
         0PMVPDoAwDfWfx3UAURVcXyRLqtg5zCeow07P8HxiDMGiwv6I7nHFUQ2BoO+uXdTHlg/
         VCj6xI+lDw0FFeaRlRUDN1eKyL8YxppwcUWFo6H7zbK1kOslMXYpjEHf5XDS3Q2pTkOi
         +X3pWvhakX7Si6/tMB0jzA0w3URegYZTgp2fAaCotw2RO9oTnd1Hea3VsmfbORmSyO+d
         r1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775856983; x=1776461783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d/ZkXAjTN+MjWCqsB5McracnlHQTzul2ROdtvOpaZMM=;
        b=hvlVPZQt43XcmjZHLi4ZyeLZtwybbmN2ZAi3axJT06OzIZ5q6ZMbaN+C7Y1rkbUTfJ
         soac5jVjJNPH+5tisQBH8FdDqAZRlWhUJufDa8mGW5kcIgpr8VrDBRp2YQjQdBmpCj9Y
         GsPzdYvIW3KAkQb3YPll/SPF2qkg4UIGkQrbdOv3AytRinJKxhR7sm3Q2En1OhGZGa2r
         6IDEc1DBIpx7by83AKUrftaHBw3byDp987q+uw1QLbkOXKewiN9+a9Pj+h33dUzpzkq+
         HrjXbuLpXMMZshAUiIMuEPoSbhddvSWuY73c1k31Pw3KDYpDVnUXUdiqg+qzcCnjaj5S
         jJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCXxWWogwCgKjV01kn8HkrUz3/8CFa/ZquAEPYZ/uajOdycL+jZJv+LlLTsXK5lPWnk4vIYPT0JCmsBu4Wbv0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0gO5/GKPQ6E8JRxJM3ZS9g/Xjmlj3/zZkN1JwiTrAmFVlFZkt
	NdE3W3PDJ9R8V5jXMaefQgWslzkO+61HttJ94EcyYs7ec82Ll2MzjDe/
X-Gm-Gg: AeBDiesb1649jPcGuc4YVm+Sg734I3sF2IGavFx8s2FqZHZi2mffm2oo8HUzEuhUex/
	51Y/I2qlkOZ9kN28MLiFfElE8Orqm79WaYECxKqNXFGKTNP9YVOxOaaXQ5V/B3rA/Gnbhu77o8+
	J41GXD75moPIPz1EdPzwzoW7s8vgsvcv5FNE2K9+8cgw/vzXa+YF+3GEr8ez2Xad7AxtWmnx+6r
	+zMRK02drKH32usl6JgppyLSAiG8DunRcWv/ZdBS8g3+O9HpnU/XIe0a2zQzABGn2Q5H789TRWN
	HtyioueJhara4vdgYy92PDJ3vPwTbCqA3Bg9hVs+77+UXE03iAQu1cEJh/uh4awdcnk8Rst7XCP
	X+9JkmUTcmtbuNBmMAJQ+SI3EDRmvYlE6hR2Gnu+SnuqP0ZldepFS1fwhRBLcRQH5IRxDZD5ngU
	MzG6ochNAK/aiwDSmzM4s/8cWjwp9BJCWVYjSaEZbg2OfE
X-Received: by 2002:a05:6a00:3a29:b0:82f:48e:241c with SMTP id d2e1a72fcca58-82f0c2c8063mr4788741b3a.23.1775856982403;
        Fri, 10 Apr 2026 14:36:22 -0700 (PDT)
Received: from mitchelllevy.localdomain ([131.107.1.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4e3d41sm5111551b3a.48.2026.04.10.14.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:36:22 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Fri, 10 Apr 2026 14:35:32 -0700
Subject: [PATCH v5 2/8] rust: cpumask: Add getters for globally defined
 cpumasks
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-rust-percpu-v5-2-4292380d7a41@gmail.com>
References: <20260410-rust-percpu-v5-0-4292380d7a41@gmail.com>
In-Reply-To: <20260410-rust-percpu-v5-0-4292380d7a41@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Boqun Feng <boqun@kernel.org>
Cc: Tyler Hicks <code@tyhicks.com>, Allen Pais <apais@linux.microsoft.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775856978; l=3267;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=nFa6XzGa0lobebiKoERWPKmf/z75UhcpF+sR2BSl5r8=;
 b=Ny8jZTTn2nKtMFz16cbqPqojORJoc5t7WJOTlcvhg5M1RO1POOoBpvS/N5eE8SvhWzbrrt1xm
 JYMPyeawyXqBUwkQqwAmSvTiNScQlLsQgAT/Ju6d08ZnAo5kY7HdGdW
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Add getters for the global cpumasks documented in
`include/linux/cpumask.h`, specifically:
- cpu_possible_mask
- cpu_online_mask
- cpu_enabled_mask
- cpu_present_mask
- cpu_active_mask

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/kernel/cpumask.rs | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
index b74a3fccf4b4..2d61f1323837 100644
--- a/rust/kernel/cpumask.rs
+++ b/rust/kernel/cpumask.rs
@@ -80,6 +80,52 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::cpumask) -> &'a Self {
         unsafe { &*ptr.cast() }
     }
 
+    /// Get a CPU mask representing possible CPUs; has bit `cpu` set iff cpu is populatable
+    #[inline]
+    pub fn possible_cpus() -> &'static Self {
+        // SAFETY: `__cpu_possible_mask` is a valid global provided by the kernel that lives
+        // forever.
+        unsafe { Cpumask::from_raw(&raw const bindings::__cpu_possible_mask) }
+    }
+
+    /// Get a CPU mask representing online CPUs; has bit `cpu` set iff cpu available to the
+    /// scheduler
+    #[inline]
+    pub fn online_cpus() -> &'static Self {
+        // SAFETY: `__cpu_online_mask` is a valid global provided by the kernel that lives forever.
+        // Since we wrap the returned pointer in an `Opaque`, it's ok that `__cpu_online_mask`
+        // may change its value.
+        unsafe { Cpumask::from_raw(&raw const bindings::__cpu_online_mask) }
+    }
+
+    /// Get a CPU mask representing enabled CPUs; has bit `cpu` set iff cpu can be brought online
+    #[inline]
+    pub fn enabled_cpus() -> &'static Self {
+        // SAFETY: `__cpu_enabled_mask` is a valid global provided by the kernel that lives forever.
+        // Since we wrap the returned pointer in an `Opaque`, it's ok that `__cpu_enabled_mask`
+        // may change its value.
+        unsafe { Cpumask::from_raw(&raw const bindings::__cpu_enabled_mask) }
+    }
+
+    /// Get a CPU mask representing present CPUs; has bit `cpu` set iff cpu is populated
+    #[inline]
+    pub fn present_cpus() -> &'static Self {
+        // SAFETY: `__cpu_present_mask` is a valid global provided by the kernel that lives
+        // forever. Since we wrap the returned pointer in an `Opaque`, it's ok that
+        // `__cpu_present_mask` may change its value.
+        unsafe { Cpumask::from_raw(&raw const bindings::__cpu_present_mask) }
+    }
+
+    /// Get a CPU mask representing active CPUs; has bit `cpu` set iff cpu is available to
+    /// migration.
+    #[inline]
+    pub fn active_cpus() -> &'static Self {
+        // SAFETY: `__cpu_active_mask` is a valid global provided by the kernel that lives forever.
+        // Since we wrap the returned pointer in an `Opaque`, it's ok that `__cpu_active_mask`
+        // may change its value.
+        unsafe { Cpumask::from_raw(&raw const bindings::__cpu_active_mask) }
+    }
+
     /// Obtain the raw `struct cpumask` pointer.
     pub fn as_raw(&self) -> *mut bindings::cpumask {
         let this: *const Self = self;

-- 
2.34.1

