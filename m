Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0150E30F93A
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 04:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767157072; cv=none; b=WYeimxlVKNrkuAEbf5nC2ylLMLD24apd4IG/oi8eS6Exx54z51rnMzOxjJo/MZdtZUOCqOtrZQQUT/nah5NShetItF7tNBMAeBpze7nIjienuxXy9NxIVVPXSOi7pt6s7nn6LcMHUn/O0FvZmmJbNn8pQM27ARAfzD5nd3004ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767157072; c=relaxed/simple;
	bh=psIHf20qIUj9jZntB2l5vudb3LXS1sfkEBXwItIia1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=raNInVgeOksIw1XNU6jSeXWckyhYKsmKbw+0AhS9E7ysePylGVUmGaIAuIsZkPR6ntJPmOB587+Bj5sN5iWLQ41rfwlsY6AzAW6dR5dLQWblJt0yf+/30GQzMkj8elw5IeZu6qkqXWK+zAs7wPfD9QzlIqKbQ+SJC/ke9qrbL5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSGO29NV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSGO29NV"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0d52768ccso131411745ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 20:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767157070; x=1767761870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTP6l8jl7LK0FuEBgKxwdLK4a7PuyP9zn9rGyg9y02s=;
        b=eSGO29NVMO1MWm8nJtz2EWg7xB28JYyJDw/mTj20jLlJ4GuItr2lTzeVnEclkMUpEC
         OvikVZzRun979IRRwphdRrsy1K0h+rj4+aNYbC3b+2PCLf6txE+wbBdbEOwK9CWrC5kk
         z6I5goOkHsd6zIYEdTwc0K7WIzhtpeZ/BWi4eWc0dWT3GZkNXPC8bEE3CoKr+dfne0cc
         S/cUn5CSGXT9nfjT8Vktd/3csE3oaoVOJq610WWv/UzGeNG4TJowWK3rv6y64HK/900u
         9ULKufJic394s4sJw9XIaTFWfnbewqZiLaC7JOdY4O9FpEE9820DKf99nhjkR4R0cq80
         Ha6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767157070; x=1767761870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mTP6l8jl7LK0FuEBgKxwdLK4a7PuyP9zn9rGyg9y02s=;
        b=ZWic13mrYkFa5zGWSZ2+ZRr6HnFD/T7F764A3d/3SvUSDaItIsnxkcBa7k4GdSZUnK
         X0hBR+IjqmcqOAO8L29+SJaO29vDjB4tjLfI31DT8LRfA6hnrEtXn12b4mMDnAAW39nK
         wNkhKaE6cjix3R93BVMBnjw7uxjJdtERybF3joivplnJ5M27xEsA77fAnYKsxUj+Jb/5
         ZXExJrWn1KTx4HQtv/T1mlvmoO8zvE400ngSF6bmpoBD23LbooTb7sUP+A1YyLhfZUFR
         8pjMFi8nVRnWSL4aIYm/rtuOkMITlPzL5rr4ssCMWCaQl3Znlhs4uQJs5+Lq+Foni8eF
         lD1w==
X-Forwarded-Encrypted: i=1; AJvYcCXkmQQFllxRfirsQ/h6PjINDn1kaYpylhESfGPjzRODinyMnHcNqVDBNAdgk/Dqe6Gdqdfu7JjC0OtQdfQ+kw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0cW9F413gcKU4WLAEbAXleUKqqijPKiwmFQqWhDRMzYkaQCDo
	yXKpJ76EnJd35a6nSPpTElfuthEBKyAsIeWIik5/d8iRAGOHHPi3KX1O
X-Gm-Gg: AY/fxX564ZyJIr7fAkEMOLaKUD/7TJt7iPVMA/z0L6iMTeEHeTWdbswLkG3i5dhPhlQ
	qWwL3a+EqonzPcPxOe0ELib5D1+GrR0iDkkRYpJtyST7Q93HymM4bAcpDaYJYLyzNcrwoy+ITPc
	wfL5OVbkDSqZ5wJcKESbLrKwLhXDc5u7lpbyFUb0k0D38KhHVUjydYDfqafD1nMjNGmkMWUcwtL
	p8F4n19AHJ4lQa/q2VE5zJecXfZDIXhcbL+Qm7pAjtSLmF67Eg3oh7mz7etbBCAhXqWAPX91lLY
	PyFi8TAUKzvmRNFoRDzRnWSoD1qi/XDRgX+o9zuRjmJtyR0qZ2q2dHGb3lFSSgyXnjqWgM8LT0k
	zE/UV3VW6HMQoRILllMVIWs7zZsFAEKDWJjOe9aWqe6VZx+S4Cwtry70HzzUQtMMwI/20T5i7/S
	/7b5UFmPvzRZ57mcC/J6MdihQrQZ3JHqSuvkbsr7rZ877J9oShQlNaT65RQ+JlCA==
X-Google-Smtp-Source: AGHT+IHBmZd/fVRhrqKR/POqhO705xztbZMKmTJKfhN33NztZGcXraYuM4nU4Fs/NpLcm10yZzg07g==
X-Received: by 2002:a17:903:2450:b0:2a0:f469:1f5f with SMTP id d9443c01a7336-2a2f221fa26mr418848385ad.13.1767157069924;
        Tue, 30 Dec 2025 20:57:49 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c74490sm310580525ad.5.2025.12.30.20.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 20:57:49 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: dakr@kernel.org,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	rafael@kernel.org,
	aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	abdiel.janulgue@gmail.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	robin.murphy@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 2/2] rust: device: fix broken intra-doc links
Date: Wed, 31 Dec 2025 13:57:28 +0900
Message-ID: <20251231045728.1912024-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231045728.1912024-1-fujita.tomonori@gmail.com>
References: <20251231045728.1912024-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

The `pci` module is conditional on CONFIG_PCI. When it's disabled, the
intra-doc like to `pci::Device` cause rustdoc warnings:

warning: unresolved link to `kernel::pci::Device`
   --> rust/kernel/device.rs:163:22
    |
163 | /// [`pci::Device`]: kernel::pci::Device
    |                      ^^^^^^^^^^^^^^^^^^^ no item named `pci` in module `kernel`
    |
    = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

Fix this by making the documentation conditional on CONFIG_PCI.

Fixes: d6e26c1ae4a6 ("device: rust: expand documentation for Device")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/device.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index c79be2e2bfe3..17735f980997 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -67,8 +67,9 @@
 ///
 /// # Implementing Bus Devices
 ///
-/// This section provides a guideline to implement bus specific devices, such as [`pci::Device`] or
-/// [`platform::Device`].
+/// This section provides a guideline to implement bus specific devices:
+#[cfg_attr(CONFIG_PCI, doc = "* [`pci::Device`](kernel::pci::Device)")]
+/// * [`platform::Device`]
 ///
 /// A bus specific device should be defined as follows.
 ///
@@ -160,7 +161,6 @@
 ///
 /// [`AlwaysRefCounted`]: kernel::types::AlwaysRefCounted
 /// [`impl_device_context_deref`]: kernel::impl_device_context_deref
-/// [`pci::Device`]: kernel::pci::Device
 /// [`platform::Device`]: kernel::platform::Device
 #[repr(transparent)]
 pub struct Device<Ctx: DeviceContext = Normal>(Opaque<bindings::device>, PhantomData<Ctx>);
-- 
2.43.0

