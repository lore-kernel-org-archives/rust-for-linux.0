Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9E73AF64B
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554383; cv=none; b=AHESJuPCQoIiCkH99rmZmHAlF8reOqHg0JB+GMJHB+Cr3ZE8oaJANaxpt3shnqS6p+FxhYp7O5MolhEBB53TGrZ5gN7cb7kBD3U5eq3u+8ina3vcaZ5J/ZLZLR3k9RzfmqkPBUUhezRWy48BxMN+P+011lrWaR7w6KfQxpYJe0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554383; c=relaxed/simple;
	bh=0Rsy20ctkEXTuUbFJ2QSbssdVnjkdeJG/mDaljBum/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DSlUsWohZcBlptdYfR2PRA+nQqEGj2yoTaP7lF1+cALZqlG46xmu3kEcE0dlmNbZZkbOGFIwKP20dBMilrQSmIxzyJrpI+lXXo4t5Db8DZnsBhU1BUswnaJnF2E0tFyXdoZ5Zntbg+Cb5ARL9CYEiqaDE0gOnC5FNNL6IYuHNxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRSClY1F; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRSClY1F"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-138501f8c04so1768153c88.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781554381; x=1782159181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=saDGeFnt31Cq/ume6/7BHto3BEV/oz/g09aW5LaWmQQ=;
        b=HRSClY1FSa1E/uRpu0aSJKKSCgnIINO/mhFMMmiDeoFl3JCTbOjPEW4aPfpCa81VME
         9b0pxIorqDKLLeaadFUCbceQFX+nqmJVzKrQys9fN2xBCUfmtAoodZ0Yy35JaVUqoHlG
         Jd8SEgC/T8NvGD2UpNB7NtmaR+4NTd/aZISX11/QZkKkEVDpfsEB8yzN4FEuwy0GeDbW
         veZCLcxeXbr7986Ytg1IxD4H+pvkcs58CnDyWfODTWdwzToNp0NGVWTVNnZET/zN/hfF
         kVLcpQ9bdWsOSHtuZujWeEqtywTdWUPG/2GT6r1L2MCt5kOlcy/CgGYhpEa58TG4MiGL
         dxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781554381; x=1782159181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saDGeFnt31Cq/ume6/7BHto3BEV/oz/g09aW5LaWmQQ=;
        b=YNfiQGFxlxNyGSGLhhVdojV9SDo4MeRpKULnQyk1bFgp7ibkMyHPq6kyP+4BuD5cL3
         I4ma0ZXpDQVREhTDj9XdNy9I2cMRA1EA5HmjQxK1KF1exe2WvbvK0ALPhkYmLPRS18+6
         xCAlN/RwXqg0a3zWdB3wcOb8luk+GgzB01q0DaN/AKiEFQxzUdVP3ZGttV8gDUtfN2tX
         UuOO8A6RdoWWg6XEdA+Y8AJj7QEq7y9CyH8EiONQzQtmbeVlCmVHEZqiuguD8td2JK7A
         B7evKrjoqNZksuAcRFKtfhz2H36rvoDEaMGWrhh+dtNvRZ71gTdZXOJAszf18lgm4BWX
         t3YQ==
X-Forwarded-Encrypted: i=1; AFNElJ+a3qEAbZHM0VZIi37ZhopMTNIgPcluwJ7bJ3hSQH2LkS/rHoBRebAAHyEPoSsa2ytm1d28a9xhRE/+CF9Kmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxigWodsTcACUhRmSX1wg359Q9H79rCz2OWCdGclGlSiifpQTFJ
	BvJ+1gC+NrtObqLg/08zlscDVbIHQ4uXdSe/yUhRqHp/JJA5xcOqLpQ=
