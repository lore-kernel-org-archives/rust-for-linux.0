Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426448;
	b=soK5+n5yv3YwzyrjnlB/hc5xQ+Q/covgBHC2aqCIsdDkt3YsBFFtzXjP7yxilnWQk2/X
	 8eNhDm/K23AFRSjIlXvzb818WhEMnnsqhgXi7fWY3J7aZ77Px1H7wITxaTH9ShifNlXgl
	 uVPyuzy7BaMff9no6hKXpTLT0nVZYZZ1Nrkl67IW90Ef92vFjQlHacGq7tOetBVFTTuBy
	 dQWgzjUM5o6wX4+0UNUtQu4bEXBuEzppd096GhoEXMZ2GXpN5po3DWCHYcpNvBpvTmveY
	 2ujYe0ZVZkr/b1Npd0Y+pZTmejfmyA4bjNUw3rSlAlY0nfxcwCm+I8AS/M/OxbisUEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HB+s47HQvDT0+pJXulendy8jU5r7FFBd1iGvR2TZayM=;
	b=ejWAs9cTPnbEya1ZNtREkfO6KROL2uijqt/DnXIKOejKttfDimrJCsXLz7D1lud+t6sO
	 VRQU3ikQlRaEQf1nC33mtMIF3nbdqW8Zi9oCpEwcga4C/P9+V3xRh6fa3beWH8o31MZRB
	 buHS7iOtoDLDxYitE0QaZtz0v5uB40NIBVg1MKBy05ZjqfrppW4IM7i291nJhHL3wtd2e
	 VgGMU59TvDZxzKl/n2d8j+Ga2LPmGCkEJ8llPLW+4D5Y1j4GvJaLM6NKo0QWCUvmHfgrk
	 ZI1Jrs6dOS1BE5VWnJJzEeo7VjWdmNsSKVSuoVKvOzFANz3tDM8TJSfPBxxZBNZs9Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qCIh2rNL;
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D45606AAD1
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 16:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D45606AAD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qCIh2rNL
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9906c3fc88cso987404241.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 09:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426447; x=1793031247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HB+s47HQvDT0+pJXulendy8jU5r7FFBd1iGvR2TZayM=;
        b=qCIh2rNLyzShrHZcr/CSyeWZQabyG5BA4kgWpAslU8XOFJrs+dQUk9Yjkj3SUzZ7sJ
         7panJIZeQny53xgfr9rIX99aEh2CO7Wg8mQ7GxAezejLxVA5MmBKpWszpQWf+iNQI1eJ
         gFHtXHdC+jpfzZVU2VTlGtglp2qI+VCZNA9A7vfT3eCp5mYWwWOJBztshhM9TMcq7mb1
         Itzk8JwmTJxmHGJ1DqwiwwrzfmCeQs7Oo5HNnp+xsFlwlZWOGqFXSCwKRVjKS2tGHmlc
         nq35ljOwVLF4d3Kcx9k0CWkWO6xyve98PtzzK/CDxAzxsP6uVlEEhtzAIOz2DterKxeN
         4JOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426447; x=1793031247;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HB+s47HQvDT0+pJXulendy8jU5r7FFBd1iGvR2TZayM=;
        b=h3ZijU/2v4nTIEJsdkqtLfAIxOBawgOHvGseaEA+2EDW823V1Fuk/3z+keIyFJ0T4V
         t4cp8du2Wr7hFVj04HJJSGHq91qvVnVpYFfSmRnmuBi6oQQDqlVMA5L9VXPd6RYFWdxU
         oUUlQqfURrelGm+IwcmLphwCDpJPF33q98lh5PNIeXaUL+I49vvQpe6mTW4fN5sytQsC
         o6bzStdhglJXeF91VtvV3fQDOQQTgTdSaTW8TmYZHxViEWBi2J5bZDE/cRuzr+5v4qqS
         by1pgj2uzqQNF93tAERM1Mhj3r6R1+nerPNgCTT+9J3VpCKCW9zsCneh+ra8lIN9wPF8
         qItg==
