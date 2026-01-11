Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D73375C5;
	Sun, 11 Jan 2026 12:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768134438; cv=none; b=kGHOxnS8rUjQ4ggD0pJpxi/6LYI4Sh9FUsmXRXbX5dL1MO4cfy/3PcIMuvC4T2CbkklrH4VAq/uoO/sUDVIduIJMMPbYMYpxIoQ9UaHFhPwradWb5zU3uSd/ecdWqDJ0Vh1AZ4aADn6pnkcSsAYwambFYNvU5PdVldSJ7OsPL5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768134438; c=relaxed/simple;
	bh=WVeCdo3geBEzEQSs4Z6UmGlUHl9PO8pLOjxM5MDH1a4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gLrYvNrxbwgRKnhoDvbX2uzI769EiIKP9FwKeLPJ5SOa5Gm2+IKoIcq6ODAEwZhmNKgH18w6Zh8lPxT+DIbgHqVYlUowNPU4NWW4HvBZKW7tiSH+ZRL+66qnMC09QSXLo022LlPgoKztB8up0g5VoQNVmyLBGPnLEsr/FSyIKRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jxq5FkFV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jxq5FkFV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2B6C4CEF7;
	Sun, 11 Jan 2026 12:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768134438;
	bh=WVeCdo3geBEzEQSs4Z6UmGlUHl9PO8pLOjxM5MDH1a4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jxq5FkFVKb8/q/2Chc9Qw6IuPifkj4apfcX4dQUbuwKRIyEZ9SM5vjIuTGNVOUan1
	 2m+6cHHXfU5r2MqXv+HUe1nz8VTONKgK+NenoefVkR51edOofErsmveYsR2DFIda36
	 dEYHiT3hQXtwIVaGR4fu7xrCFusa/pZSwPMBsKHAEzUKtYHsHFxh8r3S+tvFePvwcK
	 uRK9V9BdP81aLCQddOxyAUU7uZBwsgB20HIES0m++sv4u6hSVnATrzuQwBAglC1PKk
	 gyoF8xv9vyPP7Ra+Ej6cjqpgT/71vOK/4TcEr+tnLBtvaS79l/SB4o6CvXZ8b65Cyi
	 ZXmc7RAw3P3Bg==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@Kloenk.dev>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/15] rust: pin-init: add `?Sized` bounds to traits in `#[pin_data]` macro
Date: Sun, 11 Jan 2026 13:25:06 +0100
Message-ID: <20260111122554.2662175-9-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111122554.2662175-1-lossin@kernel.org>
References: <20260111122554.2662175-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `#[pin_data]` macro uses some auxiliary traits to ensure that a user
does not implement `Drop` for the annotated struct, as that is unsound
and can lead to UB. However, if the struct that is annotated is
`!Sized`, the current bounds do not work, because `Sized` is an implicit
bound for generics.

This is *not* a soundness hole of pin-init, as it currently is
impossible to construct an unsized struct using pin-init.

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v2: none
---
 rust/pin-init/internal/src/pin_data.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 3211fb522330..b35953b2daaa 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -228,7 +228,7 @@ fn drop(&mut self) {
             // if it also implements `Drop`
             trait MustNotImplDrop {}
             #[expect(drop_bounds)]
-            impl<T: ::core::ops::Drop> MustNotImplDrop for T {}
+            impl<T: ::core::ops::Drop + ?::core::marker::Sized> MustNotImplDrop for T {}
             impl #impl_generics MustNotImplDrop for #ident #ty_generics
                 #whr
             {}
@@ -237,7 +237,7 @@ impl #impl_generics MustNotImplDrop for #ident #ty_generics
             // `PinnedDrop` as the parameter to `#[pin_data]`.
             #[expect(non_camel_case_types)]
             trait UselessPinnedDropImpl_you_need_to_specify_PinnedDrop {}
-            impl<T: ::pin_init::PinnedDrop>
+            impl<T: ::pin_init::PinnedDrop + ?::core::marker::Sized>
                 UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for T {}
             impl #impl_generics
                 UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for #ident #ty_generics
-- 
2.52.0

