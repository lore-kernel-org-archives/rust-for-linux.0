Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCF324468C
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 02:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768443182; cv=none; b=jWTOiScO28k1TMj23uy1+CCce7rR8dHLXhpfNBcr7bYlKG+VXlMsIV/v/9ViOWEDSdukbJd8hJ9FUGTI2Em9ZbzRmifWCkin9qiQuYSvWTonHLpA4w3J/sDsORRLiOV8bGUGkmPjcjBQsnCBDsJ4K+6OatxUPmG6lcuB68nz+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768443182; c=relaxed/simple;
	bh=l35kjeg1dLmz+OCtLi91zPuhraFRpXqLz6+ro+HtdaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uf8+k6ATQ1kZTo2V0gYs6qVHFLwX08/nTrXxrzuBCQ3+/KEaufStSEE09OAyc+AIcCyaX1+sUracU7ih7EEg3KWV/mEZv2XswZpRa9hQ3KdaFGHCmfiyI/f/dB8NWvfKdcUiv/7Z0goqLoAYsmMoVDn34bLc7nyqCV5OVGDeHug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dC++dS/L; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dC++dS/L"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bc4b952cc9dso163681a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 18:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768443181; x=1769047981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMdkoxAbkVLtbOlTLAhTPdsK1Vq10Gsz7D6bnSK9k5E=;
        b=dC++dS/LSXCkvCndL8qX+yCiZmSakgux1cnvMmVQTrAv0Ch28KZl+b5gEv6LrhJgT7
         3c3COZRUsbpiM9cPognMrhsDA2PaO1EUGI8lYro8bqNAHbO9xbjtHeccb92vXnjBLMqV
         dcnSAlyalbcauRtePvjf4wuxR3j5yEaOVJPYHbN9CUjXFjSSJhUxXwNn2tGyeFUPsEnR
         rNaBaOo8t7Ye6F3VRIPZnbZ0nfHt7bzPfc5ZGpVHk9HtVQ+YkDSvOujR2xtRC0JuFnX2
         LyUJto2PmqwwSiBguieOWWUpvomBMCfYkKGIU4EkBkbfYEFdrz7NnSBesloZ2EcpY6Id
         lDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768443181; x=1769047981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMdkoxAbkVLtbOlTLAhTPdsK1Vq10Gsz7D6bnSK9k5E=;
        b=a1ChugxWsAI/GCBlPiuoazFV7jo5zhsBAC6nsNlu2d2g6L6q4uwiv9nkxav5NOR/Ca
         BeuQTzTh+P7HJ2L4g7GgXL+sEdzeKtsuF9Py01FnQYBYbyRhOZSN6OStCNp+Ghm8IT7I
         466Is8Ckej3BDgsMOGckjRCKiiI/VGD0BMEDquWQpHj5AaMPzOZPOQLTsfVkbWNsUzYT
         lQs5RgQpVX6Xf309wFG0it6XZhlkkzXKWA2jXCJUJIYjQ3u1eUjrTVwKUdZCuSIU4nuG
         0ldUTGavte1Ldgygndu/ceQ0jk5GtyCB+TGIHfAH52irXUkygH3s4FMPn3ASjHI+iWPO
         FJvg==
X-Forwarded-Encrypted: i=1; AJvYcCVyAgQZ+4l7e9By6aq9xBv+yBBH6ZKgyGtTXUUI3Ub7dVEjGXzMpegiZyj/xz15ZvIIwKcTMx+PyRtaBwbYhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze26YAMEOGPLuwE7NgFX5jlRIhzhJV+ornU7958sMSl521nAUy
	8u8T9QhwXSOI1GUOdXrfSJq7v6XvYVmDPL18Zt4Q/jhq7mi8APoAdqzw
X-Gm-Gg: AY/fxX7d1Ut1vS4xkqxdn7Jtkjl7p6QxrzFuNEmPL5VIHgQUztD1/Gn0pGraFCskk3r
	4RxGWjMDvDAdXdYmQBMc+TcE+UpmXW/b9P9zXFi9/iNDyrsq+QFpeGL/y25+uMvZxpre+xayq7q
	W6iPqwvQls/c2Vc7cc9Kz6fsmLlL0GdS/wGjjjUc1AVLW4PgO5qVxbKvGKxFIXTnQchXbNYwpBj
	q1wiaX5611+2hkRnzc2oDV3j7ML22n21Ua+ztT56SajSzTJiIID40MySF3QcCge76E2pSoBxer6
	LzWDZ1jF05obAiAgdpT0mh+zsaM1LajqQ0kRxMAy1dBtyaEjqSkxIhrNJOr6QGrnR3dGw9xAVdA
	Zv4eKVs4J0A6OI4biNzejAlXQq7SYFJBymh6JxNcfP7OC0aDOxwV0wixisvQCxXuR/oXBfDKuXa
	kfJz7fNOKpdRgbAfO0EZnJ93oqzRyCvlrzvgfiRhgiXfRspB6uBb4XYvsU2NG+6g==
X-Received: by 2002:a05:6a20:7352:b0:35d:1bcd:6882 with SMTP id adf61e73a8af0-38bed0dd10cmr4520795637.23.1768443180680;
        Wed, 14 Jan 2026 18:13:00 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35106940894sm1868863a91.2.2026.01.14.18.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 18:13:00 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 0/2] rust: sync: atomic flag helpers
Date: Thu, 15 Jan 2026 11:12:28 +0900
Message-ID: <20260115021230.3297420-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This series improves the Rust atomic-boolean support.

The first patch adds a Flag enum (Clear/Set) and implements AtomicType
for it, so Atomic<Flag> can be used when RMW operations (xchg/cmpxchg)
are needed and byte-sized RMWs may be inefficient.

The second patch adds AtomicFlag as a thin wrapper around Atomic<Flag>
to provide a simple bool-based load/store/xchg API.

v4:
- Make Flag backing type architecture-dependent
- Make AtomicFlag::new inline
- Add Flag::new and modify AtomicFlag::new use it
v3: https://lore.kernel.org/rust-for-linux/20260111050558.3147975-1-fujita.tomonori@gmail.com/
- Add AtomicFlag struct provding a simple bool API
v2: https://lore.kernel.org/rust-for-linux/20260108125005.2945800-1-fujita.tomonori@gmail.com/
- Update the description
- Add bidirectional From conversions between Flag and bool
- Use intra-doc links
- Fix level header for Examples
- Fix a typo
- Add a newline after the `use`s block in examples
v1: https://lore.kernel.org/rust-for-linux/20260101102718.2073674-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (2):
  rust: sync: atomic: Add performance-optimal-integer-backed Flag for
    atomic booleans
  rust: sync: atomic: Add AtomicFlag bool wrapper for easier use

 rust/kernel/sync/atomic.rs | 114 +++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)


base-commit: 7bd94324bf04ca1161d94fc193adf782b0cfc0a9
-- 
2.43.0

