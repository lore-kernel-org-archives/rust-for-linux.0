Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6690C12D1F1
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 19:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779824868; cv=none; b=IG/687tv12R0jESWj5PBeVWYYTgQKCajaNgm4S+ir8sDNuZJtzgxAlrA8s+skVwUXZpJEOjWYCPsWO2xf0j1dN6QmqGHrW/EqrBei14xiTNHG1BYObvUzllZs3DNhQfWeUehLS3G/7v6buThcJVl+shjBv2UlitZueTAKYM4qt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779824868; c=relaxed/simple;
	bh=b/6M3t6zgpKHWKeqiCxOD4da11OGS04/0/XWAp+5W+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sYr2ZrsfRqaLhB68HvHdo8GYXF8wS7EyvBBoRTFzogyO0F3OJAmmDCmlLjpNG/QonaHipEQpxGGwU1Oz0ZJFmmlJ9GzpBRSdWZuViRq8iT06wQTA7YULi2d+214qpyhqdMD9cPUajVuJSEFeNX0KFcqT91mhuCU4bNOM3eFGsSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzUyb8r1; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzUyb8r1"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-57513a91514so3682179e0c.2
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 12:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779824866; x=1780429666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hlze5hdsepZaytQ8U+U6HGWJPcTingin6A/UL10jrG8=;
        b=XzUyb8r1+ixMDW74zv5/njWOJsBH4uZ8e0ugn/3YZ+qdt0IhRkOOTHp5nByu4xJcvw
         StlzEr0hUrGYxMP1+HWHSyg6WezhsA2X2oOA3VBQcsw09lmjR+PIhmkc2Gi886xOZnHt
         bOFhM6PV3xawU5/L3y1hnn4hwxmzZj2Prc4AkmSvPDnS+cb19O69QS3ukH0iYAPMspY7
         QVripwONsi5jSJdUeeseXUNdP/8hw8ZmilVVViLLNi3Ytlv9s+SmLBcylnhGA2Y8W0eh
         cIPvyGB8SUUsz9ItCtbyEGLno4kCVuEpb1SB9uo/zcnPiPoSYu1n+EHmFHStImF21poW
         mcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779824866; x=1780429666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlze5hdsepZaytQ8U+U6HGWJPcTingin6A/UL10jrG8=;
        b=s0vWq/ZX0OMy86sATbsm+l7OdYW1fFZ9sh/exgbf9X9Y5kYyRZgvc/Y0DBcuAzr33i
         dqaiixYeUJlsWme1icTnIx3VSnZ/HPOxL0Umw00p7oj1QdO3QyT3N4Z0UdjFNatwVFgD
         E2AmjfvP7p8KvwxCHgxnAfn0Jjc7SWBTVLKssjGUYcVxpV2c71NnxOEfkp+vJ9Knsguv
         3QETy8qKt+f0eEAWx6M4arFk86HZSL1W+EBSkcBrvilgJ+kPkf4yalp3bZKj9MjL8uQK
         3GmqMGHMy0QLaZJxCXO+0069fbvsTTFm5vZeMHzm+tF7IseaOXjhMlFK5pmR4vndmKMr
         N94A==
X-Forwarded-Encrypted: i=1; AFNElJ+C8HTrQ4Gl82VyBKm6ssTMjRWV55CnHXaq2kSSjsVLI2wnNqXPYCTwVKLane0rQ/KW8aOVm3NkunxCr9fDAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyosMduyjAiGD5fqQfagWnyJxUwVPtNRKnxvCvMj3B89ktOqIAD
	dgx8nc/jGw1lKjtQsmVL85zvjQRn7XCckp8FAkPs+Xn2cm+G+hHt8ps=
X-Gm-Gg: Acq92OESedSCAY6eNIOd1jasJ28XqZVZkM0Euyf0fgasgd6itd2I9u48wo+jwpUR2K4
	uEsiMaxS4UgNLWWSL+lL6ZHKDKQtrfEJcoI1kgK7rukZKw1VedURHcjBCYMxbihuaxKC4owykKW
	mD7b2/vXXtW456AnhwLcSXl6XyONr5h8X+d79RKVMlyJujx3HPLtXYF3VRnC8vfcXe70G+CX0Cr
	Ts+eRzHEgc4vPLHZjzXlbXfbXLSj+VD/h3G0qglkjYOyhF2uXZxuCOVJLmiuVwS1IrnJD60YqEg
	SVK49d2LaMWzQIlUR5Uqt0wOLNVLnhAEnjb1P+8OStJPOzu2/8X/pRZ5F1N/3X8sgUgrR2MA0YF
	/p3Ka1LJCHS+euAdfomlDNKY60pLi/slP+Qt2cSm9vFyGNDHmroJxot32rVUrjnCh+MkuSkVSZ4
	4gbJ7MeVR0WTH44fvinrMC6SLzSl3pxTPVXPIYq7pxjEl1Qhxbz1ci9lSlasoa7wr+oNDF4q4=
X-Received: by 2002:a05:6122:1796:b0:56c:db8b:504e with SMTP id 71dfb90a1353d-58663966692mr10651268e0c.13.1779824866223;
        Tue, 26 May 2026 12:47:46 -0700 (PDT)
Received: from linux-dev ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f8f6cd40sm18487330e0c.16.2026.05.26.12.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 12:47:45 -0700 (PDT)
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
Subject: [PATCH v2] i2c: rust: fix I2cAdapter refcounts double increment
Date: Tue, 26 May 2026 16:47:26 -0300
Message-ID: <20260526194734.14378-1-nico.antinori.7@gmail.com>
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
unconditionally calls `T::inc_ref()`. This leads to a second call to
`bindings::i2c_get_adapter()` inside `I2cAdapter::inc_ref()`.

Since the returned `ARef` will only release a single reference when
dropped via `dec_ref()`, this leaks one device and module reference count
on every call.

This fix was suggested by sashiko.dev.

Link: https://sashiko.dev/#/patchset/20260521190937.248904-1-nico.antinori.7@gmail.com
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Changelog:
v2: add missing Link tag to commit message
v1: https://lore.kernel.org/rust-for-linux/20260524181151.24988-1-nico.antinori.7@gmail.com

 rust/kernel/i2c.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 7b908f0c5a58..ca6476cf4399 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -405,7 +405,11 @@ pub fn get(index: i32) -> Result<ARef<Self>> {

         // SAFETY: `adapter` is non-null and points to a live `i2c_adapter`.
         // `I2cAdapter` is #[repr(transparent)], so this cast is valid.
-        Ok(unsafe { (&*adapter.as_ptr().cast::<I2cAdapter<device::Normal>>()).into() })
+        Ok(unsafe {
+            ARef::from_raw(NonNull::new_unchecked(
+                adapter.as_ptr().cast::<I2cAdapter<device::Normal>>(),
+            ))
+        })
     }
 }

--
2.53.0

