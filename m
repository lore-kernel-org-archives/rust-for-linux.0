Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686549;
	b=OfAnlRL7thWx9EUSWCIJikc1qwM3rXT/I7N3NZl31ernkakAxCC3vfMhdEVx2xLkjeS6
	 1JlBMCurfejLyKCaUhyef0KkMqkfBClbJwsMQxcOaung2jU6YbIxSusnehMkahzOKLOTH
	 SVCmxY8qGXlYJgritHtc7YDj0ppjbHNRNlcvGkj7ul8kGkWOfPn3Bc9ZlWY0XQmIAc/qO
	 SQ2Tlmx7eEOz5+t083gDxGlowOEQvcvnd+owQjxC/o+lOMiBO+r61R/0aXKGnCEFUZxor
	 mnKup4trLGoYj67u1kQOzTLeQ+NlIVPbIbb0frFWpAt222hS6KIE7etUlKS9us9VcgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6dZB05s8L/xa0x/oyJAw9mH4rJKsN+Tc+ttIJvUQqrI=;
	b=OmU6vPXnAWo7tZ4JaLEb28jFoEmzx2GDyLKCy3lDWapavP0xcq02/ApF4UBxcgoqtI5D
	 yqretdT06vCWYymbuh7mEZQMyprrJdkpJ1vVC6m426zqBxPW0LF177O9T/cYlX3Zo0YP7
	 oCKhWj359QjL4nRFI4FTmuzcvVynI4H4fpjF2li2IPVpuODa426kLw9b29zuDxkcYU4TI
	 tmaHCKAZM0trJQsKZiBV4BfkvaONTFp/XPo7Vk+XOoylw7qW2VwYa6MMO/ImXoCz0OfW8
	 xQWoawEEnhD/cs6776C4OhmRhWvbg6JwvjO1L5gkCJAlC7DT2LBJHwe8xILtA/bhY3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fp8N7lzS;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063F7606A31C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 09:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 063F7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fp8N7lzS
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so5614568f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 01:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795686547; x=1796291347; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dZB05s8L/xa0x/oyJAw9mH4rJKsN+Tc+ttIJvUQqrI=;
        b=fp8N7lzSwrTu/9GPaWUsM5v6iLg4AYau+nLme97eCrNL++BNkEGNvfPrHaM/vo8F5K
         zngzStknlQ39jD6B8t/1rEsrX3bQEkCXS5uLIqMsLhiokK5y2lix7nuFXu5yLQoUB7W7
         0VxwKSzVoWLhFol8y4egya9cJq5IyRLs7DdtQDJu2hZGpjZTdguc7EP9m2STIMgFKr2M
         A76B4LRPHMf1MkfJMqtlO6gbS09zd673Yd8jZzy7NIq/jaYMYsKFqzjvF/iuUhH30Hx0
         X3YlO0Q8STUsOAcLCgUytAoVjidvFIBQVetkHbV726vp4qltv90sMoT7ySZOPEuo8aQV
         /UQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686547; x=1796291347;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dZB05s8L/xa0x/oyJAw9mH4rJKsN+Tc+ttIJvUQqrI=;
        b=Nq1huOfywkN23ZaXJdIT2/0O8tauZkZj6O10OwVnrxhoMuQo9u5slIwCWySAT89MYd
         rx3bMlPSb0hutetDQ0dIwlxW1v5b+vIhySxme5mCaJJncxRA1QByApTqrACjsAuwnKlz
         y42s10ZYeIOFWo2yZfXm5rJA+fbp4xTp+f0XMr8tv7L5vfQyuNSF6cN0g46iBJvoCxLy
         jIMhDbqaqErQPkEK6VTMQlbdqRO2E7XgcMLJMSnylkJBRK7JZqQw3aRHmJPutj03lJYJ
         mwoe4YC2cOc9P/1c6cd9nB5uD2cQLE2kzWjG3hOxtCjVt/veUe8lvx/gr0aTgFlAkhkO
         rWYQ==
X-Forwarded-Encrypted: i=1; AL+hErGG/U49k5PhBgBF4vlxLXDGS8/aEYvdSPfd5bSEiuVfCwQT72kPAIdUKIwtGzc8HWGolAv6sZEo54FClBBVRw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ufL7vly/JhEarO1sZXA445e/jsx3F5k2q3ZAKJhX+QZj5lave
	15PYgPVNqIocipWF55PHVANXIeHGLPfV1PEqL3UdgiZsnhOQx9LFOynrILVc0ywmy6+TvnAjbOC
	ApcF3lHzLoXMk71ja5Q==
