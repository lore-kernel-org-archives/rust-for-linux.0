Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8773618F2D4
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 06:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742106041; cv=none; b=kW5Zz9kWw1Z1sDH11qrxM2fba4KrXEuf+RXEMn9AuQnc1KKorp+sxqwFBfhCQ5lYid+ybN08RgNTbUt773s9VzHJrOR5062ea/IvofK7V5H2GtqOVlmu7SqgmbHeFT58v215S4BsqFZYh2YMcCkmFsW38yYH+/2IuACSGNphuo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742106041; c=relaxed/simple;
	bh=gySnbe+vLzB7F5mNzeA75V93oZYKI+9q9RIAFvjms8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ca3TUbhy3d7wVMk7hfHUksMGPwGvOE+xG5Tkx85is7ynAF5xn3Mu/qmUJUL3u3IA5PmBhL5lvBl5QtwS5MBx1WatQN5mF602mhrlqQ9EA+oj4C8OfnvwXuD0XMIS7v8TRs9Bsxkg6vvTBAe/MNM0L6IF26i8bWbbwlgJIf9w8Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=zqSN2CBP; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="zqSN2CBP"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e5dc299deb4so3205420276.1
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 23:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742106037; x=1742710837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx2EcOXIxEZHQL9BVCXmu7GqocKqlrDTrKJRW1T6D0Y=;
        b=zqSN2CBPYsw22cJTE4KuD+MTAZRZZkX1ijMw4IQPJMM+vX7q1NhUl7qe/tXez3Etdv
         ILfBzMaoprc3kWDofuqmGNYnDRn2Ov1tJdvQLEFSTvdcQt84Jnj56HgXAt9gzGfyY0Du
         Ki8kRplJgrpGrjEJorh4MpHpnj/4boLXubLE4xuCBykDfLmPHP91kno+lLHxg6KZBatW
         pzoLYb1+P0EHNPvQHklQTW/hYmIbT8Pyhb1B46Kf8166UuFIk8v7hss4k7qUTLzR1QqM
         XS0qzIITSpePStLQiImumodMWl0Ni0e/gZV8vNY2xnHrjQ+0iKUu8RosgeBnuU30zFLr
         UaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742106037; x=1742710837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dx2EcOXIxEZHQL9BVCXmu7GqocKqlrDTrKJRW1T6D0Y=;
        b=seVpmKM08vLRZ8ze0SLRWcuNKZ8vri+n5QZKf1RXx7dqspi2QvYQBhthm+6igSoq4L
         dvU1CXmK+dN4sZeLKSMr7Sqzj/GZIAP9Ok2JgarGqTQ1MuFLsVcbAHqto/4ebJjANr8w
         PNVRvb1eLlEMyb6SM3zLq2nYfKEYSKCZEdHDiDDDbvblqfwaW2bZlfI2RqQV8m5Msr4K
         hWoZQCbwBXsAiJFyKu+rdx0ymOgMEkhJ5H1N14RrA1PDdTlcm/mfoFmU535PRd5MJNwi
         99QtSStIQngqtu+G/G6sYsf811/JOIDEYR3QEitCxlkBceyxqAdiVioTwAH+wA3c0A6c
         mdSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIMfpGbkA58HuiiNUY0AUfDDJKhsl855iHzsZLojcxmbmuB6h3UyZ7B83Mk29reRdPH9+6iZLPK94qzWMVng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz36FeZNUQC4ewxT/QXxG0OTM6obH9Ol7S8SSXpnNZT2NfNC+Bh
	OEU+YaZlZDDZZFDRDva17yCZvAesvWFem/nEZlpJF17rz5NAAIfgUfS57c9xkJ0=
X-Gm-Gg: ASbGncsbc+UhURSIJpGDWvYIPuNDiI7Hsbm3bnmuI6NX3aWmMqEbwBhS48tU37vB7nD
	k1/PiQZD+ap6f/Uqd8uni+1lua9QTtUgL/sn3YeWw2CAC9f/7cEHKKVbnqebR7wmM3urriRcWOc
	iWIdkya4fUmSER9BcaDhRb7hN1LwPVrOV0sm8EkTlXVRn+SKjeGXQZ1px/WrN4ELSIgE8Q/RApB
	Md4ol5HAheIG/RChEHZamfB0INELn3tRyg4UlC4D136fuyy4OAcslb2DX+JaQ7nR9lXUvg87Uof
	C1vTbKvreyb5guX6sjpwiFdIfPSUNCFM5hjAv3yS8lgHlJDSMEVLqIFMw9+BakgMfFYCdsFwEYu
	Ie3a2VP2MKeo50XbL7AeoOYltqZj6RA==
X-Google-Smtp-Source: AGHT+IFnrHoT6XIuxtLq9jDo1MLrNzQ6L46U5f7kPuzqx8EI+Sypu2OuNNUq1wE4WEO3Y7c9ZHNJdA==
X-Received: by 2002:a05:6902:1a4a:b0:e63:edcc:edcd with SMTP id 3f1490d57ef6-e63f65c4e12mr9676199276.34.1742106037568;
        Sat, 15 Mar 2025 23:20:37 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e63e53fd277sm1618673276.11.2025.03.15.23.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 23:20:37 -0700 (PDT)
From: Antonio Hickey <contact@byte-forge.io>
X-Google-Original-From: Antonio Hickey <contact@antoniohickey.com>
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
Subject: [PATCH v4 07/16] rust: pci: refactor to use `&raw [const|mut]`
Date: Sun, 16 Mar 2025 02:14:16 -0400
Message-ID: <20250316061429.817126-8-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316061429.817126-1-contact@antoniohickey.com>
References: <20250316061429.817126-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` and `addr_of_mut!(place)`
with `&raw const place` and `&raw mut place` respectively.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const`, `&raw mut` are similar
to `&`, `&mut` making it fit more naturally with other existing code.

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
-- 
2.48.1

