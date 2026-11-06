Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999444;
	b=DqEkgUjF5tYkVbXoxslzWbmroclGTakY+e8NjyQo34CkwhGywXaXlP5THk5C7jhSIbyd
	 TgNYjtaKO1FEMjb0g3GsB+73zYxVPM61Kw3grUpXJPmKV8FiuFPcJ0gk4NU8wm1Y5m2XU
	 vZTjUzSEaaISt84Rri3azLyD+zAuWwOa239ioGt/t2WlBYMwrNxEc6mkBlk9/SbMJL0Aw
	 27x6isbLaBzZnQWZT6reFyM9IZZknbJEVVJHpN+NHRNVE3ARV5AfIMM76yrpNvVVGPu2M
	 tWVMPCV5cxd+RDmpyEuo3rseYs8s0KLmdsM1ZxricaMOHR/vbBTKV73XXQGff39uEtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0TfHtZkqJznG2H+ws+ctScG95Xi0uNmW+KweBrxJavE=;
	b=nbgKReCfLftp3F8SIJ2HmklNT7QATorX0pbZbdxl6DhNuYKzyT315DAEusowdO6SW2kp
	 /lmVkm94X7tADBUZNXAJQD+M9IIRqE7Exa/nFmxlE2wXtdEBirIx01gboxA0Ua45ZJo2l
	 pqTqLMFC5amrKbIOnmLVf0vHxFl4CQf70lF+sNEbjlmsOZLUkcusv/ET0DRDIWdUc7YWH
	 1QxECHN7ecoHCcip3eetbFM8TmgxLekhABtGFfoq1d4dgyeVk9qM+J+26r1h3qRjzUVih
	 Di4Vhxgkmc6inLbvNWejuWvSQRCM4odzvNWefF9CaMbnAza8LtSjU1bA11xSxQFImGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BwqKv2nH;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BA1606A32C
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 21:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BA1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BwqKv2nH
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so10179785e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 13:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999442; x=1794604242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0TfHtZkqJznG2H+ws+ctScG95Xi0uNmW+KweBrxJavE=;
        b=BwqKv2nHqlm/VApnRX/biC9ZPMZFsgVjs84rOx+CUeBa3nmfcpe6vaAi7mffbfOFJ7
         PTe7AEW2u70fWna1sS80Pw3IQHcKXYNKMaMHyFO5sGGubkNZr/DzkBZ7VExhe+T+W275
         2W2FtGgYDCRcQs5WyK0o9aGnEvYFTG/aVAJngCgGbliwTVlv5G0TpM2bcMXT6AVsSVDv
         7H9BOTNB2hfiilneePopWNT4Gt/XWv0dWtDW7G4RoInbYX49aCk0M5gzs9ec9HSYVeZy
         BmZyTFTVNdeSCOAGpi4C+gqvTFFAVbjpEM9HxNFfo9eXDoU+E5TLTFBYzvJNJCkay6mT
         FGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999442; x=1794604242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0TfHtZkqJznG2H+ws+ctScG95Xi0uNmW+KweBrxJavE=;
        b=g9TqMxxLEJld3ryPPXSyGc4KLTa9ZfLMxylGJ81tQ3P+9GaDIDIFUuwPlqAl+d7vu9
         hZ8c2yMTgzahcaRYSpgHNHxcAuRcu1KZ1pcwkmTlsZruv52nkSlS5vhrA8J5gwt17NpU
         JkMoyJT72kKVYu7u4xGH8EGjIQ5QGEjsAOP12nTcMADaW0eMLEBgWGysnYk0VbDt+ZhF
         wXcvhBHvaoVEERZ8UfpQOioU0TXAkIrxB1rYYo7QKwT0G4c8rRb6/36axhqUEfgvnWQ5
         DocbANfHhfa8Edxwws6xlh/dT/Xt4iFuigLy0MrnjCpK2ditoQ/y1znuGV2lplmdOLf6
         fyZA==
X-Gm-Message-State: APuU4Z+P4haechgYeYYCTgGSGmi97xTvUgk+t6784LGhu5TWUo8d7lpA
	KYBnHJ1hFjdTlhzTxqnPilkFgeiMaJYQvPYiXDgHvxaDg9CHvTX3Du3H
