Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F6A3612FB
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022919; cv=none; b=bhIj5TcQYJQti3WDAVo3+H8l/EVaCnN8zdDw/uO4MIK3CRXsmU64yWG0W8cENUfDYey+SOhlWlr16JfZmzpVsdvpQTd2SECH1e7ePlCW2CpkTCSuKFFMKbx0q3Hllz9b0xEwi0/ltvASFLjGwItCo+re1zq2Q7N2cI1gYBmIaW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022919; c=relaxed/simple;
	bh=hBlKdMS6RYtRgGMEPDODjPhE5SmwLiL4EI9j5rPli5Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=W9AfXs7JHR0VJW5H8xzvnS8pAod6VDqsl7N/IGeuroGIWcWE03isJpkGG0FcXFspyfPAyzwAqv4ZWKfXcR5s1XG3umWYqt9igKRTcyHvD56KoVlJyZRfFAitxDQJcIZEf3iduEGe4a0wE6xfJLZKtoJXNrSun03qek39n39+Sg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K2k35VTW; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K2k35VTW"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4852cf0318dso21355005e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774022916; x=1774627716; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hILqzC7MD7FbW4XOE96YtVaGbJfLwnag6+QDuuvsh58=;
        b=K2k35VTWrVHNBUm65NkNHhtkTbDBU7jz/JT2yWh15A49Yj1RjZhK1Dnk0UsOd7KuaU
         7cppGJB5yXi6D+YvM4NkXJBijQ4iae6lUdWuWj+egZGcs9BtGB6ywunXIpF45JJl3DhS
         bxTu4KiKIoxq5HURj/HuCVscDeBIWuDKrJOCnKlNsFCR1HbjW3gkqRdp+5LsvkxVxz7F
         W11imRC3oOMWtQD2Mxb77TuWX6NL/g3llsfeBdjst2KyBbSXTdHlRAKTjbk8dAPJjmJR
         /g0r8/8qrcJBJGth9kldT8Orc9w3gxteIvEtw4sIQj8ci61oDHIL0UgNOOFluzr2nBa1
         HRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022916; x=1774627716;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hILqzC7MD7FbW4XOE96YtVaGbJfLwnag6+QDuuvsh58=;
        b=nL4sThfhjzJDyOQA0RwxZpqzJ16i8FtXPwlXr5Ep4ks1k03Vmbb7EUGs9ki455TGbe
         T1saIRO8Qe5EIohv+VSa+tbF6gMwqEgp6LMhnFEKwBQHIJr7s6KodqprX54EVC8FgSLk
         Yyt4vMXDu99+LBOmzY/K9bEbOoNQsLMMNOGoGo11f9MYPGGsTVHcg1UB1Fn3do7zw/fv
         gRF34odawAOgsanGThUiKpZ+ZrjIhpEhSt+K162TBEN58QY6+0ld5yUY2CiVDCf4s2Cw
         OAOkWpnzxCsLlhJ1cQDjZ9w3WIwEPeNzhZXdblX/jonLhbqVGR+FeaNPF9qPVo8nfU1D
         nAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzGg24NiqUfnUzL1Xad4ge4pnp0GOcrKdjGJtwidEPT4ojZXecEBR4lhkTswTReeBgW/fMvfZNHSO9gX/LbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkBf3YNxSbsbHgoRImOOHWAhxJphpLGCc7ZWcB2qI3N92oBUdA
	8r+ofccBfAzB4PmWT7A7FKPOJJdwJwtR19pBWUb80BBCCs+xFls7/6ZrGmnIocVYDH4MuoyBJAZ
	wq1Vk1fyx5TXiEY0Xrw==
