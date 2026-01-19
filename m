Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EF92550D5
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 06:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805958; cv=none; b=A8bSHEuFIT3dx56mIQO8Q98yH8eaMs3Wrx1m8MbkDA0H3hcBtKatGaURPt2nB9zn62RkCC6EJt8DSW7eHj4h6HTMsaWXsxbW0+lmtv2S2/gmSxwbAX64+PT7uQAd0BoDPmpU58DIyREgwoLCPQ6ewomLDPzLNchHhUAt3AyKmOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805958; c=relaxed/simple;
	bh=o/WxDorT2AaO+QXz/RX9pj30IgidD8UTWFWsJpjxq38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kd7DkJFhWkxbF5+k2fvIk6lOfWdPMEPGQYGGrJb5Aa2qtR/vf36L8qX3lYoXsFPVsK8CAMF9V8JJjLex6+FPyI27HQNNW4Yri4RtQ6CiQ6tHYHVgCS7eqD7/s8l1wnzI+rJ+hOYV4oubl7A8sFIxnPPj5k0zu+LMbYe8gctot7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81f4e36512aso3853472b3a.3
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 22:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768805955; x=1769410755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/31liiVK5TjmyAHxf6+DZG+kIVks2D2TCmpEZ/T9vV4=;
        b=JHHYLXo8bgKCfsc1mqZ1RVHtuR03CjIwrzy5PEFmlXN2vi7/GKmHbD8avX+ekuXXt8
         5sU7yikHbEWmWpiDb2lQ1tRPRYRC/it9ML+eU8XxsOM6btxqJH0+3yfnBDZ6AIk6ZJ+v
         QJyj4AC+OHRZDKMDSlUo9qzIH6GgdImZIcm62xTs8OBODguzW61dpwD6GCPMNmbfZlIC
         VQf5/Uu1ghc8HzvGCl+M/aJXlNLai+ioAQJ1g6bMdd6X/8m0CXoqMbtm/YxEq3s4F2BV
         KnRpWZzCHmPKQmY6HbenHGhNaH0mecydYzx4N/628lTH5m9aBMT4NdAVNYAa0MQ23nGN
         vIbA==
X-Gm-Message-State: AOJu0YwKPobFS0kldFeAmQRBtCB12DpVeR7jytUBkhaDtvaOma2pWRI+
	ChRo2Oj9G70JI59Ie68yIXN46e9mAGUNUhsHJ5BAZpMGrtyiWqcRT8/a6j/i+way
X-Gm-Gg: AY/fxX7Yj59xVtvb8PDYMdqENsvsWj+deppKVA9I1qNjX0UemQQ93ByYEO26+4NNiD2
	C+HIL14nihkxMOtAwPsVIodjP48V+3fvVibOUsefDYwtTBSkCMc2nK7lLXW5SBAEexownLFIPdg
	o8I8aYDR325oVtd1LucFn+7nD07zxOGWXOVmgWfCt1Du7RCZZxXLkPr7PVc5IIfU26aUABKVWl0
	DyEm6tKrmX0suZbwU1vXdUCTUG9iPudmEk9DYdJ1ETjQDgfrXrNi0EEMSGz1tusB6I9C5gpQJwY
	tfDGaVR+eB5gEyZMpKjF4Tmr/eLzmABSyEHe+w6V31NFQF1TzTHakxIMSZLS72OgZ+Xw3eIuBKB
	r2hFgzldMF9nrijt3ZMs+kKa5+LJE6EovSmvDanPpRIAVruszA+iXF5MtcK4V35byTnpT1aNUoF
	CrlW5m3rs2P2aIFxT+TskSdRliAxAqEuZJ9PiJk5DyhQXn
X-Received: by 2002:a05:6a20:3945:b0:38b:ebaa:c167 with SMTP id adf61e73a8af0-38e00c2ef84mr8766148637.20.1768805955050;
        Sun, 18 Jan 2026 22:59:15 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32d82fsm8161979a12.19.2026.01.18.22.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:59:14 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: rust-for-linux@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v1 0/7] rust: Replace unsafe core::mem::zeroed() with pin_init::zeroed()
Date: Mon, 19 Jan 2026 14:58:52 +0800
Message-ID: <20260119065859.1914178-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series replaces unsafe core::mem::zeroed() calls with
pin_init::zeroed() across multiple kernel modules.

Ke Sun (7):
  rust: auxiliary: use pin_init::zeroed() instead of unsafe zeroed
  rust: block: mq: use pin_init::zeroed() for queue_limits
  rust: block: mq: use pin_init::zeroed() for tag_set
  rust: debugfs: use pin_init::zeroed() for file_operations
  rust: of: use pin_init::zeroed() instead of unsafe zeroed
  rust: pwm: use pin_init::zeroed() for pwm_ops
  rust: security: use pin_init::zeroed() for lsm_context

 rust/kernel/auxiliary.rs         |  4 +---
 rust/kernel/block/mq/gen_disk.rs |  4 ++--
 rust/kernel/block/mq/tag_set.rs  |  4 ++--
 rust/kernel/debugfs/file_ops.rs  | 24 ++++++++++++------------
 rust/kernel/of.rs                |  4 ++--
 rust/kernel/pwm.rs               |  6 +++---
 rust/kernel/security.rs          |  4 ++--
 7 files changed, 24 insertions(+), 26 deletions(-)

-- 
2.43.0