X-Received: from wrn9.prod.google.com ([2002:a05:6000:2b89:b0:4bc:7f09:ce4b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4b13:b0:4b7:75cf:44c6 with SMTP id ffacd0b85a97d-4b775cf4568mr15049720f8f.11.1795686546960;
 Thu, 26 Nov 2026 01:49:06 -0800 (PST)
Date: Thu, 26 Nov 2026 09:48:55 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIcACGsC/x2MSwqAMAwFryJZG7DF/1XEhW1TzSaVFkQQ725wO
 W9480ChzFRgrh7IdHHhJAqmrsAfm+yEHJTBNrY3xvboWAJllBRUSUyYKeLUtYNzo49DaECvp45 8/9llfd8PQ0bDNGYAAAA=
X-Change-Id: 20261126-binder-node-info-ref-9547bb8cf7d0
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=R1LORDAvDp4NuZMtOtb8uChUQIctktLSNQnXbs2iwUA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBrCACNZiRU0nSs9sDT2DUVGV4ZLL/QnKSo4b2oK
 DeWPZw/A9KJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCawgAjQAKCRAEWL7uWMY5
 RiwrEACO59M8fGBM2i5vcu9N67sYCetcAHUCfazpxOxDoUzho91GoPYdOJlSf/iePnmZX/oWStS
 jNHbZYD2GBseA2vwPdHeQHgMT67bVPdvmOVmXmrDG6t0GrTsrcUarwo8MOtnwllJP4N+RM70hYg
 czzdEWhSje3Ie/9skQJa40X9LUUVSIegAiiYLeg8LwjQTelwlLwou2oXd1eGfd/w1EpxQeQsM/W
 42NGjkfUgrUkrMdOWUudR2jwjxSkueatQv8FHhTVUGpHq2Rs/6YPqCFi9ehGJLG9z12Wb+X8eQz
 dr0aFQEYNSOvI9vYM5LeKTLTPsVikLCaPdIxt7bKAU2FL2kDaObbVqi3IJiqoinK2LiWyrAFbzV
 KvD/yt0Ytomm44jD0RZ112iWw8tfoWz6tqVoraMeNWsNgsO8naDqwAUjAm+JBTwQa3cZMh8+SFP
 FmfNBIntjc0eG707t8DpYsuatvWy8HdRTxlASFqPfd6X0SwhIMXNWfCr8QVWY4YnZqhwYreG59Q
 je3QSvArrs/7y6v5zEhG6rh9rBhjlZCjLu9G8n8h+SofGqqgmmrdUAMVlgBxUuw7nYacqbTpMAA
 Aj+DZ0UfCjfHfj67z/xEo5K1FZWzb54CR+nMsh4iUh0ef9+XkiPaptWxZ/tLK9+JjxoWvtXiHU1 /KUa5HNPkDDdapA==
X-Mailer: b4 0.14.3
Message-ID: <20261126-binder-node-info-ref-v1-1-efbc97174846@google.com>
Subject: [PATCH] rust_binder: validate handle in get_node_info_from_ref()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

When servicing BINDER_GET_NODE_INFO_FOR_REF, get_node_info_from_ref()
returns ENOENT for unknown handles and succeeds on handles that only
hold a weak reference. This diverges from C Binder, which requires a
strong reference and returns EINVAL in both cases. Thus, return EINVAL
for unknown or weak-only handles in get_node_info_from_ref().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-756a00e6-8404-4b56-badf-e15ba0bd93a3
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 1f4cb43f1de6..ece319f52b76 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1248,8 +1248,12 @@ fn get_node_info_from_ref(&self, data: UserSlice) -> Result {
 
         {
             let mut node_refs = self.node_refs.lock();
-            let node_info = node_refs.by_handle.get_mut(&out.handle).ok_or(ENOENT)?;
+            let node_info = node_refs.by_handle.get_mut(&out.handle).ok_or(EINVAL)?;
             let node_ref = node_info.node_ref();
+            if node_ref.get_count().0 == 0 {
+                binder_debug!(UserError, "tried to use weak ref as strong ref");
+                return Err(EINVAL);
+            }
             let owner_inner = node_ref.node.owner.inner.lock();
             node_ref.node.populate_counts(&mut out, &owner_inner);
         }

---
base-commit: 277f222cf565a408c604a3aa6b6b152eec2e6b60
change-id: 20261126-binder-node-info-ref-9547bb8cf7d0

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

