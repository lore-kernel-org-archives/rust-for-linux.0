Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC6A46DFE7
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Oct 2026 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193676; cv=none; b=Ubmt2LZ4UJlUP9n7hsMlqvwfSrt32zcoEq8rDgilZlnFIl9OIzd4/b9NvsVAhJRlyfaGwYwz69WqUHix35Z48IT3/zjGPyUDezQkbUlQmFoY7hpjY2wwJhiEsT8GAqWEO4iRJIo+nYNbVZHLs2vsYk8oiYPOWDnHdkhGdM5XN9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193676; c=relaxed/simple;
	bh=28uiTWIIABkfwULio8qpodsyvAtD54gc+3tq5EFHoJM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FGGiROt1jGpMe8AKT67uEoRJC+B/wQiXoxJ9hcts9r/QxAWkZUzWYWdJ30HFtet3qIF3jb+8bTLc2PZ2ailEyBgVyQRzlo7pUIde6/QsSqS4haoJ3SqNjrrUJP//C10z9UeRy4+3mbYI2qnxweG+v/fN2itgs3UU9DSvKZsGLOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ppyv0vLx; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ppyv0vLx"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a165fb7beeso16413995e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Oct 2026 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791193667; x=1791798467; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0jMEn+uojeugEvTLf+dfsz2SFwaZUIeudYt/IVuG/qU=;
        b=ppyv0vLxx9Pp2WNjtrD40LZXZyU8AuYCb5OSo/lIThuYpJRgoSKYvroSFwLDGeudRS
         qXyAQiDE6jA09G2yaRi+jxme41H5WP5w1csEEkMrFYRTNl+laWIfcBpc/rxcAI+szjjg
         uGSKUeCCW6THHI1wfHL+OaJgJPNc3R76RiB5Toioz+6BvBx+X3HE2TttSojJ/8stNGdR
         IrGcylA3IeU2TtCNYh780BDgkTNaX4IiudRSzBDEix/gqyLCpdv8mRZ0sO05MBgLFYBS
         fh3u2CaG/GGKeopTKB7lT3kSqygx6hy9K5l9j9rSjqqqkUOLSdAxvrM7/h9x2yRuTraP
         Q5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193667; x=1791798467;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jMEn+uojeugEvTLf+dfsz2SFwaZUIeudYt/IVuG/qU=;
        b=rwA4N8D/LEqx4uWwWiCDIo7OFi+dNDXJ08bI0MURv5pLY8Sp5V0a0/mUG6NQZipjnp
         nczgIy3kz0zdcKvEcpx/k9mJDOgm4IHbYK1NTdbO9tCIsR0d1wdLlqbxqVdwvBE41WDZ
         P68A/v5MX03iZ+ffaEo0TmGusyI2AMj/828VjZOLS5MX7RkhDtANTaekvA8XCiNYoAkg
         nfI3emg8FZGkoQF9Pkd+46euQLtU5G/DvtYfnYLMkkDoebNhrH9UlZHNSXXkglzBL3TK
         HQlqk8M9i4R0zSX88qsp7L2t7HG/utASG/Nh/Jr0cMH4dAbsjBd4vKv4A/IPhsZwLJR/
         XIHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxP4j5i2WNbLS/3dAfu+mUVfrNsSS2qWHOT/bLpZaqrLfs6gkeVoUynapmMoVB00jikaiW2pjwHEk3Y/cGoCA==@vger.kernel.org
X-Gm-Message-State: AFuF++kq96NHZ3DuZf7zTFx0ltOe5/dsXUSYGy6JhvMSb+bNUPdU9g4v
	FMiU4Y3KbzaQNtK7B+WhrCenOizgwe0guxvYiBDJ0s8BHKy6RcLrrHubYcql7XOobgOnigABq2E
	23KIBZqD/F0YGyqx8qw==
