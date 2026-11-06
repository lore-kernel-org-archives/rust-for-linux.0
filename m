Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992644;
	b=jOXOViZNx/Ca9tJ658qVHGb/By+iYDmK48tCpHe4hY5h798O6sJKD1xxp6/baVhLJbJW
	 ZbKmuoF0T7D1O9rUjx9VDL0qesYKejxKu8eqZPCMkt7Mu5YvqJ0e1bnHy55aYs9lIiSx0
	 aUinG2yzZE60OX5mL+Xwzs3Eu3EeHET1EjfcYHGJ4T3zqAmEoPlmWoiOXzvc87mFVUiJb
	 lA5jttTSsp57kJ6Qt5ilLsPh12KSIaiYHVqZkVN0KuzZwMIomnyPlJZS+y13wyWNpZ4op
	 GlHW2OPwbYabKO8dbWlgOkzNTAp9yIBh0W/8KRBC/TT9ljP/WfpSEstuPvugtubZklA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=opDReGPxNbgoF/lkah1ZnN+d9K7uBHUX04tEROSAFWU=;
	b=ngYjh0vfXT1tcT3M2VoVQQIrZRQcsp9yDYSicLpWcN/MEBHKl8a97VMVia/q7X6Z4TiM
	 JOvhmOmLfmV7q6H4WAAWxl5YLSDfjZV8nRxqIldgvwebVRv7Z3F3bL+bAZePSvYHbSYck
	 DHF+Oj3LTa/zRGgaSlBi7Q9X1WGe8vVLc5SeMb/hAhvu6oH+1BpsuTHpOEapW/+79MpEn
	 /2OAwVwWdndUPpFYUul2cpUrHBjAJmkBE6Kk6zTYP/yuffbXcgh2yI40LXOHdZDWJdRnN
	 8sEjFT2+CrojLeEWMmr1ERrmLJyXfZddlGUW3FbclbX4ZFZZNsdIVzRcI/gJyv4Qk/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdVeEylp;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7839B606A32C
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 19:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7839B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdVeEylp
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so884498f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 11:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793992643; x=1794597443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=opDReGPxNbgoF/lkah1ZnN+d9K7uBHUX04tEROSAFWU=;
        b=tdVeEylp8uQr+1+RxLJqR/HNFIhsvs2m/OS0BpuoKxs88Ok/8jNteIWXjNJZ+DtJVk
         wgczD9qos2kCArVBOQ6Xi7cFLgkluITLkhLAKhXH6Vmlm7Xviwb5RxAQZfFUrbkwIp4M
         bH5G1LQS3NG9IW6vH7oz82IZmiECoykEIDyNBymJR3akGqPYQB9RW78Ry/MQ16+aNJ3O
         BEDKUOHAeKo3UoHn0bFindc7ThTTDWe/R3U3SNf/QiXj3HdTnfcH/LrKZZfrZ0OwcCxR
         4oQkvpq/lSzwKFjaio1CzXon8KFsCCw5pirhkC+R0fDujSqr4obOUpa4yiur5aqMjxv2
         J1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992643; x=1794597443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opDReGPxNbgoF/lkah1ZnN+d9K7uBHUX04tEROSAFWU=;
        b=R0JTI9ch6MhrjuGSbx63PJeuoxCMgM0jPMXhjQeaeV3pdzeXpLYBF7cfwUfc9h6SC0
         DsJ78OF0OwD5P2QF/3HWHNwPfGFM2BCGdHjQYOJVog0EVIc94q5UlVxK59zF2flsIdT5
         UoU2E4KeEY+zj73+UP5j3NIU4yOkKvIF3pcNTu+vBaFSzypgpWRTYGiIeDys4C4ghiLl
         4TdcSyQLxsDtJYdAX2OPn3Mey2nJYcDXhYuQdyLlKjsBSO9H3fhVjcc8Grn5d40dAdbc
         /c1+ZYpwBb+xECKhMJ5EiKrp+329YTvVV+t0jvgiihV7u/+Ore7Mg/LmgU20j9+ta23a
         pzOw==
X-Gm-Message-State: APuU4Z8OC/wpexqlvwmvkJJ9G3TQm9XqdDy8aJxMqn63V3Q3W43JQa9E
	57k3ZOuSc08bd6TS22pLsESuiT5icspySpRaDsx3Wv/TyadpcoJyxDQJ
