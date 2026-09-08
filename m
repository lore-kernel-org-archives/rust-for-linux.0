Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F308B3B42F8
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 20:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899551; cv=none; b=OBjN2Jja2bkKTiIhzfviBLXFd79PGTc51Zb2p8hr2JtthA0WXr+t2v/Zs3JRq9a4G2Wm8/iI3r9LCShk+Ff0O2Krbith1XAs5Gj9aAtP8mvUfn/p+2BQUKWyUKxfX62WSh7oB7BEjL4+t48otEB5CLtH4Q8j1qXbLrR2IukKf3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899551; c=relaxed/simple;
	bh=FWhpj9vK1Ldc5YrEXaIJia5AF+nsKyUciE2D2XEf6lg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k5+ARhoNT7hVhEinIDPW0T9mnM3lztiRfQHCdLVFm86e3W3J1GjnzpmDPpzeujSG0IYB+NsuqqmlydC9Dn8QpBVdPYjsDu6WXbs2cbQ1hcpcn8Z1Law3qAxbmhpL9jdp973lwB5LzSqKyQE3pHRDD9VptCsANx8ax8n2CsRI45s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oXwrG636; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oXwrG636"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53091987029so18076071cf.3
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 13:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788899549; x=1789504349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=za+wuIfq3+qQspCDNaDw17t8tpWBTd0I2bcbC8c7q5Q=;
        b=oXwrG636T4NN0xTsDqgj+W1Ps/RSgKbz25+2lAyG2wHA0OruGipGyPyngDjOW2WlHJ
         U/oa1WJs63UvjGZGx1iy6ktfvAh+GgYnggYPxEFtKZzBfGe5LP5uVwh+pcPLjdTZy9F6
         grDYdsFRDOhuDfSusHVPRJmuV0A7n1jgvG5W424bXhXW05uvwX5eTCQUTK1h5ANE5umA
         alD4mAr0k2aE6kAKPn6mSZqiHRegOr4DOs32MwFGgSK9RUY3P0MJhFvrOY+92+pMPY0U
         lPEmiLf2x+Ggus/VjYj6UTXgnTYrr/bDrEkXMe4dsHhWUsmbBQGpjFLRxuTIUOjF+dS3
         67GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788899549; x=1789504349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=za+wuIfq3+qQspCDNaDw17t8tpWBTd0I2bcbC8c7q5Q=;
        b=dFEmycLL79p1FBg0PU5hS+PfPUAQ+/3qTrSOP/SC+AhUXLyuqArE4wQRCFlOKiXnJb
         x0RjIcAUNTLVyUXEtpeQVIeuUuVMJEdqy/Bnoihqc6v1TbWjX4j3flOviJsZfJPHTuYZ
         PsDxUiA/pkOdANuewhMnJTMK4myd7n0KWIr+vOylu/Bo2amSKmasm7wVtfHdtHgWb6IK
         SWN8xoRFNjwgCVvWBbAHHfdzda6HgJX6x1M16ED4JJnJoVUFAtcZ5hM6spBFF6c4jKrl
         9+tHUT0tTDrTa7WFNFCSzUv5x8NkcR9yA+WE7y6vl1EiZ+ACRe0+Rf2nzaCZlCzydlbE
         dJew==
X-Forwarded-Encrypted: i=1; AKwUvBzW7EYMJFejE9slHKKbXYf2H9yjgfQ1wk7in1/gxTUIg+1+n66hKzMcCzODLeA8J9NhufzAEBFO2BBz/qd/Xg==@vger.kernel.org
X-Gm-Message-State: AFuF++kcx1+Xm3tvHnvs00SYJOTchLZ3EJmTNUDaFGJT7Z/AD2CGEXNj
	yHBSWG/+5K4YjKGaJ/5olJro4DpyM4KCq/g5LvXAUSNTJm1narKtmCZZ
