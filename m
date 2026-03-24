Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96FC2F8BF0
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367595; cv=none; b=kiac2/JNtxG1H1Q90uVe6frUD3dNj/shZT8ZrO/iPL4UNfyCnB4/ReofdWSCzi84i8HaH2EBMYUP974CVyHUXn9Pc272/0Vuqs1VfVDDJ4/cRvkMx1nbQMHFc/3cvCn08doGstqKaNfk4p1WuhmkP+vp60oM9RqF3EW31GVF3U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367595; c=relaxed/simple;
	bh=LiIV+5XNglCPPMFa9iO5svn7RW5PZppPVuZK2KTD5ng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=epq01XqmeaA1K0/fAwwXe9RSnbt1jfAgzohlO9rmWpUS9THYJYViJ8SOjKPG8IrEVtm4hQL+vdOcMbUE1iDt0Ywdj69b0Kg3EQWHi19kLMt/gMuU/HO16w3K8lBNmO9tT5MWWcaWeErO67tIkw16j8GG/yZpFlUGXFbgxz5oq6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWCLTzHO; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWCLTzHO"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a27b5ad832so5373644e87.2
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774367591; x=1774972391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FhxZ2/HJu4L/xAHCzTO17lW76yrB8+9Q275K5Y2NCLM=;
        b=OWCLTzHOWwZYhtGrUxkEwsLwzRb+O1/bvl8BXU75QEcLyjgpJe/hQ5Kq2fGCOVEerV
         dpeR6o/dyrjmhxfO3tnMVqNRwFWctzyb/8apPI7zqeoBL2qxOigKb+EcOU7FjSJvhzQx
         V/aKy5WEVL31xh1DKbIe8E4vNUlA0KmCZRrRbImLWvI1343kkdxlKOgQF+nAy+eUASqd
         5t8Uut9y8IocSoW1HFHhxzUGpoxGy1hE2YYTo6gmJ1zfElDnvFH7vJR1IMWjUWacth1V
         XfXVQZAqUjGaEv7NpHtPDPg35jtOQwBXKSI66pVmXhCkseHTzfXlBEiYTITGa7yUWz28
         zDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367591; x=1774972391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhxZ2/HJu4L/xAHCzTO17lW76yrB8+9Q275K5Y2NCLM=;
        b=ftHd7k9w9tDsoHHoVSU/cCr+0vtfhJgnsstuS8N5a/hF8wn4MXZsKJH7WtXbqqdMNY
         yF8YYoSZVSJN/ZjUq1hL30MB9jJUJbnk2aiUOjID1pbthRuVXibzS/ihnTUHci+l7Owd
         sNvjuSItvEV+RmNj6DVAT5rtTBdQ6Xzr7wv69Piex94nGUHy5rlFb2XvyG8pe+9UuUPy
         es586ACsqZmcXBIRoc2GlBVwku6IaSucKf5cR3fIgdY7qEM49LD72tzjUPt90Qkua93U
         HhK5GlPuOHGpXk1LyNEzZhZDFk8u3umDxZSlCpr2ynEkIIR1k4AUE/amkS9zoDoSOBzV
         QsdA==
X-Forwarded-Encrypted: i=1; AJvYcCX8ulV9QMlaC6ZZUglFdoLJSEEVcIV71Bca+rhJXnpaRGCZ+wkLX4VvjsTXUk4x45pMT35yrGluxSdVuXCWaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm5YN8IUCWXLsmoXkYm78WgN/fLumqYIdDj7+qkWPbaIXdo3Tb
	3eIEtQZg/+8846XTOGxWgPOrR/wNI8apL0YU3IsTbUQuiMIlLLx+HOvr