X-Gm-Gg: AYBFou0U6ATtJz/0nB+APrDBP06baatPQZyHJYaWZUsCJfzSb9CHHeHzbYrp05eee4w
	rOs1f5e1w14eh1da48rgabPNJS5JzCBXiECCFGPEZ4kVrLhl579UvS/dVlSGqd2RUZ4bWtTcwHD
	iZ7SLPANPrTB0wn5qxUvxSiewBoofPza2cocQSvC/CRu+I7zOcxsb2LJvA0Dk4SWN5HwS4TktPn
	DWW8UHg0zy5gtbdn890s51Q4FTW4GMpWUPt4VkCWhUou5KN6bl0IujHW2pFmSiiMBBJ62hLZZjU
	CUolFsdBpx2GXYr5av3c4Pi8rjTTYIHzgJ+7SJmt74XPzeTcWZXX8YTmkgAWOhgwPmS6wo5KzXK
	0q25wbGJnSktIh08fSYgb3qpY4rROUnipLGCOq/aYuxcguk57WxOm0tY2QMgb3gsZKpoS3UQpcr
	s1cmWi30j+Pnfl6Y33Ogzf1+JMU7iM0rerkxqu0IVqLvC66FnVcQVztznO6xjI8nvs2gz2EEsx+
	nwTTEdqb+hnqx3XCh1HdNafpqh/E+ENiJ2XkuKhuSFQ2oBqKERlBkcz7HXREauzLYjGgJYEjp4v
	f9S146BCGnt12QHajek3TGCLjjFxo+kiZoDt5PWyTXFi6FKHERi4NGol5qhP9tj3PSyI3bLyemp
	I9FMACIOhUf+QCWuiVMrkNKQwwwVP2aq1wyhkhnKBl+OaZjg0
X-Received: by 2002:a05:6000:4818:b0:48e:3bc4:a367 with SMTP id ffacd0b85a97d-4940d559deamr170530f8f.33.1793992642527;
        Fri, 06 Nov 2026 11:17:22 -0800 (PST)
Received: from DESKTOP-KHFMJSR ([194.9.62.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6187sm5224380f8f.46.2026.11.06.11.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:17:21 -0800 (PST)
From: clicedvly768 <harepro29@gmail.com>
To: ojeda@kernel.org,
	dmitry.torokhov@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-input@vger.kernel.org,
	clicedvly768 <harepro29@gmail.com>
Subject: [PATCH 0/3] rust: input: add input/serio abstractions and port Gravis Stinger driver
Date: Sat,  7 Nov 2026 00:17:11 +0500
Message-ID: <20261106191714.334055-1-harepro29@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series introduces safe Rust abstractions for the Linux input and
serio (Serial I/O) subsystems and demonstrates their real-world usage
by porting the legacy Gravis Stinger serial gamepad driver from C to
safe Rust.

Motivation and Design:
- In the Rust for Linux (RfL) philosophy, device drivers should not rely
  on raw FFI and unsafe blocks. Instead, the kernel crate provides safe,
  idiomatic Rust abstractions.
- The Gravis Stinger gamepad is an ideal candidate for demonstrating safe
  Rust driver development in the input subsystem: it uses a well-defined
  4-byte serial protocol at 9600 baud, 10 buttons, and 2 analog axes.
- The ported driver (`drivers/input/joystick/stinger.rs`) contains ZERO
  unsafe blocks, using RAII types (`AllocatedDevice`, `RegisteredDevice`,
  `serio::Registration`) for memory safety and device lifetime management.

Testing:
- Built with Clang/LLVM and rustc 1.99.1.
- Passes all strict kernel Rust checks: `make rustfmtcheck`,
  `make rustdoc`,
  and `make CLIPPY=1` with zero warnings.
- Tested end-to-end in a custom QEMU virtual test environment with serial
  port loopback (`serport` line discipline `N_MOUSE` and `SERIO_STINGER`).
- Verified event reporting (`EV_KEY`, `EV_ABS`, `EV_SYN`) via `evtest`
  and an automated Python protocol test suite across all 10 buttons and
  both axes (-64..64).

Structure of the series:
1. Patch 1: Add input device abstractions (`kernel::input`).
2. Patch 2: Add serio bus abstractions (`kernel::serio`).
3. Patch 3: Port `drivers/input/joystick/stinger.c` to `stinger.rs`.

clicedvly768 (3):
  rust: input: add input device abstractions
  rust: serio: add serio bus abstractions
  input: joystick: stinger: port Gravis Stinger driver to safe Rust

 drivers/input/joystick/Kconfig    |   1 +
 drivers/input/joystick/stinger.c  | 191 -------------------------
 drivers/input/joystick/stinger.rs | 174 +++++++++++++++++++++++
 rust/bindings/bindings_helper.h   |   2 +
 rust/helpers/helpers.c            |   2 +
 rust/helpers/input.c              |  18 +++
 rust/helpers/serio.c              |  23 +++
 rust/kernel/input.rs              | 174 +++++++++++++++++++++++
 rust/kernel/lib.rs                |   2 +
 rust/kernel/serio.rs              | 223 ++++++++++++++++++++++++++++++
 10 files changed, 619 insertions(+), 191 deletions(-)
 delete mode 100644 drivers/input/joystick/stinger.c
 create mode 100644 drivers/input/joystick/stinger.rs
 create mode 100644 rust/helpers/input.c
 create mode 100644 rust/helpers/serio.c
 create mode 100644 rust/kernel/input.rs
 create mode 100644 rust/kernel/serio.rs

-- 
2.56.0
