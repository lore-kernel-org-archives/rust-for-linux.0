Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E502D1E4BA
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 17:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388975; cv=none; b=QxVE8in1pU2Ji18KgzGFgwXbMxFB5M3C9afFleLdv/loDMqbmPqoH/E0weuJqXPRy8yoHtXC0PB1keFaP4PpCx2RFexBf807QRle50cZHosDvlbr/sMio7tDBSXZtqFn4MCIUoB3Ioe6bXL5We7YNYRmdFGW0xx9c7LGX/yNOYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388975; c=relaxed/simple;
	bh=0KJffezjVyzqS/UlwE1AO/6G0SUoub1lN1ZNsV+Ylb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MTfFKrYjGPIQc8y7jvIx8n8GATs7nsT/gL3OR8vHR1nfyZAF4oaX5vzrXwTMMDRJd27WsvOVoPNm9EiSk/30Y6frZJ+1pcXBDF0jxVskWDnLU8L99OcIe3XoyaJ7Anakn340fgLYIpa6f7329KqOdXDuIs9G4EjyhkQYkqILUn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Du8+gjVq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Du8+gjVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711388972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=omO/qOA+iXX1seZX2dEPpZ2scpnJFXkCTiiN29qltEc=;
	b=Du8+gjVqS7US0w4V0QP8Sf/Y6JoJBcFWNux0IZshGBidWGD4AyopcSZNVAh/nmPsWXzmTE
	+zpjPvy+/Kbdrk8ydM9J1qK+utnghrLLo+xlLYZlGSZABbwtcFxgv9lT37Mp2bK9rw3jW9
	CxunJ1Ihf+fkMah3GJQO0GJupLfhiBw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-5Mw7zbkGMv6k-8vJZqgTkQ-1; Mon, 25 Mar 2024 13:49:31 -0400
X-MC-Unique: 5Mw7zbkGMv6k-8vJZqgTkQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33e4397540bso2698506f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711388970; x=1711993770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omO/qOA+iXX1seZX2dEPpZ2scpnJFXkCTiiN29qltEc=;
        b=LfDzlI0u48RNuqh3u8EKL/GJfukmVePXOMrIOGaCIlNmVhLeGe/mF3lec9C3laewMZ
         AAdoXpCSGtfscO8enf5Y4SvYQsAag9SaeUN3DeKAYYOppdeiKuq0NO2JVKrVTw6noXQh
         bOZMKuNi5bzcYo5mMqkVjzazbt23aHDwqMc86SM8Jc4dDE2inQXJDp9EZrxhc9XzwTs/
         v6OlRGZ652NNhFNHy+kxtGXsxoEGBeqJ0eOdr5jxlBurwb4hmeUXSuZpZhpXARTkUhX0
         oHVmxXohEoEju8rPTaX5c1Gt/1W5rInFo1lQBc9zmWi2b4X6J35mJlLQNFDaIlcPoKn2
         b3FQ==
X-Gm-Message-State: AOJu0Yz8DUHoTVYubDO+wN/sV33mu0xv5zderg93HCZhu6AA/rdpWOhU
	pzAUDkLleCUN5rG6OHxjjWqIoVHYNClu5pUg18/6oO4w5mHz93VdQWYrAwtcXJP07DFw5rs6GSf
	9aw+eXQZVvAGEN/2AqWC1VnClQcg2F+ciXcysR1xTpvQXTycFiRRFNgMeWhz0CSzk
X-Received: by 2002:a05:600c:19c9:b0:414:8aaa:acb5 with SMTP id u9-20020a05600c19c900b004148aaaacb5mr235315wmq.16.1711388970687;
        Mon, 25 Mar 2024 10:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGegRswWyT08KCpAMDXQaIzUr9wy+1F8pd/tG+PJF6iWyq9qrDiQmjFFclWqppaf2uca2mSxg==
X-Received: by 2002:a05:600c:19c9:b0:414:8aaa:acb5 with SMTP id u9-20020a05600c19c900b004148aaaacb5mr235288wmq.16.1711388970384;
        Mon, 25 Mar 2024 10:49:30 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id bi16-20020a05600c3d9000b004148cc530a9sm371294wmb.7.2024.03.25.10.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:49:30 -0700 (PDT)
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
Subject: [PATCH 0/8] [RFC] Rust device / driver abstractions
Date: Mon, 25 Mar 2024 18:49:04 +0100
Message-ID: <20240325174924.95899-1-dakr@redhat.com>
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

