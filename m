Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202620;
	b=BeejePnvjx3RIc4sq0qFZ1qedNq0NSOM4TGvZAAKRSl9qvfWAPcuHG0Z5iAUHiJbxg6B
	 sm57WOdJN1pYat+elXA7hFwHiR6AzIXO4VMNGFsvCSf0Kj2b6epyOQsivgeZn3sHnEJf9
	 AJ6muBHPjnolvwmeZbAdKUHHiWTxWC7D8KKEQcgdftBeNmEd5JwIh20sdBwJlODr2DT4z
	 gnHnD3hIW5IQMA8kjoKJhpQqYjP01SDq1AvMez80zq7/UvfKiaWfm5QaW3tESBPrrMhoi
	 7Uvv4gSaEoaLYvMBTjmio/ChrUB6lgKR5O/UjEnPOEprzByrMXpZSirOsgrhJDxOamg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wj4LX9xOsHpuGRygOr/nDK8i03h77TPrsXBsHHo2CzE=;
	b=hbPvI1rkgSO7qljj6Fvowpfo8mWwwKTM2M6Xnu/oqyBVZ4D2Psg+YTDVzU35cs8MeaRw
	 CqzB0iZpivKRKcBzSGWJVEtE7AvWkkF6e9pU4xKMvJhZc6xDh0RzmlmmqgZ4lSPZW5o4G
	 z9BpwmLqaF0njNpNZSLEu5hcJwxWTMoabNPwx4osioxO82Qo8ARjLw1tvpc/1ySk1ptk7
	 JE222H2XeQSi43e88uwuF87TlycPM1+yTTQqomnCJEo8v/MW+h3Np2XxQOOQHACSECLle
	 8J+DM+KWKoN6ihEOne6yf/avFeXpPporxGd+fjUh8u/DPlpXdCFBqHvx9/dsTAIEUtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L3gP8nyH;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FEE606A323
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 15:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06FEE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L3gP8nyH
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso1229005e87.2
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202618; x=1793807418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wj4LX9xOsHpuGRygOr/nDK8i03h77TPrsXBsHHo2CzE=;
        b=L3gP8nyHEpt7c0+mIxQ4RE0XFyRCO1UWhX6RArQV5e67OLxg471Fdc/XET1Yu1ILQT
         Q6iKZ1OgUaRmQtlh4i2mKr7l/f2l602LAkSGYOvjK9vDRVLOmbqZLS3xOij4o2srjPFq
         PU/wglL8p4fQxbbWhbxRERoDprueyz0T4yBdcAgG7VUDSie4QeGTlyqISmaB3bUix0eJ
         4yE7ohInOuyfj8YnxkW4OaOd7FaZiI/tl/oLRnw2uLfNbrHYfSsEaphe5v+017JWijzi
         TNtEUKG2nCH39y44cB5F5TZ/M2K8TvBGllYGJVjWSUxD9D8GsPoDOUMAVX8JYgpKiP9g
         V7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202618; x=1793807418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wj4LX9xOsHpuGRygOr/nDK8i03h77TPrsXBsHHo2CzE=;
        b=TsFEGYcdLkBQG6kLdhQlVrvX3YB6z2tvFFYDjqBSPTCdpUmFchugFNjB09pGu0+9ol
         bcVuedZ+88s2TeZVOr5HnFeoklb2jAJczHSsg30cGm5Q9DDINXjevvopEUbVmvLwvXtD
         LIA5bRGcjDbYQg6LbhOYmrrUmTU9qdk7b8SZGACPyq65KrdQvGFGWNBpIQww9yzuYtta
         n4OJ+0t60cjSV+x1tOOfOYmc/AFr1WLHeqw8OrDbK+OsWdAGutxEuE4RXR3QkAItpyxk
         RD05OsPuC+xjv0qhGLKCEZPC6+YIGaNwRP3SE2FMttyhgyU0acFl30tEo4HKVlfSx6om
         a36g==
