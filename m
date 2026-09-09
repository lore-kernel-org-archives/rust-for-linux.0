Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C03E46D569
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947257; cv=none; b=CefE8/FfUFRdGC/hY1AAs0FiNT/CcFbCNZ6JXMl3GC2DofEICtWYFe+FgeFnq8tfPx0t0qXk7Gb4Z6q5aJjisoxuyRux2q2uRFJYn/nwWE07hSjlJHohqHBUY3Xxr5wiXOlzB/eQ18ASDAnd3EsKboi2XEH6s2CKrel+T2HakBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947257; c=relaxed/simple;
	bh=nypzWupHhqeDHZSw5V8PFKnbXnGNzOaSKUB2VzqSghM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IPEKNUB498BmUYxSrg7ZaaBLIZ/U/fQIJZ6Z1K/ETzQsQ/29HYfnlP3T5VGPr+zHeGIniHTnf7fBkZVwWtumXUMY1DBMIWMwwJTe+qQDfp60yxaUXGzO99S0zuS5ji0RcqzaP7skSk7/K3K8r8H2cPJcCK8bxPw7Fio5qgyulek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=II/akbez; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="II/akbez"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso60840325e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1788947253; x=1789552053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/HIVazkafDF+8hPirTfPnMH9fb4lkFfW6ga7qAMbzE=;
        b=II/akbez51QCbQaM2tDXMqH+HtnovfBkMMP6W0nF7iNrgsMO1GNPfQzUv1uLcXZAgv
         CgF8pBREP4Dp3UxTlNLePDuGimftzJV9c6EQKA/IKVlm/uIwte+oAU4W6iwzFcadiB3G
         Iblb7OzIa5p0ga73RxZacav2BTI9RypomdR9/uqbmgJafWvmrpGcPngiJykAbemqHsXC
         Z0fmexMGueU2P6JFN44cIztmpJZnqwicB8NnW7FVNWAybgCHcoARQuceSb3/Rv+KaHDJ
         6oTQoA4f2CuIKiTdfL5RKItILhSqajWEsejUYE8pufNbCcTMt125DTWs+CYj1myz0RFa
         DGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788947253; x=1789552053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/HIVazkafDF+8hPirTfPnMH9fb4lkFfW6ga7qAMbzE=;
        b=nfiRzrF4KLmHksLGVHeyrdBJNdHQSVdD30/Gda+0fDM1einsONTkTwvSJlJHitqSIy
         wX/J6Za1F0EYMNXlfcufq0FwhGmV6MOh8Wd+FjoiorwkNC2oLo5shMyoQhOBia/ZXuA9
         lxGjgDNuMfYXpEJQyyVhoaSwQEPLM97ZMFrfEfjSy24m06NEtI1JZwINRCNhZwJ+GnZw
         Uznt4QxripTebslUh3VW+5Xp7zMJs+FrH0qGdaqolx/jH7ZDqdRZGsyjap28LmJIhEGV
         Irpz2z9pQDsb966YuU+k2G3heXXCWy9n9yUucEH8WIeGq7gexcp5Cx6ZFpBzDE2D40/H
         QIFg==
X-Forwarded-Encrypted: i=1; AKwUvByt7MUTdDIgYsfdhe8WcFoH7n7jUBpgNbNnRYrNtTuxCAE3IXvQ+b9bFDhVxdSom9RyPlbRMjQlF7ZZCYAJQw==@vger.kernel.org
X-Gm-Message-State: AFuF++m7vDKPV7Rc/dad8NpnjQrj096NpVm1yYjROW6l6D2LDfV32mqr
	FVf+WvlHM5ZuDm52znH7LROMb6UYWF8p5q7Lyzhwg2lp08n7vwfxhJqh/WQW0/gcNw==
X-Gm-Gg: AYBFou2bBQhR6N2Ww/Q73XdnD7CsQQHtBVQHTylWbb8/jEqyulsPKpeR0FqSnMOtV+b
	G0nwCS27Kse1zr7DBuBNDFgmCkiT+St7ImWlYxIoLYAQzncTXt2lf2cZvQhftq7zCcmUju1JvTM
	6mU5t95Vyj6j7KII82YO83NL84UOdk8UGceLgPSfHDxczpt+lOJ3XO4gDGrPP4UQVAKby0HWZb4
	38NoXVdftRPUCUlD8HrACviIypGFrEeZZR+5J5yTgppdEQbyp8bNyoUXddyMyIY0PI9Xzq1aQiG
	96VStXXkMqh035XOqfvpUq/GCg3VIAQxOObz2cE/ueHqQsOkeE94ewx8ICnzZ+C/gYe9L8jcUy5
	p4lsXqqcMQZUC7lKGaBOGCI1XkU2GNbSwKakB0GMyThi8mKaBv0TqvyQgPSos+Z6DsChEbPrcKv
	3WsLvdMNiP56ZTPLCz5hBpdl6tezBG66a/FumBjflzYhIbxGdImS2/ul/TjooS3Lg35BSjsWIHa
	o4h5toNYM8Bckn2ny038ZcsyAI=
X-Received: by 2002:a05:600c:4514:b0:49d:1e09:694a with SMTP id 5b1f17b1804b1-49d1e096970mr124975675e9.11.1788947252972;
        Wed, 09 Sep 2026 02:47:32 -0700 (PDT)
Received: from quark ([2a01:4b00:d309:1c00:7807:3ba6:3446:4db2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm597615395e9.1.2026.09.09.02.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:47:32 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	alexander.deucher@amd.com,
	mukul.joshi@amd.com,
	rust-for-linux@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [PATCH] rust: drm: gem: add missing handle_free to the object vtables
Date: Wed,  9 Sep 2026 10:47:29 +0100
Message-ID: <20260909094729.1593-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both OBJECT_FUNCS and the shmem VTABLE initialise every member of
drm_gem_object_funcs explicitly, so adding a field to the C struct
breaks the Rust build:

  error[E0063]: missing field `handle_free` in initializer of
  `drm_gem_object_funcs`

The callback is optional and the Rust abstraction has no equivalent
DriverObject method, so leave it unset.

The shmem copy is only built with CONFIG_RUST_DRM_GEM_SHMEM_HELPER,
which DRM_TYR selects.

Fixes: b67d2d039f64 ("drm/gem: Add callback for when handle count goes to 0")
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:Opus-5 [Claude Code]
---

b67d2d039f64 is only in agd5f/drm-next, so this can be squashed into it
instead if you would rather keep that branch bisectable.

The shmem hunk is by inspection - CONFIG_RUST_DRM_GEM_SHMEM_HELPER is
not set in my config, so only the mod.rs copy is compile-tested.

 rust/kernel/drm/gem/mod.rs   | 1 +
 rust/kernel/drm/gem/shmem.rs | 1 +
 2 files changed, 2 insertions(+)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 80d8f524f9d5..ae61ca7e1246 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -278,6 +278,7 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
         vm_ops: core::ptr::null_mut(),
         evict: None,
         rss: None,
+        handle_free: None,
     };
 
     /// Returns the `Device` that owns this GEM object.
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index a687d46d170d..d08a03cb7a13 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -145,6 +145,7 @@ impl<T: DriverObject> Object<T> {
         // SAFETY: `drm_gem_shmem_vm_ops` is a valid, static const on the C side.
         vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
         evict: None,
+        handle_free: None,
     };
 
     /// Return a raw pointer to the embedded drm_gem_shmem_object.
-- 
2.55.0

