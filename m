Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DC1299A8A
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 04:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907537; cv=none; b=eW7bc404Noa7YFWEu+VqKb/HivMl5GP27BuEOdyauCNyJ4GNMFHce3iWXNDm/+xHFn3OtoObX4yxcgCvPgjlzcQOCLEhFKZ1M0Yg1Jo+pqPXoO1YabDf0MVHuKdpVD1mm6sIKV7q+pa0SDW0b9fr+SYMIhaJ7FRAInU5n8hFIFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907537; c=relaxed/simple;
	bh=b1xLgounYgAgwix7HTIz89qnAwlJn9qu3/e7SYKIiwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W2BwKredB4N4SDPHDIhb/FwPu94/ayi3sjWAuErI0DOtRW3iX0Gutl+okApxAJEkupnB6hDgS9UhNbVTCywi/M1QsZKjpA9B4YNRxptoEOpK/FTNhQUwZcrClGoSLES8wEUb/572qPUs6wHKyy9/sLIPGBuJiBpTzKCjzb+dHpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdGPyQGd; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdGPyQGd"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9080841899so329626266b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 20:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771907534; x=1772512334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siyGLrMfYzfWpKFoliNweeMXGBRAFWTpZWYm7LAc1oE=;
        b=TdGPyQGdK3oSwAxxSiYzeVbtxiTigeB7wXXSHcKB/tzEtFkT33s8Hz3Cvupio/4+fr
         klYvKDU21KGDIAdLOCNqIxt4rHBw/yYG9r7OiXJObMaVQlUf2QKynR0yaHlGaAoXGrkV
         yW0Kz3GbEWjdrkhM2kE3gBnJEYsmR1GBNi8I1P1DCasNmF+lG7qWkJEMu5r4wdwfxY6l
         g+hsLmT3nyiEtJ9U/agFw/e/6Bv1NTOArq3MEKjZ2n5JFC6v0QrCgBRHNYnpnmZubgS7
         p8+xgrVFMyUxMcQ9jF99lnJM8BN90nQeBTbBCtpBtiAJpV9iOGt6gcAcrZgisRW0gH4u
         pKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907534; x=1772512334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=siyGLrMfYzfWpKFoliNweeMXGBRAFWTpZWYm7LAc1oE=;
        b=qD8AQumpywZTRQqATvUJtBxZ10ceMKq3Q8m2k01VP81b/uU8ETJ2B0UHQeG3S0fFjc
         F3+ECC3twzleN0D584DkCZV5cGem0UFulqYZ8OumTqCRayWCJ0APTY9V61faubY7imxM
         lNctK7vxWGCR/6RgY+Ws3GtPJTgnwrCwetXGE0U1rinGzvScDnteqWSgAizsILSVmn+1
         zoOb/kmX7K1QxUq1s0N0iPO9D0+5wORF1KLJHs+VixF7dasBcr1COcnCiMM+W2rsWdI+
         tS37a7Alo+33bZGLjb5DFnzgRQh15aJeNcOO57VvfOLgpPahsQHfjhaiAv7FuVKs6g7s
         YXcw==
X-Forwarded-Encrypted: i=1; AJvYcCV/sjwcFHBRFJmpea6gAvhord4wZI3nEug20aabWsuSb6KYSW0YaUrQXhqW8Pek9xtDKjoZC+Oeyq2h+1XtqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ebveKLd+SRMQVhNb2LLBgI6Rm9qfCZOAiYSdOTneM5tN1ekT
	Ke3vTyeyBiZJBS4ll0HTSME3kQgYRpmfvb4HSgxd4vmCkVZVnovhqjQ/
X-Gm-Gg: AZuq6aLZNuraRkRVsXC31eZ4h8d/t+Zu7EGcBPW7Ug6wJkpeZz4ZUIalHQYSGJPxEif
	LFdcUBhke/N7vHRgwAik3N9WJx/pUnvd59mUaQEPiCvewN/03WLguG/FQbw0kSz5gCaG399qqOm
	QFLKgCYEWBbYH9/l5XXQaaVdqk3oHpsa2bSj+HwIrNdcSGvQLCjjcKX/CIg5vx4etin5mGNj+Kl
	S1z2Z6TKBVTAvuV4xwNFFP3fb8i/aRYkuqnaAqP1YQfZ6niB8zRASO9faUfjNC01JRvRze4odov
	mMhLNjRCDF0w/H2i5sxR07sr925NjpjkIiki/XRWQ6UgIWzjDcSHViI1GPgcXwjhxLkp1bNoBAo
	fkLafAqUUPcou0Lvm55A+/M08zmqt3OY4ZR39x9E1sPPoy8FCoJbXbxYU9bFpDhGOAwfFAVwGzS
	XQe04z4y4VqjfNTGX9F5MguQryN2F0wyNVJUqKOMXeUhXiaicytlhEPabb6VnoNtxpYxV15/yD4
	LVXGOS86Da8T6bikiy5n7a0lMfb2MCpzxPkDcNAhcm0CfTLk2571m+ryhFrHaeb6DCjMuqZ/A==
X-Received: by 2002:a17:906:9f85:b0:b8e:d4ed:5eeb with SMTP id a640c23a62f3a-b9081a45252mr723264366b.26.1771907534454;
        Mon, 23 Feb 2026 20:32:14 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (206.242.32.34.bc.googleusercontent.com. [34.32.242.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9088c8fc30sm371284466b.63.2026.02.23.20.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:32:13 -0800 (PST)
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
Subject: [PATCH net-next v2 2/3] rust: net: phy: expose genphy_config_aneg()
Date: Tue, 24 Feb 2026 04:32:10 +0000
Message-ID: <20260224043211.1747-3-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224043211.1747-1-iprintercanon@gmail.com>
References: <20260223220504.2102-1-iprintercanon@gmail.com>
 <20260224043211.1747-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add genphy_config_aneg() method to phy::Device, wrapping the C
function __genphy_config_aneg(). This is needed by PHY drivers that
perform custom BMCR configuration before calling the generic
auto-negotiation setup.

The wrapper calls __genphy_config_aneg(phydev, false) directly since
genphy_config_aneg() is a static inline function not visible to
bindgen.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 rust/kernel/net/phy.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index b86939b163e3..01597f2616fd 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -284,6 +284,15 @@ pub fn genphy_read_abilities(&mut self) -> Result {
         // So it's just an FFI call.
         to_result(unsafe { bindings::genphy_read_abilities(phydev) })
     }
+
+    /// Configures the advertisement and resets auto-negotiation
+    /// if auto-negotiation is enabled.
+    pub fn genphy_config_aneg(&mut self) -> Result {
+        let phydev = self.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
+        // So it's just an FFI call.
+        to_result(unsafe { bindings::__genphy_config_aneg(phydev, false) })
+    }
 }
 
 impl AsRef<kernel::device::Device> for Device {
-- 
2.43.0

