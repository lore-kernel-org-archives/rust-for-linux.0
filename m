Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C0C2951B3
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 04:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907536; cv=none; b=hWW+eBZyPP39EobtnaIxu2Hf5+030ciXCmXUMWp9w89DQoCnvK7Kd9ilkUCa9gCtNfW34/fE+1poVV/8sR5G3beMiIzRf0PqyVDGzClsuCSjfFjnmksuV08uw6Y0JR52uNmoUqhIfUClpw4hfoFycv3Y9GII+xPPFb3krYc+8xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907536; c=relaxed/simple;
	bh=UEnQcp4MGlJixya53SMjZLpT9RLhpMLIX7hTK536NMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VRr8WJkFYqdMZNGqrXmtemp3U1YFG4cOCxGTHFHsDCEVl8RJG5+jMHPHMcHxv0RJxZfK5njvWjXtFqPbhBS45SZ3nQlCZxrBWwDhbicjVaNIPSnAaVNgsxstvAdSzR3hPbhV9vIfNYKKmWUS94bXNHYQc4aJuJZiZpsi54r0M6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZXfwg/4; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZXfwg/4"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65a36583ef9so854517a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 20:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771907534; x=1772512334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2TVn9WTr30egH9VBmZciSNVmo3+g7N5E2PAqbC/nLw=;
        b=LZXfwg/4tZ6HhrT9jl4EPeGkI3uDTT+znbzZuqrGm3vqHETOCp7DPPE4I3BJrlY4Ss
         gIM0R+yR0HQZ0LzBT26e1/i7HupkrLuAq+TathWp8I10RzEs8qkmUtzdkXGkQ5+avt/H
         G6Dyz1UOpDSv+woBt1K9ajTq7ncVzzwaXL8a7jty3Ww3nzipSa+BNaql3n9Dgx9JNZ6m
         aTMaK6pRB0Kpwnmwb6Tkc9K11m4ai/BG3huTEC/C0FYS03x1NonMLYM5d33e8darWG8M
         Wi39KgQVgU4MeZlc2Thf+hwyBZtPwjxRmc4RRhTj/JKoQBLccVXVliowTnGN3CHccqQ9
         lTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907534; x=1772512334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q2TVn9WTr30egH9VBmZciSNVmo3+g7N5E2PAqbC/nLw=;
        b=VKx3BaL8FeZh8BkktMn4/mnCd/LXM++/bZAHgk7Zy77EZMdYYEhXfiYjHmDoOp8S/q
         MBlBwxI8ot349Epbmfr2od15cVaUVhaCMk6BgBoSBHJ6DC2P4Rk9VylB/TJNrGzEUJyH
         YJktaSMuItGcHEMu6dbBgTwTjK/zSHswziTtpm45TqHjM4ih70M6Ad+kwU7zid8i0jtM
         IOOfeCralK1ia37XIl4sHZq8nuw2gnPZ7QUti3RFh6KEtGFmODH8K7f1H5UB4vGf7FqF
         HhOuive3j3COJI5AUIg914Rp7OpgbJIAPVStKnvhBLNdVx1neiVrDaPm9BB7l80AKWrL
         lkxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6j2g1JvWcmKIQlPH7Pg7RST92VzMe6Ac/dT4P4ylty0C06m3SymfRanEV7h+0C8b7cHVcYAlXybMrsbmBZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA+j3g/LIai06KXTb+3UjM6tAs8vr18X/R3hBg7FIMNrPLMpnN
	uHnA5g38sFVIRTOPRO/V2G0IR2jtOmq7vD3uLclMUOg/YOmX1lwCC25X
X-Gm-Gg: AZuq6aJPKohLlEw/qKXhWD4uXGSYV27f2oyg+ygvmzvF3ANtMox4fBhX0SEZltxJFS/
	nKhn1YfIih9FOH+PoEpxRsY6w4b7gZHMyKIjxE9seLPFEEpRhrtflATKLho8+POQcmeSa+Zxorh
	Hbcd00jQzlNjwNXOJ0k7vuNWwLe/kiqpw1oiKLIOmTv9GOpb8Jrjjxwu1qGbSSLW+Um+MmH5QJ+
	Qvx+IgZuoa/3xaP9BeGIXryCfT99NYJSPTtkmQf4swuF4dFNvCBeN3aE5Mv8GN6tBrR0eD7jIsy
	H0Qw3jMMMFSYB10S5MzSs3rYO+K++Kt4OWIs6sP0/E3nw0uXa5ewa5JsH34r0vO6K4eAkc4GzoD
	MKONKt3divqCxnYj7nOanc7AfJ5MwOrTYiteUWo/uuNrBc7dEFYeR5WQPVee9LSA9fddWtirFxc
	5lhx8aZ54QYJWKegNgAvb6Fa1Kme1RpX2r57WHiQtNmdGjmH5QjraPI4WuvdZK6cYg1ixTtUrd+
	Q9UONUHwMyoPVudqtft+tM76EgS7UuVLmMEdOVODmidO8ej6MJD3tlJotGIHvsLoK/Oaw0Lxw==
X-Received: by 2002:a17:907:6e8c:b0:b87:19ae:eb36 with SMTP id a640c23a62f3a-b90541616bdmr926260366b.7.1771907533547;
        Mon, 23 Feb 2026 20:32:13 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (206.242.32.34.bc.googleusercontent.com. [34.32.242.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9088c8fc30sm371284466b.63.2026.02.23.20.32.12
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
Subject: [PATCH net-next v2 1/3] rust: net: phy: add speed() getter to Device
Date: Tue, 24 Feb 2026 04:32:09 +0000
Message-ID: <20260224043211.1747-2-iprintercanon@gmail.com>
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

Add a speed() method to phy::Device as a getter counterpart to the
existing set_speed(). This is needed by PHY drivers that need to
detect speed changes, such as drivers that must reconfigure hardware
registers when the link speed changes.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 rust/kernel/net/phy.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 3ca99db5cccf..b86939b163e3 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -158,6 +158,14 @@ pub fn is_autoneg_completed(&self) -> bool {
         bit_field.get(15, 1) == AUTONEG_COMPLETED
     }
 
+    /// Gets the negotiated speed of the PHY.
+    pub fn speed(&self) -> i32 {
+        let phydev = self.0.get();
+        // SAFETY: The struct invariant ensures that we may access
+        // this field without additional synchronization.
+        unsafe { (*phydev).speed }
+    }
+
     /// Sets the speed of the PHY.
     pub fn set_speed(&mut self, speed: u32) {
         let phydev = self.0.get();
-- 
2.43.0

