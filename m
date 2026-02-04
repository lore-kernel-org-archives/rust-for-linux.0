Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AA341C2FF
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 15:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770220257; cv=none; b=ZhAtcSjMnHL5bgAnpLosU7QQ45OM4c0HViKmyNHzhTL4SjAdDSl9wh5sd7qGpfC2115h40nIWDSPB5OJ7bc8Zo4zSl/+CldzfNnv2LNikrbBUG285FBUQLbXD7LHpLetvOJLfOnGoEpSCCDV29PoprwptoEJvxSD6eDM+v+zbsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770220257; c=relaxed/simple;
	bh=pf9piQbIKaU/4miTSzQgshVkdz4xFowimaRpgN9zJ+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=su0+ty6BinrmyOdJXwChA+Gonre4lDM8mSfBDStDQcZlsW+rlkyC7cquyKKRoPTElStqVeWOouPtVfVHS2JeMNl7HCFdOCbOBHbgtTQ7Yg6BH8AyIErkiGpnrFp7cnctNvQcwEhYWtBP6MLoaumde+t4SLEKwSdFqghr9r5gbQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SC9loFxn; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SC9loFxn"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so50793015e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 07:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770220255; x=1770825055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MlEm4vHL6tKPzmv658L2EhVp1N/w5kYHb9cCJLXYzDQ=;
        b=SC9loFxnahNvsxQZBuK2WKic+QtnFP3HhCWSGAda84h+MhtzA08gVGCL5HjeyKZ6nQ
         TN7WUmEYJJWCL1pIsPHa8ekr/XQyFSJls1FX+vpITeriRwjZHigMAHMLBMEpYEAQEri0
         3WGxu+aFLGVA9dCYb+2ChJZJpbMYDdc3V1zxL9utx2BKwJipWhO6za6W/1GCITrIDZan
         OKPuTfemspy2ErceUEkPRxFtAcgD7u1hZZv/oPWciTZP3+8EbQPPu2cARjlW1wiL0TU/
         Cz6R90UXMtyFFqd/Iexp9a44GmXRbXPKaa/RvXWPowy3t/E0gbg0BG0maVOF/A6o7NaU
         r0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770220255; x=1770825055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlEm4vHL6tKPzmv658L2EhVp1N/w5kYHb9cCJLXYzDQ=;
        b=wKAB9O/z5BCQnyBqv8L8E6qhhqVWYV0VvqSdnf0P25j+KcLSJ29fxvR3x+VOS2yAqb
         BG7u2WfR7ztHWYLOeKIAYh+a+hL1TUsSdyfaBlTFGStN0d4HecLnXHaTq6YFduoAAAAa
         YnnGA8UBhn6Zgnln9g06n6R4rnnh1h+U6YI7InBchCgM4XS2+rbIQUJPdUVZV0YRynAS
         JoSF6MSmlBY75AmVclJLGqWp2a2gMU01u88m+EEIlqZMgthFGcjWUI7rY/rXqqXbkNPd
         DGR0t01WB3AeJLTbYQR15yykjm5ZTtbfTYV2DA/q4QcCgcOoKc9PRUuRR7mts1P6WmTl
         V31A==
X-Forwarded-Encrypted: i=1; AJvYcCVpES+QxEVGMLxC2pEhwaPHzsWMIYopCS/Ny6ktyuFakZk6ns1ep+wMUJP4WAY0HKFyxfzVT11WS5H+DDJtnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ENOI4KcLBJuQy/Z83Oz8P8+EEk1KF/0zFbDrHrZtQP60dZ2C
	HFZ/jtzSe2Mq2RInOFpwXq9IPDRUOZJ5m7pJD5RNe+19Md0LDAoeGycW//SZF66CpT/uTr6TjN2
	xt5RP
X-Gm-Gg: AZuq6aLiKxShcoP81hx/5jQnngGLc7kIGW7uKtU4ewtq6NYUU/l+lEIYc/w3XJ8IvV4
	wUwnz/HaQ+nRqTsd4k8W2VYU00skmBvIqlGWD+/k6q/zOXb1tyVifEn3sYAYWE/JTcsfSJcmrFq
	/bdEDCkpI1PCKtblAxRiXOZz24nfkwDVMVt5aNiKF9HsB/QBlk6ZivE0vV2D8uq3si3x0H+X6mp
	dB+dVNwM8KkvcDThBF31XrXsXq4FBtF2NMWO/YyBhZg+CCfe7IAhp/CU4ApekLmFNhuMSKn1+Nj
	Mr0n9rgWiQ3ImzT3BdNpSHSxExANuM0Fthn7Ichdk9Egmp+qx9yznztdB6AKctNnHSS27IC33El
	+Bfmwvvyf2TiEj6Rc6mkKJTL6xn0ELCIzL+9V72924SPs2lBjENQoH+Fhyjd6U6C8T/gasQyoTk
	Q1cmL0a+YnLIT4
X-Received: by 2002:a05:600c:1d04:b0:47e:e946:3a72 with SMTP id 5b1f17b1804b1-4830e979529mr51787765e9.27.1770220255073;
        Wed, 04 Feb 2026 07:50:55 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483107e62d6sm51879535e9.0.2026.02.04.07.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:50:54 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH v5 0/2] Add new workqueue wrapper and enqueue on cpu functions
Date: Wed,  4 Feb 2026 16:50:35 +0100
Message-ID: <20260204155037.325482-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Recently the workqueue code has been changed introducing two new workqueue,
system_percpu_wq and system_dfl_wq, as a future replacement for system_wq and
system_unbound_wq respectively.

The change has been introduced by:
    'commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")'

The old workqueue(s) will be removed in a next release cycle.

=== Introduced Changes by this series ===

1) [P 1] Add wrapper for the new system_dfl_wq
  -   This change introduce two new Rust functions in order to add a wrapper for
      the new wq(s) defined in the C code.

2) [P 2] Add wrapper for system_percpu_wq and two new functions
  -   The new functions added are enqueue_cpu() and enqueue_delayed_cpu() and
      are accepting a u32 parameter, the id of the CPU on which the work should
      be scheduled on.


Thanks!

---
Changes in v5:
- system_dfl() renamed to system_default()

- Cover letter v4:
  https://lore.kernel.org/all/20260203152818.317806-1-marco.crivellari@suse.com/

Changes in v4:
- two new function added in the Queue implementation:
  * enqueue_cpu()
  * enqueue_delayed_cpu()

  These functions receive a u32 CPU id in order to schedule work on that CPU.

  More info can be found in the v3 discussion:
  https://lore.kernel.org/all/CAAofZF6jcCAdDjRp-7w7+_ZgOG4k3apxbSiKvGoUDVf5hw0GhA@mail.gmail.com/

Changes in v3:
- added a proper comment documenting the new added functions.

Changes in v2:
- added system_percpu() and system_dfl() in order to use the new
  wq defined in the C code.

- fixed misleading paragraph in the commit log (no warnings are currently
  present).

Marco Crivellari (2):
  rust: add system_default() around the new system_dfl_wq
  rust: add system_percpu() and per-cpu enqueue functions

 rust/kernel/sync/completion.rs |   2 +-
 rust/kernel/workqueue.rs       | 110 +++++++++++++++++++++++++++++++--
 2 files changed, 105 insertions(+), 7 deletions(-)

-- 
2.52.0

