Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D724E1A239F
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436523; cv=none; b=T4HSSCF3QSu9zI2Io0uqf3H0YyVgOgBKS6LU7My0dC0T1o2xh2qOJeWWkb8+kJJq8E4NhR4jk0NDRulImbpbHNjNS8bAP9+qwLbLnr083PZn/c0WmsvJS3R1mhQ/I+DDvfYZhYplZyF1z4xj4LmDPji5u2QCLtam6ltoXaLS/J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436523; c=relaxed/simple;
	bh=55V2j/OQPKYJTWiV+U25GDW5Iw0leNvV8HMgmBJ2+HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbtiDn3iOn9hDVO9hxy7acWnUMbzfIoXRe/wFoqIRjzo6XOwHWraCsBNXcguANXS7G5LMAizvRPbRpUOSmdz/555ASCXpdQU5YOOd3TEAM/4owncdK/sPAgOGrzs4eBoOh0O2DB70WdLHfTbHLSjqeNsN4baLNUjS56NBqNw5yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=LWs67NfU; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="LWs67NfU"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6fead015247so2189087b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436520; x=1743041320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYdjsu9Z7/7WUWaSQUOHiYBv7brhy95VtaLf8YZSIL0=;
        b=LWs67NfUHEd94PBe46MENCciIUYHpghRNAKijCxV8DIT5YRXi6RIQE2LP5wEason55
         BReZNWhj5clCRi+rm4Z3vvgmQVWHi5wNVupYbxOc93f1/Pv5Qr6dqNmuVQmhFRxX5HhX
         oKSO3xP2CJ7Rt33MWF6Qlry0hjSUk8G3FLHc75t4TGEWLpGGESaPMtS2gvfVTRZT9pqy
         OdVYLsL6SS82oQ5rnO7sWXOdpWWEWgxfVrpNh6FzAFBUoL8FPdbPpeYkvPFoz66TVTej
         qI5ik3u9Nje6TPyxZKoU+nzNXVGyA7dQdT4M916hA3X+xP42envwwRjTqmUDWKl1iU+f
         AZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436520; x=1743041320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYdjsu9Z7/7WUWaSQUOHiYBv7brhy95VtaLf8YZSIL0=;
        b=ZHqMiczVifkviYqLTmjIbvkKLpSu9a9r67C4f5nLpEuuS/362WdjLc53dy54LHZUzI
         8Dj23jlCWYCxGe1cEmbITF1QSl0WsQXXYdqxHa+mWvBwWF/0KZ34w9lywa0BqEkH7hiU
         CnwbuLztQuSqcYeAYZ0FbsYf5NefOsLapJLIbzdeKwcrMouwertZ4V4xsWNmAB2fRPeH
         glNpmbMzHmoFHCf9ZTCEDMPxZyDq+wGJRCMsHoNjV829J2hSnijEx0WLKfeHgRPOSGN5
         3y2j/Mr0jRBqV2SVGcpXbziaBOa9fP9K780eyTZjzgb5zkdY2Q9yrP2XA/PLaQtrG3b8
         aPgg==
X-Forwarded-Encrypted: i=1; AJvYcCV4Ut21twE8fZAvg0PeYoq5q2cmiJz0henQdIemu11V9YksPElW+nM95zuxW4dv78Y026m0GxKoVdMakIaTEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6wtquetFty3WuO+s76KOZ0qYuRKqS7ls0/Zlw1MAc7zU0mUFN
	fnP2vBOYhoQi+9ciuBmmbEdPQBpGZE4dYIlIf+f24CCF14wlOSyZHk8aV4uvY68=
X-Gm-Gg: ASbGncvJC3+g+ziu7781NcPZCo0oDoM+6tNtXF5zqYgnowx8NWKbSo6SxoTzat/Imwd
	ncZIf1EMC7E95q9kK1Nc2PSl90Oyt0kP4+d+Ql2qvpqI0a8tPZb923PmIqST9l+v9gG+Q7DK8IE
	QXKiP+PoY7vpqZ4+04R6J58/0N88Z1TeMAu5eSkVW4B9X8ZC+Pd/e0C03G7Csjreh7p373lD0jb
	bxUJrFLmae6b+6b6x0nDwqioZUuQ9HHia2N4B2gZ1bSZbpkoSyHssEmGgJLNFFR21lR/AA5rSZv
	KGFfAzjAWpeax5107TaAhmleYNj3OgjKXJxEO/Npuya21IJ84B9Yfb0zsVIeNVfz0Jr1v/7iPYv
	GulMFK4V6HKlSYkhdYbwNUNzdsRplUw==
X-Google-Smtp-Source: AGHT+IHctHYEVPNjVuLvb2QThCG44XzX6Hlpf6z6uDv1fDPTG2mB/nmST4ANdlI35F2bQBVILOWMeg==
X-Received: by 2002:a05:690c:7281:b0:6f9:87da:b763 with SMTP id 00721157ae682-7009bf78fe0mr72646217b3.12.1742436519870;
        Wed, 19 Mar 2025 19:08:39 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:08:39 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/17] rust: pci: refactor to use `&raw [const|mut]`
Date: Wed, 19 Mar 2025 22:07:26 -0400
Message-ID: <20250320020740.1631171-8-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320020740.1631171-1-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of_mut!(place)`
with `&raw mut place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw mut` is similar to `&mut`
making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/pci.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index f7b2743828ae..6cb9ed1e7cbf 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -17,7 +17,7 @@
     types::{ARef, ForeignOwnable, Opaque},
     ThisModule,
 };
-use core::{ops::Deref, ptr::addr_of_mut};
+use core::ops::Deref;
 use kernel::prelude::*;
 
 /// An adapter for the registration of PCI drivers.
@@ -60,7 +60,7 @@ extern "C" fn probe_callback(
     ) -> kernel::ffi::c_int {
         // SAFETY: The PCI bus only ever calls the probe callback with a valid pointer to a
         // `struct pci_dev`.
-        let dev = unsafe { device::Device::get_device(addr_of_mut!((*pdev).dev)) };
+        let dev = unsafe { device::Device::get_device(&raw mut (*pdev).dev) };
         // SAFETY: `dev` is guaranteed to be embedded in a valid `struct pci_dev` by the call
         // above.
         let mut pdev = unsafe { Device::from_dev(dev) };