X-Gm-Gg: Acq92OHqFwrBd40EBXPLuXnsc3bKXol2M8lq1V+cDs+ebIPG0O/IacklSe9tMITn0z2
	JV/IBHIUFHhiYOVg6IY25upmHMAp6NInDh9F7HpiHLPIGhhciRALhl+Cg8p9LuE4s5QYHsOlLxW
	5q9brB4IFgtxrH8xipIOaOPTp+t/UnjASXqv0Pl677KMwd8Skh2h0gkMvitSqRlyq+bosk5mI/4
	FmxgsQsbcFiQZzmixNxX5yNwVmUMPuBVhjTRnL5JBUO+LBrH6tkiqUH4m5uQeEvQpTuaE76Jz4p
	F15dPz9f9r9Ud/AyLhc6SznaxGaD0/kL2pG+Mu6DK4JvqRSWUCzU3wiXOhJOpW/1/vueYoYIy6O
	jWIfe5aIV3WUBmjD+gS7rmcy7mK5+qi4IiUecsepjbnvCasx8L7MvQ5bxKq/XPChPUO51BknFl1
	q1DpvEB35IH2vTHHd/bPVzaXVZblt4pW1X1ZkQVNtKXcXOJ8QHPodCu9TU3llEEqPc6eb8FAjFJ
	767
X-Received: by 2002:a05:7022:1e10:b0:137:567:14c4 with SMTP id a92af1059eb24-138707aa18emr5391868c88.29.1781554380814;
        Mon, 15 Jun 2026 13:13:00 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b96d6c4sm11684171c88.9.2026.06.15.13.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:13:00 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Igor Korotin <igor.korotin@linux.dev>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] rust: i2c: avoid locking when calling I2cAdapter::inc_ref
Date: Mon, 15 Jun 2026 17:10:49 -0300
Message-ID: <20260615201141.8920-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current implementation of `<I2cAdapter as
AlwaysRefCounted>::inc_ref` relies on the C function `i2c_get_adapter`
to increment module and device counters. This function acquires a lock,
looks for the adapter in the IDR table, and, if found, increments the
counters before returning the adapter.

In the Rust API, the `I2cAdapter::get` method returns an
`ARef<I2cAdapter>` upon success. Incrementing this reference count in an
atomic context (for example, via `ARef::clone`, which relies on
`AlwaysRefCounted::inc_ref`) could trigger a sleep-in-atomic bug due to the
mutex locking inside `i2c_get_adapter`.

Since cloning an `ARef` implies we already hold a valid reference to
the adapter, the IDR table lookup and its associated lock are
unnecessary. The fix consists of bypassing `i2c_get_adapter` and
instead calling `__module_get` and `get_device` directly to increment
the counters.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260524181151.24988-1-nico.antinori.7@gmail.com
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Citing the second part of Sashiko's report:

> Furthermore, if the adapter is unregistered and removed from the IDR,
> bindings::i2c_get_adapter() will return NULL and fail to increment the
> reference count. Since inc_ref() ignores the return value, wouldn't dropping
> that cloned ARef unconditionally call dec_ref() (i2c_put_adapter)?

`inc_ref` no longer relies on `i2c_get_adapter` to increment the
reference counts for the module and the device. Also, being able to
execute `<I2cAdapter as AlwaysRefCounted>::inc_ref` implies the
existence of a shared reference, meaning that the adapter is still
registered in the IDR.

> Could this lead to an underflow, double-put, and a use-after-free of the
> adapter and its module? Or if the IDR index was reused, might it increment
> the new adapter's refcount while decrementing the old one twice?

I don't believe this situation is possible.

When `i2c_del_adapter` is executed in `i2c-core-base.c`, the kernel waits for
all references to be dropped prior to removing the device from the IDR.

This guarantees that no `ARef` is still alive when the IDR removal happens,
effectively eliminating the risk of an underflow, double-put, or calling
`dec_ref` on an invalid reference.

 rust/kernel/i2c.rs | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 624b971ca8b0..d89c42691dfe 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -426,8 +426,11 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
 // SAFETY: Instances of `I2cAdapter` are always reference-counted.
 unsafe impl AlwaysRefCounted for I2cAdapter {
     fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::i2c_get_adapter(self.index()) };
+        // SAFETY: The existence of a shared reference guarantees that the refcounts are non-zero.
+        unsafe {
+            bindings::__module_get((*self.as_raw()).owner);
+            bindings::get_device(&raw mut (*self.as_raw()).dev);
+        }
     }

     unsafe fn dec_ref(obj: NonNull<Self>) {
--
2.47.3

