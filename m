Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D642F5324
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 23:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762384590; cv=none; b=FmF5Td4+aLqTENyn8geiHrgEc34Ubr5UfNeWr2oi7cqqCyoJrHR3PfQEvkxHGfEsQjBe8zOmXJKLMdv11D3uarVONBy4NxNcQZgqY2JzPOdgvPGMag9idUAjLPv4ow4w7hm4mwLwmpejQoSaj7kN+U+UgsPvlP857C3aYBNULjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762384590; c=relaxed/simple;
	bh=YISdcADBQqzuvoNcCs3nt3kan2jGJvuSVytELmc4hYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EddsDd3ZVMcjuFbMGEAaCuQh3j3JGHOSkD3V7yQBT3UFcVqXwxB6sO5OZy6u9m+jCD/IZFSZUeW99e7mmgWYeNu2xDIzsKdDD3k1YImQRiDxg9oNUz80brDdsUHQCV35cpj1pPb17SZYOKfzR0jzUrWvCU6SuRbNC1KBj4bP0xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiFn2Kb2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiFn2Kb2"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2955623e6faso3677195ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 15:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762384588; x=1762989388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6ObyT3Tt6gveKOeNa7NjmSIElr//qB7g+FJoPS22Qs=;
        b=FiFn2Kb2islhrWGo1x7AtCiM6O/QxzCAQGMxOa3dQrvZbEfcdFTWIn/VkKOPh7ISar
         b4Lx8OOiet/FwnLJDrzbD6pv9dWPCAevDeH54T/+2yC/5Ms//tRqOAQPMwfG//t6VsFW
         03fnb+GYRQVfby4d1d6A5mUcxBYR4Uw0b1FpSEMprU2X/ZJcLuG+ZN/nVHVUMacvYjjg
         AaqyaL/+yGGVSuq33iJ2oU0JT+UhjGC3BRHzaJBsDmQnkyKQSlp2SKfFc8jnI+zb/oR9
         5fA+FsnY2J8xpGdcgnDPAJxnND6twCihak9H9cvGQ9fs0FugkLxG6Wsto6beOIKVe87E
         Vx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762384588; x=1762989388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6ObyT3Tt6gveKOeNa7NjmSIElr//qB7g+FJoPS22Qs=;
        b=Io60GnUulObr8kbozWp37oNv5TcRMB58CIb9SMXSujWlsIPrLKpfRQq5dAT980sMt/
         ei37YYIK3lRTeGjKEhRYZ2pVCrWNJX+dfwuDgoXP8RmdHyNZAWQw+gy7KaovbPk3trXv
         d6ZOxvzjNvY01crfxJNyMGm3wVdGvokCLWHObpbDSMKezBcsWJOd9R9f5oTunEy8yBYT
         5yoVxn/oinxkyR00fl/hVmkPvzhCBPiar11lvdWdEB0hO4MY3+7+j7Wu3PDI6tFc4Cxe
         FRM8kNzjEJwltCq9ZN8h49K7KgLPhjOEC+LUbYzhEGL0WU9kzGhL4rb/qMlEcnakP7BZ
         ZcoA==
X-Gm-Message-State: AOJu0YyfSjDJqWQa2XHybkocqJ5eFLa39uQlrE9YNmALN6s26PkrJJZV
	oPDGc+2uYsD+wHonbqojUVwgUKjqhziBicdSXFdV4mdF27CVroOg/JvH
X-Gm-Gg: ASbGncv9bU2EHBZ8LJ/kysTu6zv0fpSqCO0yNwwydTjs88V+2Gkn9iSwAjSlllcaiEM
	dpFUxVFdHYSOAPgBlHJYtrAU3UWHlfPVA/wMm7uyvmMtaZEHBcLp6Yd1sCIJzq0a5Pv9Gg9ELtb
	gvIqamSriIMXxuOTzwv68O6+P6Yba/z5PUIZo1dqQkdCd6rmKIOZoZMdXP5CstspCrIAasXzaqg
	sz9LTrhRU3PmBcT7MWbxZOxGC9m47efFecW6gKroztn3YFA5nexEi+mf8HLOFADjhqv438fYRv4
	3GxpknSrbR6prG2PGW6q+0OWq5P6Kkii/O0Dss+VI0jZEubVLltsC0+6KO++0V5eSNm+05wqJw9
	3chVqMXLY+NHFKxqCvBSpQtTg+4BgrrAWU+Umzau7QgviTkuKVf3tLDzi3k9/hq8p1yMT7RHmTT
	+p70HKXbQdEP8DlaSTSMGjtnptuXYxAjA=
