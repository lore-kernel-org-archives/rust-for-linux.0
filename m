Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA543FBED4;
	Fri,  8 May 2026 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254205; cv=none; b=cQ1MaGdKSGewGZmqfxmag49YwMa9NP5o0BIAJY6P9IogQh8o5r4wdmjrJRZTPcgnNukBdmH5apJL+4PH5RDG/2IhNXFhWyDpWk0pStIcUv+MaR3GpwWQ05OQSVrgPe49Iz799gqvWK8hjRMf6wwayFcbHpphtMjIjYI4n8pBoiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254205; c=relaxed/simple;
	bh=DcU26AWIJjTXr9mWKXFmu9g95ShUxCe+amShEnyMlgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SHXoCFtRyNmntegUHzel20luTSOW0V/otEtL1EAsGZ1LhofWjCLP/h/WvE+j7p74QMoJn6hgmvEv6hwkbnMFl+GDC0qL838vBlix6kmpas5asNVFZzDGRbPm418qMzO+p6J0ggu8Ep3QYMVs7RGIvHB9DnGk1LNuwo2MTlD6Q9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwsM7WW7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwsM7WW7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8302DC2BCB0;
	Fri,  8 May 2026 15:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778254205;
	bh=DcU26AWIJjTXr9mWKXFmu9g95ShUxCe+amShEnyMlgw=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=IwsM7WW7+YVTTCGLIt4CibzX1SK/f3Ov5jihUhqrKROmeogJsznUpcDxLi8/P34WZ
	 4nJh6FxDgfk6MdlOVkuDkmVr11cBGE5JWPOGe16nKyn2XoUTrUItuBXVgKyf20E0c5
	 xzKX6eR0yzQwOveIqFIn9VOKR2wPHSnDiKIkAU4s2oDOhYfF6mV+Wj88cwz8cg805j
	 EWWRY/7/2rrzStip6Q5tJBKDgOh7sbeaN0fVjPyFsvM/Kdt5FvSOCndEmofRTGOn4+
	 rnAR/N+BIGzQiXNfOuHE7QSATlQr6szf1dUbXaeN+g48zibmkIhBd/lN0GsGxATcAd
	 LGSRWG9SSC4lw==
From: Gary Guo <gary@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: pin_init: internal: use `loop {}` to produce never value
Date: Fri,  8 May 2026 16:29:49 +0100
Message-ID: <20260508152950.833635-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

In the `init!`/`pin_init!` macros, we rely on a trick that assigns never
(`!`) values to all mentioned fields in never-executed code to let the
compiler check that all fields have been initialized.

Currently we use `::core::panic!()` to produce this value, but before Rust
1.91.0, it creates outlined `panic_cold_explicit` functions which do not
get removed by the optimizer, thus leaving dead code behind in the binary.
This has been fixed by [1], which lands in Rust 1.91.0+, higher than the
kernel minimum version 1.85.0.

This causes ~200 dead `panic_cold_explicit` instances being included in the
binary, with ~90 of them from nova-core's usage of pin-init.

Work around the issue by using `loop {}` which creates the never value
without macro expansion or function call at all. All instances of
`panic_cold_explicit` outside libcore are removed by this change in my
kernel build.

Link: https://github.com/rust-lang/rust/pull/145304 [1]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index fbc8286263b2..b1cb2e53ee6f 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -338,7 +338,7 @@ fn make_field_check(
             ::core::ptr::write(slot, #path {
                 #(
                     #(#field_attrs)*
-                    #field_name: ::core::panic!(),
+                    #field_name: loop {},
                 )*
                 #zeroing_trailer
             })

-- 
2.51.2

