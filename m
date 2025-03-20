Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4401E47C9
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436494; cv=none; b=hyvh+4PZdddS18BNs4PonzmbVoMUMy0xxVUobTrfGN2xrBi6ETSUxIUOfSNLYDptzvqiKADdQDPNsy3F2qJqh97Fg0nMc0YfclAERE3+bMnUUexDDlEFxp5o2eH/rg3J5eRQ4tyHdbvgC7nTxtvxuqOA8ZODWMHKx8cTWe4LhS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436494; c=relaxed/simple;
	bh=5DYwCw5VSjMRViNkfzFuwdcL8RKibKODas0k+zh2s+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HbDeQeJFe8rf44Y/z6pBpyQPxo40bZcFlpPu/fa4aaa10LvPfOmxmdfm9ycdyOcpTzXlPQEVTTztr2YLQDZLJAVWekz0VaKXyTxyhbq6swudPFw2N02bHwxIJYpX2T3bAnGQOa4+AfmYZrfq74c5i3vplr59Spyxb5T3NInrSAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=UQZlUOzS; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="UQZlUOzS"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6fedefb1c9cso2092107b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436492; x=1743041292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjP5UYMdVD8swW0UhXnvA0Xvua7PoLrWUXi4eCeH58Y=;
        b=UQZlUOzSip1U2maanPmmv0u1xv+3X1lsPBSQ8A7bloI2Tcn+gtBhV+/L4RS6CAR9aI
         Z2Dz6UWB5ibU++zwHtm69sgQ3e2dUY6yJpco9c0VMbykZMwLBrHUd/eJAvBcep6D+jjd
         T4A8wjXjfeAn5+xmi5LKuUjLv+R/cpeWn+wr8P9a0BjWXe/XPJrUVsUBVLkUcKAHKQuS
         HxofB7OXVrljxqyccCcwvqLD5Ll2tz7itwxT8htFzflB3IbW/wzPQk6IAtjdtkTBvoaW
         I0gFZnyTSnMpSljN/HjqqOZPPbVEBVcw8nRi4tDvTdrD5zD9tQpBLkJIvxX89FinxMD6
         UX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436492; x=1743041292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjP5UYMdVD8swW0UhXnvA0Xvua7PoLrWUXi4eCeH58Y=;
        b=htbF2in9Vtlemfs2Wr48PBCnM35fNs7UVX6kSmcxWBO1t72CRiXj7fultW6iSTUwdL
         KTODoVXjxti5/azW+wQljFkA78s+YHUNx8RJd3EzirP1O0WOmOFx0slEvtCKYIPXDfhr
         ezf00l6XbEnSX29X0OJurFg4tAC4RCFKYCpldEGTHDnim9zNZc2HRyWEjTXxYAvm4OJE
         gIt3UpU/inv4vAF7XRz9mU1Miz2woTPsh6RZWKDodWpObxi9XdxlNSbO2c1HrhT8U4QX
         2cHgRtPLKUxu9oGBPpqpIO/p2/DlgEh064j0k7sHrT/dTkE3Y+AgiqY047Nro9w7yfKk
         dBzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOMPCAbuR3th991nu2fMD1cmaXzNR1Oq/YAx63+DiB25Y6eUHdtiwpH0jqtfMIPZsk9UtStGV/SN/fsBbI7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0LhWjZ+bHg11PibzZXDZLSgSxKSYhD5WMxJuKSEgmu5m28oEs
	nSZAJidujBmBxOJXpJI72IvfSLn7pzyvpgQQgT3Vy9x2PUcsq0wizjAskzfJF4Q=
X-Gm-Gg: ASbGnctVnp5SaECcMTAy07keHxR3px94FCC3uNkM7dGNcNs2JWEfmvRg1Je1KLxy5IN
	fAPhvGihwJHLIYpE5EKB2EN8Rjc3zkb2rrfXtvoZOcRmO2wrKw+G1Y919MDU1xlE8RiU7f63l99
	U60DGbrFE+y566sbIubR2MpjFljpKyrZRssNqloXRgIEe/lvjr+Ic/kSsdsPDKQTGBG/bOm/IT8
	KRDCxn0q2nI2wFAh3XENs8tUdJDDNvYWfeZNYqLR0VN15Lc59VfzXC1bYGM47TvytBImlkQGGlK
	06V5vWpbHiY2g0MxIaVEGbBFx7+poWyLUK70sTZmwya76BTTsPdVHTO1uYpuTHjAVjl72xvWRuX
	xatP9805or+Exy6ShzUyQUlgg1U5lVQ==
X-Google-Smtp-Source: AGHT+IE+1+outUb+Gv03/JgxTzo1KPf7Ulu2G+RNfgqQlReYHZUVrPUgA3z5P8FXtZWsXbv0HHu9gg==
X-Received: by 2002:a05:690c:6185:b0:6fe:af27:33f8 with SMTP id 00721157ae682-7009c02deafmr74365507b3.30.1742436492028;
        Wed, 19 Mar 2025 19:08:12 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:08:11 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/17] rust: platform: refactor to use `&raw [const|mut]`
Date: Wed, 19 Mar 2025 22:07:25 -0400
Message-ID: <20250320020740.1631171-7-contact@antoniohickey.com>
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
 rust/kernel/platform.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 1297f5292ba9..344875ad7b82 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -14,8 +14,6 @@
     ThisModule,
 };
 
-use core::ptr::addr_of_mut;
-
 /// An adapter for the registration of platform drivers.
 pub struct Adapter<T: Driver>(T);
 
@@ -55,7 +53,7 @@ unsafe fn unregister(pdrv: &Opaque<Self::RegType>) {
 impl<T: Driver + 'static> Adapter<T> {
     extern "C" fn probe_callback(pdev: *mut bindings::platform_device) -> kernel::ffi::c_int {
         // SAFETY: The platform bus only ever calls the probe callback with a valid `pdev`.
-        let dev = unsafe { device::Device::get_device(addr_of_mut!((*pdev).dev)) };
+        let dev = unsafe { device::Device::get_device(&raw mut (*pdev).dev) };
         // SAFETY: `dev` is guaranteed to be embedded in a valid `struct platform_device` by the
         // call above.
         let mut pdev = unsafe { Device::from_dev(dev) };

