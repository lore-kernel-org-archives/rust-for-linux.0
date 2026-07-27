Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1B842A799
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 21:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186867; cv=none; b=ILeQ2zuBMTgokHIrzl9CKDD7PwHqmmBknp5E797yAZu6bu4rhOpfbJdmrDOxbw7E6KkUpiUHexJKObKbOEo1fyet6vmz1RxCTLKX/K/2EM0XVdN4Hw/jgURwmPAhJPoqVHLLNi2XH/lbVmbuBRtiV0Fq4RgmzDZnU3Iu6b+tS+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186867; c=relaxed/simple;
	bh=5V7f0e2Wd/GYysaBOb5U+e7W5ITzR3ZvWTTFgT0mY5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NY72vHd+skki/IlnAjxdpbtBCIfW3XUHsB9T3ym6Kh+sfa5/zzQdrEDbKLD0EdEmWPWJddB4MW4fmJZkvXmdWyJn/jAIgjTIMPfTGRg8khVk6/MrIxxWsoTYMhAIagilzvIYprjNO9JsqMOshC48L3Bul0vJrcy4fLY+Ejai3AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgcWUXrV; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgcWUXrV"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca7c1176317so2266252a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 14:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785186864; x=1785791664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjy5MK4aAcCv+w38WsNjg39N/6ew3Hf2N4qUhAbHfKM=;
        b=dgcWUXrVQUbXpmEpeC6CXbul8q0SUgDNI1RV3Fr0QhRxir3Qlknt42XV5WU3+YVgwP
         Kr9ev4BqoP9LFkDARCt6JLbUdly2qNws9l9dr37f+sGc9Hq08p8wgMH0VVASpHuYA2r9
         Z5wBq2MHp5TDMacp/KiYUHl2zIMv6k8c/uJBurXKIPQ4cKQ6XvTII4NEP0EK8Ey7gLRk
         4MYJPthFP1n4/xjRtHPA64ln2WjO0Jb7GFsX31IJz0AAynnLRmGleRURcbb/20ChQ3bY
         YmGxK2RLyih0GxuI+q/sOYCErh0HEcaBZeyXnc1+90LAANLQVdDRnETfCQzO3z4cNDDY
         saWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785186864; x=1785791664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjy5MK4aAcCv+w38WsNjg39N/6ew3Hf2N4qUhAbHfKM=;
        b=ikN9nO0eXaedF7MIusL+QHTzrIDY61zhWSGx3W70LYXNYCjt/OI9EFVDR0wpbOdKw6
         IiB6aS449DDSYPfNyXTsALPc+SA9sZffayFEWm6vSoawg7NG84ZdHFlgwvp/NwhnmgLn
         9+whKVWQFEfKTQ8/s0vDHMB5gcyKWqL514IpwpSddUalSYEbOdCAHsuuVZT5leOjS71S
         eGy3uwgXJIiuUkE4PdXKDWqucqnguf6cRpAJz0nENMhKz3VHHU6cD0/IaS59X1T5TIx9
         1Ir4WRB3n49pewqceSFYExGfT/AcUNtVsquSM7H3fTul9jV3gIlMIhO5TJURpHrEIpYG
         RflA==
X-Forwarded-Encrypted: i=1; AHgh+Rrqs8EezIKGZEiejEFWE75zmMut3D1QhHbWSdU8nDLZwAUvxP2+BmC2bTfdFmEeEL+s5h7K40haEGluhccZPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWxvXAxAVLh95cn/jnBIdHf8FuRUyDFSWe5SLpqCxerk71F73N
	AdZ1XkinDgo2XpsTLYUeNV4gB6wI1NugItFpraTrNkvVgxgYR8Wm4F6w