X-Received: from wmok21.prod.google.com ([2002:a05:600c:4795:b0:4a0:2845:31c9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ec6:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-4a02756637cmr181239935e9.9.1791193666905;
 Mon, 05 Oct 2026 02:47:46 -0700 (PDT)
Date: Mon, 05 Oct 2026 09:47:29 +0000
In-Reply-To: <20261005-devres-6-18-backport-v1-0-06dcf0e592d5@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261005-devres-6-18-backport-v1-0-06dcf0e592d5@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2717; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=7I4O+g3s8+7UkGcF3WGN5dLLRIwv6sGTRiTYgZQAeNk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqw3I6z25lJhoxLkMfeGvQ3dP+jgpGUCfhYI96v
 goLu5RRKzeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCasNyOgAKCRAEWL7uWMY5
 Ru4CD/9vz3AJzlCzvqxa/3mkfoBpYmcTc1JCDPk3w1aMhCzC1FtotJKcy2S5mrXiz+rrWigrSTq
 iXyTPoF6/KXur8twcF63idkdC75PuHlvuW85UM76Kz13xd8hDcTrHZbZwBNtufxtT56WZZFEWsS
 YPYwChI67vhUqRLSti8BPuVTWD3dUuuugI+hghsgUR1zuZYc5rmove2UGibFEmfP1YOgt60fsaY
 McUj4+YCthMIrErLl2QF1c3OHNy6YXhwRBvBJpIhU7gZdL4uNGVfBj6iL99iZzJUVXr0Bs38ASt
 Ic0fMzxwZ+LoSaYSFRN+x4ejYoMxKszdmUTBU+wBaNTgh0ODrVB5pEgrf7YdJwj1jZgW0w83sD4
 u7PjT0PiksnaXt74Q35hUm+CTOsp0aPoma3C4qLIqdc1A3XaYMmOJugk5a046CsSxcVwUT6UVGE
 mBcmNycTTLqfQqu4qPrc1GxWWym9FipycnJJNUyVE1p58nVXclWOykaht0Qa66ons3rWHQ8CIPM
 H2f7ojJ433PvM0/pCU5LWT91L21Bp/9vWMwm4kUz1/sXhuTfdkIGxHYMDqrdWx9ktPDcCbJRsSk
 eTmdobXTbNnXYH4sjjt9GAQY+NQbQaDtQSpPZZRxQkZsT2a3QaIZZroW+7qINd3DFWVz0o41v8c 6VKI2tUPiKPW7vw==
X-Mailer: b4 0.14.3
Message-ID: <20261005-devres-6-18-backport-v1-4-06dcf0e592d5@google.com>
Subject: [PATCH 6.18.y 4/5] rust: devres: ensure revocation is complete before
 device finishes unbinding
From: Alice Ryhl <aliceryhl@google.com>
To: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, Markus Probst <markus.probst@posteo.de>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Danilo Krummrich <dakr@kernel.org>

commit a10639966fd72fff8f7fbf3c8e733307daabd38f upstream.

Now that the revocation Completion is in place, also address the
symmetric case. When Devres::drop() wins the is_available swap and the
devres callback loses, the callback returns to devres_release_all()
without waiting. This means device unbinding can complete while
Devres::drop() is still executing drop_in_place() on another CPU, which
is a problem if T's destructor accesses device state.

Make the synchronization bidirectional. Whichever side performs
drop_in_place() signals the Completion, and the other side waits.

This does not reintroduce the nested Devres deadlock fixed by commit
ba268514ea14 ("rust: devres: fix race condition due to nesting"),
because that deadlock was caused by drop waiting for the release
callback to return (the old 'devm' Completion). Here, both sides only
wait for drop_in_place() to finish, which completes within the current
call chain. The Arc<Inner<T>> keeps the Inner allocation alive
independently.

Cc: stable@vger.kernel.org
Fixes: ba268514ea14 ("rust: devres: fix race condition due to nesting")
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Link: https://patch.msgid.link/20260628200304.2365598-1-dakr@kernel.org
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/devres.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 02916f80db5a..fc0d8b2cb7b2 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -173,6 +173,11 @@ fn data(&self) -> &Revocable<T> {
 
         if inner.data.revoke() {
             inner.revocation.complete_all();
+        } else {
+            // Devres::drop() is concurrently revoking; wait for it to finish `drop_in_place()`
+            // before returning to `devres_release_all()`, ensuring `T` is fully torn down before
+            // the device finishes unbinding.
+            inner.revocation.wait_for_completion();
         }
     }
 
@@ -261,6 +266,8 @@ fn drop(&mut self) {
         // SAFETY: When `drop` runs, it is guaranteed that nobody is accessing the revocable data
         // anymore, hence it is safe not to wait for the grace period to finish.
         if unsafe { self.data().revoke_nosync() } {
+            self.inner.revocation.complete_all();
+
             // We revoked `self.data` before the devres action did, hence try to remove it.
             if self.remove_action() {
                 // SAFETY: In `Self::new` we have taken an additional reference count of `self.inner`

-- 
2.56.0.360.g66cac248cb-goog

