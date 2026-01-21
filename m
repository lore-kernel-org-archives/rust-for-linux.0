Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1665F3A7F57
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768995112; cv=none; b=LXSJlVRIDFkg6JkBpQko0JeL00vE4DHvBlQNThPB2JUdKYjN35V9pHyAF/JCJdkzXlpFLPOYG8I/dW7xAgI9DBAb8PQ6ku/px2j7g0CupyP9Tumue47rpDlHnBKjxBVRWiS3e10rMXMQLtidf5WeAOnq2x8zjHSL4Js2KCr3be4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768995112; c=relaxed/simple;
	bh=BZWCRFLXkjqhK1Z88505dFjo7BoPBfOgcyNTLcg5274=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=I3hkvG47K9uR08nbkR7QG+4w96ZTpGdOUeIAjPG/OD3bjolYEqPdBDr+V4Eim/zmW+vVFDLMf8V0czFEhA0dZho8kJH3j0JdNbYTjrowgy80lZFPaHQHozkHgtF2GXx+9MF593999r4U396IWBW0EbcZ/cVS63Ik8CPznfpIxjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ktD+k31n; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ktD+k31n"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47edfdc6c1aso51463865e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 03:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768995109; x=1769599909; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4mdQj1bvKDaw6tJ7zJN+NnDko+TtCOU2zP4qWX6ApPQ=;
        b=ktD+k31noQuVVohylxq23dw2hfs6z6xQy2krTpm/GuFgPWlD5lHB8CABCt2OqNH/0g
         nXY/LnRh3E8AFF2XqcIqc7kkO5MGZP0Amymtj3eFI2HjysmiOn1Nb4y1ljXT+o7GQWLk
         uShqORRuduNNzDd3TjWW38EjrzgaVDoixv1jzloQFmbYF5e0NUNTz9T/68F2QjxcYEpE
         ohbYHS8Bl/KD8ysCmoM2b22dzJs+FQEJWVRSFcIVFStto8bKHQYqm645cIqoeHf6kIRH
         qarSDXfbz+IRgdYTo86koP3sPQuokibLCXRsgtnH1grdOXd9h7uY72gS7UE3kKmL4UpC
         ruOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768995109; x=1769599909;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mdQj1bvKDaw6tJ7zJN+NnDko+TtCOU2zP4qWX6ApPQ=;
        b=QUVFpJlne9bohuzhHcVt3IEEhY75q76latjflukKH7MYITwcx/wD4bb3cnIP/dLoYu
         My3v6qjzmqWMfRizQBmqCVPRIW1vIYIv52CRdWz16naRITZt2h32bTy8MwFeHbZnQuYf
         W63Q4AR9gVCBdIRXYltmfO3ScUIbzG8PwjTNJJ24Jhp7olCw3+v6tf8m3Ngc6uNe2UCd
         eEYJEV5dmUdxZz/qbF1wlsu+XC34E8bH8Pp2+m76GAV3nWk2ZGmSBVf4DzqEhF3KdNof
         x/MHHFy9mTIJRsVTkFIBVb402AGTZHY2BRFpoZrc2rvBjA9GkPibYSw8E5+cBfiwzgGb
         dgZw==
X-Forwarded-Encrypted: i=1; AJvYcCXBPgouD/g8SiD4ADJxPAfyCFy4WHB/bb6mYYWivNw+urIr3rXpnpKSbMp21wQ/fv5TNx14D22p1ZzHkPnpiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1HcOq6HL9h0mPqRfNSKiBp4tRjPAJSoKCy3JhyKp5MKX9fqK/
	WwJMLNCFXDXnASfbDYUuKXEUgk/p8zZK2f3bJUMKsxJa1z5bgbEZw2za8nGB+tY/VxJYz/qYWsC
	wqbTNdvv58nYd6v0ncQ==
X-Received: from wmco6.prod.google.com ([2002:a05:600c:a306:b0:47e:d98a:b5c5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3107:b0:480:1a3a:5ce6 with SMTP id 5b1f17b1804b1-4801eabf6b4mr226568075e9.14.1768995109430;
 Wed, 21 Jan 2026 03:31:49 -0800 (PST)
Date: Wed, 21 Jan 2026 11:31:16 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAW5cGkC/23MSwqDMBSF4a1Ixk25iRrbjrqP0kEe1xioRhINL
 eLeG4UOhA7Pge9fSMTgMJJbsZCAyUXnhzzKU0F0JweL1Jm8CQdeM8Yv1I5z6mmY40RVw65aat5
 II0gGY8DWvffY45l35+Lkw2dvJ7a9fzOJUaCoWiFUy8sK4W69ty88a9+TrZP4zwpgcLQ8W6MMs AqglqAOdl3XL4Ku39/hAAAA
X-Change-Id: 20251128-gpuvm-rust-b719cac27ad6
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2204; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=BZWCRFLXkjqhK1Z88505dFjo7BoPBfOgcyNTLcg5274=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpcLkYKwMOETW3FfMZsE5YWaTcRU+Dx/I+uQMZq
 zYjWZzvJDOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXC5GAAKCRAEWL7uWMY5
 RhiWD/0SsqiqQ5F2+aIVmxYumjMRZy5kct/zEaHje7Ey/vJWcbrKouTg51ujxypn+7GWX/LnqM3
 puKgrSPlJpc5rB3+kPUOCsYBT+hRaDjp1ftJ6pDp7GfVoof7GxpYU+3TbPgUxGVqaiPHZ2kcgMe
 oTUBNk9AHBQVmKr8dDk5YYJsMdStOTP8sr0RdApZ8vkx+VKGFM/ZKr1xucbf6+BFVbpfy1PRXWC
 OMa3DRTcKDUjA4KHfS0TbYSW66VsztmZmPDW/PzJNmyLUrGThIDVTfKMscU3Ym/sbvZP2J4mZIg
 5Vjp3+M2ds+b9zz9gU4kluwvIn7PxNGSRPvJRPicWzPmsfE+DUBBt2Fnjqj0QZaMwapbzQu7I99
 tWH/z5hzJa4RagzHSK9imYDSHaZYD9z/6CuJZ09T9JpqsD2eIwuHPn0mt/Xhe/ivRu/Ks/Hul8k
 YkWoba21+xoyIQaP9VPOJ+KUjQPUlFxLZxXxaSyyfT0Njmih1Xi5/b/cjQFkd0r+xCDylKXhaOL
 txrKFCAQl6mJVfoZqlcXbNRh6pUN9lA5+6fhAW/1LcWXqIhPEry755uXDx4/MO6nKk6ER7MYbPU
 9vHrGooZvJ3eNYV+s5kg72aOhty5vzgw2ENOg3Ud2aIBwQ674Axhe6SQ5YeBsRUq9NR8GN9miKQ WX8tAJuJwdjWFhw==
X-Mailer: b4 0.14.2
Message-ID: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
Subject: [PATCH v3 0/6] Rust GPUVM immediate mode
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

 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   2 +
 rust/helpers/dma-resv.c         |  13 ++
 rust/helpers/drm_gpuvm.c        |  18 ++
 rust/helpers/helpers.c          |   2 +
 rust/kernel/drm/gpuvm/mod.rs    | 299 +++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/sm_ops.rs | 408 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/va.rs     | 148 +++++++++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs  | 227 ++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 10 files changed, 1120 insertions(+)
---
base-commit: 263e9ef3f5736697483af66babb8bc72f145b3f4
change-id: 20251128-gpuvm-rust-b719cac27ad6

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

