Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96740176ADE
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 09:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763890029; cv=none; b=BY50GGL7xDqogXcoYtTzJKMK2eAgUqOmm1baA7qRXfY7jvQo5XATcjtvw0SI1UIIZzxcIs6wsJLOlNMWM4EPHV0S4ZmMQg7zTZ7d9dZXAPDMhVXA1XxMQsTDU6t9wFBxM7ymiSSODfcUu8xrTQGA1O/zel1gE4ckxlN3mg8nqPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763890029; c=relaxed/simple;
	bh=hswRjYzI10zhUsDjz+wkVowHp0MANy7svfXMu6AA6rA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gSzbNbKiZIvMFIZL0Co2d8F4ociYp/YFxp+z3HfspmIyAJrmgZPrl2K1vXhKYULP/brziRZJxc0SGV2DpYoefvo6qYP0nqe3LN+qHgDI5C4lwhzbPNqpgGECFDyT9lXhBQXTmubDxdZC/bzsFJDXClAEXoAtJJYcP7v6/OiPlsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHUaIegI; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHUaIegI"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-298144fb9bcso36694975ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 01:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763890026; x=1764494826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxofK3PIJmJGptGWmPl6GxImW1KehJK8Ra0bi1cA/KY=;
        b=MHUaIegIDQOCo43fmEKY3VfYaRjaHxMRCjEJdRctUgEoSGnjge2xscSRhxisxU8SLl
         NJOeH6ADpX8QYPEvx01Jwf16k1rSrrqsN4O0MpZ20Zdv+4CSNKUTyvoIW56eoxd8Dpmp
         pYUoTjjP37fFEf70a3UvPetXiuceifTyDKvPplAmaqND2Tb4DY0t2PjixqOMwoODTu6n
         Sfh2RkxmKFUMoSkEh2cvc5S6paa6Tu5jIws+SKUMNGGdFdKR6VVSMvI17kni9GyERYCZ
         wsL4lT313URpHaa10qovYCCJauAnzm3FzwCqZjnTAPi2qR8mQeZUUFlKP2B1HTh460TS
         VMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763890026; x=1764494826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SxofK3PIJmJGptGWmPl6GxImW1KehJK8Ra0bi1cA/KY=;
        b=PzuARR2I9I3/zHCVBYWhXGUtxRhJ0twDIe610Bo1EK7bp1/1sztyLrCIYsS6Nu6U7m
         93xcq8IjaNLVn9pbsOBvENoYZC0WavZGmC+ejZwPK4d0pQHcYhVk0gOuaFHoGotEV8cb
         u5E2g2oKbSlCVHh2mnQL7S8ocMMamLKF+uvPgUw1LtbrOq7u1OIkYp9Awp4b79NuZigf
         jHuivkbgnAOSIBNwqcSRgPT4KNXVnTkT21zNhUmgc3h5zHUs17d1+XZGTse7pMnXJQqG
         Z67XplGy3AV9xoUSHlbsGGgI44XXQJwza3z+052U8qagLjT5s6h7zihmXBr6FHxU+Ipz
         kJBA==
X-Forwarded-Encrypted: i=1; AJvYcCWB8AF8wlHNWp6aB0gikJOA4FO5Ne85r5aNkgBXL7gGUNsE6s7zYtVWQCNHSdgmQrrPEjyQfcm1mhLoiO7C2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjp2BxXmgcxrS5+o78gnNsgCfzQqQbj5aNjgAOUyXJitbzWtzX
	8lxWsjYltHxXNxxbq28ewymrriTvLEkfMFpebulSYx0D+ekU7pKoXw2s
X-Gm-Gg: ASbGncspRLKJoFTuO8cnS8F6bT4GJXgAIVl/Sa4chttMUwnm/ZbOFFRXQnZQ6NXaucI
	1eRkzhvWgmz6AYXBuIyFA4laxHHEOB5X52NLLlJlWJ3in2LD57WQx2UL4kCF+wKSyf1pAc4N6H0
	zCtukurYndmq+DHDiPIJrS2l2YxAOMwbjcC/RwUXbdkDtpU6PvReziAYSuLhK0GrT8pSP0dlqVf
	WFpYpAvth1K73L8+k5n3MN4hqCL8e3RXl+i2UKlK8cUuT4SNOviPP4+Jsn8HX1z59Qi6RZ40YGX
	ANbsXUImeuPdzB7KBYZO4P19hK/HGLZqtP/LdknZiesHLx/iRroDF8UyIWhlWJxCmVsYo7IFfcP
	W5H9/eu2aOE7Hgg4VxbhQW2+qD8qI3iqPUuKZs+7PYcxTLcUzViooSQ2ORJzmdCMiPEI82f2IHp
	JkT2ycr40ochqPYo3h7UnAZAc76g==
X-Google-Smtp-Source: AGHT+IH1U8t8hCw2WDyvXF/0DPfy18rrujnj6Em/QND/b9i4osv8+SLy39cyAfSRsaedSvrbycJTtA==
X-Received: by 2002:a17:903:290:b0:297:c048:fb60 with SMTP id d9443c01a7336-29b6bedf343mr95210775ad.25.1763890025910;
        Sun, 23 Nov 2025 01:27:05 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 01:27:05 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH 07/10] rust: kernel: Update ARef imports to use sync::aref
Date: Sun, 23 Nov 2025 14:54:35 +0530
Message-Id: <20251123092438.182251-8-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251123092438.182251-1-shankari.ak0208@gmail.com>
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update call sites in `scatterlist.rs` to import `ARef`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/scatterlist.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/scatterlist.rs b/rust/kernel/scatterlist.rs
index 196fdb9a75e7..b83c468b5c63 100644
--- a/rust/kernel/scatterlist.rs
+++ b/rust/kernel/scatterlist.rs
@@ -38,7 +38,8 @@
     io::ResourceSize,
     page,
     prelude::*,
-    types::{ARef, Opaque},
+    sync::aref::ARef,
+    types::Opaque,
 };
 use core::{ops::Deref, ptr::NonNull};
 
-- 
2.34.1

