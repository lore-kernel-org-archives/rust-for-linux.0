Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792441316;
	b=O5ABwgZeIDjIxwPHBPbO1KzsxJkWotBERoC+6EmkUzI/76+eCpLEXOiraFFNjALdmQJf
	 7EnbJn6Y1jP52K+9M235ySJr7d7geWKlqthEKvps5yVvQ9N20o+oL3ug9RecLAiNsbVLH
	 wo8qS5n5Uq2zRf65I0vxQhwwQOZL9RDHnT84Z8me+c8aOXWd9IoI2oM8iWqvNqgSd3m1p
	 EPfZAkOhxnX7++IFtXZ6jn7lq1MoReHONm//IGNZg171hhJwqkVua08yLPOsmYAYhz1oj
	 AwtVnv9BGymYRQhS4Eifp6XyNqJMJSyUSnKtb+rSGuaBkAXL71NtKAZQyOBQHTC8K0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441316;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7VYnIXfCSv6xxZsw8JvqiB9mqwVvZczWMP4cvK66K9s=;
	b=z/ePTw75LfPAuV2Vz2Xudqwlz8VVyTItg/yFnAX8ibRRYFfJntMZ5c/fHKtexPPgnX2g
	 b4OdA3MbcixZ4l7PCH/ATi61ur6Kg4bHPJkroQM2+afxrk+hyphfthM0PXo9wAhkNNI8r
	 pavPVxiP3SfKPOh4NdpnAm5jxeOMFRjdUdJDynNkb3q4L0aJVB9zMXkUBROalbVu75Sy5
	 UEApJLLfEyULSgCzvNSyVzEN7pknxRJzam2WcdOvz82i/BW4+Mz1yZc5dc0YOpVxJvJDz
	 Ad213Mw+EPyPILuGRJu410Xx4bWgckHyTv0ROzWDt8gPMcGz8kNdRdYEnfgZO0MUE9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhRRTN08;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6E8606A319;
	Mon, 19 Oct 2026 20:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhRRTN08
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792441315;
	b=D1pqlhMxghlOWFj5PCc1ka/JlwaeDQOqOjjYVUCmekrA8s4uoJ3GBWW/EV9tnpzin9xb
	 0Nd80lhxkVkZiI7FkUb5CDCVgQxLO0uxuq46JYp8KtzlMnERbPWgOhFfvloU4Gb+bjpAB
	 NaLord4ot6v7OBVNVcACpGsXbBeiIa9XhBcPzCQearjcX9CyAaqB2yIjioJSc2Vj/XrGf
	 Pdi0idZns3jLeKJTHf+XQoNJ9vyJJ2kz9kUfGk9wGC9JsHv0xbnTmY4cBcPBPrCYFoUiK
	 qhcTwZTGYPuAoOStLACT2rIVNownkD1aItS8oMC5irXHHeP9okamJxxsudBXR3hwUhQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792441315;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7VYnIXfCSv6xxZsw8JvqiB9mqwVvZczWMP4cvK66K9s=;
	b=fXhX8Zxp3uAvdulzXeSKuJnYfqyEPVFdpjcLZhzVydLfTtTZ1fVSKkBdJ+P9uD1sKtlB
	 72KUD6dnRyN2a8TYgRrCj6EVXmtzYSf5F/cFz00Y54X7jYhDcQfhmp9MDbb/y1z+x0oT0
	 JJIlJPS60XFrbxeUkHvnYKE9HhPsBovmLMA8mnsc9H8XepZx/0lQt3V/HS/E9NjJpCeSc
	 8Bt9BUoAnxcY/UT99WcbBvGAY8fVX1VuFHKW/CfRNtF1xdclvdqgCs+btKa3gT9Z94Shj
	 RCJuWa5tVxaD2IU65/GePALDkYKl9u4ijwrovMVQnLNp++EwUEGHhoB8QMrUnwsbdwg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA0971F000C4;
	Mon, 19 Oct 2026 20:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792441315;
	bh=7VYnIXfCSv6xxZsw8JvqiB9mqwVvZczWMP4cvK66K9s=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=FhRRTN08iEZ7teJDbFLL2EvKprW9B5FS0KC0K/82+9QelUdHO3x1Dtz3fb2aJb0h0
	 jNge7QOw6mekO0RFYcD4al1wwavyFs0fGitrvhiTFtBFUhj7Totmq7ORRe/rk9WzRB
	 UNPCfrZuO9kJp9EgvjHhNWbCtUe8HC3/xuq5SS/UPKaADvX2C7hzIqln5TvBtGe/se
	 RkbNHinZhBHpIlCjodKt1o/AxodBKtKbapSh53J0Me8XR8d+VQHvjpyqPMmDfE3FA3
	 +tL4KAdYCzIedI5h+eaynT2hfNWgeyye7j7+F8EmUwAtCp6hk8lQ37ioWlsI3KVS+g
	 F5EByhja90VSw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 38FC940596;
	Mon, 19 Oct 2026 20:21:54 +0000 (UTC)
