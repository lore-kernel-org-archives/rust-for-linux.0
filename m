Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C586E2D3A70
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 11:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765453135; cv=none; b=gwsJkMGfa/OPazVpHm0VpJlZ4H+Zgcz5SMQulfcwZsabydX2riaxFQ19ZAVJrpg4HiXK6PjgLqM4YQxBGloV9wNpsOwBKYV9gaAtfewuYYVadulqbRmwW+lbCFLzs/7Bi+6MC5hotmudlYGHtdXgrQ3OS8tZPMc7qgp2Qcrawtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765453135; c=relaxed/simple;
	bh=5Y31NDzJOQLo8zstlBB7RMo9nYwxoJpvA5Kw/9r3xDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DczPpp3JA3qwAI7SjLnRX/EWUIoQ8hvNw3b3rScWl2MTLTkaSgPV/hJNdntst1lRtRDwRuPx/K9PgVPiC+aU84lNkAhINs99CjzX76SlIIwMzhit5k0qtmv+iRyjlmhIQe247MDXMzTOnx21VUUk5X6+vbXLmWo5GiSe3HeJP40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyZqEFFr; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyZqEFFr"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-343774bd9b4so715120a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 03:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765453133; x=1766057933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHttjLmk7tTFtYOCzdqr5Ogxj4lalzdnDKACJ4Izyds=;
        b=FyZqEFFrmv6jH9yWun0h/+CGnez1omE6EBu9+xvY8z7zGySSPXTKAAMkW4bJU1fX6j
         ft9xc0i3u/dpBy/UfftEdDqKIYPe8FtFt8yFy6belP0q8IZlJr6Al6LJM0ZoV/8Yovm+
         NfKM7NXANq3gg1iGCRo+GmFcZ/wMPwFAMLqt6tBi6B+mxTDrY9kaT3R/xn2/AraJIUJu
         B8/CGWw6ugrVN5DV9wsHfPwCO7W+224f3oR/nydS7SE4xT4dSgDLqoTX7lBZSqHesHXu
         VjYkUJRCE2sbs+Ee24OCuKqKODoCAZwpuEYQjDVnbcywKsVSQuj7Pja8T2JTWZ/wdu+f
         6NlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765453133; x=1766057933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHttjLmk7tTFtYOCzdqr5Ogxj4lalzdnDKACJ4Izyds=;
        b=RwvUmnT8aF7wLjpYKH8akn/tBuRzYq0L4c9xHtVJSrgLl3+LVoBSczonDUjZmuNZ7N
         DXU68vIp6MHd3w2s0safZd4A3wL0i2V8kppDL+1LNZe9SwcEHNG+lT9GVn1ININaKrc9
         FJJekYI4iapo2sJ8mWXE4tBfKEXaw8K6Oj4nXapyeoZZZKBgpSL8qFmPHoVe+o/AuFyR
         iVjNQIGjeb8WLYyPbuCqLUVWTieA1ED6BhZZ4LHvQPCFcXvo+Gc4K73rFEgk23rK9cN2
         pImpkIOq86LdyfWC/sMpbES0YH5mQWlU2gLCFjIHv8E0+PhHnbHd7ETp3IwyIEPENFod
         jtXg==
X-Forwarded-Encrypted: i=1; AJvYcCVSpfnkVkWgnFwrQYvHih1ENiVOvpeblhGYVcmhKHB6f+6zgyq/cAOEJxX+0+iJE+VwgFf+NyYcla2i+94HFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCJWatmlDTaGQ7G9NET6AGHT6Quj4Qw1/MmP/cLLlV+UwRegN9
	+hVHue0lw+84xmSbV7Px8Sa3jTEzGQACKG5ko/OLY7fZayY56gk0IQrb
X-Gm-Gg: AY/fxX5OggE7sp3kgJp8VhNz/qORJLrPrXfVSrKhW+7syHdl5Lj6j8cSh5UU6cJtNG1
	7/qbHL3YBjm8f8aZFqr20KIR00ARntcsh580QNnRpDBISYCpeoKSdjcGCfeSuaHbrSi9u/y7p4M
	sZ6VDb71a+MEMX1UcRETk8TlGYb5unQxl2DQajrx0qPgHxcIUXR5W/NrBNHDKMX2ATrLd18OZZu
	ia0zhHXC4PKRx2e4451wqKrd5GKNoXWn+oOnZTevACbbsMH/U1Qt0F68nEi8q/KrtVo0Z4UMUwB
	o55yYrW5koG4FrT9W13rctHa1l9ARGVToBpo1sKEFIKPo3y/mplLFBSlr1h83Z3e/UxH5EeH6om
	D1cBsJ18a+CNa4BCCffOR6V64BuNsIiVgXJIxAJ3CvPql5GfuzZUx8B2VBGGC1g/pEUMHlLFtbo
	4ciumkgBShXskq2ZvuRg+mCVUMuuKVOK2tbQP4tmL08KcVSBrttfphWS+E5PU0sWOVQTq5Vnay
X-Google-Smtp-Source: AGHT+IE53R8K8WEvN737u//oWFmHAX2pr/X06pE0KkgLSXUbNZk2k/kNhvsnA2KXjTvi3wp9mxOf5Q==
X-Received: by 2002:a17:90b:2d4b:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-34a7284d094mr5626008a91.15.1765453133081;
        Thu, 11 Dec 2025 03:38:53 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a9264e4f6sm1780337a91.2.2025.12.11.03.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 03:38:52 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: acourbot@nvidia.com,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 0/4] rust: Add i8 and i16 atomic support
Date: Thu, 11 Dec 2025 20:38:22 +0900
Message-ID: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds Atomic<i8> and Atomic<i16> support; including
load/store(Relaxed) and load(Acquire)/store(Release) operations.

Relaxed operations are implemented in C's READ_ONCE() and
WRITE_ONCE() macros.

load(Acquire)/store(Release) use C's smp_load_acquire() and
smp_store_release() macros. They internally use the appropriate
architecture-specific instructions.

v3:
- Move i8/i16 AtomicImp next to i32/i64 with the comments updated
- Add a comment about leaving the existing macros untouched
- Add __rust_helper for helpers
- Update commit messages about atomic_ext.c instead of atomic.c
v2: https://lore.kernel.org/rust-for-linux/20251117001035.4068507-1-fujita.tomonori@gmail.com/
- Implement relaxed operations by using C's READ_ONCE/WRITE_ONCE
- Rename smp_load_acquire() and smp_store_release() helpers
- Simplify the macro to generate atomic methods
v1: https://lore.kernel.org/rust-for-linux/20251115050305.3872412-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (4):
  rust: sync: Add i8/i16 atomic_load_acquire/atomic_store_release
    helpers
  rust: helpers: Add i8/i16 relaxed atomic helpers
  rust: sync: atomic: Add i8/i16 load and store support
  rust: sync: atomic: Add store_release/load_acquire tests

 rust/helpers/atomic_ext.c            | 44 ++++++++++++++++++
 rust/helpers/helpers.c               |  1 +
 rust/kernel/sync/atomic/internal.rs  | 69 ++++++++++++++++++++++++++--
 rust/kernel/sync/atomic/predefine.rs | 24 +++++++++-
 4 files changed, 132 insertions(+), 6 deletions(-)
 create mode 100644 rust/helpers/atomic_ext.c


base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
-- 
2.43.0

