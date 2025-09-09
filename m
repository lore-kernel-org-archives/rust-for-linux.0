Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4352021B9C8
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757424999; cv=none; b=DM+aZEQh8OVPBf9VLEEp+rkzRZ3TIA9znYXI0xiGttnTR5a6TviM6wpMc+BJjZRNokZEahPEUIytez5hlMtZierVHbNlDialAbhBAiEUCDsnBQ4EEQvbat+wq1WMRYW4OcQ6xSrXdymSGA6pV2GHeHyIakt8Tc/7M6wbxfQ1iWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757424999; c=relaxed/simple;
	bh=GeUdJBt+v1KLgbpRUvyZgBAL3FGBKi3BqI0ivCr3XSw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iBh7JfW26uWANzQUHu5bIm+m7hM6d71vc+qWR7sNhZWk855ZX+1DUTQmBoTuASbb2BFHwgcP473I9CRDdE/BFM1aR9VojRetRQ0X4w6/KwprQqPsAbqoOjUQ1sc2HALq8feDmSRgZ3PJMTi5CZQ9urfbLjAiNP9c7c3TDpOQkjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bpV1lJvt; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bpV1lJvt"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3e424a186fcso1807853f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757424995; x=1758029795; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kXmltCaa+AaoNYSNTm6MtPTiMQ0YZbzrD/4xtNxBMMM=;
        b=bpV1lJvta3dfswwRvwsoePBn68HkR/UorsZUHHbGQBD51gGfCCABPexhuKNzxcvv3j
         9RNdd/LMC0rWtLZ4JfFkphOYCpqTFRm13Mg9Lgxwy+CRlbR26vTTmm1xHI56YqgfxbWC
         JwrK1k/lGSBq5zKSFcaicVQOgbw+EASgtdSEdG6rnQaWVqHfM7nwGTKjiMvQVMJ5c5Mp
         aMhR62eLtOUCYryF4b/taF01Uw2skUOPQJykXgVakLd3X05DfEz+GI2wE5V+SocjPIDM
         bD5lL4V7V5tDFnF1IEkB4mq7g4tvBPTST9ONm6o4Qjo7tJI3uDRcJ1XlDQWIrjEZmkom
         lIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424995; x=1758029795;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kXmltCaa+AaoNYSNTm6MtPTiMQ0YZbzrD/4xtNxBMMM=;
        b=o89x0uPt3FlRx+D1AD4a817Lo/rM6TDUMQOgPPN1dIzV35uL+tEnCcGG0171/PY0xT
         lC/n5OWufIEeQlrPyMt1hV2wkWpaTd/GJE0cuecgXSZb37XiM4W8TUfHPskXeKqe3nAf
         If+vDmkgswe8BWy80a0Bo8eweoeOgi8VP6zKxtHroKhh6diiAzlckLi6eq/TTV7NhYG1
         ZNrxiPjXe1I62Llk9WGthtprzabY6xzV2MhoFqZr16X0PYhr0kqokswfKH3Z6nLdeYc7
         GXSkof71D2c/xNxRWH5Vssad8F4u+s8WGCJsNht8f5ZMl9jnEJSSysgunkBcFCf4oI9T
         BPAw==
X-Forwarded-Encrypted: i=1; AJvYcCWwZip5HB62b5Wv63hSGYF0FXp70n7Kg80zhYHzJRULsdsvCp0Ksa/MqzmSJ6CD8SJfNzAktsoHhtgjBI+S+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3izemzG4H0BlI9OgSWyUBdbnkXsuQwCWXTeLmwtqOV70XY79m
	5DtAxORQ+afnFV3JP7ODLo5HpGKkSpimNsNfxSLE/3HiZddO92edpBQUol89xhzFEwayEh2itKm
	O04M2Kr9nnzAOGiVLCg==
X-Google-Smtp-Source: AGHT+IGpd7wVDU7QaP3WDSMkWRZay0a703HdaORpePC2ExBYXtfISIk0y/IycXtdZ8Fxh2p+uKHUoHh4HXK5Hec=
X-Received: from wrp30.prod.google.com ([2002:a05:6000:41fe:b0:3e7:5322:fa12])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:a2de:0:b0:3e6:e931:b3e7 with SMTP id ffacd0b85a97d-3e6e931f910mr6330514f8f.61.1757424995549;
 Tue, 09 Sep 2025 06:36:35 -0700 (PDT)
Date: Tue, 09 Sep 2025 13:36:21 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFUtwGgC/23MQQ6CMBCF4auQWTumLVbAlfcwLApMyyRCSWsaD
 endraxd/i953w6RAlOEW7VDoMSR/VpCnSoYZ7M6Qp5KgxJKi05oTMvgcSJLAWtrbCemVkmroRy 2QJbfB/boS88cXz58DjvJ3/qXSRIFNoakqVs1XJvL3XnvnnQe/QJ9zvkLO1FwoaUAAAA=