X-Forwarded-Encrypted: i=1; AKwUvByHW6Zh92xvDxcF8oa5euvivxBgpAkEaV9XtmgOEehjfVEVWIMWjQZ7dPjegJaAnefYiscv/TW9B3R+wyQIxg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvC0Wo/F/DXwZ/ul5QqGTDDdFCRA2zRlzXCEQgAdJILETRjuRq
	YGD6XHoFxNv06mmKyJFW4/NJwXJh+uXffcYpV44MG4WKq62RZOk8x6QI
X-Gm-Gg: AYBFou3o4E1gtk9ocNfTBB6BSQniAayXGrQADRkMna80Pi1j6Vu0VsK/z4Xaqcv0zb/
	JXOianWPnT776H1tqUORR+evhSm/UCevys2dZAK29tpHbTHfngpfhwkILcKf6ssslWviI7HzTWr
	QOKHDNzP64MsRjzURYzE9KgTCzjdsdJyaHLRBuR/EGJYwre1xdy2DGOMU4622+ETNFN9N2ujKbq
	VnjFDha/fdSFQcjEuZ9c2sbvT7Y97L2ph0BSOT5tCYfcsWtrupGAuF9vOBs+8TRNJq/HAYHt6VE
	DmmQsIOLmPS7fitVLSp8tRiCKOkbhsO5abZUsPlWY4+n3DcQY3OujoPnDNzZ5XzHhSxIqUSewk9
	lYV6VP0e1vl3sQMasRbJFWQjQKlNHcnoQhU+QGmkbdqHyUyLa9WmZMg9hSZsHa3rBP6RQO3Q8lF
	gEyss551RfmsNm4l10LvUXxMaxdGTZCoRnTkPaQ+tKhvI3RZXbg4msNuiGmicW5ewzXqw/cffFQ
	ELmufb60uL7kRhYI15GK8FEIXfO2Uyq+4U42cgBLgFduoc8trZZDbTLYe4OsAeIrhvJ6mW/0Grz
	QMQ1Ig0GXmQTtbwbLc6UpaEAglUT2sDRwcmF5A==
X-Received: by 2002:a05:6512:a83:b0:5bf:b93d:a85b with SMTP id 2adb3069b0e04-5bfcad893eamr1077228e87.25.1793202618007;
        Wed, 28 Oct 2026 08:50:18 -0700 (PDT)
Received: from archlinux ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5c6ffasm694002e87.80.2026.10.28.08.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:50:17 -0700 (PDT)
From: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
Subject: [PATCH] rust: macros: document emit_base in ModInfoBuilder
Date: Wed, 28 Oct 2026 17:50:05 +0200
Message-ID: <20261028155005.174417-1-mbkchelofficialdev@gmail.com>
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

Add documentation for the emit_base method within the ModInfoBuilder
struct. Explain its role in formatting metadata strings, handling the
differentiation between built-in and loadable modules, and managing
linker sections and conditional compilation.

Signed-off-by: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
---
 rust/macros/module.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 0a7b9e24c..6f361013f 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -49,6 +49,16 @@ fn new(module: &'a str) -> Self {
         }
     }
 
+    /// Emits a single metadata entry into the module information table.
+    ///
+    /// This method formats a `field=content\0` byte string and places it into the
+    /// `.modinfo` linker section. For built-in modules (`builtin == true`), the string
+    /// is prefixed with the module name (`module.field=content\0`) to avoid naming
+    /// collisions in the final monolithic kernel binary.
+    ///
+    /// It automatically generates a unique static identifier using an internal counter
+    /// and applies appropriate conditional compilation attributes (`#[cfg(MODULE)]` or
+    /// `#[cfg(not(MODULE))]`) based on the target type.
     fn emit_base(&mut self, field: &str, content: &str, builtin: bool, param: bool) {
         let string = if builtin {
             // Built-in modules prefix their modinfo strings by `module.`.
-- 
2.56.0