From: Sami Tolvanen via B4 Relay <devnull+samitolvanen.google.com@kernel.org>
Date: Mon, 19 Oct 2026 20:21:52 +0000
Subject: [PATCH] rust: drm: gem: shmem: do not leak pages when sg_table()
 fails
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261019-rust-shmem-fixes-v1-1-3f7f6de5b5e7@google.com>
X-B4-Tracking: v=1; b=H4sIAN971moC/x3LQQqAIBBA0avIrBtIhdCuEi2sxpqFFU5FEN09a
 fn4/AeEMpNAqx7IdLHwthboSsG4hHUm5KkYTG0aXWuP+ZQDZUmUMPJNgjY468IUrB8ilG3P9Id
 ydf37fiLu4TtiAAAA
X-Change-ID: 20261019-rust-shmem-fixes-3a838ada39bf
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150;
 i=samitolvanen@google.com; h=from:subject:message-id;
 bh=Zr7vQwXA9E8hmZ2MFtEBon9gBEwSUz6LGsU4RyoehDI=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnXqh/66sV7me2K21Ap8fxBQcQl3qbl+9uSjvM/+BAUo
 vkqQ1Wwo5SFQYyLQVZMkaXl6+qtu787pb76XCQBM4eVCWQIAxenAEzEbg/DP9XdK03VPWOeTj1v
 FhWx5Xi0cA6vbYffi6OiRxVuSh4tnszw3/F8r8CvXVpTOrNWyzqsZryX+ldn7p3uLWLK2Rd/HSx
 O5QcA
X-Developer-Key: i=samitolvanen@google.com; a=openpgp;
 fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Endpoint-Received: by B4 Relay for samitolvanen@google.com/default with
 auth_id=1242
X-Original-From: Sami Tolvanen <samitolvanen@google.com>
Reply-To: samitolvanen@google.com
Content-Transfer-Encoding: 7bit

From: Sami Tolvanen <samitolvanen@google.com>

`SGTableMap::new()` takes a pages reference and maps the table before
`Devres::new()` allocates. If the allocation fails, dropping the map
frees the table but keeps the reference, and the next `sg_table()`
takes another one. `drm_gem_shmem_release()` puts only one, so the
pages leak.

Take the pages in the initializer, after the allocation.

Fixes: 616c229ab010 ("rust: drm: gem: Introduce shmem::Object::sg_table()")
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 rust/kernel/drm/gem/shmem.rs | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index a687d46d170d..72e4af3b0503 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -555,15 +555,18 @@ fn drop(&mut self) {
 }
 
 impl<T: DriverObject> SGTableMap<T> {
-    fn new(obj: &Object<T>) -> impl Init<Self, Error> {
-        // INVARIANT:
-        // - We call drm_gem_shmem_get_pages_sgt below and check whether or not it succeeds,
-        //   fulfilling the invariant of SGTableMap that the object's `sgt` field is initialized.
-        // SAFETY:
-        // - `obj` is fully initialized, making this function safe to call.
-        from_err_ptr(unsafe { bindings::drm_gem_shmem_get_pages_sgt(obj.as_raw_shmem()) })?;
-
-        Ok(Self { obj: obj.into() })
+    fn new(obj: &Object<T>) -> impl Init<Self, Error> + '_ {
+        pin_init::init_scope(move || {
+            // SAFETY:
+            // - `obj` is fully initialized, making this function safe to call.
+            from_err_ptr(unsafe { bindings::drm_gem_shmem_get_pages_sgt(obj.as_raw_shmem()) })?;
+
+            // INVARIANT:
+            // - We call drm_gem_shmem_get_pages_sgt above and check whether or not it succeeds,
+            //   fulfilling the invariant of SGTableMap that the object's `sgt` field is
+            //   initialized.
+            Ok(try_init!(Self { obj: obj.into() }))
+        })
     }
 }
 

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261019-rust-shmem-fixes-3a838ada39bf


