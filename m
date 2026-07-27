Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6713E63A8
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 21:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186863; cv=none; b=IvIOj9LzjA2jUjaDq2pquwD+UipfdqI1d+k4RYf3ab8sSs3fxVSWBI3YjHUMfhhNcaIOPo5p1nOMaLtQrTpWmw0vMHKu1M1wJmpQJopofKhvaGVNZ54Pd7vXTuklKeT4TnNWyzoaNDrYeXA/g6mQsD41TVntBuwJ5gbnJ4GZQUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186863; c=relaxed/simple;
	bh=jlWqG8gTbu2twnBybj6iW/dXM23ZlushmG2B8NreGeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWJ3ZRRuLD5dvGxIxstl6h5mYRnSEo3cdTSbDop8AR9+CsNe/KOhuatWAmjQ/vWLBDyGntun8/DlbaM1FWzcVUGGLnq3LztVasR217clLV4/2TE4vTSeExIgkYD3CoI6DPaWFPS/5nhc7ut/qihtSIPZOicrU97bbEO2py5TzX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjY/caok; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjY/caok"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84864086bfeso3070887b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785186861; x=1785791661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTwGwys18fLpJ9xlKbE47qZQ9XXoD+aeMygdr9DdQKQ=;
        b=YjY/caokCtTd5aWwGrOLe03HkNQV5cDSeOnXRqykOMvRE06KVIW0tqg1h12t470Yuw
         SQj9qX2xtVb7tnLocDsZk2Xa85V72j4oYX3koeUebempd8qJN+pjR+Z/J3n4T9SGaqAh
         N5lMldoFB8w59vSX/AnNvVMY4syofOjLUDCGr0Ab7nZCaXJ+d/ZC7Htm6BbHVLCCdBZI
         qu2zA2DbyXKCqdjZdyFOgT999inH3LUVXIO8klk39BOCi61biAq+sA+9H2C2I/OHVwGA
         4yjf3NXTcNMMHw/AdGRC2lAGkAq/y0S3QqtsucEK0CskTYPPLM1TTaiRgN3ETAVRsbIR
         3kGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785186861; x=1785791661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTwGwys18fLpJ9xlKbE47qZQ9XXoD+aeMygdr9DdQKQ=;
        b=rYv4hWW7C8W+N8GFFj3eWB1YXtpNcmVZ9GiNkl7am6FF/J9jICsYeTKJov0m9dRuIo
         5DoWGPp9J25nRdsKBeQBSoX4lkGDZG4PIYQU/k6Fdxh3pikMx5MYaJrwCERn5EFtoU+s
         BG421tRRT1+TBNHX35eHrnJMVokn1ci4O4gnD+u0HQpM5CTz+9s9lRLkZeJUTpvk/N+w
         w2gymwiSIN5PbDn/EB3en5OcpSwYSnV6jv9D1wld1/mvGl5g/MpnUtpYduaE3cxENVsk
         q0cnnX7sGZXlzwGY+tjcAkMjUFEU0t1twy53WbqtPh4UVhdFrdeccqp1G2V6Xki097gT
         n0eA==
X-Forwarded-Encrypted: i=1; AHgh+Rpa6JYr2811tFyJOrWgmJsp1G6+iFnTrD6qPnRIJbcQSLa1l9trLC36JTUXcN6s1rO+OnD18WhB8bn0iDE7+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvD4qunNmtt05Rf49Dz9MCi8wGZxVcVM6weCj4uM2rD+yKRbUJ
	g1j7hiWjoNTKXoPqUWYCZJpUCvMKRnPFjw30YRX3ZiEAkWGc1xub2K4D
X-Gm-Gg: AR+sD11MRXHyZQdA5o1gyfGd7VF5QeF2E9xoPdNi84nTKpcnGjg+V9hUHdC0TiF2Tev
	cucUo/KgW16TvmQaLNAPNoOo2WYKUhr1OFpgvR2BTkc56E72wzP/bH0LyvBBv8SrIcT8xu99YvV
	SEho9XNI9Stib2DcOarp/INDHksojztQRfo3LLb9nacMMs3DXpyP3ZURN2dWgAWrTrmQULvdEMa
	RGcXcAu7GWcMbJSuTFfxMdoJ5WOH1ksFnpeWFEkX4vzlRxAmdTvSfryLy+jPAndQhqqz3pa8NjR
	1K8h20608w4u3X3uGHnYXamqzCvLNQMyFDrAE/ZOXIg7nzRC7gBxshdAPCT9wjOak+Nuik4Hsyo
	XB6ObLD2EvcUcT8OIFzuEpamhN6gJaHo37q3I496JWxDK/VuYU6Bk/boHQWRp6Z/r9t8KX4k=
X-Received: by 2002:a05:6a21:70c8:b0:3c3:a1e6:a624 with SMTP id adf61e73a8af0-3c6c7b921edmr1333695637.29.1785186861417;
        Mon, 27 Jul 2026 14:14:21 -0700 (PDT)
Received: from archd ([2601:640:8c00:a:1544:c19e:8a1c:4058])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm58456645eec.2.2026.07.27.14.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 14:14:21 -0700 (PDT)
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
Subject: [PATCH 1/2] drm/gpuvm: export drm_gpuvm_bo_destroy_not_in_lists()
Date: Mon, 27 Jul 2026 07:11:20 -0700
Message-ID: <20260727141121.11975-2-danny.pesic@gmail.com>
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

drm_gpuvm_bo_obtain_prealloc() currently calls this function directly to
destroy a losing preallocated drm_gpuvm_bo. Export it and promote its
comment to kernel-doc so the upcoming Rust GpuVmBoAlloc binding can call
it the same way.

Signed-off-by: Daniel Pesic <danny.pesic@gmail.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 5 +++--
 include/drm/drm_gpuvm.h     | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index d1c80ad3dead..30c134455547 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1608,7 +1608,7 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_create);
 
-/*
+/**
  * drm_gpuvm_bo_destroy_not_in_lists() - final part of drm_gpuvm_bo cleanup
  * @vm_bo: the &drm_gpuvm_bo to destroy
  *
@@ -1619,7 +1619,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_bo_create);
  * object if the refcount reaches zero. It's illegal for this to happen if the
  * caller holds the GEMs gpuva mutex because it would free the mutex.
  */
-static void
+void
 drm_gpuvm_bo_destroy_not_in_lists(struct drm_gpuvm_bo *vm_bo)
 {
 	struct drm_gpuvm *gpuvm = vm_bo->vm;
@@ -1634,6 +1634,7 @@ drm_gpuvm_bo_destroy_not_in_lists(struct drm_gpuvm_bo *vm_bo)
 	drm_gpuvm_put(gpuvm);
 	drm_gem_object_put(obj);
 }
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_destroy_not_in_lists);
 
 static void
 drm_gpuvm_bo_destroy_not_in_lists_kref(struct kref *kref)
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 38221d83285b..d014a389405c 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -760,6 +760,8 @@ bool drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo);
 bool drm_gpuvm_bo_put_deferred(struct drm_gpuvm_bo *vm_bo);
 void drm_gpuvm_bo_deferred_cleanup(struct drm_gpuvm *gpuvm);
 
+void drm_gpuvm_bo_destroy_not_in_lists(struct drm_gpuvm_bo *vm_bo);
+
 struct drm_gpuvm_bo *
 drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
 		  struct drm_gem_object *obj);
-- 
2.55.0

