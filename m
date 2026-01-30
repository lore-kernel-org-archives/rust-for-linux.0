Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B2B1F09AD
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769783063; cv=none; b=K3Qjw0z3NC9WONAJ/rEfgPWYPYbxpAhLJ8rySgYAB0HFg65TCyirpi0bvDSQQMv3f4sv15KKLNPaEbuRz6wqLkDP9gJ82fsD6Xxo7DsF7yftipb2GAWdqfuoaGWXIyGCuOjY7Y9DipdLaI7KzF79fw0PVDqA7G/rpQ/IGM28Mvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769783063; c=relaxed/simple;
	bh=c7+gsehW6l++ywwtKH66K3DZWRLdGhqXlJPg2WevWJg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=P3J8FaEyTYdNzb2IeWLpz3HnK1uPnhzT6vj16VW7vXX0G/PKZMraWiwDc9sdt4Dy4Qh98OnM9hXjopLSZjx45szZdJfarkwxspZccpbtnhSFuoYtObqTAH58B9ywGe0UxmRY/jRUR4MFoIayq3YAnIlb/u07dyZwJXlQpS1lg0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gfw5vX8u; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gfw5vX8u"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4802bb29400so28513405e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 06:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769783061; x=1770387861; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wgH1umHMvKF8uVd86KXX82zt+PyZUkfGsFkd4abYEVQ=;
        b=Gfw5vX8uYhtNh8jd9ZDZjbqBJuIJ7KXQcCnQshjmoiYeYloxO/0s7FlBB9jeYgeTuX
         m5zl6MZcrLBfrGK5Q506t4SNUx5m3IdXdOi0n0HMv4mc63W5ZpAo0QG7JAs175OZYLYN
         mBZGn1ic/2d6Dx3AuTXeSj763MawSuB3JiZfl6ZvpFJBdi3y5yzoxu3+dC/XEfqasQwd
         oOrVBiz31Mjazra5bfdwufKME5Hnf51+8Ed8gVBQ+k1bAuYzbd4Gn6bx5k4U3fxFtmff
         ad+lGKaoVX6JuUpN3vab9TL5l7xtGz7XrgCQSZ81rLXJHO7Ck644mhL3fGUKJ4pO+BgH
         KPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769783061; x=1770387861;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wgH1umHMvKF8uVd86KXX82zt+PyZUkfGsFkd4abYEVQ=;
        b=Yv7uA7hiUMCMcqugCXrxwPyt/VkJ9sGhplxycrv+ClMDUhkPJyJ8Gqv5Dta5SOzsgz
         ZPb2l1lyy08NLucVMGHzwFeDa/pNzyJKzHprv1KdR37vadeCsl44fzTzrrugTT2/2k8a
         iBqX1QoNYO/sGHAtpDNkfaJTEnpSWfU3KMEd3HCjtlOwrBEJNdNw6v+j/JNrYdUajFaC
         BdRP1qq+d2SlvCfH60SLM3Rrn2bFjkpH2OP1GpAUQgfShCP8GkLvCt/n2zQ1Hy3g5CBq
         5u+m9/W/EUrRuiffpz0ayLc4EMsdb94uLY3qoMAzGq70rq13LMMvWJeGc5GKsQAu6P4b
         zt8A==
X-Forwarded-Encrypted: i=1; AJvYcCWbzED0hAbgQszubqCM9wif7/+C2mhCoh5D4ukvHvxoMAta/dSH2QtxWnM9Ey0e7MPt/WEogOt2v7HOkXcjBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOQEL4VId9Hk54bkxECqS9leX5HOtgqvMLMIlbo4YoqlN0IZuX
	CxbnqIsIcKqaiSZLsbj9OVSdnJsMybRqxoNDKQ5JgbsL3OTqzt0I5ELmByuvoYeIxr9mrxxik4d
	Wp9VJYePYNR/TDfCkgw==
X-Received: from wmlc14.prod.google.com ([2002:a7b:c84e:0:b0:480:2e46:31e1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c16d:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-482db44d22dmr41461495e9.6.1769783060869;
 Fri, 30 Jan 2026 06:24:20 -0800 (PST)
Date: Fri, 30 Jan 2026 14:24:09 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAm/fGkC/23MSwrCMBSF4a2UjI3cJH2oI/chDvK4bQO2KUkbl
 NK9mxYEiw7Pge+fSUBvMZBLNhOP0Qbr+jTyQ0Z0K/sGqTVpEw68YIyfaDNMsaN+CiNVFTtrqXk
 lTUkSGDzW9rnFbve0WxtG519bO7L1/ZuJjAJFVZelqrnIEa6Nc80Dj9p1ZO1E/rElMNhbnqxRB lgOUEhQP1Z8Wc52VqzWnAsNuUQtip1dluUNQ19k4h0BAAA=
X-Change-Id: 20251128-gpuvm-rust-b719cac27ad6
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2841; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=c7+gsehW6l++ywwtKH66K3DZWRLdGhqXlJPg2WevWJg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpfL8ODHdEgGQHcL5Hx5w+G06YTGrVLX1xlfPdu
 YsjP4Hhv+2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXy/DgAKCRAEWL7uWMY5
 RgVRD/0V0SYugUCUlBz1Sz9y942V/YvgefJCytbhSCJR46MtDAFQ84DBrnUujwLcy9XbqLRFbw9
 vijMkh2pKEwPCWCOmQn1Jfq/jGHs/kzM+pUSr+0uqeInyMtx1smuejcr4EMVz2+JMNqIhkkv2AB
 LbFXCPh3jKmFijP32lCojxbNxHIesmgMcwq0gMPZ3nunJsifWCnI2uisyznst6VNFqfHNlQ7jkF
 AS8LicvtviuEJHJnapnG1JBweUjCOiHg7HMxYu20EIPzD0XRbP5jJOdrg2K6cb0eoFKxUh57IJ4
 hSc1FMp4mAEyyQO3O0zDKERQIh/3EwMiyD3nSqVNbVmI0OiBHDx1WIQ1lwYoslkyzJl7m+5ejXr
 NeHea+soQ3XiNkY1/n87RxD7V7sX0Y164ODq7F7MZAy5lCUFrsamT5q7F8dGo8RLfe5LBWzIDK4
 Jojy/R7VzGaH6GV+YmpDPe05X6VK3SJj9Bw6n+mTvW1ltuhCnKgZGBnJR3fOUaIy023mGupQz0+
 Rg5ZsaNuxlDFT28Ur8T7S1CWMQGlp3FmPYj0K42eYS67JvjRljt4m5CX9ut6eTkRUcO9y4Qjk9+
 bRDVTy4bEge3mYvbXlxm+gl3xSCqZDASjuXHWWpsWtxUrSY3Nv5qQ8sKe9249OgJ46qaJxxxp1n vv5YsWte9cRmXmw==
X-Mailer: b4 0.14.2
Message-ID: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
Subject: [PATCH v4 0/6] Rust GPUVM immediate mode
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This series provides an immediate mode GPUVM implementation.

Only immediate mode is provided for Rust code, as all planned Rust
drivers intend to use GPUVM in immediate mode.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
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
 rust/helpers/drm_gpuvm.c        |  18 ++
 rust/helpers/helpers.c          |   2 +
 rust/kernel/drm/gpuvm/mod.rs    | 299 ++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/sm_ops.rs | 417 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/va.rs     | 148 ++++++++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs  | 227 ++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 10 files changed, 1131 insertions(+)
---
base-commit: 263e9ef3f5736697483af66babb8bc72f145b3f4
change-id: 20251128-gpuvm-rust-b719cac27ad6

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