X-Gm-Gg: AYBFou0qgihprRsVnvIWKGRrr2ZToDRAq9sz+h/sz7VKHfmJQYHMrk1lx00JZ576lVr
	XOwdwcXPMw8nlJhbwNwiYXZrI3IuD8ZHCttTQFcnwRS23pXdDKNLj1oMyDME/JTRAwBLVN5bYD0
	kmH0MBCQKbgOeBL1QciiJmUmLbuRVPhEZPxaSr0EjTeYChg9Q4vSgKEGBUua9rQnjpznmq6egtr
	J00cwy70E/yh5Kvy/sLs+cwN9zWLPsYnFqGQH4YKmbfZhvXpHZTsfPedUq5Q7o/tre/OpZ8ngs2
	pOp/7fVUGjfYX3GjS6NEMvHbkWIawH/H11hvf3UzgCiyTc5LYSpl0KRjdDjKO+gIjPrSQqQVe60
	Fqx+HPecZDJpROp67bzRfXoWAZ9BOG0jZkrLPkP7upQa6Ec48X9QVWlELApT4qpOTxNyMQw1VTi
	9Mbx2mWBJDYRXF/ECIVBU7VvpaYddacVNi6Q45tiD6sZOj1RoRgzTlUftLPNAj4BaOMInzdw==
X-Received: by 2002:a05:620a:8ac7:b0:936:c026:be61 with SMTP id af79cd13be357-9398036fbbcmr2132977485a.13.1788899548747;
        Tue, 08 Sep 2026 13:32:28 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9f4b3csm1219948385a.5.2026.09.08.13.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:32:28 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Eliot Courtney <ecourtney@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH v2] rust: id_pool: document panics in `find_unused_id` and `release_id`
Date: Tue,  8 Sep 2026 16:31:57 -0400
Message-ID: <20260908203157.1271219-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`find_unused_id()` calls `Bitmap::next_zero_bit()` and `release_id()`
calls `Bitmap::clear_bit()`, both of which panic when
`CONFIG_RUST_BITMAP_HARDENED` is enabled and the index is out of
bounds. Neither `IdPool` method documents this.

Add the missing `# Panics` sections and state the bounds requirement
on `offset` and `id`.

Fixes: 2cdae413cd3e ("rust: add dynamic ID pool abstraction for bitmap")
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
Changes in v2:
- Use "within bounds" instead of "in bounds", following feedback from
  Alexandre Courbot.
- Add Fixes:, treating the documentation hole as a bug [1].
- Link to v1: https://lore.kernel.org/rust-for-linux/20260829153442.20799-1-georgeandrout13@gmail.com/

[1] https://lore.kernel.org/rust-for-linux/CANiq72mgZg-QBy4gwzHmD4gJm4wScktfpdDtyZt3Zijk83h2CA@mail.gmail.com/
---
 rust/kernel/id_pool.rs | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
index 384753fe0e44..ae6960d7f638 100644
--- a/rust/kernel/id_pool.rs
+++ b/rust/kernel/id_pool.rs
@@ -224,7 +224,13 @@ pub fn grow(&mut self, mut resizer: PoolResizer) {
     /// Finds an unused ID in the bitmap.
     ///
     /// Upon success, returns its index. Otherwise, returns [`None`]
-    /// to indicate that a [`Self::grow_request`] is needed.
+    /// to indicate that a [`Self::grow_request`] is needed. `offset` must be
+    /// within bounds.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `offset` is out
+    /// of bounds.
     #[inline]
     #[must_use]
     pub fn find_unused_id(&mut self, offset: usize) -> Option<UnusedId<'_>> {
@@ -236,6 +242,13 @@ pub fn find_unused_id(&mut self, offset: usize) -> Option<UnusedId<'_>> {
     }

     /// Releases an ID.
+    ///
+    /// The `id` must be within bounds.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `id` is out of
+    /// bounds.
     #[inline]
     pub fn release_id(&mut self, id: usize) {
         self.map.clear_bit(id);

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
--
2.47.3

