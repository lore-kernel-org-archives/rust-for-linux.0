Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A7A2F25E4
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 21:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547309; cv=none; b=K1B518wGxIWFwI3e9W4Cp57UFoOVce9XmEWjEXe9KtkuzklDyV0q0M2e4E/7xODGaRTgRaHRGsuvG/DfWQMOujNFAj2VRnJct9AVhWrLPaic9n5LMSlNEynC4jT+6dKkO+zsm68Ns5tAj8mmXaXH5tQCuvEWHLhoPWEKKUVT6HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547309; c=relaxed/simple;
	bh=7KJXJzo+UE0xE9qAQMsWzVrOorS//UfnfERkBCDL37I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pKgGGxujhHUUblu2NX7JGke66/PDmcSX8oDeSIpe3jqWWZ8zZoj6ufJ9AXcjOSGQ4IRN23CtKV/DY5fU0dy2ss2FMG/aAe7+Ohmu9ApXKRsZOZJArNUGIuoqETnSZt9xZqml/JI5OwMKqUCMBmfKfm3OQ5Dh4cSUSEQpY6AoLnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbUi5dYO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbUi5dYO"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cad8076b01so14269265ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 14:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783547306; x=1784152106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ws9RhF/v+RDUhCzwrIsuIgwDdl54OneaRZCtnhDgCNo=;
        b=dbUi5dYOv74sX1ph2QjqwrH2P1X6X+GyipaScdiG0ElDNBVvZxmbO1qtkb07nDvSVe
         SRxWkQaUqOcF3+wBYpIeVoSIz7nNpQXsHPfBo82MP6zmqeFc4CWHM+TwSJkozKhQ40qP
         /KKxm57d7pJiZgJiZjY7kmmDUhFMP+vJTQLyVeOW8AnPgCIZ8INQWyVUOlp8DFSt7BeT
         YwU7p90uTGLNybComwoe7OcG+652A7bRxLJy2G3Q8QiT4fEuE4BkDdDZ6bKDOr1SHqkc
         r2Zr/O/T31zZltLZVxnDH2Z+iN9UAbmUmywYAjpJtr812j3ES0bwCoTIynwmj+cJQSu4
         ErPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783547307; x=1784152107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ws9RhF/v+RDUhCzwrIsuIgwDdl54OneaRZCtnhDgCNo=;
        b=IkOM4KDQSedr2hueKebGqT9W37ghFpa8WOIQFICrDkBzlNkkVHpa6J9AR59f7nPtB4
         XKYRlqlXm60bHrDLXAN/369bWNiY4DSP/66aRKc6fXRpv5hKmwU7gsPDBRTJ4sTYBgOP
         gQAKVD1toGoBW15a25+1ClCNYTnDch0D6Sp107KltQqAh/d7Od1aUPhcQfzot807KdV/
         61U0MyP3E72AgRzd9BMZcEaC75lC+yZSn1x6+5LhGl51RMw9ZPP4FfInPMsNfmiREyUs
         lOIqkGRaL17GFnoj4ZJk5svGMOIWAZfc+tovpE0IryOQAtp8Mm9FV6VFH2714I5aUlth
         P0iQ==
X-Gm-Message-State: AOJu0YxZXu8MeLzrfyyYAoh4hmn411GRZOetBf7y4Pu8MZh1y9ycJbjk
	GS1whNvy8RVGtZZdiNoU8BRDCjFDSX4cuUvVBtmFfurD5+dUekgGlevibPf1HW7p
X-Gm-Gg: AfdE7cnUBqdYKnPmRKJ+MpOFcp9j3RWJZBRaFAKNpT/FGErDDp+EIW9uxFjOjcf8Iag
	iJiu7vUoaFezlj5P0WbdtgRInEIM8mqjQipP/Jm/FLSpNhX+mzxc8UpaI0muJBf9Ad8cN/rVqnL
	RZdpAA9EM6TmZjG8GEHWvrQBwFsPvs9q9DApF7d9L5RAQfkUG+3WKoKCgvVn3Knve3m3DN6lx3f
	opDdSh9nis1Gn4A0DrYpBvd72CGSqbjJH0IpnxEMewZWpHR36owsQxbRvJ/sdg0oFDAk95jZ2ll
	hrTQpG4uzwJe6haixZZhveS7Cup2Nf1HuqqyyPM95NUHBIC4Ld1qXETqX+c0lCCNj2kejPVvFeB
	LsDxEslY9Rd/uVT92iI36X0mLJHHK93b0H/rQu2qsST3n6E6pWW7ExtHsQ+ETPnx12TddSsuWcS
	dBOOJc7OxD5Oo7zy5AcDnE84k8dhfm/hXjz3jUB9XqHJ2ctALv8pLQLR8OGEt2LInWLt4FAyK5i
	FN5n0Xcog1Oi8WJy5I4OuPwCXvuGRQJa1IHh7DmrmO6H4Tpe+w2nsXi7JYynGJEi4OcOY28aaS3
	RlZGPZEofSCZIqlPHTjYkDPYxFYCKQah0auok4FbOy2JsB1d0v4HTnryljh6l3iR5ov3C1vp
