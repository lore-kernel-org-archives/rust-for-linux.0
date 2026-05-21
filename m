Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD214014B1
	for <rust-for-linux@vger.kernel.org>; Thu, 21 May 2026 19:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779390621; cv=none; b=dmV5duSFv5oIWQNdUjaM0zm3HHdf94alcvE0p9cWz0EUyww1QpwsMatpIXaLWN2zjeyOXH2fWLpp8Ry2tUq5MGw0y5bWUmPpoZW0mFtmYjWgmvop4hNn8XTEWZ+jy4QqT/wx2+vJUK/T6mhvDghonp5DQZyQ8M2p/D7EUpDBXEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779390621; c=relaxed/simple;
	bh=IeC66QzYgmFdVKKJEHJElgU9lwX7T6fKqEf5JgW/36A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XKxs9NQxJdIOWGZYcuyvq7DrKNJ+K6HCpd2jqv0W62YEKn8FGGg0sCP/uw7gWukQAULVWw623LcE2c5+iTXmuOBcm0SM2LHApeltcXN4bRXb0uOKZqbIqF2WS2yIFCWXskWbGkfFwWqewjMTqLjUfD7oIp2BkfrnAkIStxpLxhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3iT1cyF; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3iT1cyF"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3044857f09aso379929eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 21 May 2026 12:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779390619; x=1779995419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lxyK9xzIpqzjCgzQbXh+agEAuv/W5UG7h+zwC0bxeck=;
        b=D3iT1cyFtaBaaYmjGCyisomUwX2XG6665NLaY/iumrh/+uQ78vOj/0tKy8ZH+ebkSK
         Jjsdha/DVWxeJi/A29B3Ua8ndfK5t7gfvwsTDTpTvYxtRHr9LAV7CWlTMu/kng6H5MBk
         X2nPyNSq85wt1F5r0kQ0Gv7eCeZbtiZ0pzWorKCX1lnCzUM0k2XPi0EYS00LydklUvlx
         1ncrgABUusPXwwb1OnhKiIlW7W9HqY0vm7Kgq5WC0G3b7WsDxBDIfL0y1+r8N2ciOgaX
         uBudycmD8oaZ96B5a66kO0ODIXTVVL4CPi3QvsKujxYmTGR15xtBsbgSNHD2KjjrhfBR
         BQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779390619; x=1779995419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxyK9xzIpqzjCgzQbXh+agEAuv/W5UG7h+zwC0bxeck=;
        b=ShweuofVDseDiCUrAmeJKoNbZsd43Vx7y1tAUg/YQ09aPC3ezvEwqoFuhr4hR1evOL
         Po2cmU5xDbCxVLQ1FGYAMokqC/DUxReqHBvWLrFj4JtJklr7XTwEDt+TkcJnJF7MOJ77
         6cV9dT3bHr+g/oMfYj84h2kZX3MYm+t/SgT4h0ro127yA4HcChwFRGRGnLkcduvDU9bj
         zq75tAjXH7X/Nz8ZxhfWDeMQO29yNOblUlFLWFeWAOyFDBtIFbroOIOQ4zt6cnx+dytU
         e6f1NuZLMvheFZ2p3YKaJ0ng2eI4OHL5D107QDyDqUoT5spXYV+NnbaLy+JOsanDvfT+
         l1eg==
X-Forwarded-Encrypted: i=1; AFNElJ97FMJ05GlR1p59+NiXvDdKq8sVF0N/oMYmFwXx84B8K0dMsdWUXL5rRMgPbL6oxtce1H9/TVRz91T5NG6TOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4nQjt+JzDWlGf4Aacga3Tb42pk4YRFEzhkPhLLMvtxUFlRmpk
	6ARejV74FjRQMiwCHZSQzIwghBYzc8XhzQ+Dh6xGDolka2DdbBMgskE=
X-Gm-Gg: Acq92OGkgzVrXVd5TmSbgjiLLUw6DDlHVR81/kbEAr5QV/skeJooWIv/5eZZTunK7F6
	ihX2yIhjCt/kFL+Q2YaCcChCvOijCwXqP3PZ1ZgRC6pkoJN8P5AnYzbK/Gd1U0kfKKA7ekQzhgQ
	7saE/j3HYZ1nMXQ8zAzmIZTZSAkU+npGuwjBC1Za9uLvCRrkTLx1f2ibRJAeiay3KAT3ntHl+qS
	up7R/DJenWIii0pX8OJAq0TCtNtvBemkqHKYlLJ8/Y2ZZJFneOm0w/mozF0M1AYM/gAmwR4kNnb
	AEPAK/dVvsxUjdik/oQ2RW9IhozmNMR2uAcqoPLaFS26k1KpLw1XUEKiud3y0e5NaKtXpGt8IXU
	xQ3yQw/Af7V47M5bRT9woHAqsc8wfnLMXTLB8hydEn9Ki4i+GR1dBazh6bLER4b8dcwMEAb9iAb
	sgxbMCC+ceohRBLlerM73K8wpvd96hHE4/MNE3tl3Xj2ZKidncxtskE1GECp/b
X-Received: by 2002:a05:7300:ad2d:b0:2ba:a2fb:403f with SMTP id 5a478bee46e88-30449051b2fmr295935eec.21.1779390618669;
        Thu, 21 May 2026 12:10:18 -0700 (PDT)
Received: from linux-dev ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304435c10desm1175734eec.27.2026.05.21.12.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 12:10:18 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: igor.korotin@linux.dev
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: rust: mark I2cAdapter methods as inline
Date: Thu, 21 May 2026 16:08:50 -0300
Message-ID: <20260521190937.248904-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building the kernel using llvm-19.1.7-rust-1.85.0-x86_64, the
following symbols are generated:

$ nm vmlinux | grep ' _R'.*I2cAdapter | rustfilt
ffffffff817ff380 T <kernel::i2c::I2cAdapter>::get
ffffffff817ff400 T <kernel::i2c::I2cAdapter as kernel::sync::aref::AlwaysRefCounted>::dec_ref
ffffffff817ff3e0 T <kernel::i2c::I2cAdapter as kernel::sync::aref::AlwaysRefCounted>::inc_ref

However, these Rust symbols are trivial wrappers around the
`i2c_get_adapter` and `i2c_put_adapter` functions. It doesn't make sense
to go through a trivial wrapper for these functions.

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/i2c.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 7b908f0c5a58..07f9fd53c4e5 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -397,6 +397,7 @@ pub fn index(&self) -> i32 {
     }
 
     /// Gets pointer to an `i2c_adapter` by index.
+    #[inline]
     pub fn get(index: i32) -> Result<ARef<Self>> {
         // SAFETY: `index` must refer to a valid I2C adapter; the kernel
         // guarantees that `i2c_get_adapter(index)` returns either a valid
@@ -416,11 +417,13 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
 
 // SAFETY: Instances of `I2cAdapter` are always reference-counted.
 unsafe impl AlwaysRefCounted for I2cAdapter {
+    #[inline]
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
         unsafe { bindings::i2c_get_adapter(self.index()) };
     }
 
+    #[inline]
     unsafe fn dec_ref(obj: NonNull<Self>) {
         // SAFETY: The safety requirements guarantee that the refcount is non-zero.
         unsafe { bindings::i2c_put_adapter(obj.as_ref().as_raw()) }
-- 
2.53.0

