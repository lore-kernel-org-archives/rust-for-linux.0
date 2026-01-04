Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AB31DA60D
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 06:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767506800; cv=none; b=gIVcHNOXbobrJ0DVkQVmynWi1TOGGu4XPR503um2bYDd3Nvc2e8Qc05FdGZy0AK9M3EX+JPR8fGlmuG+Rw21uiB/bT5BJtBck19dH9FC1Eya99+nAMfMH8+iDDq/RYoRV4EfKN7kwRsiIwJ2FaQZheYzkUWQrfgy6Qemu8eBwRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767506800; c=relaxed/simple;
	bh=f25w8P30XwdOFYdYUuubeRWXeDZoWUpUtZtcN44QvLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/3kmtE9ZdnXGV/UBeuaUqAwBjOFK2Ko0LFvctwlWZoT6Qsc59ivWjGBUACSre9BgCw84+08PEd+WE8xohfPdMFpmPlnkX8UvoRoRq+yJEs6/nxQupozMkGex2JqlxnorF7J/o8t0Si0QDA94nUS5S0wTFIuST4shJlPgT6P44A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c1d98ba11so14034505a91.3
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 22:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767506798; x=1768111598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFisLg7pB0/wjg1yiWyF/1wSgIjJKBjQesBSdc1bhbs=;
        b=OOAg/HA9fDpZV0TBukEFvs4q1hQjBFoj0EHYtQwTLTotqR32g+tE5fVxrGxBJjPpS2
         s4wV2bI3+xVF5InqveTZAHVTyXD1iR5KMWyqya5WJ9j8nLxovQO/DngIgJqViV4FTMhd
         4l00bppZmeHBrmsy6wB+0jY41jhvIgZfYlt6gpIRfYNOt81cswQnhfZFIoeuho888y6+
         6t1B/RmVRuMzwMewN6tyQdORGe3SpnePgVV7qZk8qLxr82uYEYwho475K5fdgCaI7HbC
         MxZgz4koN6Rr5kJEIf+7t/6/JT59+vA/RU8/72fwGv4HNbjr2ActWyJnmmauleTZIHNx
         qsKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvpU7efgo0gKaJiievgrvphFhZf63EJX3U4bhe46AaYnsR+yrhj5cWdFysCHkBNkp0fXG731HQvsR5HNLPcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9IdDK2i2LjhhGm7emdq8VyND1wLeDUOy3SI5s6LiLvFSy6anR
	oWkn3QVsBabK3kC6CZOQ0Vj8z/wq0u5t0lD5Jm75E5N1Nfxb836uWs1B
X-Gm-Gg: AY/fxX7rHJqgyWqL+DZhDZU/FFGEh2Jc6iC4+JpOgWwV2inUaOeea2I9BQRYY4Tx3hX
	5jytKfpzvJAF741LTIXLiR9JNonLJUudxkIl4rm09697X71uazeG8g4R16jV76pUHyzhxi0i5F2
	pCsCZHgEfIf9n2vr2LnxMBJXaJZK93+wuR2PNNz/wlR/q4T0dxttgPL0EKRM5RQDjkzRzCppWtg
	8OKAqo4mQO9iAuvKapD0QABvC+aIyszCBO74LfNVHz3mLDZPYDrwZg8+p5878Y4p1kFDiG34O4/
	5N1pulfPkY0kyaD6RK74NeCmBREoalWMD7dTJZy0wlPNx3Xi4aIF8H6il4SB+d0aN3osd722LDj
	+PSXYe2olGTlYyZfCBkMN+5fHvvRJi8XOkFBrguaJfWejyBu/eq95IyKVxN+z6donwCKs6vev+z
	WIy5xxiIenPPCQKizuohX8
X-Google-Smtp-Source: AGHT+IF9AK+JALTPPWQqLosv5pj01c7qsNSyZAurq4xyUFOmRaqEL13nw9E73V7Ggd2KxeGALEEhsQ==
X-Received: by 2002:a05:6a21:6da8:b0:366:14ac:e1da with SMTP id adf61e73a8af0-376aaff44a8mr38934085637.64.1767506797751;
        Sat, 03 Jan 2026 22:06:37 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.189])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc68ab5sm40408449a12.17.2026.01.03.22.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 22:06:37 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Alvin Sun <sk.alvin.x@gmail.com>,
	Ke Sun <sunke@kylinos.cn>
Subject: [RFC PATCH v1 0/4] rust: Add RTC driver support
Date: Sun,  4 Jan 2026 14:06:17 +0800
Message-ID: <20260104060621.3757812-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds RTC (Real-Time Clock) driver support for the Rust
kernel, including the necessary infrastructure and a complete driver implementation
for the ARM AMBA PrimeCell 031 RTC.

The implementation provides a generic RTC framework supporting multiple bus types
(Platform, AMBA, I2C) and demonstrates its usage with a complete PL031 RTC driver.

---
v1:
- Add AMBA bus abstractions
- Add device wakeup support
- Add RTC core framework with multi-bus support
- Add PL031 RTC driver
---

Ke Sun (4):
  rust: add AMBA bus abstractions
  rust: add device wakeup support
  rust: add RTC core abstractions and data structures
  rust: add PL031 RTC driver

 drivers/rtc/Kconfig             |   11 +
 drivers/rtc/Makefile            |    1 +
 drivers/rtc/rtc_pl031_rust.rs   |  529 ++++++++++
 rust/bindings/bindings_helper.h |    3 +
 rust/helpers/device.c           |    7 +
 rust/helpers/helpers.c          |    1 +
 rust/helpers/rtc.c              |    9 +
 rust/kernel/amba.rs             |  234 +++++
 rust/kernel/device.rs           |   35 +
 rust/kernel/lib.rs              |    4 +
 rust/kernel/rtc.rs              | 1710 +++++++++++++++++++++++++++++++
 11 files changed, 2544 insertions(+)
 create mode 100644 drivers/rtc/rtc_pl031_rust.rs
 create mode 100644 rust/helpers/rtc.c
 create mode 100644 rust/kernel/amba.rs
 create mode 100644 rust/kernel/rtc.rs

base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845
-- 
2.43.0

