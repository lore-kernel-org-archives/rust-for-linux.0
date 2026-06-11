Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF40B2E7BD9
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 22:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216270; cv=none; b=gT+NoamBR9IMIkBZYL07pKtaS+Y2QVy4DwpT9+QunFo8gdMIasLbPZws4OMbt9ZcVkOGd2BgvsQzH8AX/YcbBDTA7msDVFNRLgtQ0TwLdsZeJ3jAV/WqBBGDq6dPjtEHcYYdGu7qikg5eQs5oILBB4UpBIJFFpGP8uPFzPGHK1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216270; c=relaxed/simple;
	bh=p/AE47IyHcaebbFkTi9u6ikl0VqYeHTuPYLRWQ/mtXY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iIPBXJpaWUeZyc7waSAMDfic7Zu8Kyc1cmENowLhwt4AP5lvmtQWi53h/o/NCe95GiM/XCM8xxPOfGZPhaUDNWzujqu15y3tgBBsihITcVeRt6pCJpBeB+j8mumhonV+vs3aGLlCRwOrxmGb6KCVYrg7v71l2af2eaKweYfBI1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QgX/2LbX; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QgX/2LbX"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-137fe4a3640so577485c88.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 15:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781216268; x=1781821068; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dJIwQi130RYeZI/enMX21LFGK+1yh87Z79iJEkBqx7Y=;
        b=QgX/2LbXamnyeoPCMkX1G327yVnY/9Vs8ZMeSNT/zQL/eJJ9z0l0gAs1dZjn7ZgrqW
         04s/7aaW3wghg9kg3t7GVsqPR4VJIN9S2Mfvy0ipt0ynVu1iuM088XDAf9LLJWnYQGL+
         di8tAJaoOwU5YjbXeoHGvKbmLNH8x0LFgPPhrLK2r/6UzmcX8CigKwiZBnellmvGgiVT
         Bt2iTF2RExodM5Sit4q8ORlYugdef3pia/VxEP1P0Dzu4/4bfFkiQ5oAVPxL9J8B+nDm
         7OIr/kZOZBui2/l6zlyg6tXOtTItGuZ+mz09pUh5QU5cAXc/UN6Sv2QLLG8zF7UHc+u2
         mhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781216268; x=1781821068;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJIwQi130RYeZI/enMX21LFGK+1yh87Z79iJEkBqx7Y=;
        b=sRAXiEUzg//6Llp3lscZRx7poNeYt9hbhpreKTaQVumbR91u1KvE+vvoSJ2IQYRuiM
         Brw5n3dlPZI+XK4MPQTCr7s03WVLvVjDTcahDg+zKypYme2qpUeSBrqW8QyuNMYDWpEa
         7H0FlXqp/BrWU29o7BgYeZJ4qUWgdB+ewurtXudzahy+jjf/krryD07IX/lf/gEO09Yf
         PPsghXtczSMFusqrtf22j79OqI2po6E9RDMUBsK8sUxTexoY+WUi1MOYQognRdIDp1PV
         RKqIQxmxfCTDU1Atoy77UjZ10bhoUp5zeDZqYASlRSmo2erNyT3/Z1L/YQTRKjXxUw11
         sBnA==
X-Forwarded-Encrypted: i=1; AFNElJ+2+VzptMLc18cFJvFhk2gE2HYd2omZOcj5bcLrfKoet2o7YNLJmjYMGY0gDRbZew9q0JDqoue3MqGTx4GMOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTjL5JzMVcluAfQFKtOiIQ4mkrSfXJ4t2w04sd+BgxiYqG3TLv
	bDWxUQ11YYPAfMM8lVahsWwFGf17LL5pbl3hXiFHlgOunn1iZMcrLY9LBzQTidyDWWq3OmX9Ans
	qZeARS5V242qsNAD8ICxJsVip7SM+Pg==
X-Received: from dlbrl3.prod.google.com ([2002:a05:7022:f503:b0:138:5ca:19af])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2215:b0:138:2369:50e6 with SMTP id a92af1059eb24-1384bb678fdmr59629c88.19.1781216267298;
 Thu, 11 Jun 2026 15:17:47 -0700 (PDT)
Date: Thu, 11 Jun 2026 22:17:20 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Change-Id: 20260611-gpuvm-sync-send-aa47a9001ae6
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=p/AE47IyHcaebbFkTi9u6ikl0VqYeHTuPYLRWQ/mtXY=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnaxu9nXXv6RLPg5/od0xLXrywPmnCJd/nNtBMa5zz/W
 +1w+pV6oqOUhUGMi0FWTJGl5evqrbu/O6W++lwkATOHlQlkCAMXpwBMZPEnhj+809Wy3iUrTnu5
 cIFqmt7kP31RK6Mc78zwS3t6U3F/3sTJDP/ditisdQWNnm7/yX/15dGmScuULkySt9ze1Wd+7v/ vqWbMAA==
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260611-gpuvm-sync-send-v4-0-6c7f4ab2778a@google.com>
Subject: [PATCH v4 0/2] rust: drm: gpuvm: implement Send and Sync for
 refcounted handles
From: Sami Tolvanen <samitolvanen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, Sami Tolvanen <samitolvanen@google.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Hi folks,

GpuVaAlloc and GpuVmBo implement neither Send or Sync, so drivers
that move them between threads need their own unsafe impls. GpuVm
implements both unconditionally, which Sashiko points out is
unsound.

Path 1 requires Send + Sync on DriverGpuVm and its associated data
instead of bounding each impl separately, as discussed in the v3
thread. Patch 2 adds bounds for GpuVaAlloc and GpuVmBo.

This series is based on Deborah's DeviceContext patch as they would
otherwise conflict:

https://lore.kernel.org/rust-for-linux/20260610-gpuvm_device_context_v1-v1-1-01a890b17448@collabora.com/

Sami

---
v4:
- Moved the bounds to the DriverGpuVm trait as discussed in the
  v3 thread, and reordered the series.
- Added Send for VaData as pointed out by Sashiko again.
- Rebased on top of Deborah's DeviceContext patch.

v3:
- Added a patch for GpuVm, and changed GpuVmBo bounds based on
  another Sashiko analysis.

v2:
- Added a missing T::Object: Send + Sync bound pointed out by
  Sashiko.

---
Sami Tolvanen (2):
      rust: drm: gpuvm: require Send + Sync for the driver's associated data
      rust: drm: gpuvm: implement Send and Sync for GpuVaAlloc and GpuVmBo

 rust/kernel/drm/gpuvm/mod.rs   | 26 +++++++++++++++-----------
 rust/kernel/drm/gpuvm/va.rs    |  8 ++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs |  9 +++++++++
 3 files changed, 32 insertions(+), 11 deletions(-)
---
base-commit: 550dc7536644db2d67c6f8cf525bba682fba08d9
change-id: 20260611-gpuvm-sync-send-aa47a9001ae6
prerequisite-change-id: 20260610-gpuvm_device_context_v1-367c21f94e1e:v1
prerequisite-patch-id: eb2074676db5d923c8505208388fd1c0dba58b6a
