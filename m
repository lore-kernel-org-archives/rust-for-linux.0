Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0501BF31
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 17:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388875; cv=none; b=Inv9k5mdra3jZM9DIhULIW1XBkvJnpHGt5tN0TOzMfGddJsSWKADfkgBs/idxbz/FCM5PG6FLcn10h3t8ZCGcvuWA+pZTd4GYSDYQp584Wni1Veh82uEYocro072tE/7PirIn3/7YaQBo+Uz8E9j+rzPpPpU0NIzdwglTll1y70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388875; c=relaxed/simple;
	bh=0KJffezjVyzqS/UlwE1AO/6G0SUoub1lN1ZNsV+Ylb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nfD6IdZFL+V+W7fBCic8aUUZ6FYojPOcXtAYug8I/aWdmu0xRov7jsVOGvJpmRpvhClqB5jwO9kzYK2e6icpn5mSAKfVcydSMV1WdamVFExYoq2pcULQ7eoGEKe8muf6r++uXASOd4RDrxOHIi7xKHtN5nv7+Fom35nVVMWcPDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ed0nRDah; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ed0nRDah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711388872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=omO/qOA+iXX1seZX2dEPpZ2scpnJFXkCTiiN29qltEc=;
	b=ed0nRDahJ/1s7qjjsuMRYu0zrerEwAoUyJM8XmmCPBCIV4BPcGeUVQZ4rDJ7KJCNKxg6F4
	1aJa+d3TNu/4mmWT8hw0K1npAdSx9mEUGfivmVPXoGXkq8DlMiIT9pkcG9DG7jR/H0riC3
	OFig0J/5xQXpiSZjR5l67L/iYde63bw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-T8KYJnWXP_aw8QJrzbTARQ-1; Mon, 25 Mar 2024 13:47:49 -0400
X-MC-Unique: T8KYJnWXP_aw8QJrzbTARQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-34172041676so2590963f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711388868; x=1711993668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omO/qOA+iXX1seZX2dEPpZ2scpnJFXkCTiiN29qltEc=;
        b=JI4ddQF8VH3lEu6UJ/vw8RR+jsEO0HWjotK+j5HXq/aHANM8h/6C2+84uv+UBv0sAr
         sCz4RYMBM6SspdCA0q4XFl4oiELyAXThX2Jwv+uKRNVGNvyG44/OizMKpsbwSAyOyBma
         ARcYBnW7NgHDZ7fPY0aDXE2AkGD7xr98qyFiNwM+4Osxc64dCh3vu+n5hpbKC4BXocl/
         3T28KUmwjTqumKYD+aAA+Oo2AQiuB/N5mAt/doyaCCIYHoUUGlsff48hOEC6z1a/Sh86
         gvDImTAZT5ijfW9kkNFNLZDVyM8PV39RRXH1F9Fob+GYlM6W2oPHt2IyGGVgmoo0clBp
         inDg==
X-Gm-Message-State: AOJu0YyEKZSzP+4P/kdWbb4LDfp7QsvCjHllEyCECb1GwzAWvhoPKWOl
	qezJhSD0aefWrXcuCG1kF9twcCHfLprTvOf8ZrOQ50ZAvevjCGdbW0xk8rMlpaX9TNn3/y/z1ux
	gMsOczXuAyKC8FE1jeFIySNRS2zg7Drg5CQo14egaFaEdou3ZlM5erQBZC01ry/6G
X-Received: by 2002:adf:f1c7:0:b0:341:c449:f255 with SMTP id z7-20020adff1c7000000b00341c449f255mr5574066wro.20.1711388868051;
        Mon, 25 Mar 2024 10:47:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/s9b/RUoR/pLbqpnngUgQ9e9BYUOh9BnO06yh2ckhwCXnFjVzEBedZTRGJLQ00KbAsjCXaA==
X-Received: by 2002:adf:f1c7:0:b0:341:c449:f255 with SMTP id z7-20020adff1c7000000b00341c449f255mr5574033wro.20.1711388867462;
        Mon, 25 Mar 2024 10:47:47 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id dw1-20020a0560000dc100b0033e3cb02cefsm10087697wrb.86.2024.03.25.10.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:47:47 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: rust-for-linux@vger.kernel.org,
	x86@kernel.org,
	lyude@redhat.com,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	airlied@redhat.com,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v7 0/8] [RFC] Rust device / driver abstractions
Date: Mon, 25 Mar 2024 18:47:16 +0100
Message-ID: <20240325174743.95542-1-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

This patch series provides some initial Rust abstractions around the device /
driver model, including an abstraction for device private data.

This patch series is sent in the context of [1] and is also available at [2].

- Danilo

[1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
[2] https://github.com/Rust-for-Linux/linux/tree/staging/rust-device

Danilo Krummrich (1):
  arch: x86: tools: increase symbol name size

Wedson Almeida Filho (7):
  rust: device: Add a minimal RawDevice trait
  rust: device: Add a stub abstraction for devices
  rust: add driver abstraction
  rust: add rcu abstraction
  rust: add revocable mutex
  rust: add revocable objects
  rust: add device::Data

 arch/x86/tools/insn_decoder_test.c |   2 +-
 rust/bindings/bindings_helper.h    |   1 +
 rust/helpers.c                     |  28 ++
 rust/kernel/device.rs              | 215 +++++++++++++
 rust/kernel/driver.rs              | 493 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs                 |   6 +-
 rust/kernel/revocable.rs           | 438 +++++++++++++++++++++++++
 rust/kernel/sync.rs                |   3 +
 rust/kernel/sync/rcu.rs            |  52 +++
 rust/kernel/sync/revocable.rs      |  98 ++++++
 rust/macros/module.rs              |   2 +-
 samples/rust/rust_minimal.rs       |   2 +-
 samples/rust/rust_print.rs         |   2 +-
 13 files changed, 1337 insertions(+), 5 deletions(-)
 create mode 100644 rust/kernel/device.rs
 create mode 100644 rust/kernel/driver.rs
 create mode 100644 rust/kernel/revocable.rs
 create mode 100644 rust/kernel/sync/rcu.rs
 create mode 100644 rust/kernel/sync/revocable.rs


base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
-- 
2.44.0

