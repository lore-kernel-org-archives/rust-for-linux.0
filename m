Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275424792C5;
	Thu,  8 Jan 2026 13:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880389; cv=none; b=MKA+MTBnka6qeej+8LorYofvIDyr09IG1Q2ZDiqZ668oDe2v2OJb6VbtRNv6L8+6Xf6sXHyPmUOi8le1UmT1P89itQSTrTO9/xFeKkTwJGvl8EPk6JaVrlQbFzWA8/UROuuaaEJL6eaWnBjVaZcYtXzgaiDUNLrE0I87n08RHSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880389; c=relaxed/simple;
	bh=XPbyiK5L+U8qJiBdlhkgjy1TX6a+liT601Q+FVVH5H0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tp/7bbe2XWxOOTJhkTkRokxmBnMZOwGGJ2l0nWxFRMONcA4hjpqjnEONPr6ska+elvntlrFqXTGUiCyqcFCmogAnGjJpny2Rqeb/bkcg2TNmWLKxxXhC+UXzt40lcyr0CNF3iYL0vkI/63ddU2gbvld6XEbcvbA0LkpZyAlNnHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmCbuteM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmCbuteM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF0FC116C6;
	Thu,  8 Jan 2026 13:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767880389;
	bh=XPbyiK5L+U8qJiBdlhkgjy1TX6a+liT601Q+FVVH5H0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kmCbuteMZcTWnEf84lus3wr4OJxQWrcfSm2V3RrEPR6Mp79yZ4bbvAPHGGPS1//vX
	 ef5Mdc23MmfdEu1mi3p2aWqQ5qWJJ/bWq4WFyz3kvscmZ0htjG/OK5kwruUxfchbWG
	 1mbe5A4gPBi87Q2vNykfVg7xExKL3xWUSHcSM+ITsN56OigLbIiM/1ZeSTQdFFmrtd
	 MIlZrCk1AGzJcqmLsp+9CowZmSCApra60UMc1Jq9OMgOMEtEikEKH6nWi/cx3qUWtB
	 qrsEp5imd7qpolBEUbvNYupHEyCyzJWj1WaW8JVVKRLVta9SKtkuF5qy8GDnSrZn4R
	 AnHO5ZLogkPHQ==
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
Subject: [PATCH 07/12] rust: pin-init: add `?Sized` bounds to traits in `#[pin_data]` macro
Date: Thu,  8 Jan 2026 14:50:45 +0100
Message-ID: <20260108135127.3153925-8-lossin@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260108135127.3153925-1-lossin@kernel.org>
References: <20260108135127.3153925-1-lossin@kernel.org>
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
 rust/pin-init/internal/src/pin_data.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index d1e7ed121860..0fc0ce5fd4e4 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -236,7 +236,7 @@ fn drop(&mut self) {
             // if it also implements `Drop`
             trait MustNotImplDrop {}
             #[expect(drop_bounds)]
-            impl<T: ::core::ops::Drop> MustNotImplDrop for T {}
+            impl<T: ::core::ops::Drop + ?::core::marker::Sized> MustNotImplDrop for T {}
             impl #impl_generics MustNotImplDrop for #ident #ty_generics
                 #whr
             {}
@@ -245,7 +245,7 @@ impl #impl_generics MustNotImplDrop for #ident #ty_generics
             // `PinnedDrop` as the parameter to `#[pin_data]`.
             #[expect(non_camel_case_types)]
             trait UselessPinnedDropImpl_you_need_to_specify_PinnedDrop {}
-            impl<T: ::pin_init::PinnedDrop>
+            impl<T: ::pin_init::PinnedDrop + ?::core::marker::Sized>
                 UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for T {}
             impl #impl_generics
                 UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for #ident #ty_generics
-- 
2.51.2

