Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8B23624C7;
	Fri, 16 Jan 2026 10:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560995; cv=none; b=NZwxb8b+KDSPi0TKjMxFjhoF6whDibpvKmKMO7RmHLodWS23dWERPaSKeGmM+MuyKycKjsEKD+S7hE8DS7qbEc2UB2wFpmB2sEmUC5eH5RjJrk5s5wJ84aFLBcu1LkSSyIkO2hLKX+AiQIV9MU3fD+ZxFYx1tHoMk7jzL4hwt+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560995; c=relaxed/simple;
	bh=//3KCgtf0P/XZavEN+NB6p/Jsmc2AsGhSyNxc5LgbPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzVaYz0FmE7Rj7/ccmV0zoYB89Dbm2yaRVcPycT2YzLP4IxNW+iazsrMDGsd0J3zxeUGMiOv+ViX8v8eyDUc2P5NWncgUcKE3Ed6B/eSHnr0ophsceukK+qCReCTlXC1W7vy+UrBtb1mazuRmDk5DYjcfZB+XWniZPdDIzJkmi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ias/88Ax; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ias/88Ax"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B46C19422;
	Fri, 16 Jan 2026 10:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768560995;
	bh=//3KCgtf0P/XZavEN+NB6p/Jsmc2AsGhSyNxc5LgbPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ias/88AxwMnwv5vngj56GeF9HTmzE2yRtL5PyzrjM1J7I2VWGXG/L0/hcE+tD8PSB
	 YJoYUpNEvMgZParqQ8NQsCpaUK6S/kYQUVHjGBAuD9m0DchzOCgCG7Z8cDxLIE0RmY
	 ttOSQ9RwP9SmykXNKmJB6grfZc6xqmoBTlKUTAan0xMrL7lzbqmRmyu9vaSptTA7QP
	 LqGOVva6ympityUemwi0Iw0WTxBizy8HbawtcUo9zjznUQxyiMESsJnTYTO7w12ybD
	 j7kpf3+qYc8DfkfleUb7KT+Y4QE7j1GuzxR9qbttrrOJj6xHvkgy4SJhujFl/vZLy9
	 mmSGFu/3YtsrQ==
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
Subject: [PATCH v4 08/15] rust: pin-init: add `?Sized` bounds to traits in `#[pin_data]` macro
Date: Fri, 16 Jan 2026 11:54:23 +0100
Message-ID: <20260116105514.3794384-9-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116105514.3794384-1-lossin@kernel.org>
References: <20260116105514.3794384-1-lossin@kernel.org>
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

Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v4: none
Changes in v3: none
Changes in v2: none
---
 rust/pin-init/internal/src/pin_data.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 11ea3f8d8a1b..7d871236b49c 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -215,7 +215,7 @@ fn drop(&mut self) {
             // if it also implements `Drop`
             trait MustNotImplDrop {}
             #[expect(drop_bounds)]
-            impl<T: ::core::ops::Drop> MustNotImplDrop for T {}
+            impl<T: ::core::ops::Drop + ?::core::marker::Sized> MustNotImplDrop for T {}
             impl #impl_generics MustNotImplDrop for #ident #ty_generics
                 #whr
             {}
@@ -224,7 +224,7 @@ impl #impl_generics MustNotImplDrop for #ident #ty_generics
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

