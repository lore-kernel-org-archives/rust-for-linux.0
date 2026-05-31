Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F6E377EB8
	for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780251823; cv=none; b=mld3Klv8Kn0KqAAH1G+jgkKK1Hk+TO/YSeV02hoSRI3QXdDHIBKDDG8ObMk7SyZsGHsfriCcA5+4LEWnt7JI7E0USXplBvBvRDBfJ/ZPKj0JQAn8WIagWuN3fjaK+eGvNP32uVfMQ+CFzIorZBFvg+jmYrBa3BSzPEokG6qH0fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780251823; c=relaxed/simple;
	bh=duauwQPdNOaCX8n/BA/ifDVSSVZPB4Cn2kr/4bwpX0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UzRw/nmhSETlNyWQD003Ux2ULtgj8SIm0AFW2b6Xio2UOTyXQ2NCCRd4HptAwr2bPLKToYI3b0sBfEf6vgOqVUSU43pvqDtpvcyPA3wuzdN/zDUdfoZhzEnjIClQamsFwj4dy68RwmzystgMHpJ/7ww4j35FcmbELl8/CygwKAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjSlTWkE; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjSlTWkE"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66036d6bcb3so3597057d50.0
        for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 11:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780251820; x=1780856620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZU06z9RTZCXfgLkK92JhL7C0HWwV9dSVvTqen1OyJs=;
        b=WjSlTWkEdLcQYDdnjuP32ZAoffPgM/40D+gDsrAtoNhD40xMTZMiOqHMYA+7IqMICP
         wBvQRo3MXARGrGDu9kwAvezqquKXFewypvGgZESgTIdXdRHNOa6rt4mH0dzlYMBQJFiG
         ACO0oKksbLklWE6+IH1GY9Tm16bJYBUF1uoT/g0zjESPo2NzQK6bFHU2KDEk2XvyjFDz
         JRONKWM3H/PlQLsuJnKUdp9BvFB7tXJ41LCOkOB0TLzUqPhkykWkDuiryK6pOyB/hZiX
         GPeA/PI30eKBd4Jz2mzMzEjYJ17MnzYYyrN5/DCejALUy3BWBncW+dms6/M5KiNoxwc4
         1JYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780251820; x=1780856620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZU06z9RTZCXfgLkK92JhL7C0HWwV9dSVvTqen1OyJs=;
        b=YkV8XkflvYWDpGKCOtw20VboJrgPSRzVf8xcYS8zvV6KLVRtXomhuxUwQkedg0G9Pk
         uphzwl7WaCnVFm3wYZLBW0qF+suCBClJw1sX6HthhgSachGDcF0/5tiMdFDtlpwudUnJ
         gkMSIwtOvnLmdiJv12iEP+jJSJWfukIszgprVSjrNFGfaOPtcaPLLjs1gbN0iTmyn/JU
         8joRRnBlxi6PnbZ5MSi0EzKTYvN2nHixaQBNO5TYAdeAuk6GD679cNky7lGW6YWOGN17
         HRY8OlEinOW0VU/R34ovsubTbVA/pHwP1xMZAru6vJykDfUqEkarrv8AjoYowsUCFCkR
         TVbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TFBoVpCEwTOplQ2KQk4U8uymjQg3888YA70W1cEkvi0dz5SNfk/Y20rLaG0BBz0U6xQOtTVd0u2UUBt8wnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJT/UlR3rHYeADSX4ViVsCGFtWLlkwdpZCuqi8Dr3BoUHKWYqb
	Pa/v/CW3W9R8EpuCtEtUAdj5R1jjBBLDRSOT6acQfeAV8d6JC7v4oNg=
X-Gm-Gg: Acq92OHgWAOtZYelp2op4pLLdwXy+e3hMLrZfCRGnjA+T1L0q4V+clPT9O2STwhlzpe
	Zr5S+GQkjl74qeriLtDZK5q0SZbL7QZqUjdHN+hBuX8eD4KqNzPlBH/pyQyaUZgsF8HFrD8u4Ci
	SWPGrg+rC69zajCV3tEVwq3MyOIGyQm+6oWWiVu17HKMIyOoKLGVwjX23Sw/F4j4MMOGqxg4H7u
	Qjcv48+TloaE+F82eIK8sMhiIWqw8Po3VwI7Z9FvsFxjnln/1nwHwOsYjdQVy+LoTiZlnXsEXFh
	/cjdxRoyxAwlwM0riAuZObCS9QRrJjW5qYeKV5zwIHVMqV0WVUdRPuEGCNYHCturyiYCyAqt3Tj
	7d1YhFP5SS+zw05dxLydQbOXDCGFtx0uTqQgGIfJc2qYQt+sSBgWCne9XcYV0t2g1cISIoR1Y3K
	UXbWaUGGKNsY0MU0HOXm2jSASPxUJI4pDNFyub8Pw93L/C4xAIlQT/ysd1zBtXGVfR1Fxr3AQ=
X-Received: by 2002:a05:690e:1243:b0:660:6ead:8993 with SMTP id 956f58d0204a3-6606eae2101mr3974894d50.27.1780251820159;
        Sun, 31 May 2026 11:23:40 -0700 (PDT)
Received: from linux-dev ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6606970912fsm2399747d50.4.2026.05.31.11.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 11:23:39 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Igor Korotin <igor.korotin@linux.dev>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3] i2c: rust: fix I2cAdapter refcounts double increment
Date: Sun, 31 May 2026 15:23:07 -0300
Message-ID: <20260531182319.21777-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When `I2cAdapter::get` executes, it first calls
`bindings::i2c_get_adapter()` which increments the device and module
reference counts. It then takes a reference to the raw pointer and
converts it to an `ARef` via `.into()`.

The implementation of `From<&T> for ARef<T>` where `T: AlwaysRefCounted`
unconditionally calls `T::inc_ref()`. This leads to a second increment
to the reference counts.

Since the returned `ARef` will only release a single reference when
dropped via `dec_ref()`, this leaks one device and module reference count
on every call.

This fix was suggested by sashiko.dev.

Link: https://sashiko.dev/#/patchset/20260521190937.248904-1-nico.antinori.7@gmail.com
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
v3:
 - Remove unnecessary `.as_ptr()` and `NonNull` rewrap.
 - Add SAFETY comment for `ARef::from_raw`.
 - Small change in commit message to make it clearer.
v2:
 - Add missing Link tag to commit message.
 - https://lore.kernel.org/rust-for-linux/20260526194734.14378-1-nico.antinori.7@gmail.com
v1: https://lore.kernel.org/rust-for-linux/20260524181151.24988-1-nico.antinori.7@gmail.com

 rust/kernel/i2c.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 7b908f0c5a58..c084a45b1916 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -405,7 +405,9 @@ pub fn get(index: i32) -> Result<ARef<Self>> {

         // SAFETY: `adapter` is non-null and points to a live `i2c_adapter`.
         // `I2cAdapter` is #[repr(transparent)], so this cast is valid.
-        Ok(unsafe { (&*adapter.as_ptr().cast::<I2cAdapter<device::Normal>>()).into() })
+        // `i2c_get_adapter` returned the adapter with an incremented refcount, which we pass to
+        // the `ARef`.
+        Ok(unsafe { ARef::from_raw(adapter.cast::<I2cAdapter<device::Normal>>()) })
     }
 }

--
2.53.0