X-Received: by 2002:a17:903:987:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2ccea35ad78mr48716195ad.4.1783547306454;
        Wed, 08 Jul 2026 14:48:26 -0700 (PDT)
Received: from ip-172-31-21-198.us-west-2.compute.internal (ec2-35-85-29-74.us-west-2.compute.amazonaws.com. [35.85.29.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d946sm33733855ad.66.2026.07.08.14.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 14:48:25 -0700 (PDT)
From: Bruce Robertson <brucer42@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sebastian Reichel <sre@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Igor Korotin <igor.korotin@linux.dev>,
	Gary Guo <gary@garyguo.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun@kernel.org>,
	Bruce Robertson <brucer42@gmail.com>
Subject: [RFC PATCH 0/3] rust: power_supply class abstraction and SMB347 charger driver
Date: Wed,  8 Jul 2026 21:47:35 +0000
Message-ID: <20260708214738.25008-1-brucer42@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a Rust abstraction for the power supply class -- which
does not currently exist in mainline or rust-next -- together with the
SMBus helpers needed to drive an I2C charger from Rust, and a Rust port
of the Summit SMB347 battery charger as the first consumer.

Motivation
----------
Rust drivers for power supply hardware are currently blocked: there is
no safe Rust interface to the power supply class, and the I2cClient
abstraction exposes no register I/O. This series provides a minimal,
self-contained path from binding an I2C charger to reporting charging
state through sysfs, entirely in safe Rust, with the unsafe FFI confined
to the two abstraction layers.

The series is structured abstraction-first:

  1/3  Safe SMBus read/write/update_bits over i2c::I2cClient.
  2/3  A power_supply Driver trait, a generic get_property trampoline,
       and an RAII Registration that owns the descriptor lifetime.
  3/3  A Rust SMB347 charger driver consuming both: it binds over I2C
       and reports STATUS, ONLINE and CHARGE_TYPE.

Testing
-------
Built and exercised against an emulated SMB347 using i2c-stub: seeding
the chip's status registers and reading back the corresponding sysfs
attributes (status, online, charge_type) confirms the full C->Rust->C
path. No physical hardware or interrupt path has been tested.

Open questions / known limitations (hence RFC)
----------------------------------------------
  - get_property recovers the driver's private data via the parent
    device's drvdata. The current code relies on the observed ordering
    (callbacks only fire after probe() has set drvdata); the contract
    should be made explicit.
  - smbus_update_bits() is not atomic against concurrent callers; a lock
    will be required before a charger IRQ handler is added (not yet
    implemented).
  - Only get_property and a handful of properties are wired up;
    set_property, property_is_writeable and the IRQ-driven
    power_supply_changed() notification are future work.

Feedback on the abstraction's shape -- especially the descriptor
lifetime and the drvdata recovery -- would be very welcome.

checkpatch emits one MAINTAINERS warning on patch 3/3 (new driver file);
it is a false positive -- the driver is covered by the existing POWER
SUPPLY CLASS "F: drivers/power/supply/" glob and needs no new entry.
Patch 2/3 adds the one file outside any existing glob
(rust/kernel/power_supply.rs) and updates MAINTAINERS accordingly.

Based on rust-next (v7.2-rc1).

Bruce Robertson (3):
  rust: i2c: add SMBus byte transfer helpers
  rust: power_supply: add power supply class abstraction
  power: supply: add Rust SMB347 charger driver

 MAINTAINERS                                 |   1 +
 drivers/power/supply/Kconfig                |  14 ++
 drivers/power/supply/Makefile               |   1 +
 drivers/power/supply/smb347-charger_rust.rs | 180 ++++++++++++++++++++
 rust/bindings/bindings_helper.h             |   1 +
 rust/kernel/i2c.rs                          |  42 +++++
 rust/kernel/lib.rs                          |   1 +
 rust/kernel/power_supply.rs                 | 133 +++++++++++++++
 8 files changed, 373 insertions(+)
 create mode 100644 drivers/power/supply/smb347-charger_rust.rs
 create mode 100644 rust/kernel/power_supply.rs

-- 
2.43.0

