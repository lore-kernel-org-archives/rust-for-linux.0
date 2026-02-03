Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330282741A0
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 15:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770132513; cv=none; b=sQkJulTwO+XxuD9pertRQd3mkUYdW90Klj5du0b8JRnLHlOojxRL9gNaWlGW6fk7mlwG8NHRauRw961h5XfeqVxfvDAiNpLEJCwMtEBcULwKKs/6T404y4/ZAsJQaQmHbaVXcknz3ypYK4o5Wv/vVb8W6hmZzbo1CQ6BDdMPoL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770132513; c=relaxed/simple;
	bh=feGXy78gm+sEIjpsQUguh5JqEfrMuxOqqTwjgBzwnqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h7HK14BAqNb2Va8FnZPrbBu/OT/bvCT9I4yn/02KefXW0/aI74SFUcWevqL8o/Pvkl0hzmLTSgVjUsjT2jz/vnx6ZvqN5zlf00r/pkypXZEIsY5DkLsq86vOfU41vHD5oPbbBl4n9YzE6pyA9o60ALj4A3COwDL++sW87rdEY3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y9WCsSY8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y9WCsSY8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso58952475e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 07:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770132510; x=1770737310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNBZWsXLQ30/V+1KNzhQFPY8Mm+yHT82xL2yQosJWYI=;
        b=Y9WCsSY89ZLbvwNK1OI+VjEIqCF5uuWdMFnbmRjSCKhSxr6o+sxVdCHjl8KoHXOrBe
         FgnJLDOHy+0Tia3GCq9xxrO9HP8u3UMymxeM/kYrQb76Vwfk0HWKUdfNNoiXuMIrN85s
         R3/GVrEjMHOpl2bvh3VozBxnNao4RwgFHkS6g1ixgAkuoJo9vTewx9Q74o3bt0Tibhd7
         BXoICDeg4B/xTnWSf05koyt8PFDoY4erVty4zwmZjrWshE234S/wcRh3rM1ll3H8AOqs
         sYWDS2tBAkwoafI2k+9P9X1Uyg2Ge7QGAoPShyWHMapuZsvCTm9e1Aqico2ThrdiN/EG
         7uLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770132510; x=1770737310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNBZWsXLQ30/V+1KNzhQFPY8Mm+yHT82xL2yQosJWYI=;
        b=jNxuHiX6/D0I2sAJU2xwjhMNy+lePtLL63la4p3mDmQKhxJVRt7d6wBuBdmnC/GQUU
         dpm8nSbVECbdLC5rjcto8U6zGbUrUDfKEG72SdrEx6H/SSoGH/tkRIcAXMoj6Ynl/SO2
         hB6ezKHmDw0NbgIH2MAWFU7f5Tps3PEZhHGXM1vm0kDryQ9GkxTGzQ2FfSPOn3Mi+pAP
         ZkskEy06FD+xFJJcoiPc2/LzggVC1luXYcAhPyqxFtAQCieIsDofpxoxOFWFLZ4w31m7
         zI9uPC8ZOHOKA8Ad3pxNFDHkrCY9GIoZ79wtZKGDJHOzOCyO2uvWqm9bNLA1Lz0uqiDP
         +jZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeLyZW7EMyBxm2Kgprqw6Z1LqU2KVKTvZfN/JrGdqEGINQwc4x0wD2/lVWOHI4SVVrDQjNkIxbAsPHnLQrZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+sj8rAFwGAlYaFwqxvopmLp8tYtEmZQnUwLgWwihuY9XwvSZT
	3puCGNURgeN9KtxXelo11Au5t1w5/eyu9Hy2kfS7yFRK6B1ZDpvhcR0l5e+TpBAhzPE=
X-Gm-Gg: AZuq6aI7RWzPcCWL0C7nMB02oMyLRa2CXoEBLpfKprRlmUwt+CBhaor4cHA/a1ezf5i
	7Mhq5EnmXq6jVVx2fJRvOPomzPu4Oir40pEWFhpKYUQBO5PAoNHVD1zR98DAgaFhzL0p9g7l/c+
	nyAx7u5Wq8N5tN2BIaZ7r6JseKmhX2moZ53yiQVMXvlA2Avz6ocTMn08dUXthYYDTLqg5BobvoT
	25XvwINuE91z5qKLNG1FKG9hqjAXiXW4iTFyr49I32K6M9x53Ftt0NrhZ210QJN+Zojv/jedvAf
	LG2hcsOpE1VhdymhJM8iD8t5C7TZEA8cNWcEA8j7ESDrWwsBCSWAu2Cc/qukKvXYbFIwhvW7t4T
	lmXwKw/O+qmuwsTTJW90m6J6KAuXEn0ec9nBZp2tiorhrMQPW761m8tsVKbKuYCUdB1Wm6nP19h
	DqrISbkHuSYQP7amsnjc5TZZcxqA==
X-Received: by 2002:a05:600c:154c:b0:480:4c20:6a06 with SMTP id 5b1f17b1804b1-4830e96adbfmr164095e9.17.1770132510478;
        Tue, 03 Feb 2026 07:28:30 -0800 (PST)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483050dd79fsm71316005e9.0.2026.02.03.07.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 07:28:30 -0800 (PST)
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
Subject: [PATCH v4 0/2] Add new workqueue wrapper and enqueue on cpu functions
Date: Tue,  3 Feb 2026 16:28:15 +0100
Message-ID: <20260203152818.317806-1-marco.crivellari@suse.com>
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
  rust: add system_dfl() around the new system_dfl_wq
  rust: add system_percpu() and per-cpu enqueue functions

 rust/kernel/sync/completion.rs |   2 +-
 rust/kernel/workqueue.rs       | 110 +++++++++++++++++++++++++++++++--
 2 files changed, 105 insertions(+), 7 deletions(-)

-- 
2.52.0

