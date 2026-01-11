Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4060A125A0
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 05:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768107983; cv=none; b=Ntyq91n/vLACqvk57BKOrm8JUAew7kW4w0vDSMayWA+fjA7eDhewWpNb/AlgRgRW16rA5I7gqdnbnEUjYPsdRlOhfUDiOgm4temPli30K3XgqEdagZ6OjGpxC5XPErvyY/IEPNBdw6lcftS5Ksjw1xU/G6z8GpaTCrnE9At68wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768107983; c=relaxed/simple;
	bh=Qtu7IRWWSWqabMD6B/42Tdf38f96rukdopsQZX98HZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F12LNY4RybWKSxs3995JoS2uFGJ3CMixdqIxRb/DJc9cEUQFKzojkYLyzhVEKqk/md/6zg+Z4/7OkniUtO9mzVUraxejXrZjwC9kxMsWP9RlRr0ERRkYtk6ITMCRMBYnfk+9PTranugKfD1Tqv6Hbgaeg3UJ80+W0/MLO0Wxa9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8xkm7QT; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8xkm7QT"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34abc7da414so3110128a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 21:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768107981; x=1768712781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=15EZPOLa0+R40qA2XvAZ5qe6R/mB3yfhi0BHixOgLiY=;
        b=H8xkm7QTEquvy1kR4DgilvcXbD4tD2lDuJHY9n3hwJl5ZPM505ZF0BtWn0+D2evnoi
         41h2OO53D5e1YIaoMx0lJjsZnf8334DqLnHwt+jurKOAj6i/IRyoWYZyRq9TNwuB/gRy
         montUjXL1+aFKikQMnY9DzoOmCUd8Jt0DtIHyrtkh2M9phDVgBWtAEBOlecNe/g9Axdq
         I2SgoOsznmFs5+yRRfl+6VIQhalz5LAT8NIIiDPLCodkgJ7bv1MxuEUsJ9ZgiEW1XCig
         AQ2+CStQxl9Zf1IYQWinrk9m0Wd+B1b+F7zAf0u/5N5Zq0Lu2KhT7isfsW4PKUi2a1MM
         qRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768107981; x=1768712781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15EZPOLa0+R40qA2XvAZ5qe6R/mB3yfhi0BHixOgLiY=;
        b=pv6uKfugHflyOTHJhgwlaUyQiqZ6HFfLcRb0RIkOItdsXZt9A+RDsLAb8GvzlniPke
         gjYgb7WKi/3z1hOorBjdVsCb12dIB7A/zRPgefmWkhJQAv7/Izf5msZNB79wbuaW8K1G
         Q1WvaGU+jsLGnbUSP0BaYaVUjNDiCOt/YE8EvyLgukpHGv6dl2r7USm61Ax74c3b1oJ1
         ILZn2bv9ESK4E02iWHA/RXhZYCq9dgW2EQxWF/bX55WpbZaDlH3lo8YlnxYzsVLR7gKh
         1s5FnSP+d1kRJ9vt8DQ5eStewdMxu5lEV6znF3rwI0ASwGKgQUdhNN+mg3TBvoYMNxjC
         4C4A==
X-Forwarded-Encrypted: i=1; AJvYcCVZzT5PzZC3SuCcrO6QbKkAc8Ocj4sxxj5ckPL+bbdY3/5cO1dm11kU9yNeLXD5GbbY8gsgWhgwT9HVpvmBHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNuRogP2vTBCOnIqSz7M9YahfK+i2s3OmPAsovbU2Bs+wuozVg
	kQKr82xksRct7K+6Y+/ZicQfGkKdy2mpVLkE7yrB4s5K5epW7ZBXG3fk
X-Gm-Gg: AY/fxX4lUt7XWDqfcuhxvor0svTR6AjLCTfHFjVLDK3Qp99pr02ZGkOTKgyS33zdRfD
	2VcjQFopC5iNW+f4ENHXsm83gXtQwCkT+AxG1KuymN09NHnS1LzhGQlvvBsejv/LCJML14f1kKU
	K06g0FQoO6PmVaDcDSm/1chM8DLb/WBMCyPaAU6NyVTQsPxL8Hel9KfMyu52Gew155o4YIRHciZ
	dSRWHTjWh5eDdY7lnPIg/rBke92KyWYzDcYBRweI8mJAxl65jgFeQfcM0q2XRKty6kzTG4lnmvg
	ydWzmPhDlnOU2IES376SIpe6nLR2tdyjNPnJ5lgvlYoomGjunIkQcsq1iL1JMTgPHy8SLvVmwEd
	R7qErXvPJFu9bYcKSwWJhfxgLjZDmQS6g2ISDhGqy0rxiEjn0G6kJDhs2Q3nMlc5coHS7R5xHR6
	W68Ob0hTYN22bH8uA7XrJ7oTHFWNpx/Rdbmcw5UnOFWH/Op2obI/zkDDzksyqr5A==
X-Google-Smtp-Source: AGHT+IH4U8H0I8wNK0HABdxecE6PJIU+bWk7S/Z1wyl6phiXnnKwoZJlwtIxKOsI/ZgK84amssCI+A==
X-Received: by 2002:a17:90b:4ecc:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-34f68b67ceemr13694704a91.15.1768107981500;
        Sat, 10 Jan 2026 21:06:21 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfd27953sm13965818a12.11.2026.01.10.21.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 21:06:20 -0800 (PST)
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
Subject: [PATCH v3 0/2] rust: sync: atomic flag helpers
Date: Sun, 11 Jan 2026 14:05:56 +0900
Message-ID: <20260111050558.3147975-1-fujita.tomonori@gmail.com>
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

v3:
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
  rust: sync: atomic: Add i32-backed Flag for atomic booleans
  rust: sync: atomic: Add AtomicFlag bool wrapper for easier use

 rust/kernel/sync/atomic.rs | 102 +++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)


base-commit: 7bd94324bf04ca1161d94fc193adf782b0cfc0a9
-- 
2.43.0