X-Gm-Gg: AR+sD10wPp/aNso6zNUjA2486m5Zup9tylWOOpllcu+ra3aLTHMTXEY+LdVmLZeLGyi
	B9Rnm8BAod5rDEmS28ZiSD3Klif0qhutJIKMxCT6oS0+gXhFwy8BW+igzPOrQBiJqoLmwAk9B0b
	SAQBs/+91HDRO/S2fqnubYC2SfDXzOj0lcbyUgSShn65g3355gyOpNtK6/MDr1SxH7BYtw4nZ+y
	+E7lmy/CCqenBgbssuR+NE7LVPkAGD2xTX2OONDWPkXZH1v/C0zjSeMrzHhTdmA64zY+6axJMiU
	1ZrcFEIKoOk2vblI48643ITSFP4VRcdLBJ5ReWH4kUJ48mZn4wgqL5iNuFxnjFk8fUKcWfdl+AB
	QxdgClOFBIUNHFpEL6CwPFgGGkD8YU/AQcJebx6LAkcM6nS3w4rfzq39jUmgLtsijHMfryNkepu
	9AHwKfPJgNc3kaFptFddUJDtqzRhX9ki1hU08CDhXuYBIGjdg4fbm2dQ==
X-Received: by 2002:a05:6a21:9d95:b0:3c0:9c19:65c2 with SMTP id adf61e73a8af0-3c67e0727f2mr8884194637.74.1785186864472;
        Mon, 27 Jul 2026 14:14:24 -0700 (PDT)
Received: from archd ([2601:640:8c00:a:1544:c19e:8a1c:4058])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm58456645eec.2.2026.07.27.14.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 14:14:24 -0700 (PDT)
From: Daniel Pesic <danny.pesic@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Daniel Pesic <danny.pesic@gmail.com>
Subject: [PATCH 2/2] rust: drm: gpuvm: call drm_gpuvm_bo_destroy_not_in_lists() in Drop
Date: Mon, 27 Jul 2026 07:11:21 -0700
Message-ID: <20260727141121.11975-3-danny.pesic@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727141121.11975-1-danny.pesic@gmail.com>
References: <20260727141121.11975-1-danny.pesic@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GpuVmBoAlloc's type invariant guarantees a refcount of one and absence
from the gem, extobj, and evict lists for as long as the value exists as
itself. The only way to consume it is via obtain(), which moves it out
via ManuallyDrop, so the invariant holds when Drop::drop runs. Since
this is the required precondition for
drm_gpuvm_bo_destroy_not_in_lists(), call it directly rather than going
through the deferred put, and drop the TODO.

The GEM's gpuva lock must not be held when this runs, since freeing the
last reference to the GEM object would free the lock embedded in it.
Drop::drop has a fixed safe signature, so this precondition cannot be
enforced by the type system and is documented instead, matching the
existing note on GpuVmBoAlloc::obtain(). It currently holds as
lock_gpuva()'s two call sites, in sm_ops.rs, operate on a GpuVmBo that
is already obtained and never construct or drop a GpuVmBoAlloc.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Daniel Pesic <danny.pesic@gmail.com>
---
 rust/kernel/drm/gpuvm/vm_bo.rs | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs b/rust/kernel/drm/gpuvm/vm_bo.rs
index a30f838c11b8..7c0f5846cf39 100644
--- a/rust/kernel/drm/gpuvm/vm_bo.rs
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -249,10 +249,14 @@ fn deref(&self) -> &GpuVmBo<T> {
 }
 
 impl<T: DriverGpuVm> Drop for GpuVmBoAlloc<T> {
+    /// Must not be dropped while holding the `drm_gem_object` gpuva lock.
     #[inline]
     fn drop(&mut self) {
-        // TODO: Call drm_gpuvm_bo_destroy_not_in_lists() directly.
-        // SAFETY: It's safe to perform a deferred put in any context.
-        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) };
+        // SAFETY: By the type invariant, `drm_gpuvm_bo` has a refcount
+        // of one and is absent from the gem, extobj, and evict lists.
+        // Per the precondition documented in impl, the caller does not
+        // hold the object's gpuva lock. Therefore, the preconditions of
+        // `drm_gpuvm_bo_destroy_not_in_lists()` are satisfied.
+        unsafe { bindings::drm_gpuvm_bo_destroy_not_in_lists(self.as_raw()) };
     }
 }
-- 
2.55.0

