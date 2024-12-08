Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A987314373F
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 18:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733683757; cv=none; b=oQ1qPgdHR7kyFbEjouK3Pdcn9xFkVFneDS5izDRYi4QGAJ2+O5Asl4zUQNDLvEYVC4QAlYLR1MZgR7mn7pXnMsJl598WME2Eub0qONeK8JW8OlHuhyhFg2cFcTLh4+wlj+hpNYK3bfBDyVYFgu04FBpHK8Skvm6nkwCWgfk+97E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733683757; c=relaxed/simple;
	bh=sH8XBhEYN6e3sgIwcS7OIfbs0ulTw4gsWBmddpP8zoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fV7z/hKI75XR9zndHB8EMH6ffKJOxDtinXPQO2/Mzk4fBqNW+PX4CdMehAAqu2F4+clhYoMWrQ1ywyVIondIkJx1gk84G8W0euSCTjK7ZL9QHdTUm10p3JWIlqips6wuGTw83BaKLEFEB3snhGe6SozvWf7VrbkwuZPp1BVA1E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQmPia7Z; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQmPia7Z"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-725dc290c00so538311b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 10:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733683755; x=1734288555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MwCIqVmDpigQHbmtbLY85AInnMDU4G8wioyfdFnU2W0=;
        b=iQmPia7ZVCuiyqMYrtWf2UB4V5YYjEWQ89z2pofOydrNCdUXYn2g/lth/5wXcKebzN
         I4yMEgN63mlfIP8R8KXuurzYL1WNNVXhnBQGj0r391Oh+al9X+eowvdtPUprXxe9HQjb
         PpOlqSlvsZYmDHFmj9xlcLRZXq/P1bsH8ZZRm6cdwJsfF/2R73OVq1C/X07x+HFUkCdB
         mg0+7QWGHQ8zoCGH70WdrzgUebj7DoUbgQPjChUYI5v0gEomVttASa20vBLnLEMx+QbH
         UhO4Q7MZ+IqPONl+FGlsZmGipBt3qfsTna4HLpaDf6Joxz6tQiIYtBHuB6UeR5O5ilNL
         WXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733683755; x=1734288555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwCIqVmDpigQHbmtbLY85AInnMDU4G8wioyfdFnU2W0=;
        b=Hh/QQmJPA8ctJQLCwnYrcisv0EPVVzeg3hWXod9C7jyzDzDF7L+H6ah2b2Zsjg+FqY
         niPPCYgLL+WKtHVsuXQSeBGkHRh4xsTMigfi1EEb5juK1nPKWSn+XSXdKbKMxWU/t+l/
         KIV6xd/qcffVPanMh7yqSoizy/06Hhs/1UoISlzhPZJtftFi5U3yD/KhsLn3DTF8G5xY
         YFSYfqzm85ifRcd+KDk7972czJQjIptrBJ+2geWzswi/85rJ5jFE/gTDNfIvwxbodvuZ
         ekcysiBTI8eSXBT5G8K+yHuzCefTw5zExc1U6Sh0bgLm+pZxJB1YNl/9v3PFtH2FsIHo
         8soA==
X-Forwarded-Encrypted: i=1; AJvYcCV59SWcy+jwXX2lpLNKyNe/51vFdj3IzTKaF7TdKhEoIrxnHwQMIDbJemHjroZgPGxLDbknY+1EKr2EChzgeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ph3Kt019ANqKvN1KyG+octPHp2qQNPM1RUKqTb0z2OlXHNMd
	Qcq5QAAlKwvpZaZrulvlDMo8aPwNk+cdJOUB3vguiEjemHku3USa
X-Gm-Gg: ASbGncuaWE2GzDR+M0U3UM39fJ+TCCl9CYHxk7kKEE0BKiQp9KHhBVTneNH8d7flYJq
	VT4tvGhBw0t1AcktMdbHLieT3pJn+2rVziofwOWTQkDThs1sHZmb8pMaRZoP05MhcEWaLO+kpa2
	WaErdWF/V6rlUl9d6vQcaey/MvgamKCmxQIgzPkPY6HmLje85hrKtLqGYbWsIOm65K0qWg4EkFj
	G6yPcvhSJmUNmgFtT10DDRBpGwXN1YhhoBWrZ8j+IlR8couk89fxFiOB7zUXQ==
X-Google-Smtp-Source: AGHT+IHR6NhZpiK3gNYs6LuCizWteYP1vHw70sad0+70rGcHK1FHqeWkApDMxaEazQKibJFGvlHPSw==
X-Received: by 2002:a17:903:2303:b0:20c:6bff:fcb1 with SMTP id d9443c01a7336-21610821558mr149053195ad.1.1733683754782;
        Sun, 08 Dec 2024 10:49:14 -0800 (PST)
Received: from localhost.localdomain ([73.109.132.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21649ad2bb0sm7175475ad.254.2024.12.08.10.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 10:49:14 -0800 (PST)
From: Jason Devers <dev.json2@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Jason Devers <dev.json2@gmail.com>,
	Alice Ryhl <alice@ryhl.io>
Subject: [PATCH] rust: sync: add #[must_use] to Lock::try_lock
Date: Sun,  8 Dec 2024 13:48:34 -0500
Message-ID: <20241208184834.50212-1-dev.json2@gmail.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
currently does not issue a warning if the return value is unused. This
could result in the lock being unlocked immediately, which is unsafe
and unintended. This patch adds a `#[must_use]` annotation to
`Lock::try_lock` to prevent this.

Suggested-by: Alice Ryhl <alice@ryhl.io>
Link: https://github.com/Rust-for-Linux/linux/issues/1133
Signed-off-by: Jason Devers <dev.json2@gmail.com>
---
 rust/kernel/sync/lock.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 41dcddac69e2..f6a5e83ff685 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -147,6 +147,7 @@ pub fn lock(&self) -> Guard<'_, T, B> {
     /// Tries to acquire the lock.
     ///
     /// Returns a guard that can be used to access the data protected by the lock if successful.
+    #[must_use = "if unused, the lock will be immediately unlocked"]
     pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
         // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
         // that `init` was called.
-- 
2.44.2

