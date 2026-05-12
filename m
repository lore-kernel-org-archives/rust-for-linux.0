Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F95238D52
	for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577699; cv=none; b=YbPn5sdDjSZoBOCJXe/6lB0o+zaEEogBHDIvAu5852NHRPyN6JThXX1MAgqg4XqhU6zO9wWTud+zJEv+l1YBA/ZfulHBlRImuZNX/QWfqpzTP7kN/V+ABXDR6Xfde2czLiY4/D7fTW8k0Q8HLsmUbFYE7Rbvn3+eeFEE7VZJ/eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577699; c=relaxed/simple;
	bh=bMtVTDRa2g/U6j1qdzOSkdwi+QZHweBeSbBFsOb+2z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E0b3ZMa87dfrvVmXW4oAZHvmV/BHog8CiEBIDEbVmHEMcpcYg1q/jnUvkwEiutbXsiv3I6ZQf7YcXOLXjx6RwSLtWHJ4f2GpU18DpBxtYefpP1Th8QKtZ7yM8PMIQwlKy6NwcG/4Nwlbpz6gFrLnq5MidmQf7eOirBT+Hl8+0a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c80148ae949so2263947a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 02:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577697; x=1779182497;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBAItMkPWcD7UhdLSMPda3k6QBSTUclspk8ZPPkrpHA=;
        b=AWihq/d1UiGNIBE1MsJWzdEg70qRIpjZbJnRGAxVl8Fp64YodXQFU90a6k3M6392mH
         uthmWtLUhw2FRJqmsbnBHxz/JLiDPHSBHb+mMgh171hMMgj6x4NhRcDMeBbuyDXz+7kC
         E5gGE5aUYKTQ/l+xvP57JI2FgcENnAxJZ1o0dFe8gI5v6+j4YbomNW1h6Jb1SYS1pEQE
         f5iQfopHxdRpeAC3DCuVRK9bHN8cc8miz4UADpyznZDXXcq1V5lhQV2Vq4ls2Neq1lCq
         ne2NJ4x9AO0BPQ4iMEwlDHkvRb9TZPPlufI6yK13+Q7aYYrTVuc4tOM7Ge9yfuoDn8P6
         3Agw==
X-Gm-Message-State: AOJu0Yws8i++P7ETDYPamd8UlCD82RUEFoBmNApZoQFf5M3ZOl5ezg/q
	edlX++LeVtIaQnRU7hu5XEmEhuU7opVifNmK0egeZ3UjqU9FPuJSUKnL
X-Gm-Gg: Acq92OGH96vspT1RUz/x+zng4h8TcpOV6kB1PkeFTGjH3sk08834vufJ6Ns/l5iHxXQ
	n9cgIvLnAddH43krTcLq5CAMjJ7G4XNsQz3RltAS86PIhKaRbVSOyWrcpLiZAaqTQa1Qg9TnZH8
	kOBCCuPb7JJClbjEk5BYNPN4hpTITK/VXNBRCFHxDLOo4I1PO/xmmPGtnSpS8LaA8i/ZwWLnwIb
	6WruSjdCxMlL6j+2xpYW0CYbLbBLVgtzokJhiBSRBd/NZ8NM5rJatqia0TLwZXAztKoSH7vr0oD
	rDlN4ORzMxNU8UfnXOm6BHduRQcx+yunoy+gO0eBrxfX4Qr/icidkDDkoQPOpbMvznHKWzHCsN7
	Os9zPyRIylhHL688uLr0vGsUMa4HYKcErb+2RAxGvj/LpfmJ1XPUsyeFQjC/2hpZQuCQ=
X-Received: by 2002:a17:903:3c46:b0:2b2:5515:661c with SMTP id d9443c01a7336-2bd012a2eacmr28200675ad.31.1778577697059;
        Tue, 12 May 2026 02:21:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fed8sm132701045ad.27.2026.05.12.02.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 02:21:36 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Date: Tue, 12 May 2026 17:21:21 +0800
Subject: [PATCH] rust: fmt: use vertical import style
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-clean-fmt-use-v1-1-7ae7858192ac@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIABDxAmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0Mj3eSc1MQ83bTcEt3S4lRd02QjIwvLFENjcxNDJaCegqLUtMwKsHn
 RsbW1AMTXrVNfAAAA
X-Change-ID: 20260512-clean-fmt-use-5c2289d13741
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778577690; l=1471;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=bMtVTDRa2g/U6j1qdzOSkdwi+QZHweBeSbBFsOb+2z4=;
 b=OVgOl9CMTK3nRhqZ4hvBky2emvM8M2nxUY/o7OWCeUTkp7+w2qmSz7MDZDmNGRpeAso5uk2iA
 o+OI63EzqJlBQmt/q06Y4X1KjHvy7FrQa/EKX0QhFvStU8SOi8YAXjp
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=

Switch single-line `use` imports in fmt.rs to vertical style for
better readability and easier maintenance.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 1e8725eb44ed7..73afbc51ba33a 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -4,7 +4,14 @@
 //!
 //! This module is intended to be used in place of `core::fmt` in kernel code.
 
-pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
+pub use core::fmt::{
+    Arguments,
+    Debug,
+    Error,
+    Formatter,
+    Result,
+    Write, //
+};
 
 /// Internal adapter used to route and allow implementations of formatting traits for foreign types.
 ///
@@ -27,7 +34,15 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     };
 }
 
-use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
+use core::fmt::{
+    Binary,
+    LowerExp,
+    LowerHex,
+    Octal,
+    Pointer,
+    UpperExp,
+    UpperHex, //
+};
 impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
 
 /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.

---
base-commit: 50897c955902c93ae71c38698abb910525ebdc89
change-id: 20260512-clean-fmt-use-5c2289d13741

Best regards,
-- 
Ke Sun <sunke@kylinos.cn>

