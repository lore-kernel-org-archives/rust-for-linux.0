Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D14433B6D4
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 16:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580538; cv=none; b=N9odo7H1pP+8Cn/6UWpUkB/Lq1FR0vj5zlmYMKEgVViSjW4278XteDMFyy5Ix4qKYkEjw0LivZoQIIevDu3aLpnqAwe/90CzZbLtXuJZoHs+I4qy3F4aD9cIHhAEgNInEO5P5NA+ZXgvmvbYf/oDRpi582esKR1X93V6nNKRvaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580538; c=relaxed/simple;
	bh=k6uk/YPSWWkbNqbDhN6k34hp+Sutvadqg0poR9CGcPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W8XAaPo9lnIJP3K43RzFZ6/gWuuZaDO447tFPYY2D1G7LmX29NSXgaxz48g4HhVvcNMG8/KEUdHw34j4GJOPec1be8qIbkonsvdv/WxTP+zPWgytLPYsAP5C7Jrxg+UidcEVvlQTiTp5smVkUhu6EvqFWWzi++zykdB0KasSTw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a07fac8aa1so15798625ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 08:22:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580536; x=1769185336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqzIUfHPj+TQoO+QVqpWdlIys6eDU2MXDTIdo4TlolQ=;
        b=ZrA7YTkwPhc2ZoaUr/PFLnzxNuoXYLcXgWhQyyooGVoKAEdripePgsLQ8NWAfS9wRL
         B5bTnXdLHEUNkg0lsgW/XnVKukU4EYnIptIrIxaL2edPLhrIhNzE9esgAbAyxDZddLIa
         HqboIzxD/mOXr7qOPknrEONi7gcB0Dj7U82E3fCDrkCUiEmVS9c8Fk8TvZNZ9HyQi5P/
         YPJNNU4vSRi9dJGqTcw6n5hi+fkj2YykXXQHDoZZDDIo8gAXR5J9wBG92MwDDF9waGEn
         0OxM+d+KkNO8iSUjUhs5HU0FrqqtENkFOid7N7zh3eXCRjxSjFgicsNewKPLpI454bIB
         FWmw==
X-Forwarded-Encrypted: i=1; AJvYcCUpBCKmsmX5L3953tVlDfyCEQjiCNUUCYUdcysdovUm0qb5oWxi9RLKhqEN0CV6nTZQz6PdKYnnj5NQUD68CQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP9tcY7siATkmeZV47U2DVMT/2NotNTX/V0NpbAE9RhOm23JFh
	E6/KhALqNXIPAjc4CIF5G9ZxH7TqU/wxR5Q8F7+cTaSXHAJJUIAhgKzv
X-Gm-Gg: AY/fxX4sbiVp0mkyLVOmGZzR4Ny+0zs9DkgLV5obWg+6YufJ80a/C+hJ/st7xDtsU3N
	E3TaqdzUl9HbX7vY3JCOMRVkIJDHgwDeOc7o/8nLxH5NXN5NPfc2gTmTJZ/xXLNqmqpALUurJp1
	iRG7MK6++ElO22ijRJfiMYs+3/QItNrOudAh8ro6F12hUx8TAJXB4beSnxVLUmPR2RwRbPPQ/RR
	DM6sUwwrQHKKXAUqRtnnriHjpARSKllrxXE57EN1ovBnSeDWdNEWaemnBbKn9r4MGGM35Z2YWNF
	9Wu5/vfLTvpqI4FwZUZJmHyzH1PzdA8CJGWDwkqv09/0m1gez0JSegNf9KErkfEpkSSWkrcbvfp
	MVAsfmbThki42UfcwhYD0+quV2wytAKAQ0TQ3aAnyvSvdYXpZO4khAHxKEtYHtNvBSkMX6SOW2+
	rxe8lL7WZmD1vr+45EhjYB8+0oidGaBVOKxRCStHW3JmgC
X-Received: by 2002:a17:903:28d:b0:2a0:89b8:4686 with SMTP id d9443c01a7336-2a7176c6d4bmr32141915ad.46.1768580535718;
        Fri, 16 Jan 2026 08:22:15 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190aa333sm25165245ad.5.2026.01.16.08.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:22:15 -0800 (PST)
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
Subject: [RFC PATCH v3 0/5] rust: Add RTC driver support
Date: Sat, 17 Jan 2026 00:21:58 +0800
Message-ID: <20260116162203.296844-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds RTC (Real-Time Clock) driver support for the Rust
kernel, including the necessary infrastructure and a complete driver
implementation for the PL031 RTC.

---
v3:
- Add rtc_ops_dev() helper with RTC_OPS_USE_RTC_DEV flag to allow drivers to
  choose device pointer for rtc_class_ops callbacks. This enables Rust RTC
  drivers to store drvdata on rtc->dev while maintaining backward compatibility
  for existing C drivers without requiring driver modifications
- Refactor AMBA and RTC abstractions to address v2 review feedback

v2: https://lore.kernel.org/rust-for-linux/20260107143738.3021892-1-sunke@kylinos.cn/
- Migrate RTC driver data storage from parent device to RTC device for
  unified interface
- Expand AMBA bus abstractions to full driver support with enhanced
  functionality
- Refactor device wakeup API by moving wake IRQ setup to IRQ layer
- Simplify RTC core framework by removing multi-bus abstractions,
  focusing on core operations
- Optimize PL031 driver implementation and remove build assertion
  dependency

v1: https://lore.kernel.org/rust-for-linux/20260104060621.3757812-1-sunke@kylinos.cn/
- Add AMBA bus abstractions
- Add device wakeup support
- Add RTC core framework with multi-bus support
- Add PL031 RTC driver

---

Ke Sun (5):
  rtc: add device selector for rtc_class_ops callbacks
  rust: add AMBA bus driver support
  rust: add device wakeup capability support
  rust: add RTC core abstractions and data structures
  rust: add PL031 RTC driver

 drivers/rtc/Kconfig             |    9 +
 drivers/rtc/Makefile            |    1 +
 drivers/rtc/dev.c               |    6 +-
 drivers/rtc/interface.c         |   18 +-
 drivers/rtc/proc.c              |    2 +-
 drivers/rtc/rtc_pl031_rust.rs   |  513 ++++++++++++++++
 include/linux/rtc.h             |   15 +
 rust/bindings/bindings_helper.h |    3 +
 rust/helpers/device.c           |    6 +
 rust/helpers/helpers.c          |    1 +
 rust/helpers/rtc.c              |    9 +
 rust/kernel/amba.rs             |  441 ++++++++++++++
 rust/kernel/device.rs           |   18 +-
 rust/kernel/irq/request.rs      |   17 +
 rust/kernel/lib.rs              |    4 +
 rust/kernel/rtc.rs              | 1008 +++++++++++++++++++++++++++++++
 16 files changed, 2057 insertions(+), 14 deletions(-)
 create mode 100644 drivers/rtc/rtc_pl031_rust.rs
 create mode 100644 rust/helpers/rtc.c
 create mode 100644 rust/kernel/amba.rs
 create mode 100644 rust/kernel/rtc.rs


base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
-- 
2.43.0

