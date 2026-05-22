Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310973BB9F5;
	Fri, 22 May 2026 17:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779469980; cv=none; b=o1NY6u1p9xPUokzEByk4SMg4Lb8vFlk3g27wh7StjA005gyou9Cl0wUmfvT59KeHsdLIsgmQolG6SAhJc5Rmhr4xIMmtXDP7MVfMKd2dkWMYS4OJVTW4Mn9yTBKhEAvTpp/E+QoeT0w35LytCpZeqS02dIuMDHAC1AESEdwionI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779469980; c=relaxed/simple;
	bh=xDqlTikyXLWT/2IEmEtic19NJT7Knn5nS++qR+zGJ3s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NjOAsEEfRqh/ogUVx6jD4pwqbV7DGGc0K9HJlsJOoAFDgMBxWO8GFpWC6clVj4pwiajZ/fSXMgxr9W6b9HGrxWafWpL/2GS6lYP00zLwsWvOnFoIUnlQhz1THvFxkPE+UGP10tUhg/9ywB/vB8pXjucS9pPA5x0tH6Fz3WxZsJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vq/Zyqy4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vq/Zyqy4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA3C1F00A3D;
	Fri, 22 May 2026 17:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779469979;
	bh=7KLylSTcUtYjE1YN2VI5SfDemrkq/JwigYTVe2lZO+8=;
	h=From:Subject:Date:To:Cc;
	b=Vq/Zyqy4BjBfbFPiVE+zv6WWvJLUf5yF1msC+7fCIli2K+oI5yl1DD2tsQOsMJJH0
	 TfJamMACuWpMGigq8Tl00jiAAPiqMlxM8fGhd7UF+0xmNFe4cp0T4HGjcq3OSkwRZd
	 ypKenQbVCj/RiFCJEJmUIFwn0Wk4vtL2PL9EeN/6KcfptXA9NrRhaUcRBIHS/7QQXY
	 tvHY+VoyBzUQnkg4A2lt1p8k6HacjVA8PBbGc01vGcVDzyqssgCJMucocMvNKG+gL5
	 pJWbfoo/zKGH6zXXJKNjZ5/mNUXMmTrWEfFXxdOtOzJJzIYc/QOOkJA/w1mhoq09xk
	 8h8jcNB7M0YSg==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH 0/6] rust: binder: reduce `as` casts
Date: Fri, 22 May 2026 19:12:45 +0200
Message-Id: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ7CMAxG4atUnrEUAqWCqyCG1vkBM6SVnVZIV
 e9OgPEb3lvJYQqnS7OSYVHXMVfsdw3Js88PsKZqiiGeQhsjD5oTjL2YSuHJxgW5zwIOXSctUpL
 z8UA1nwx3ff/W19vfPg8vSPn+aNs+fTavy3wAAAA=
X-Change-ID: 20260522-binder-strict-provenance-077c5eddc943
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2024; i=tamird@kernel.org;
 h=from:subject:message-id; bh=xDqlTikyXLWT/2IEmEtic19NJT7Knn5nS++qR+zGJ3s=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFkCfZMzjYJP/mGeWfPpKtPlqadc+Ax5i+MaupI9FsekJ
 NxTjQvsmMjCIMbFYCmmyJIoemhveurtPbKZ747DzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjoGOsYMXJwCMNWNMYwMZ3/6q3rcUm8X/7fpiX0Dc+Sfpf6s97gvRj1Xqi1oKPV6w/CHoyjS89K
 8z1lWrieTs7ZZ32Yy373SdbnK0U2z92fsVFnFBgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Follow up on the treewide Clippy lint series [1]. The Rust Binder
driver retains local allows for `clippy::ptr_as_ptr`,
`clippy::ref_as_ptr`, `clippy::as_underscore`, and
`clippy::cast_lossless` even though those lints are enabled for the
rest of the kernel.

Fix the Binder violations and remove those allows one lint at a time.
The first two patches reduce related `as` casts outside those lint
enablements: use the strict provenance APIs for Binder
pointer-to-integer conversions now that they are available at the Rust
MSRV, and transmute embedded transaction data directly instead of
round-tripping a reference through raw pointer casts.

Link: https://lore.kernel.org/r/20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com [1]
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Tamir Duberstein (6):
      rust: binder: use strict provenance APIs
      rust: binder: transmute transaction data
      rust: binder: enable `clippy::ptr_as_ptr` lint
      rust: binder: enable `clippy::ref_as_ptr` lint
      rust: binder: enable `clippy::as_underscore`
      rust: binder: enable `clippy::cast_lossless`

 drivers/android/binder/allocation.rs       |  4 ++--
 drivers/android/binder/defs.rs             |  7 ++-----
 drivers/android/binder/freeze.rs           |  2 +-
 drivers/android/binder/node.rs             | 12 ++++++------
 drivers/android/binder/node/wrapper.rs     |  2 +-
 drivers/android/binder/page_range.rs       |  8 ++++----
 drivers/android/binder/process.rs          | 12 ++++++------
 drivers/android/binder/rust_binder_main.rs | 10 ++--------
 drivers/android/binder/thread.rs           | 24 +++++++++++++-----------
 drivers/android/binder/trace.rs            |  2 +-
 drivers/android/binder/transaction.rs      | 12 ++++++------
 11 files changed, 44 insertions(+), 51 deletions(-)
---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260522-binder-strict-provenance-077c5eddc943

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

