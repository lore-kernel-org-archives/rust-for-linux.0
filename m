Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863BD3E5597
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 21:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186741; cv=none; b=gULffqZGA3LUe0F8q0Fxd8gq0CYrIgiW8CIKV5Ztrr0xQWm01brSFxLYM10zyCGyOb2z0BErvCZOuySXPgJylNN3rn6XyqpazdYupLaJkViCcwrfTEK/GvHV6PrArYriQ+KyROxWrqp1gshrlUo6XE4yrrF67Bv58L7UBmfWCoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186741; c=relaxed/simple;
	bh=zQ1cx8WBYwkVXux7RjyCbeIUdKgSm+vA7wogQFvWqF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f2gYS8ErneCWoZiMqqWxSrz42/q9J0YTbTAV0x2WeU68/0JTPqMg+aIj8s8PXoI4QDN96uKcScC6C3NqUMB+edq90ToRGcbDq4pas/xXGBU0C0N2uCqT5R6Y5pRpHJTec3IpHeXNFcKTc2xV0cSVyvd4mZO7SSvdUramlrZqkYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ua9GM13D; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ua9GM13D"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso220563a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 14:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785186740; x=1785791540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvjIroWBUR46GpmdR10fQCd9PWHAMrSwKzxKCg+dB3Q=;
        b=Ua9GM13Da7X9XOqEOcHQ9XUy/gjvCveczeBdd6IdOmnDtSMZcctM1VfCqzrReJ0xhr
         y73GJg3R7eie34vYLNJ+VDM9opJ0pQcwHFkjNurShc89e7IA5/xeegUoieR8V7b1DL9/
         TKMEyTiH4UUI8DQQmNVq+XdLkRsQiTmoSS9RXm9sctWc4C3QUmk+o4TP4TyrXG17QHfL
         bXSGjrZvLDw/i8cwsNiihsEHyt6uBwnjXxeXkO3dkALTwu95DMOy5a2tfhm2f/mahldG
         /4ibnp6O7NTUk474KKVe5OTIlGI/oOdngrNihLV+t/TRRxIAusPxXG1Uglct6EKg5R2/
         GiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785186740; x=1785791540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvjIroWBUR46GpmdR10fQCd9PWHAMrSwKzxKCg+dB3Q=;
        b=YQKOsQTPwH1dt4DrnF6h6kWrwiId7uJ8QtrfjE1XumP0ha8E8Q731zi3Mn2r4nQbMG
         7xIs7Aurgqj17oZqmdsrHNAAEs5beqGhL2E5Q9+y68eh9yEqq7sqimkNZfXgF5v18xad
         XPRvjX3RMBZUhjY8TXwb5TsC97yhKrbT/v2zAWLhAhyBAY0W+rpvEPsLPbclX0eQ3Ikt
         +KQpxr5hQ19l6vnkTz42LDfOty2ojouLHyyfvYL0L5gV3/wPxRhjigqjkfZhepBw3mLF
         o1s5HgDuSCEUt1fRY8LHXlsy9hm+3Xbmm7EaHz0OGh5UmEdFZE7zRyPS4fAYGSgYLD3+
         tHPw==
X-Forwarded-Encrypted: i=1; AHgh+Rqf7BNeeiBCc/vrBzYLke8G7q3tFDpkwOwHCQa+KE6Z5A/hYCDKAgpVOzx8NM1OBAdzfZWzDOrCjDbHLt3Hvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw03443AwhJNRxzEbiUk8xnfzGIU+ljgexrxbZZC/Ee/EbktrcY
	MgxF+Z3QRp5QPljW2Dy9WxOngC1w2duNnK1W8lx4RNdDTnX9VKN6u6dU
X-Gm-Gg: AR+sD11Lph89zQ8B4UKO3ibmJi5HO4wyJtTPPtBLrxP7hCvf41J4i4VUJIykCjGgo0Y
	UKEsJBsuUqPNQmIDyr2kvRU6pmMM1t9NPMTFCI5UqKNGkVMk7qbqbvj2cLa+XQjtsYuz1i/Oxs5
	WQSFKEsO/iHBrd5PA5xw2HdfxtH6rfao88R7Gd434dgt7IjnkY1TQUkhME81/85oEE4mtuUKqhJ
	FuGDrTTRl3yUAc3EvHhYRs3hWFheT/oJpIoy27Bj6QT6pDQ1qDZEo50+47FPCjZyW7I02fIU32q
	3dg13kez+dv5UYgyKLeWe91hUK47pgkzY3xs1mFzHEa+aEWYv9eEt5fZcL8i0cTAb6p1PtykF5g
	LnTyT0gpCGyQA4zUdoDZjgf3QMJmPfPuIk5QC0eSWv4fgR8/vm0k75pgX8eI+tW5YaAJNZZ0=
X-Received: by 2002:a05:6a20:7faa:b0:39b:bc11:9ec5 with SMTP id adf61e73a8af0-3c785785491mr424424637.13.1785186739724;
        Mon, 27 Jul 2026 14:12:19 -0700 (PDT)
Received: from archd ([2601:640:8c00:a:1544:c19e:8a1c:4058])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm58456645eec.2.2026.07.27.14.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 14:12:19 -0700 (PDT)
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
Subject: [PATCH 0/2] drm/gpuvm: avoid deferred cleanup on GpuVmBoAlloc drop
Date: Mon, 27 Jul 2026 07:11:19 -0700
Message-ID: <20260727141121.11975-1-danny.pesic@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GpuVmBoAlloc::drop() (rust/kernel/drm/gpuvm/vm_bo.rs) currently releases
its drm_gpuvm_bo via drm_gpuvm_bo_put_deferred(), which exists to handle
destruction from contexts where the GEM's gpuva lock cannot be taken
synchronously. However, a GpuVmBoAlloc has a refcount of one and is
never added to the gem, extobj, or evict lists by construction.
Therefore, a GpuVmBoAlloc that is dropped without being consumed by
obtain() does not require a deferred put.

drm_gpuvm_bo_obtain_prealloc() currently handles this situation
internally, where it discards the losing preallocated drm_gpuvm_bo by
unlocking obj->gpuva.lock and calling
drm_gpuvm_bo_destroy_not_in_lists() directly, which skips the deferred
path.

This series lets GpuVmBoAlloc::drop() behave the same:

	1/2: exports drm_gpuvm_bo_destroy_not_in_lists() so it can be
	called from the Rust binding, and promotes its comment to
	kernel-doc.

	2/2: switches GpuVmBoAlloc::drop() to call it directly, and
	includes the safety argument for why its precondition holds.
	Drops the TODO left previously.

Note: there is currently no in-tree caller of GpuVm::obtain(), so the
drop path isn't currently exercised by an existing driver.

Daniel Pesic (2):
  drm/gpuvm: export drm_gpuvm_bo_destroy_not_in_lists()
  rust: drm: gpuvm: call drm_gpuvm_bo_destroy_not_in_lists() in Drop

 drivers/gpu/drm/drm_gpuvm.c    |  5 +++--
 include/drm/drm_gpuvm.h        |  2 ++
 rust/kernel/drm/gpuvm/vm_bo.rs | 10 +++++++---
 3 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.55.0