X-Gm-Gg: ATEYQzzkKgGnIcH4s8rK9KGbcswVDict+FlGFb3iwxKaFs4H2Pz/+inVLvrhFIZXIE0
	YqX/Uvcu3h85snqbaTchtOYBgH7izNE+fEt0jm1OfOgMiGMAW+pSziOoW+8JqMQO2klIuumKY2F
	+rl24M+nIAth8dLyd/1DEzemhTBi/8X2U80XJmwUoYAwZ1EAdHxCkCTI5qPdXyzVgqZn0VTa8mE
	GM7Vn6NZmEgUrpdXACwxu6eurwsmzyNbJiB50YVuc2wQg/I64TTZoLTeHb5GsiU7otE8m8nNAp/
	KCg2YlFH4VAyHzoiIY8I6cqnZ5mR0ZoD/kOCdTG2a5fRJK1sDutX3yNIUAmnXyuaYHHYHzp8kX3
	SGmXVkwF/RpqNFSp8NmBQw91J5wkvEbM+Yr6lf68ZB/XhgkVPkZXJxOkMzIGYj84FMTtMzqWHfG
	AURh7s+GDg+ZRlkNnoDjTWQUj42XrJVF0NGRNHIPJZ6n0eTjGeibIMBU8EhpkekAuSkagRuML8n
	isbP3P2CwPk8Ld/jQ==
X-Received: by 2002:a05:6512:3d10:b0:5a2:851a:264a with SMTP id 2adb3069b0e04-5a29b97ecc8mr7788e87.10.1774367590545;
        Tue, 24 Mar 2026 08:53:10 -0700 (PDT)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aa7cd0sm32567841fa.32.2026.03.24.08.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:53:10 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: fujita.tomonori@gmail.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	dakr@kernel.org
Subject: [PATCH net-next v2 0/5] rust: phy: extend abstractions for real-world PHY drivers
Date: Tue, 24 Mar 2026 18:52:44 +0300
Message-ID: <20260324155249.15098-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends the Rust PHY abstractions in rust/kernel/net/phy.rs
with features needed to write production-quality Rust PHY drivers, and
adds a Realtek RTL8211F driver as the first user of these APIs.

Patches 1-4 add new Device accessors, register manipulation helpers,
driver callbacks (config_init, read_page/write_page, config_intr,
handle_interrupt), and interrupt support infrastructure.

Patch 5 adds a Rust RTL8211F Gigabit Ethernet PHY driver that exercises
all the new abstractions. The driver implements RGMII delay
configuration, PHY EEE disable, paged register access, and
interrupt-driven link detection. ALDPS, CLKOUT, and WoL are omitted
as they require per-device private data not yet available in the
abstraction. PME interrupts are not handled for the same reason.

config_init was previously proposed in an RFC for the Rockchip PHY
driver [1] but not merged at that time. This series re-introduces it
in a form consistent with the existing vtable infrastructure.

Changes since v1:
  - Added cover letter (Andrew)
  - Fixed Subject prefix to net-next (Andrew)
  - Added RTL8211F driver as API user (Andrew)
  - Fixed rustfmt issues reported by kernel test robot
  - Removed RGMII from interface() doc example (Andrew)

[1] https://lore.kernel.org/lkml/20240201-rockchip-rust-phy_depend-v2-0-c5fa4faab924@christina-quast.de/

Artem Lytkin (5):
  rust: phy: add read-only device field accessors
  rust: phy: add paged register access and bit manipulation helpers
  rust: phy: add config_init, read_page, and write_page callbacks
  rust: phy: add interrupt support
  net: phy: realtek: add Rust RTL8211F PHY driver

 drivers/net/phy/realtek/Kconfig          |  12 ++
 drivers/net/phy/realtek/Makefile         |   1 +
 drivers/net/phy/realtek/rtl8211f_rust.rs | 140 +++++++++++++++++++
 rust/kernel/net/phy.rs                   | 260 +++++++++++++++++++++++++++++++
 4 files changed, 413 insertions(+)
 create mode 100644 drivers/net/phy/realtek/rtl8211f_rust.rs
