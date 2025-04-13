Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD652EAE6
	for <rust-for-linux@vger.kernel.org>; Sun, 13 Apr 2025 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744541819; cv=none; b=f2OqK2fRA1LvXZ1ay2XoXofkVbuQtrRKGjkF2lKp4zX7WMzFcmc2yd123wtYUoxhYRdaCw7zMSqhjaR4Uoky76ElR4QRpEwT31nI7N+b91wdHrVliY/ju5aYP415MZaeTpSzMAvxteghlKQoVOyh8We6joRxTG8t7djErPZ0AZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744541819; c=relaxed/simple;
	bh=zUED0fZBSGZGpRiFbP3AegMWGoYYA/oDWMidWmOcL0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kPmVRmooomOAuITLd0kVqV2CoJAg9TeZqm8TvFBWWNsK8AtHAnrSOfpw5sY/F+lyWEIQD9DMFW0sJJy19MmWuTDeW+Di0656IqTPP6gPiuiYqidTwTu5SR/6iREE0T2nJa0MNfLpVh7jTXbURBu3rpfg2GW278IcdG/gGA8avzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYpoX9UR; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYpoX9UR"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2241053582dso46162235ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Apr 2025 03:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744541817; x=1745146617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3yczatl+gXkGUTiYZLWFbZrdh7tTN19+GNfTz++1lX0=;
        b=TYpoX9URdSMDBJKiwjf8e5nBdbZCDLbqDGRp1MyHsJR75OXFtliEjnDFp/ZwNQY1uK
         LYlWonttolVYxBtvzReIaIfuUmX5S4Dy+Dj3Eb/vYUQXDPTw36pco8/w7Vg67XVszeM3
         l6wCAZBbgA/A/vkC7mptrjM6nxuIvGrENurF8mzSJ6ZfC0LZE7pSKHwScsYM22I9Wsza
         QBIxnnzv52t1yzwuNP2FdJCEjxW+C3Qjm6gLIx02Ih9kFO6spodek1GIPdCh8FD6XKt1
         M+/jKP70D7/itrxXbJQitfrKSm/YRQcObXxYAqqr+t+aiwOjR7mVU5GzNZnXObmu1RMh
         uz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744541817; x=1745146617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3yczatl+gXkGUTiYZLWFbZrdh7tTN19+GNfTz++1lX0=;
        b=fDKiKgblEsDHZp5E5DCeghThi1fQzys/+Epxrg+84DPBM0uyyMeQCZE7l7tGRljYjw
         2okjbXnigkrFfucyt9yFINVZvxuFiA3ynTd5AZtcHw8UGHBt0J5Nl8o2XJZSEBcBsMdh
         3QEs5L41jjSpG0tFE392fTFU31jFszlXEUK8jLLAOwvSmlo2DCez2KNCFnKFiw22VFqS
         Wh9WxlPcTpqXyoIbYgrbttCz2gnmdwcVNIjqMFsBi0BKn/5+8jeuNkRgDkF1wCb0fmQc
         fH4PaxofUpKONfXtQ+NqVhDqmkrsMmsjlfDbeYh5fPByLc0sSxuAPvVdmLAVCZyr8/xb
         OSKA==
X-Gm-Message-State: AOJu0YzVUN1z8SWayRHX3XFwXRWtZGtaP2oSIatBc/apw1wqG8BnQZaE
	xuRzqadO6+YRP+/mH1bCz0fOrGROkeIwxcBANg0pZbs5KUEqNvD6G0pphgm0
X-Gm-Gg: ASbGncs68dl8SQxkBab38LH8ZllBCy3vpNt7ZINyr8uSKJt2Z/Q3FSWi8aCsdSgQJUJ
	CalmnID4KkN2G4EoFfrW+LKkUTt7eY2FOW+l9UMRyRybTn8ztirKcFScYstHl0aVhK4fxE/J0d8
	rZIf3igNbaT5kFp7qLNJl29BM8d+nrKzkLWaniIB4gOnXvdsmF0bq3/s3UYhAxas/ZBksPrPlKO
	AoUXhFueS7/6i+uYPnWZqyze4Qy5V2+t0EZVJbtAcNsoyriX0p7tNUyPmjHELqefaCN7/85htCV
	kW8utNX6prR6tdybcFrIjgJj069DEFh9R/JySz1wrv/3BoFk+NwgQQrq0FuY2ZDRwnKlxnPnJn6
	cFoiCZW/Ne7+RvXc1FA==
X-Google-Smtp-Source: AGHT+IHC5jHlbB4AeCrJlBnFxmLRVgFtw2iPbDxwtnVR6K1j4OyjZlq2oboAAPnpWvCW8YhwA8HshQ==
X-Received: by 2002:a17:903:3c68:b0:224:1001:677c with SMTP id d9443c01a7336-22bea4a19f8mr117885385ad.9.1744541816959;
        Sun, 13 Apr 2025 03:56:56 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccab77sm80667215ad.214.2025.04.13.03.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 03:56:56 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@linutronix.de,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org
Subject: [PATCH v1 0/3] rust: time: Introduce typed clock sources and generalize Instant
Date: Sun, 13 Apr 2025 19:56:25 +0900
Message-ID: <20250413105629.162349-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a type-safe abstraction over clock
sources. The goal is to remove the need for runtime clock selection
(via ClockId) and instead leverage Rust's type system to statically
associate the Instant type with a specific clock.

This approach enables compile-time enforcement of clock correctness
across APIs.

This patchset can be applied on top of the instant and duration
patchset [1].

[1] https://lore.kernel.org/lkml/20250413104310.162045-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (3):
  rust: time: replace ClockId enum with ClockSource trait
  rust: time: make Instant generic over ClockSource
  rust: time: add ktime_get() to ClockSource trait

 rust/helpers/time.c                 |  16 +++
 rust/kernel/time.rs                 | 200 +++++++++++++++++-----------
 rust/kernel/time/hrtimer.rs         |  26 ++--
 rust/kernel/time/hrtimer/arc.rs     |   5 +-
 rust/kernel/time/hrtimer/pin.rs     |   5 +-
 rust/kernel/time/hrtimer/pin_mut.rs |   7 +-
 rust/kernel/time/hrtimer/tbox.rs    |   5 +-
 7 files changed, 167 insertions(+), 97 deletions(-)


base-commit: c15cdb5491cf0af24d5558cece48cff059c50785
-- 
2.43.0