X-Change-Id: 20250905-vmbo-defer-3faf90d821f5
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2470; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=GeUdJBt+v1KLgbpRUvyZgBAL3FGBKi3BqI0ivCr3XSw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBowC1dGqdohxONBkmeGDCsxY+w9d40QZKFJNsMn
 blUuB2WgMKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaMAtXQAKCRAEWL7uWMY5
 Rjl0D/9V49VT0Tbg6rT/l8FP+PvPvgDkL+20mqG6MQUaTYe15pW4fvIT38lA36TeEmLzYOOblJ/
 iNZu+LQs1SUSMY0XT3Lpd47Gd6suiwvO8aCo2+xsyMBmiA22jM4Wl7Ug+o/pWTMgOTv7kPqWsYI
 9x4izNqiAEeQW15SlpoGt2eVDbkqvz/JyZ3v9Y9Rmcv0TGs74YALbMW1Sozp/0EOgR2lAgklLyj
 uND73E1B+Kw+ObTcou+8WkikX7Kbg513yQdvJaAxWADEV8E2hALAYpGItOduFdNaM/HFtjvfLjE
 AGKeTZH0ZXRvlWPqCisAwJDw+gxUJvjvTkvuM79FioAaULVwmuPgjg65Xb8gMDT+UbyNexjQx5L
 QixxOGM6gEm/QVF4zWdmTfRnLpvuEn9G4VNNP5hALbxXKcN5iRBUCHbvCsmKntReOi4opHZmgDv
 71XTIAdFgQAHThObOuzMfbtU+V8qpbn9pVPxCkA+lbphh/HowtYrMVhR7v7DzJoQfvGIPQAqjkv
 nURbgyocHZ0MTNQeBhzmPrSoBCM6ZkXE6V7gvNnLPzmhZAhXY2HwB2UfwDl1BerLCFZ4mYlTSa4
 jnOsP21rmP/tkucFd1XQgh72IZGyLGk2zz8jvTFEOfJqz6tf/UgnPqEEtxTN69KhW7y/rw7vAGw D8A+EpkPjoC26qw==
X-Mailer: b4 0.14.2
Message-ID: <20250909-vmbo-defer-v2-0-9835d7349089@google.com>
Subject: [PATCH v2 0/2] Defer vm_bo cleanup in GPUVM with DRM_GPUVM_IMMEDIATE_MODE
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

There are two main ways that GPUVM might be used:

* staged mode, where VM_BIND ioctls update the GPUVM immediately so that
  the GPUVM reflects the state of the VM *including* staged changes that
  are not yet applied to the GPU's virtual address space.
* immediate mode, where the GPUVM state is updated during run_job(),
  i.e., in the DMA fence signalling critical path, to ensure that the
  GPUVM and the GPU's virtual address space has the same state at all
  times.

Currently, only Panthor uses GPUVM in immediate mode, but the Rust
drivers Tyr and Nova will also use GPUVM in immediate mode, so it is
worth to support both staged and immediate mode well in GPUVM. To use
immediate mode, we must manage the vm_bos and vas during the fence
signalling critical path.

The first part of that work was the introduction of a fence signalling
safe mutex for the GEMs GPUVA list in commit e7fa80e2932c ("drm_gem: add
mutex to drm_gem_object.gpuva").

This is series the second part of that work: Dropping a vm_bo object in
the fence signalling critical path is problematic for two reasons:

* When using DRM_GPUVM_RESV_PROTECTED, you cannot remove the vm_bo from
  the extobj/evicted lists during the fence signalling path.
* Dropping a vm_bo could lead to the GEM object getting destroyed.
  The requirement that GEM object cleanup is fence signalling safe is
  dubious and likely to be violated in practice.

Panthor already has its own custom implementation of postponing vm_bo
cleanup. Take inspiration from that by moving the logic into GPUVM, and
adjust Panthor to use the new GPUVM logic.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Fix missing kfree in Panthor.
- Rework mutex_lock() calls to be less confusing.
- Add note about resv lock in drm_gpuvm_bo_is_dead() docs.
- Link to v1: https://lore.kernel.org/r/20250905-vmbo-defer-v1-0-7ae1a382b674@google.com

---
Alice Ryhl (2):
      drm/gpuvm: add deferred vm_bo cleanup
      panthor: use drm_gpuva_unlink_defer()

 drivers/gpu/drm/drm_gpuvm.c           | 174 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.c | 113 ++++------------------
 include/drm/drm_gpuvm.h               |  26 +++++
 3 files changed, 219 insertions(+), 94 deletions(-)
---
base-commit: 7156602d56e5ad689ae11e03680ab6326238b5e3
change-id: 20250905-vmbo-defer-3faf90d821f5

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

