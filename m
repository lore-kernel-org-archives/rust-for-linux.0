Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046A9342C80
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 14:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796676; cv=none; b=PQRhGQfiARq0UYpG6+K2Z99X492K6HdrAOLitRAI+NLx/f+irr4R3XxJnhVjnGcEamjdeGDZVQpaQESu2IBbSe8PjreONZWeEX/omnILQgo88ODjrxbYitsCPne9kdd0LQ62ruqkgKzdUNHSiujCs+U+VG00QqcRkQLd+Cu8KZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796676; c=relaxed/simple;
	bh=kPiBKjd0tCc+xmV/TMc4nVnRpkWniNPzMfq3q62D0Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F3J1bGdbyipTEcVW91jvBcM4BCOs0yAHVGIfpXk1Wl7tGqsmvd3gndkvedD/errH0KiMps7MPFIpL6HPkl/ZfGaZRaqGDRfbgbfcwZJKI8EhJ2PF33iHiRHys4gKuB3idH3wkpch3ckr11MIS0e+DOzLKDJCkgoNBTc6AOa0uNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso2486932b3a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 06:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796674; x=1768401474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNs2LYaQeHQE1lXl20I5Hb2AdyRp2ROQTu/4NHn9+ZU=;
        b=mgx3pUAEjZ+fp4+aZN2iZ9vF2CA2effmhzb0rDO82+ymxYite9TMKtZcXat0I3lDtC
         +Rhu0H2n1rvwLdNKWG0ZC5fxE2c7VqZ1sLwCKRTEEcp4msnt4rat5omtU/PjOgUwEVQU
         KNweuACnhqF8R0wmmX9t/lgJN2vAMfggRe4O1VfwPZaB0Ll0qg0xCL4sX6WlLCqsr0NN
         pq9PVbiEGfSRSRnH9P8qiNJPq6MJHBgq/h8qKkK2dcSs+dBOCm4ySOC6BIpNU/Wwu7IR
         QzUxBalkR3EZhmvELZEfm3zHXYM9zAQPQJ6VhkIp6cpbVa1APZCqcpUpUANBSru9r370
         KMvw==
X-Forwarded-Encrypted: i=1; AJvYcCVip5Eja+AMukPU3jAlOM95NWgKFbQFSwxzEZAfGkE5h7YebTXI47oLXZTXijGrS+XLCzmP5ykCmClHfRijfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7FozfxskS5KHmFpPomLr83/9rzQhaIh3h0xDahlUWKMmT6Spz
	iJhb4/7Jm187j/KiMx4mfk50zYJWGeG4xjMRzPea25tcmV9MBtadBfaE
X-Gm-Gg: AY/fxX6vLAXBo6rcDlNn9PY5WuW4WApNRxWB2k82VbLFysBsboSL0XVpNvf37WgzvOT
	nDEEycsAHfSiLVX88PtOdC/r0aewpDqKLQeKgcFNi+FSIaElwpy1IBizIOTkuFsf9c2VqdA80cb
	gl6ezn6JZ4DkPoh3zrNzB7RcSrQvxk5s3Y2hwQ23WG27VhtL+4fuU4WkPLlT2Ynifq0r5UWF3nt
	Y124xAydY1/MUiPQZFmdXk4WKIV/Py7XgaGb5eEPADYCKNaxiXVmY7Xwd9DGOKm7PTHZfYNEk+p
	9fwW7IPkelIwa/kbPO/afIC6zbEb3oNt3hgeAEaDIhawXUSCxJmFN6sL7DRlKxG/ZIsDevWOoFL
	QaSCQdAlxXfdotb1C24c+moT89B6rNR/NZV9QotXcD5Pk4nCTZe4uNPbacZslVpYaYm9lVDSPcU
	uPr01J+uoRZpTRhl6QasFx
X-Google-Smtp-Source: AGHT+IEWNr3TbDmPngYUnqTf5Qq7wLyKeSUUMCdC97oX9M1QQa5Ox9V3uhO067R68fiFJRY9aDva/g==
X-Received: by 2002:a05:6a20:3d1c:b0:364:1403:7c9b with SMTP id adf61e73a8af0-3898f90514amr2623401637.21.1767796674260;
        Wed, 07 Jan 2026 06:37:54 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm5470352a12.2.2026.01.07.06.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:37:52 -0800 (PST)
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
Subject: [RFC PATCH v2 0/5] rust: Add RTC driver support
Date: Wed,  7 Jan 2026 22:37:32 +0800
Message-ID: <20260107143738.3021892-1-sunke@kylinos.cn>
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
for the PL031 RTC.

---
v2:
- Migrate RTC driver data storage from parent device to RTC device for unified interface
- Expand AMBA bus abstractions to full driver support with enhanced functionality
- Refactor device wakeup API by moving wake IRQ setup to IRQ layer
- Simplify RTC core framework by removing multi-bus abstractions, focusing on core operations
- Optimize PL031 driver implementation and remove build assertion dependency

v1: https://lore.kernel.org/rust-for-linux/20260104060621.3757812-1-sunke@kylinos.cn/
- Add AMBA bus abstractions
- Add device wakeup support
- Add RTC core framework with multi-bus support
- Add PL031 RTC driver

base-commit:
---

Ke Sun (5):
  rtc: migrate driver data to RTC device
  rust: add AMBA bus driver support
  rust: add device wakeup capability support
  rust: add RTC core abstractions and data structures
  rust: add PL031 RTC driver

 drivers/rtc/Kconfig             |   9 +
 drivers/rtc/Makefile            |   1 +
 drivers/rtc/dev.c               |   4 +-
 drivers/rtc/interface.c         |  18 +-
 drivers/rtc/rtc-pl031.c         |   9 +-
 drivers/rtc/rtc_pl031_rust.rs   | 503 ++++++++++++++++
 rust/bindings/bindings_helper.h |   3 +
 rust/helpers/device.c           |   7 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/rtc.c              |   9 +
 rust/kernel/amba.rs             | 396 +++++++++++++
 rust/kernel/device.rs           |  17 +-
 rust/kernel/irq/request.rs      |   7 +
 rust/kernel/lib.rs              |   4 +
 rust/kernel/rtc.rs              | 985 ++++++++++++++++++++++++++++++++
 15 files changed, 1954 insertions(+), 19 deletions(-)
 create mode 100644 drivers/rtc/rtc_pl031_rust.rs
 create mode 100644 rust/helpers/rtc.c
 create mode 100644 rust/kernel/amba.rs
 create mode 100644 rust/kernel/rtc.rs

-- 
2.43.0