X-Google-Smtp-Source: AGHT+IErnpQ9NEon4sLnfm43ewHu1WQPnKlmXQx64IUma2bPMa0syB8oJXoKEKJnh6FdaNt8aobyMg==
X-Received: by 2002:a17:902:ce91:b0:295:bba8:3c4d with SMTP id d9443c01a7336-2962ae4c366mr66913885ad.35.1762384588147;
        Wed, 05 Nov 2025 15:16:28 -0800 (PST)
Received: from mitchelllevy.localdomain ([131.107.1.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c93ce0sm6391925ad.88.2025.11.05.15.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 15:16:27 -0800 (PST)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Wed, 05 Nov 2025 15:16:15 -0800
Subject: [PATCH 2/2] rust: cpumask: Add getters for globally defined
 cpumasks
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-cpumask-iter-v1-2-7536f906d7ed@gmail.com>
References: <20251105-cpumask-iter-v1-0-7536f906d7ed@gmail.com>
In-Reply-To: <20251105-cpumask-iter-v1-0-7536f906d7ed@gmail.com>
To: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762384584; l=3255;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=YISdcADBQqzuvoNcCs3nt3kan2jGJvuSVytELmc4hYw=;
 b=uWbL7USdtFPgH46WxrNbQZ+7YvwlQnivbiloF3uMV8bMyInBPeqFjbQKvOxXYBDa7D6TidaKB
 dNHrZoxQBYzA/019iZJHr8ErSir7cF+0H6gpVhXBhlzP00RmajPrcVx
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
index b7401848f59e..a6a130092fcb 100644
--- a/rust/kernel/cpumask.rs
+++ b/rust/kernel/cpumask.rs
@@ -77,6 +77,52 @@ pub unsafe fn as_ref<'a>(ptr: *const bindings::cpumask) -> &'a Self {
         unsafe { &*ptr.cast() }
     }
 
+    /// Get a CPU mask representing possible CPUs; has bit `cpu` set iff cpu is populatable
+    #[inline]
+    pub fn possible_cpus() -> &'static Self {
+        // SAFETY: `__cpu_possible_mask` is a valid global provided by the kernel that lives
+        // forever.
+        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_possible_mask) }
+    }
+
+    /// Get a CPU mask representing online CPUs; has bit `cpu` set iff cpu available to the
+    /// scheduler
+    #[inline]
+    pub fn online_cpus() -> &'static Self {
+        // SAFETY: `__cpu_online_mask` is a valid global provided by the kernel that lives forever.
+        // Since we wrap the returned pointer in an `Opaque`, it's ok that `__cpu_online_mask`
+        // may change its value.
+        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_online_mask) }
+    }
+
+    /// Get a CPU mask representing enabled CPUs; has bit `cpu` set iff cpu can be brought online
+    #[inline]
+    pub fn enabled_cpus() -> &'static Self {
+        // SAFETY: `__cpu_enabled_mask` is a valid global provided by the kernel that lives forever.
+        // Since we wrap the returned pointer in an `Opaque`, it's ok that `__cpu_enabled_mask`
+        // may change its value.
+        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_enabled_mask) }
+    }
+
+    /// Get a CPU mask representing present CPUs; has bit `cpu` set iff cpu is populated
+    #[inline]
+    pub fn present_cpus() -> &'static Self {
+        // SAFETY: `__cpu_present_mask` is a valid global provided by the kernel that lives
+        // forever. Since we wrap the returned pointer in an `Opaque`, it's ok that
+        // `__cpu_present_mask` may change its value.
+        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_present_mask) }
+    }
+
+    /// Get a CPU mask representing active CPUs; has bit `cpu` set iff cpu is available to
+    /// migration.
+    #[inline]
+    pub fn active_cpus() -> &'static Self {
+        // SAFETY: `__cpu_active_mask` is a valid global provided by the kernel that lives forever.
+        // Since we wrap the returned pointer in an `Opaque`, it's ok that `__cpu_active_mask`
+        // may change its value.
+        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_active_mask) }
+    }
+
     /// Obtain the raw `struct cpumask` pointer.
     pub fn as_raw(&self) -> *mut bindings::cpumask {
         let this: *const Self = self;

-- 
2.34.1