X-Forwarded-Encrypted: i=1; AKwUvBzEKHK99Yg3FZBnQZvogl+xfHrZyHOlFjgcnJ+WKxt988mdN8m8cKwtQQXssFoT93ZSiZ8scyVpjh24kk2ykw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKoMVW/nghvHT97fujAJ67Qvc59MkuzijybqR0Q7FBmczHfdsiv
	S08SL9xMaOJHNrH4gWegLRhawFJUAq5VV5l9ADE2aCHncMePWU8efbM=
X-Gm-Gg: AYBFou0I9JGm1byeiMTCp4P58336EivGOY0/A6w1FuiQ02qcv1Kx36V/Wo8Z8r33ix3
	MR37HLoKL1gzhMhtxh1Hy9jgjI9EQ/ICTk85ou5qWKLCsT8u7e9q4UFPeW42DBIJENc8xyx95zz
	0ELg/6GHgKfaN4eWmpATnLcTf3tuFwqlLVpDKQ3ngj8hsM2tN/dKUPjmy6rUu82triYuIOxaedh
	qLb+mhxvhOeHoNbeOzJl+i4U4LvqyuSD7ERXEgEfaQjeIQKNqdc6Wd5EjS2Cldabz5QfAdks7b9
	6yZLa6+qwQEq0/e2v45B81wD4sKUmj0/ITloP9IhJc5DuxeGxl+1SA2dmalmCg/6BLWWes1qEeO
	amtEZ9jPHMbwJzO7rco6kGd87SxDyk7J5B9VVrUQGxZS/GllRXNxKCf1i6Xf45IaU/3Iyc/M3hT
	d2uolPnUe9Q4wpr/mNe0nRDXWidAXKiHyPtvo7MOchyQyt1tfvl29liY3a5LEl7IjmhzxBZAEaz
	eu8P0hc7tXg0DKCAud56sckU4Hwr4bmhgshvNiYbGtZN0lsxg==
X-Received: by 2002:a05:6102:849b:20b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7cc3eb09b24mr1467266137.11.1792426446639;
        Mon, 19 Oct 2026 09:14:06 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb38f7f1sm525062241.10.2026.10.19.09.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:14:06 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 1/2] rust: pci: remove TryFrom<&Device> implementation for &pci::Device
Date: Mon, 19 Oct 2026 13:13:37 -0300
Message-ID: <d128d86b751a51fff46a1702b636de74a4807097.1792417858.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792417858.git.nico.antinori.7@gmail.com>
References: <cover.1792417858.git.nico.antinori.7@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the `TryFrom<&device::Device<Ctx>>` implementation for
`&Device<Ctx>` since it has no remaining users.

Fixes: 7edc491f6fca ("drm: nova: Use nova-core to read VRAM_BAR_SIZE parameter")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1264
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/pci.rs | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 769d01d23429..0e9455fd544d 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -6,7 +6,6 @@

 use crate::{
     bindings,
-    container_of,
     device,
     device_id::{
         RawDeviceId,
@@ -535,26 +534,6 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }

-impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device<Ctx> {
-    type Error = kernel::error::Error;
-
-    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
-        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
-        // `struct device`.
-        if !unsafe { bindings::dev_is_pci(dev.as_raw()) } {
-            return Err(EINVAL);
-        }
-
-        // SAFETY: We've just verified that the bus type of `dev` equals `bindings::pci_bus_type`,
-        // hence `dev` must be embedded in a valid `struct pci_dev` as guaranteed by the
-        // corresponding C code.
-        let pdev = unsafe { container_of!(dev.as_raw(), bindings::pci_dev, dev) };
-
-        // SAFETY: `pdev` is a valid pointer to a `struct pci_dev`.
-        Ok(unsafe { &*pdev.cast() })
-    }
-}
-
 // SAFETY: A `Device` is always reference-counted and can be released from any thread.
 unsafe impl Send for Device {}

--
2.47.3