X-Received: from wmoo17.prod.google.com ([2002:a05:600d:111:b0:485:4ce0:d98f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:2d14:b0:487:2b7:18d1 with SMTP id 5b1f17b1804b1-48702b718demr12384625e9.33.1774022916077;
 Fri, 20 Mar 2026 09:08:36 -0700 (PDT)
Date: Fri, 20 Mar 2026 16:08:24 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPlwvWkC/23Oy4oCMRCF4VeRrI1U5eZl5XvILHKptAE1kmhwk
 H73SQsDNro8Bd9PPVmlkqiy3eLJCrVUU770oZcL5o/2MhBPoW8mQGhEseHD9d7OvNzrjbs1br3
 1Ym2DYR1cC8X0eMUOP30fU73l8vtqN5yuXzMNOXBy0RgXhVQE+yHn4UQrn89s6jTxbw0gzK3oN rgAqAC0Bfdh5ZsVOLNysmGrPShLXuoPq96shJlV3W6kUQFBxajmP4/j+AfajeGXWQEAAA==
X-Change-Id: 20251128-gpuvm-rust-b719cac27ad6
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3392; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=hBlKdMS6RYtRgGMEPDODjPhE5SmwLiL4EI9j5rPli5Y=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpvXD9hBnBy4v/N6Ooh3haSutKrTSCowEuWwZf9
 kZMSiNUnCOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCab1w/QAKCRAEWL7uWMY5
 Rr0QEACZwV9PxTgCruBbLTsHjzQgM11t+YsflqqbdcOgBS/GhczSHGBedviQkKyhzvAMab4HhUl
 mdsRWPVwejLNQigClprES3R4MULyJdPhYfR97xA9QffeRgfjgwzkupOrre6COplPPfZQ0xK8FQl
 THXBKbzpdG49Ew+gup/wCJasXqCdCGtaHQC41z+mk440fvmiP+jxAIKVxtjYV8v9u84QWMSzYec
 k533VjGC2VwMPYJp8k1wVToNSx/Qj1XFq/KdsEq7phQtFoLpUijN6ODhnM5E2d8cxYDpZD3Psz/
 lDDr2AkmbYPoa2ndyrLLFJHp6X6f9c4ikaLmm+akIlqAX06hhqrrqhatGFcvbP9C2EsY5q/QXg1
 Vu9dl6J7eZ+m/LOXI2MoaPfnHT5hxiK4nAzW5HSOQTpD9S+ypJmBPOdSbGT7837CsFTdan2mWy2
 cZdXgLqL7eO7HfuRmsj5FUVaken6OCRCe/RVYJX32Aw49NjesaVsDov+toyluRsmCB0T7E6ZTvq
 L9qfmg4gC4VKE8CKrzOQsWiviHe8sUljWf7BPDNZgSKMaQlTDkzRvxDFPJO2s77/5scbnd2F/1l
 sKMtkVddXR6A7NGJbsah41YY1WAFhxO/R0ZQ0UDzRJKP9m1UQZh3IKM5GafFsatzfCB1zhoCo+D C7ex9s8fEM/0HmQ==
X-Mailer: b4 0.14.3
Message-ID: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
Subject: [PATCH v5 0/6] Rust GPUVM immediate mode
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This series provides an immediate mode GPUVM implementation.

Only immediate mode is provided for Rust code, as all planned Rust
drivers intend to use GPUVM in immediate mode.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v5:
- Rename GpuVmCore to UniqueRefGpuVm.
- Implement Send/Sync for GpuVm.
- Move helpers/dma-resv.c in MAINTAINERS
- Improve GpuVmBo allocation and free docs
- Add "in GEM list" invariant to GpuVmBo
    - also mention said invariant on GpuVa
- Replace GpuVmBoRegistered with ARef<GpuVmBo>
- Add TODO about dma-resv lock usage
- Add __rust_helper to helpers/drm_gpuvm.c
- Change _invariant type to silence type complexity clippy lint
- Link to v4: https://lore.kernel.org/r/20260130-gpuvm-rust-v4-0-8364d104ff40@google.com

Changes in v4:
- Add trait bound so that DriverGpuVm::Object must be the same type as
  Driver::Object.
- Add rust/helpers/dma-resv.c to MAINTAINERS.
- Add __rust_helper to dma_resv_lock and dma_resv_unlock.
- Rename GpuVm::raw_resv_lock() to GpuVm::raw_resv()
- Reword comment in obtain() for adding to extobj list.
- Fix typo in commit message referring to GpuVm<_> instead of GpuVmBo<_>.
- Changed the PhantomData type used for invariance and add comment. (No
  functional change.)
- Rename offset to gem_offset in args to sm_map().
- Link to v3: https://lore.kernel.org/r/20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com

Changes in v3:
- C prerequisites have landed, so only Rust part is present.
- The logic for drm_exec was removed, and is for a follow-up.
- Split up into patches.
- Add lifetime to SmStepContext.
- Docs filled out.
- Mutex abstractions used for GEM gpuva lock.
- Drop 'shared data' concept for now. (Can be added back later if required.)
- Rename 'core' field to 'data'.
- GpuVmCore<T> now derefs to GpuVm<T> instead of T.
- Renamed GpuVmBoObtain to GpuVmBoResident.
- Probably more changes I forgot.
- Link to v2: https://lore.kernel.org/r/20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com

Changes in v2:
- For this version, only the C prerequisites are included. Rust will be
  sent as follow-up.
- Add comment to drm_gpuvm_bo_destroy_not_in_lists()
- Add Fixes: tag.
- Pick up Reviewed-by tags.
- Link to v1: https://lore.kernel.org/r/20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com

---
Alice Ryhl (4):
      rust: gpuvm: add GpuVm::obtain()
      rust: gpuvm: add GpuVa struct
      rust: gpuvm: add GpuVmCore::sm_unmap()
      rust: gpuvm: add GpuVmCore::sm_map()

Asahi Lina (2):
      rust: drm: add base GPUVM immediate mode abstraction
      rust: helpers: Add bindings/wrappers for dma_resv_lock

 MAINTAINERS                     |   3 +
 rust/bindings/bindings_helper.h |   2 +
 rust/helpers/dma-resv.c         |  14 ++
 rust/helpers/drm_gpuvm.c        |  26 +++
 rust/helpers/helpers.c          |   2 +
 rust/kernel/drm/gpuvm/mod.rs    | 306 +++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/sm_ops.rs | 417 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/va.rs     | 150 +++++++++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs  | 234 ++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 10 files changed, 1155 insertions(+)
---
base-commit: a19457958c3018783881c4416f272cd594f13049
change-id: 20251128-gpuvm-rust-b719cac27ad6

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

