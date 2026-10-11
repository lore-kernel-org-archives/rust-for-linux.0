Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665F944A411;
	Sun, 11 Oct 2026 13:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791725049; cv=none; b=monWazl9IJh50xoxge9xnDjweBdqRWjn93EjJdX5png1yiemqU7O9pGzrb6SbTxKCR0MfpAWbLkMcNFVtTlmFzXpbej36wp0933KqofZWIHJ5vypboWgD/VIwLR3wvxUHAz89qnP/chTNSbwc2GA4eikIgTW9/4YrR+uWwvByrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791725049; c=relaxed/simple;
	bh=Udr7QqtGNr7OV/p4pWujoV995vDoRzBVZ7joJXRhkSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dKWMUa9cpzu+2XiSv1MaMyT9UayX//ZWvLM8PMsf2A1/X0iDVVSPLVn3g0yzUshjWT9uldULse3FXaLKeinPMV6hyOg1SNQC+4PIAyT8+H15Erv0hN4SrOjo8jU2PLKSqIAkkeoCck4s0lxm0hupgqQoywjndb5nxa56RWEYQHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGbnqMIc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGbnqMIc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CF81F0089B;
	Sun, 11 Oct 2026 13:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791725047;
	bh=CvrpLqfmBQ0TVBNk934KRb3Z8FCdBTWVsN4LX/lpfio=;
	h=From:To:Cc:Subject:Date;
	b=fGbnqMIciRU5LlmFttoL8LJ3BDkhoSLwVcEAFsnec7ifh24JnRoGZK8WF6KEWR4JS
	 NQ5tpucFdtF8+v5YqKHD4nOn688bAW2vRXNrQ2D8YG+nxYfR/PGU3MsYU5ShTYygfX
	 BSIIfJKi5lQHbQxh5XCF2mT0hwQKl04G3v7tQxqKramZmED03oj6dUlRrUzUZGvWbW
	 xnxQms0jGL4HzXhtYWkbX7rvRl4bIyKm+Y8D4cd4cxOj1nAom10TJ9bMR+4sdKL8Pe
	 mRAzbKnw+5Besr9m6sSEGkxHtEWTm36HKrsEpvmHnOkh3yeNP002Iz57lJDsbX+ayH
	 d9eQs8djdfoDw==
From: Thorsten Blum <blum@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: Thorsten Blum <blum@kernel.org>,
	devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: of: use safe zero initialization for struct of_device_id
Date: Sun, 11 Oct 2026 15:23:54 +0200
Message-ID: <20261011132353.272824-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=995; i=blum@kernel.org; h=from:subject; bh=Udr7QqtGNr7OV/p4pWujoV995vDoRzBVZ7joJXRhkSU=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmne1+yVvlvDZbYHF+0TCR4teY603WqYS9+r7twuWfGi 9/LJB1DO0pZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAil/0YGZYGqvFUzfgc5bS6 9fiMvobdq34meyQrSnw833JcY+uBx9cY/hkuYGQNY7W+etzAPdP0rqSyi0pXxxkm1eD53CVuvQW JnAA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Since bindings::of_device_id implements Zeroable, use pin_init::zeroed()
instead of core::mem::zeroed().

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 rust/kernel/of.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index d0318f62afd7..75d5004d2221 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -31,9 +31,7 @@ impl DeviceId {
     /// Create a new device id from an OF 'compatible' string.
     pub const fn new(compatible: &'static CStr) -> Self {
         let src = compatible.to_bytes_with_nul();
-        // Replace with `bindings::of_device_id::default()` once stabilized for `const`.
-        // SAFETY: FFI type is valid to be zero-initialized.
-        let mut of: bindings::of_device_id = unsafe { core::mem::zeroed() };
+        let mut of: bindings::of_device_id = pin_init::zeroed();
 
         // TODO: Use `copy_from_slice` once stabilized for `const`.
         let mut i = 0;