X-Gm-Gg: AYBFou0UJsuNafKdRl1k81KV6UiZWonjC+pnw3I//zkJ5srG4vJjAGZ/RGgDn0tzq/3
	o4CjxbZK/2XqTyjtWuba7S22mKwcRrEQHeFWMwhKiFNl7dxw3bQP81kLlEjS/iO6976q3z3ue6K
	jK8X6mzwexf8HaCkauHOOeu1SzUtOttgP6efibGqSbOJViU07VIrnvtbZ2UV/sdXJDOXi0zYEwP
	Lzk0qQEBZP9BhLU/FDzXHenPf1RYCC1/NXmWhq/yq4tA18wjDeZ/vEStfiWPu7y+n7mb+znmZZq
	2Gf4fv10rnui1eSbkMkiBwuPkkEaQvabte2/ZjgrTfMoGS1YeJpuiYcUhm1G2DeBVN9YfW75gfc
	Y0/Mx9Tf/tBH6Rq15dDHXhTQldHvJobnnR+dce5tFQOiPmh3jeydZ/Vi1ltaAA6HcxkI0glt/QF
	J+IseS7EjJI2pXy0rWv0o3N8LyXGEodiBp5kpp56SUL5sZG4RajM6YIZQrr6Ihx2/KfCG1QE2wk
	Z06U3fth+c3SpU6YkWZ3qyxx24KHklE0m4ietyX03zctV1bbrcRNN6OHAcL+yr7e5R/eSpgAOp3
	Yl/EbERbT+z8Zlby6FnYB5PbHLPZcRnk2orRLv5UEMm9f5J/zww29ju5pA76YpqxjSbsTMbzkpn
	0j3xpVx+icP8Fv+SHCI2QiEBNl5wxjibEU5crmtywWTTtU+SG
X-Received: by 2002:a05:600c:8b23:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4b6dea6984emr67911215e9.9.1793999441880;
        Fri, 06 Nov 2026 13:10:41 -0800 (PST)
Received: from DESKTOP-KHFMJSR ([194.9.62.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3283b50sm8049295e9.10.2026.11.06.13.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:10:41 -0800 (PST)
From: clicedvly768 <harepro29@gmail.com>
To: ojeda@kernel.org,
	dmitry.torokhov@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-input@vger.kernel.org,
	clicedvly768 <harepro29@gmail.com>
Subject: [PATCH v3 0/2] rust: input: add input/serio abstractions and port Gravis Stinger driver
Date: Sat,  7 Nov 2026 02:10:32 +0500
Message-ID: <20261106211034.401918-1-harepro29@gmail.com>
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
  - serio: eliminated race condition in connect_callback(): initialized
    driver state in T::init(), set drvdata prior to serio_open(), and
    published input devices in T::start().
  - serio: integrated serio::Device with kernel device abstractions via
    AsBusDevice, impl_device_context_deref!, and as_device().
  - serio: mapped IrqReturn variants to C irqreturn_t constants.
  - stinger: restored userspace-visible device name ("Gravis Stinger")
    and dynamic phys path, preserving udev and EVIOCGNAME compatibility.
  - stinger: maintained module name "stinger.ko" using Kbuild object
    aliasing under CONFIG_JOYSTICK_STINGER_RUST.
  - stinger: formatted imports vertically and fixed line-length warnings.

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
 drivers/input/joystick/Makefile        |   5 +-
 drivers/input/joystick/stinger_rust.rs | 179 +++++++++++++++
 rust/bindings/bindings_helper.h        |   2 +
 rust/helpers/helpers.c                 |   2 +
 rust/helpers/input.c                   |  22 ++
 rust/helpers/serio.c                   |  17 ++
 rust/kernel/input.rs                   | 248 ++++++++++++++++++++
 rust/kernel/lib.rs                     |   4 +
 rust/kernel/serio.rs                   | 301 +++++++++++++++++++++++++
 10 files changed, 792 insertions(+), 2 deletions(-)
 create mode 100644 drivers/input/joystick/stinger_rust.rs
 create mode 100644 rust/helpers/input.c
 create mode 100644 rust/helpers/serio.c
 create mode 100644 rust/kernel/input.rs
 create mode 100644 rust/kernel/serio.rs

-- 
2.56.0
