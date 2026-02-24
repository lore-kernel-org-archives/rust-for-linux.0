Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA6B3A9623
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771951770; cv=none; b=baZJyepJ7IZaiYZ7b93VDe6Xpk+krrqXI2MQtU205bhdPzLQYdiA5CN9Nz3mOhU2+TLZ+sx+kma9rh2mqYcYxaXQPnZ7YFpT9kIvWGCR9592Ey+XRWhMHtI4u5sZicEFrvKyMf2A11+lN500TESysWzWLEAqzecmhcKXb/QdTl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771951770; c=relaxed/simple;
	bh=EN/Ks3g8lgtC51URMTxXxDpUpldSH9S/dOB1pXvWwGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBsvlgB8NiO9SzKxtzuxG+FXi9GApzkX9fBdUXCY1DDmMpXzSdQYTFr72iXNeLdEz296ppqHnDj9XbqXWAOIv91ZU4Oxeh4nTouR6RMdQTdf+0WGV9R4wAKQkDRbUN6l9H7yIqPVRZfERkPVPh7Yw3clKaElvbn3cLeIcpz4cDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOoZHcY4; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOoZHcY4"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65f71ed7c6cso1054419a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 08:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771951768; x=1772556568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/4jdgDH4nJh+ZV/35H0g53wBVJcWnan+PpgsjjzZOo=;
        b=VOoZHcY4YG+bQ1YOSNNEChFr3lc5xqdsvtWfohMdMKISUmKMTi1pxMgVSPzUoE/nTD
         Q9rZe/qaN0qKtVxNUrLEsyPsBhvkUqPTnlItluL9YiZszT4+N4eBJQ8lxcjj0iWtIS60
         kom+uqZe7+P6UEkpFIeP/avgH50uMxwnOZBKktObQDHGtq11zUstPu9gseV7PdVG2A+g
         1bc5BYYFtqvd3Kaw/5Oy28z0Cs6J0GspGfbYwljFY4CZOCgUUkPE0Nea5/2LxUHQpRoT
         yJFaG3iiThWTiWGc/10oMWbiP+apteNkUa56HDonJzoUKLVQ/VxB7vnXL9yf+xASr34O
         Z+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771951768; x=1772556568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X/4jdgDH4nJh+ZV/35H0g53wBVJcWnan+PpgsjjzZOo=;
        b=aLydAPjqZuWISclVgAceEBxvCvxe6qJ/Ma9wrQBWKk/fl++Zv3b8ozjk1KSuwDkxoZ
         DAIJADcL8OAM8awOB5BQl2JF5r8N9lygXusP6K4xKrcYmsMxECTmdUawdi80oL1hphB8
         VvfbMulqkwjxla+owWcPuhIP7miRaKLPZqH6LVRpIFlaK6kn8b7SP8x9f6Hz3DHH5046
         n2035uVs/HwHSW/24yeMUQ2/4oZLJ5mv7HjAEaUPFk0Ci1R5ojU4VOtaVwvTFN8gXuk+
         Z5ljEJ7tdE+eCOl5nXOqeMZ0UBk6yGu5r9NIw1djdcNzlqNXs6bqNapNbP91QRQe5+pE
         DOtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7hlKqElRA3J6SLGI6TrwyvbSuYxDft2dAQ+HzLzYMrsfgRysNrk1X+8JTi+H/kIIq9LdhMQUu7PPNGC4Ljw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGfPWPMGX/IU0Oi5H1XV8czC1nNoJKEVAXbsXN3/9QVaAs4y2p
	NihFTD8pMIl7LD7GFdGMZAM4qwATzvyzwwtfKRarc4/iNPTIvgVmbU3i
X-Gm-Gg: AZuq6aL+8ETk15IjLnlewIeZJhg+Q6KeqMoJSIeEk34x7cfRMuZMgcYmTMvwiGYX1BO
	c4986Ec1q+2fyFX7MAvCucK274I/VhDelskK/yuR3yIZpcTnUjlpJ5CPK4G/Z25g8nunVAJOwKP
	h/yqS+Lmve+c1kX321qQMyFebnGbGSYucClVKbzMyjBWgyV3JBoGjdEdYlv1QkeS99+78yI+X/B
	nhvTM644z+Z79zpr0VbIvqMG01n/GW7Uji42ycJJSzXSMJrl2Z6ZeCM9N4OnK53fL/0CD3Bc9L/
	8sNaeCXDG/lxgZ2acsiBC7abBGVZrS34Cc+RxphmiZ4p8BRudoGx8c9rmjOx+YDFqFtRS+2TXww
	I1AW+D3qcG6xnUe5/mujbuAJpXbcrzuisSo7u27wIRwonS7z++ROMYbBW0SEhiXGIquQ+HigVJR
	/kRBCEaODqJpfmcmZILtc82kSvaxOv69BopFURGyXQ60jIbWKrYKvT+TxmeGqXYFENn2qCCvlD9
	WJS9ZJOESccEmsij0SUAxTb3ktl5x8oYWbkJmYYdP7a/7hOqWFG5A9P+qoK5uSQ9EVh
X-Received: by 2002:a17:907:9723:b0:b8f:b222:34d with SMTP id a640c23a62f3a-b908191f2b4mr918950466b.5.1771951767709;
        Tue, 24 Feb 2026 08:49:27 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (30.49.91.34.bc.googleusercontent.com. [34.91.49.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9a077asm3771023a12.4.2026.02.24.08.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:49:27 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH net-next v3 0/2] net: phy: add Rust reference driver for ET1011C
Date: Tue, 24 Feb 2026 16:49:24 +0000
Message-ID: <20260224164926.1760-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224043211.1747-1-iprintercanon@gmail.com>
References: <20260224043211.1747-1-iprintercanon@gmail.com>
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

Patch 2 adds the Rust ET1011C driver itself, implementing soft_reset
and read_status callbacks.

Changes since v2:
  - Replaced custom config_aneg with soft_reset callback using
    genphy_soft_reset(), which properly polls the self-clearing
    BMCR_RESET bit and handles autoneg/forced mode (Andrew Lunn)
  - Removed all BMCR constant definitions (no longer needed)
  - Dropped genphy_config_aneg() abstraction patch (no longer used)

Changes since v1:
  - Added speed() getter to properly detect speed changes (Andrew Lunn)
  - read_status now only reconfigures registers when speed changes,
    matching the C driver behavior (Andrew Lunn)

Artem Lytkin (2):
  rust: net: phy: add speed() getter to Device
  net: phy: add Rust reference driver for ET1011C

 drivers/net/phy/Kconfig         |  9 +++++
 drivers/net/phy/Makefile        |  6 ++-
 drivers/net/phy/et1011c_rust.rs | 69 +++++++++++++++++++++++++++++++++
 rust/kernel/net/phy.rs          |  8 ++++
 4 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/phy/et1011c_rust.rs

-- 
2.43.0

