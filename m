Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74862820A0
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 04:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907536; cv=none; b=l94PgVQcOV1vyqTQKcHdmCZ3Z2mqyB9dnhILSO1jwCKTQBnHFx64m5+N49vOOCacBdsiN5MOQBpupxSZIls/bGEzQTc3snycWtN+TjGkvhR/ETKfCQ8EEau7sKzhbs9mznIcSaOsWWfOLxYkpnNbBpS8WrRQQVGwBI6zZ3v/fPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907536; c=relaxed/simple;
	bh=PL1uF+miaRjncn9pPofTd48PdjMggPgKMuiNmOSdqqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NF4NrvMeOwj59WBTds2mD0zBs/fjv8tKI+e0z8QRczGhMATPE04C3QXjVa77osR1qF0p4GPAzdi2uWQASC3qMqFQnYcY2F1OJ6xww0aGPPudUo43ZFhmxwvsnzUoYVWEq6lM1PtoQPZvMnnZBIjNtLRNIjYKYz3etdHe/anbBGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFsPvhXl; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFsPvhXl"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8f8f2106f1so685992766b.2
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 20:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771907533; x=1772512333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWFYHX4cmQ4ANjjDRTxWDPBizHkpnwZrz9MSL1ntByw=;
        b=EFsPvhXlqISUkdROhUevWP5B8qFIsdytmWuvS/H5TVJQOd4zlW6ZOvmbwaygK1rpKm
         AwwVHlFtnMgNH2CP1ILv6L42SdmT8Tx6cyIK70Xq3m5p3wfdpz8vuWbLIa8H78WdiQpr
         jOQ5wdnuRj6hWHwrl9mgxI/XGsHeFmdxe4Ofpg7Ec5o9xur1M6lP8zv/eW53b23bUGP6
         9MAWtMLVzFKewQA/LQrsVtSB0nk5nQzd5g9nTntyY8Rmye0CnEgzWnlbQQufadOv063u
         3frX8RxuED/eQc0cnanQVHFOShzY1xfzIOsoXZSo3tcvRxHbVKcenY32thLHxf2DzlS5
         e9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907533; x=1772512333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RWFYHX4cmQ4ANjjDRTxWDPBizHkpnwZrz9MSL1ntByw=;
        b=Q3QdR1soCFlVq5WhqNRTkqLIHKnow23G57/jA3P4eXFLAEnDWOIBKrOaShGDdDsGBo
         CzmqODR1LlwuEDnPmvttJIAyMmH6+ElifYAD8H8cWHVJ6QYjDNprCo74y1P94eO3DvaF
         F4gBAydzFSPBL6Mw8/X77oLMXgaizHQX1OZ8Jc9CSjOGkvwBSLAF89of5DOgLvZXbMaj
         osAYagX8yF1GhkGMlF9kJA4RL++kAQisjm3y6u4abocINoCF/L9nxsxx5UjJjhNtX2iR
         1xWmbzsMn+hL7cH3Tq2LgTIYMgg3QPg6Om3eLolqsNdZVuab6d6AHc8ZjH3S+V/90mZZ
         0Q+A==
X-Forwarded-Encrypted: i=1; AJvYcCU6Um2j9je4/Hg617aj77z5KpGSGLw7HuYVWnuFAy5xwuVlUVN0ne6uMti37wa+I5WehreKQ0OJDcJP2my5pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPelQAQr+OHy7aqXCgLp8MsCEH6XrPsrCjIyKT9oJUV0WHbhvk
	RZ/VDlcJcZ6jwMZ3hF73/bhly0RmD+va52StlzykmXBdwC1Vz6XYsyzT
X-Gm-Gg: AZuq6aJfUb3RZ1IAjY4ZDBlXL66Gh+6BYhkLMKxWmbuJjPu/EaZij3ZSmLT1bo9AE7k
	NDYqRV7SpOoa8SawS4vPQLvSScfMchuHgTPtiBGHjrODgJz9Ee3CXKg2RZ+7dBpCZ8aBgLbgMc8
	fZZXw9Dx9VTXhxTXinvxYcuv82smzAR230U1dAduN43v2cvIxO1tH9yYVKXTQ6eG+Rrxp8t/9YC
	ae3LPOOU5TSRDcdwcBr+5H6SmhXMj5Zs76r8iD4CsdTCI49074d5+O6Eqhc6jA7LB7DBKwTjxSK
	NFRPXHDIA9dfpOrmsARSEW71vC2YKNVfge2IqaWP8bRZ/TXiT4JKHgwRd/x5o0jio20rEUkDKBc
	col56CNTb91REswnF4sp2DybL3Qu2FQlZFk0yRKO5GxH+NVFRZG6lO1Q6MKf5t8h0Cnzirym37r
	U8wAawMtLzmIAPmsyQ11RcQyKQbGbnzxtAQnIBwe/NglGTo7XUnve4KkkFAEn+p42aOziPPBsCu
	r4oiGish3BrL+gJP9xQ36S/dI3s2L2rnuU8GEQDfSMOFA8tQ9IBZSgrMNMfYjvZNvCn6eFgKQ==
X-Received: by 2002:a17:907:1c22:b0:b8f:de1b:78a with SMTP id a640c23a62f3a-b9081a2ce44mr719504166b.21.1771907532815;
        Mon, 23 Feb 2026 20:32:12 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (206.242.32.34.bc.googleusercontent.com. [34.32.242.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9088c8fc30sm371284466b.63.2026.02.23.20.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:32:12 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Trevor Gross <tmgross@umich.edu>,
	Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH net-next v2 0/3] net: phy: add Rust reference driver for ET1011C
Date: Tue, 24 Feb 2026 04:32:08 +0000
Message-ID: <20260224043211.1747-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223220504.2102-1-iprintercanon@gmail.com>
References: <20260223220504.2102-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a Rust reference driver for the LSI ET1011C PHY,
following the pattern established by the existing Rust Asix PHY driver
(ax88796b_rust.rs).

Patch 1 adds a speed() getter to phy::Device, needed to detect speed
changes in read_status.

Patch 2 exposes genphy_config_aneg() in the Rust PHY abstraction,
needed by PHY drivers that perform custom BMCR configuration before
calling the generic auto-negotiation setup.

Patch 3 adds the Rust ET1011C driver itself, implementing config_aneg
and read_status callbacks. It is a feature-equivalent port of the C
driver at drivers/net/phy/et1011c.c.

Changes since v1:
  - Added speed() getter to properly detect speed changes (Andrew Lunn)
  - read_status now only reconfigures registers when speed changes,
    matching the C driver behavior (Andrew Lunn)
  - Removed unrelated dim2 staging patches from the series

Artem Lytkin (3):
  rust: net: phy: add speed() getter to Device
  rust: net: phy: expose genphy_config_aneg()
  net: phy: add Rust reference driver for ET1011C

 drivers/net/phy/Kconfig         |  9 ++++
 drivers/net/phy/Makefile        |  6 ++-
 drivers/net/phy/et1011c_rust.rs | 75 +++++++++++++++++++++++++++++++++
 rust/kernel/net/phy.rs          | 17 ++++++++
 4 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/phy/et1011c_rust.rs

-- 
2.43.0

