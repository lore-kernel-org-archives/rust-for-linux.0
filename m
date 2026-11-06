Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794004244;
	b=jjrnaJS524Qo7nXmLWLWXtqURGw/wacX3hJeSHjMAKO9FMMuLcPVv8a23J5w96cZR6hg
	 8lkNh63bpimL/ZDP1YQyoZljmq5VuYTOubY2GWUHnNJj7k+Q1N+lR1FL8Whxf2HNp7j02
	 AWvp7uS3mUmFO2dhHqpaao6AJ5anRJXt9fPonG3gwjJ47G2iUK4amwtLrlag5BCsAx8Vg
	 RgDCkgdGdYHB67pPWPpXSzA8UTNrjq8/VZHpG9oBMMlA0xlbNZ55Zg3/0OE5nP6dOu+sL
	 t3ah+ktGAo2oKyeeGo7bJsSgUojRbVZWgeWEE+EPPRb+KVqPAJ500dnwIos1J+pzL/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794004244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3Wc9u5hs9bPs9BVBlW4FrmuLwiUyoR2WnleMZeaplMU=;
	b=UNOCdJ+JI/9S7swPloDEpifLnyyEkJa6rrMUVSN6KiHZZ6n9rP58pSpUmahiGuHC+Dk2
	 lxmZKgkR0b2esvtH3eNhg/nSwUYmXdTGViAq1aE8Q1j7WCM6SrtBmYtb0fH6u0RpvBxtJ
	 CWjCU5E54aTXWMrrgl6ZH5hPCypH19dcIOWuWMiQYHOsUzb9PgVd8x8/Cw/Lja71Cexz6
	 jEigzODap3KlcRX8xYE7UaAgWcT0U5X5gsVkhE0n3rXjXamWpeWolZ3Pg7uE2S3BF26M2
	 CcIGYLSMElXEy5YfDhwxjCAUEaV0OB3KuOOKufl6F5jZwlMe6NrR2khTTYT9NzKVw1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgUhOGCA;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54824606A326
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 22:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54824606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgUhOGCA
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so13411495e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 14:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794004243; x=1794609043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Wc9u5hs9bPs9BVBlW4FrmuLwiUyoR2WnleMZeaplMU=;
        b=jgUhOGCADoYR3d1N1lVPq8+U21W4+fOPITxXTHlSWe8XrT+OjOmeD9KaU2c7QNmdJd
         wpdtNPo+fIrTjIEy/TkoA/UCQfI36RIKD9y7oWaB2gHkIyHx2TsBWYFSoK94J3fXb9F4
         24Njdnq54epZRFMiDJtP9PZgqqHknsMhCa75sDe4ZlsbJMU0UwUzAUfG09WCpGMLZXgS
         oq+vkO6PGwI4/6gFj1EvW4J76WcVFZsRCo1vOqkyhBGyIy31DIiICZUva+GJ+ps9tnNB
         KNlhW/7C1ZqXULDG3bpVcjYZuBjOhlt/hM7CA5qpeabBQ7nX0JIUNV5AwttvvYiQ3mqD
         qRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794004243; x=1794609043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Wc9u5hs9bPs9BVBlW4FrmuLwiUyoR2WnleMZeaplMU=;
        b=TofmCKFLjiS/Nuc34UUED9SnB3r74ZkC2aJCoTAR84T+tC00tMC+UXr5oqyFlafy7V
         bgbgOi7AqD5q6azR/2h58GGTPkK40o4NQvrUlomGQ7OBTz45Kaz/tyVRJDRPq/5GGGoa
         65NyqJI8MWIL0BrCi+hfYVI6kza4EmrFYnNkLYBRk4TocGabbgzhLoE9KPbXueWIK0Dd
         tDjK0gSrDt9Hdxfdr7S2laNZ8WPEyGYSqfZVLdmV4L8N0zTl54iiwk7gLtrwFIGkTOLy
         4gTviun2zM5+sT6SyQTjTmDkMVMEwFZvoo+tV/khKt08yhX3qzhSk+WFc+inLCwQ++ba
         3+pw==
X-Gm-Message-State: APuU4Z+g1M6cedztDasVXFnn6+nAs1E3mxleEW1iqg5hICeKjziA0CkJ
	O5iXv9fNCWapBkfXhLSUYYhTwgzHcawVes6WLXyoBTARuaT5D/YEz5EN
X-Gm-Gg: AYBFou0R8cYndm0YPPBxz66ZeiXfFLh+U+XTGwV+dICQieBhl7l7FoPV1MJH7Fi2JvO
	y9mJNggNle/kYyvoa8qCxFRejaBRe1nySd2572AHQeqGbw/TqRqSORJmLhjoAskaBaJvE2QLRyE
	w7xOSlfcGemDrcyw/tG7RQ/tE/TJJnq7StmHPaJ53lNM4gNqO6eatFtKKyEJmfKtyEXbewu0nM4
	WopOxSrMkrIcX2bV2TPw3nIXcwI9aysaveJ9q9MQuMVAJGCY5jbyHLHx+JWjzFQ/HOyJ9kVyyb2
	1/iBxzFBcH3vzhO4o2unFgf0x3DaFr76EIY4z7PVo1yoIdtTsY12hDEFIsx+DDsdF3/lgCIgglL
	15h62RhjN6XwNkL7jFjkTYm94HtS+nn4n1CqJb2lkKE2gq3P78QHwX6x/ufP64lIxRoApYS+0KB
	Odo7Oxx8DimZYo/iGie6ygg4k8Dj6f/ZVoRVPtWXCvoXuIi0BOkJryx7IeN3nDy1QJ7yHS/3RDj
	4TjymXxNMf3j8zOsWhvUcX0YA8YDwqtvrzn/xdlmyBWx4+YUTtfYfyO9jnlqS3QAVi9lr7dQS4z
	TFwmteJtHIoQ8SAwlBs2/ytvqYebfA68yf5SzWMdTzBifzqvENdeBGgRZJffxEINnHBp2YZS1G7
	2gzatY8E2TgO6zgewAzs6hWx7aP2vfWIZ5GNRX/u1ERpyVpfy
