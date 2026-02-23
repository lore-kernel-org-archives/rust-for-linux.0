Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA7A37A49D
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 22:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884308; cv=none; b=uoDn44ekkQLJofx5GDecjdVnKiowDKQtE9qN7UO9Mq3GUxrXjQ7Orp7UvBTYlp9r0d2X5V/nh0s0WXT9nL9jJl7OHEnPltDi+W/Gw5y2dP6hgTEcopy63HINgyrbFumopMmQ0uKnBM7Q5KLcJCJrkRN07jmvr7lNgyd8gWjiPYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884308; c=relaxed/simple;
	bh=Y+8lSDEssiHEtct3vm6mBuQ4c6bTHVM2kVdeyUoO3ho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O5BlpkPfTE3WpR1tzyL2VBEog0aA/mGwcixVEobf6o0zLOkgdxy5juSC4nPbamxL9HufoVnTTzSTzOYWtmIGvXgbhWgaCs6kdAOYoY3K5kf4Bdx6AOP3oYcOXDhMaEfzC33PL9367ICBfyMAVdZzZ/+4GxQtGC7nni1eQcnIauE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFJ3ZoIR; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFJ3ZoIR"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8fbe5719ceso803264666b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 14:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771884305; x=1772489105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHK+3jyoHNJV2FbjmJS+D8CEWo+rq8MXAjvGR0EeBTw=;
        b=UFJ3ZoIRyv4en2sqprK02oU+yCwWgu6+bDh6CBbhCUhbJP7iLREE+/y//yx1hPguxo
         QNWGv9DRzLapiEAbvRT0ep7E6cBalF3FfgZriUA8o3+oaI2tsnygNBOnDXRRX7shYDvV
         3mhNsV+Ssb+jst/urHnbkEj3W/LbD3WIkTbahym1cP0JOLHxz9cfGkhJtca2Vp3C6Rcb
         pj6rZMF0tQNMujoGmLKfA8euKjXXcbYbLGwbgzxV6lifySYYWZOjrVupoj1nN7hrag5/
         eZwmIPxyKSNuFkHfVrDoGJEuru3guHV9jLCiBsocrRwkvBvFlJEfkrvR+XhgH9lMMweF
         UU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771884305; x=1772489105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHK+3jyoHNJV2FbjmJS+D8CEWo+rq8MXAjvGR0EeBTw=;
        b=CE2UpJS0OeD/EBtjIiTxv20p2bnqQ53R0w5ouol1OWRtZvL1Xz9LONG0P4SHho5hhc
         eJNkYgeItiTUmTqOug2W3tmocX8cXdB+fHfuOXD+BxQT9I2VpglcJIUswX+GTMAYHI0S
         foElVYArT0dF8EX3sPY3kj+dGmLZBQPeTZH2orbKlFoxce8l/OoN4YxibbQuir047cuN
         Tlce+vlAPkQwYwVWpyBArxG71b+8n+6hZUtHHg8hrRgQE91w0mMxj2BRcMDXWLcZsY7X
         7VWlVdRvwJ7TS0m1Y7bO2HPwFUz/LwzS/om6F0RlSEm4iucBSh7fxKN+ENPdwa1p7CRR
         NvHw==
X-Forwarded-Encrypted: i=1; AJvYcCXLvvJvoK6yTUMgEft4COxZhM8zVS0Q0hm2D/Sxtn3qBabtGMELP1B9sKWrzt43GjLuvmUTJEiNr4bBnywoGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2jOPfmM32wwNBmUg9FymkO4/DuzX41IaFU5CBdxm1g71XtfOJ
	jc75GEfwX2dKbVNNDPaBMaW8YEOcvoVnYK27FGlwhAIr1pRlrEC/EU4X
X-Gm-Gg: AZuq6aJ7Rdh071eHzhNuDLY5oBSdn9cuRCLOXh+W5mD7eFHU0UaXWV/vzvcUonxo995
	XTkb6BZ5rHSUG5LLWCkcl6cXZGU1a/86vcWIKMpcgWHPBJGzdpLHFMdZy0YM90PhjcWiWm8ejqa
	P0zTAAj8XQJNzTJWcL5Tl89JPv2b4Y2Lsa1NZvUccPloE1MdrbRhk4FYWqRv9xN3EX9f18sH4rA
	3qRVJ56wmukErTLDP1+lhD5KVss9mYxALmOUZgPxUhxfoIrTQ8U3og6J0jR7FXnvPFgPYbgTJBR
	Tmz44cBXbHrT3XeRY/71DOyQ0ylHNIsyzJynaUmK48Kjhc80lNSF6d5NuwnkQM6WLKHuYi6iLYD
	FMUpOyQQ9jRB1D6XlBpaJCjaW+jVz4k1qPA4GUeG8dwYH6BPV88bSZ0wdbmAuhy9w3nSOf6Vcne
	/bObzlK68MaA5TfU7v3yGUwVG33c4zeRXnw3QPT300FVGTVvqZK9saQKi5E9ICWBsIRY53KWXRH
	ZJNCm3jvevB5cQrqNNTyIpsJz1nxopAIan3XuDFwKh9gUn50F1B6wL4dFi1gBlxNKa6u40=
X-Received: by 2002:a17:906:66d4:b0:b8e:fb1d:9eba with SMTP id a640c23a62f3a-b9081c1c4c5mr454821166b.54.1771884304829;
        Mon, 23 Feb 2026 14:05:04 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (230.86.12.34.bc.googleusercontent.com. [34.12.86.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f191b9sm359394666b.67.2026.02.23.14.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:05:04 -0800 (PST)
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
Subject: [PATCH net-next 0/2] net: phy: add Rust reference driver for ET1011C
Date: Mon, 23 Feb 2026 22:04:59 +0000
Message-ID: <20260223220504.2102-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Patch 1 exposes genphy_config_aneg() in the Rust PHY abstraction,
which is needed by PHY drivers that perform custom BMCR configuration
before calling the generic auto-negotiation setup.

Patch 2 adds the Rust ET1011C driver itself, implementing config_aneg
and read_status callbacks. It is a feature-equivalent port of the C
driver at drivers/net/phy/et1011c.c.

Artem Lytkin (2):
  rust: net: phy: expose genphy_config_aneg()
  net: phy: add Rust reference driver for ET1011C

 drivers/net/phy/Kconfig         |  9 +++++
 drivers/net/phy/Makefile        |  6 ++-
 drivers/net/phy/et1011c_rust.rs | 70 +++++++++++++++++++++++++++++++++
 rust/kernel/net/phy.rs          |  9 +++++
 4 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/phy/et1011c_rust.rs

-- 
2.43.0

