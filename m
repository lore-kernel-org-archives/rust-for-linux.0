Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686851;
	b=1sXfYXZlAdrK+rNQKm8LEdcVlb6Rb2rrbPC7c4EZihHu7UrbCEjMzQH2fR/wY9zsUoWW
	 5ckDKrBYUHYZyM+exNn2OFztmqt8DZzX+oev7qJ4E7cvWsgy/4HwQsjqSVag9xFZmZfs9
	 XI3QizTm/QWrdXEXLxkzFidR2SCNKZbtpPcE5qexNBTg1B0/FXHeg9z8dCmKGXBNqj8gc
	 XMgE8eAizN6VpJQP1ZmXRUuLVE7OvCIiO22Ugib71AxBACVOLxyHx0YC62CTir2u+luJ9
	 HxH7lo+XSazu2JwJrLNIYALFSQUlQv9TEiHHe7xFfk2Bqzi1zXj/sCDiCwX6FrKs5HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=viQnFNkfgxE1Vj8v5dyCU4nOO4hedWvtxo3baR7F/4w=;
	b=ratKucvI+oEu1ZJEpVpgUkD5WUPvX+2v2bK/heQfnV7Jsmto3j/qJ8Nh9XVDnzoBoi/2
	 WOSLyhZRTviq3weXtQnnNM1rhhezS5VldEJwqsxSYHsMeA6myhaT/uYHN5KJYMWf6RVIF
	 dqgstqTafvBS9gQ2vnfYQ2nnO0RNdLsvbtXs0qZE8mlSac1WOto/Rwa7Yjls4foxC9mo0
	 fHP6Fj3YjaM4waYF3YJAgBBW/nTrpaw4OXrOcQUa/HMbqBfRnRG/MVHo+wZPMjEeQ5F43
	 oLpaPMrYFAccNH3GTGMqE5ik4ppBlRtnB6W8iEYTV1AgkxVCqgmsHp7vzje0yQ8t4Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05NCn8+a;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0F6606A329
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 20:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D0F6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05NCn8+a
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c17a1775fcso1116902e87.3
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 12:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686849; x=1795291649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=viQnFNkfgxE1Vj8v5dyCU4nOO4hedWvtxo3baR7F/4w=;
        b=05NCn8+ap4FtQNWxuyiMuo3GWF3wfnyS1Q+GXUgtXTSeRU8pSR7Cv+Lg49kNPEA8/j
         xMDvu5IaQgh2ogVpuYNRq07U6K5H3WaWU4PImY9wZqjaEFiPcrHDr88sOHGEcUjWmBRm
         oqS/RvUnmKO3NqMzI+Wu24zXuMM0kzmICjGr6O7Z3eQLHpVMTn9wTioCP2SfX/pLViAK
         hYXctjFBZBeeJ2bPCVqCBhBbxZOlajRTwH/8iGemgJviHvs5WQE3t4zTpVIgKjfuvgUE
         RLETRNWdexfpeAKhKtmvnxjXTJXLg3CE1bzTokfDosaS2MdNy/Gko1ItXAPZqQHGhut6
         tpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686849; x=1795291649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viQnFNkfgxE1Vj8v5dyCU4nOO4hedWvtxo3baR7F/4w=;
        b=An+1Z3k9r/mId3KQGldTHJ0UvHcdS1HkXOB/3WctQp92FRDiceC/BkSjrXYhW29sTH
         nFEL1XIZXK3pZ9AhfcXaBPUQnQR27ref4H1sCjXd3oS57XiDvCgOGtvz1VQ5LF9Brrd+
         XyKCkIpBMFr/bjm6p0U55F9Yt/wt1yU5dEqFbHDkl722RVj+BsdUC7XlTwosaOLskNrB
         vFf7Q+OJulh+ffa8sdOjbM1pwrqtgUmIhaBC+KzJL+zjJZB7XHQjUt2KzvxjiWvz8fPB
         9KKoyvwK80EvBWg0BQHQcdct+q2DhajH2ReTbx1i4JUNV/NhoG2a2enrw28DdVWEvXQO
         +Cdg==
X-Gm-Message-State: APuU4Z9gCY+1U+nVBMuzlcv+KhIzUoGpTG3+ekcRf0Auw86v3Q6BaZ1K
	FRjK+MNe0JBQPTh6qIL4UKH26E8dzGWhwHQ+L5z2sp4xVkURFA3y2S7ZeDSbTS60JRA=
X-Gm-Gg: AYBFou3QHfbuvDlDbIzym7EXTGD5e0T0oFaq7MR2WXB2TfH4ir9jExIlmnCVD7m8O5q
	AOMUHPe2nAhsgYT/6d6v9+XB0xTaoMIFt+5SQ6PsBPRrbi2jA1caRNEwP+8869KHcQ0oJ8S698w
	YfvkDAheNT28M8CVXJYeakyy+4E4YDAt9+Be8SpubPzEmLxRGgqvsqP+dRnn3WccyVQLfbNja5X
	onXsEdalKyx/6E3VILtI4tL/d4wZzjj5lsEDfQyyUI8n+0rs6hBK31IK7QXApPbUPuFr1r2cstj
	1Sz8K+fmFnjbgdjD8mOTjAqXfS0AQI9KQvmwXGjkYI72Uwg/q7Tepq1W9kK/dtlmR5stYZpTuUy
	9vq3GocA5bZ7xbd+a7DDdGKz1op0W0Hm0BxiuDQx0BgnlKSBBeyOc6603PufbSGGM7pW/ybXbqR
	qZzMTk63+dRM9U3GjuCWfO+IaDRqb8fIyEkAMmfnauA3qSJIw4k7x8l6BtEAixCZQj6065oCdmw
	Zvqc9cKn182EZlQiu4r4+17uJ95p7NYDsGU3Hq3MwBQTuiDAqEX+kKdTzipk23vIVDJ5wOc1zkI
	wUuCK98Uem6BwGIq08lLgJY69tGIINljbU4rO2E=
X-Received: by 2002:a05:6512:3a8a:b0:5c1:5715:bd00 with SMTP id 2adb3069b0e04-5c170b1c313mr2231081e87.18.1794686848394;
        Sat, 14 Nov 2026 12:07:28 -0800 (PST)
Received: from IuseArchBTW ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712da125sm1891070e87.1.2026.11.14.12.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:07:27 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
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
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] rust: sync: lock: allow fallible initializers in Lock::new
Date: Sat, 14 Nov 2026 22:06:59 +0200
Message-ID: <20261114200703.33229-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GpuBuddyInner keeps the C gpu_buddy structure next to a separate
Mutex<()> and has a TODO to move the structure inside the mutex once
Mutex::new() accepts a fallible initializer.

Patch 1 makes Lock::new() generic over the error type of the initializer
for the protected data, so a fallible initializer such as
Opaque::try_ffi_init() can be wrapped in a Mutex or SpinLock.

Patch 2 uses it to put the gpu_buddy allocator directly inside the Mutex
in GPU buddy, so that the allocator can only be reached through the lock
guard, and resolves the TODO.

Tested by building the rust/kernel crate (x86_64 defconfig with
CONFIG_RUST=y and CONFIG_GPU_BUDDY=y, built with LLVM=1). Not tested at
runtime.

Ivan Tverdokhleb (2):
  rust: sync: lock: allow fallible initializers in Lock::new
  rust: gpu: buddy: store the allocator inside the Mutex

 rust/kernel/gpu/buddy.rs | 38 +++++++++++++++-----------------------
 rust/kernel/sync/lock.rs |  8 ++++----
 2 files changed, 19 insertions(+), 27 deletions(-)

-- 
2.56.1