X-Received: by 2002:a05:6000:470e:b0:491:5b1:fa73 with SMTP id ffacd0b85a97d-4926fd37256mr7554519f8f.0.1794004242569;
        Fri, 06 Nov 2026 14:30:42 -0800 (PST)
Received: from DESKTOP-KHFMJSR ([194.9.62.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm6262367f8f.58.2026.11.06.14.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:30:42 -0800 (PST)
From: clicedvly768 <harepro29@gmail.com>
To: ojeda@kernel.org,
	dmitry.torokhov@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-input@vger.kernel.org,
	clicedvly768 <harepro29@gmail.com>
Subject: [PATCH v5 0/2] rust: input: add input/serio abstractions and port Gravis Stinger driver
Date: Sat,  7 Nov 2026 03:30:31 +0500
Message-ID: <20261106223033.452853-1-harepro29@gmail.com>
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

This patch series introduces safe Rust abstractions for Linux input
devices (struct input_dev) and the serio (Serial I/O) bus subsystem,
along with a port of the legacy Gravis Stinger serial gamepad driver
to safe Rust.

Changes in v5:
  - serio: resolved invalid irqreturn_t constructor compilation error
    by constructing bindings::irqreturn(ret as u32).
  - serio: decoupled child device allocation and publication in Driver
    lifecycle (init -> start -> attach). Child input devices are
    allocated and configured before opening the port, but only registered
    via Driver::start() after serio_open() succeeds. This prevents
    premature registration and spurious uevents on probe failures.
  - serio: added C wrappers rust_helper_serio_pause_rx() and
    rust_helper_serio_continue_rx() to safely attach child devices in
    Driver::attach() under hardware RX pause, eliminating races with
    concurrent interrupts without sleeping.
  - serio: removed redundant Device::as_device() method and made
    Device::as_raw() crate-private (pub(crate)), relying on the standard
    AsRef<device::Device> implementation.

Changes in v4:
  - Makefile: restored analog.o and db9.o in joystick Makefile
    that were inadvertently removed during previous revisions.
  - serio: eliminated concurrent borrow_mut() and aliasing data races
    between connect_callback() and interrupt_callback() by initializing
    and registering the input device prior to serio_open().
  - serio: mapped interrupt return codes via bindings::irqreturn(..).
  - serio & stinger: formatted all module imports in strict vertical
    style with trailing // comments.
  - serio: annotated Registration::drop() and Driver::disconnect() with
    #[inline].

Changes in v3:
  - input: added AllocatedDevice::set_phys_from_parent() to dynamically
    format the physical device path ("%s/input0") in an owned kernel
    heap buffer.
  - input: managed parent device reference counts in set_parent(), drop(),
    and register() using get_device()/put_device() to avoid dangling
    pointers and reference leaks.
  - input: eliminated manual cleanup duplication in register() by checking
    to_result() before mem::forget(self).
  - input: implemented Send and Sync for AllocatedDevice, added #[inline]
    on small methods, and formatted imports vertically.
  - serio: integrated serio::Device with kernel device abstractions via
    AsBusDevice, impl_device_context_deref!, and AsRef<device::Device>.
  - stinger: restored userspace-visible device name ("Gravis Stinger")
    and dynamic phys path, preserving udev and EVIOCGNAME compatibility.
  - stinger: maintained module name "stinger.ko" using Kbuild object
    aliasing under CONFIG_JOYSTICK_STINGER_RUST.

Changes in v2:
  - Combined serio subsystem abstractions and Gravis Stinger driver
    port into a single patch (2/2).
  - Retained original C driver (stinger.c) under CONFIG_JOYSTICK_STINGER
    and introduced CONFIG_JOYSTICK_STINGER_RUST to avoid regressions on
    architectures and configurations without Rust support.
  - Ensured IS_REACHABLE() guards for C helpers and #[cfg(CONFIG_* = "y")]
    for rust/kernel modules to prevent unresolved symbols.

clicedvly768 (2):
  rust: input: add input device abstractions
  rust: serio: add serio bus abstractions and port Gravis Stinger driver

 drivers/input/joystick/Kconfig         |  14 ++
 drivers/input/joystick/Makefile        |   3 +
 drivers/input/joystick/stinger_rust.rs | 191 +++++++++++++++
 rust/bindings/bindings_helper.h        |   2 +
 rust/helpers/helpers.c                 |   2 +
 rust/helpers/input.c                   |  22 ++
 rust/helpers/serio.c                   |  27 ++
 rust/kernel/input.rs                   | 253 +++++++++++++++++++
 rust/kernel/lib.rs                     |   4 +
 rust/kernel/serio.rs                   | 327 +++++++++++++++++++++++++
 10 files changed, 845 insertions(+)
 create mode 100644 drivers/input/joystick/stinger_rust.rs
 create mode 100644 rust/helpers/input.c
 create mode 100644 rust/helpers/serio.c
 create mode 100644 rust/kernel/input.rs
 create mode 100644 rust/kernel/serio.rs

-- 
2.56.0
