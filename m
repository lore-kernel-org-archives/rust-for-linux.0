Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1161F2F1FFC
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 02:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779763403; cv=none; b=N/sWcu5QvplQhQEuQu4j69vy2gGSsutWAohJy2k+f9oUBHpYJdEyP8I8R4i4CN+pdqRx6CJfNFWgucWn3RZ3yBYH5LnF+Kg7iZ9qhDXf97CWvEw/Qfc9kv1fIBSYQXFzp5EOwnAOt6ksfWxZSGwKEqyOY8WZkSF68L+yA76eVfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779763403; c=relaxed/simple;
	bh=2TV7ebtbvkj1szJHQaiHLbPPgbAjz9bEw83GICTxwwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZMwRXgOo33hlPRuMmYOoPBUEYLJ5tSKodBQFdtK7l7JWTH/rAvwdqefSM/+b6W6XwqhvKD+qvxYmoMGtJqTkPb3eJZWE/59lZ62RZp/ghBRhbIY13AAH+mN3zJ2YpwxnVHm+NnmTYg4jmYRRByLzsExwUNBy+rO8P+GfQlTvek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c82471904fcso4062594a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 19:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779763401; x=1780368201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SG3tL/12wgrOEhpyoLjgZFw1i9B1GNATu65IvCzKwy8=;
        b=Pa1KcjzBUNYEnwowraQZ8ic857vNIRFyKioBvSt+5nP3ETpsaDnwP8aXs7okN95wln
         CdXnLe+0c+J8v9bjg1ie+/jqlS+5zAQ0fm69/4Cmv1dMJw9CObdQWnUMqzzMh+QE0OVk
         Ayf7BQ4gxp30wUTpVU2lemxVc8PTUqyDCmiI7GE7hRQhyWzvSwt71qQ/vErI5upAsj80
         GNaxd8BkNC3CMbDXDNoaM88FshU0BxxyshWlBd8dD2sYG/j9K1uih0SqNML9esGnOeBt
         HuksuBM8S1CFRjX4R3JvUKn21oUUAyqyYlTRaSAfPP4j+Jt3Po86bFa95By3Af5qYat3
         zX4Q==
X-Gm-Message-State: AOJu0YxjnEu+ixu7cSD2LIP7baWNRJCzH+8X/MefnaJYNajhITlHMNTd
	EVYrkDuUqxyia+a7tqk0PX6VvRoVWlFaBUCGJaIM5DYTlPRGSxZoB1uu
X-Gm-Gg: Acq92OG3SnXbh2si3dM8FD2ec2CLcgTQjKB7SWMlx7r7uImv1fzN8/fP+TMjDZ6pleo
	PhP8LtbyPhQAidUFJmk/paBxcPU5iq0e9I3V+RPC8jt5M9810SJ106xuWXbPS0J96yjDb68+GjO
	PLeZYMEtMiB5Oxc4I4KdeK5LtxBhnCrG5rzzLTSsQDlOZSYf+hNvbFvTC0vOVaA6J9Jky1VE+L/
	Q34vSaNgEnGrCPCG4DvS9WhJD8Auqoe//KrE2qqX4nnzffO4IIrDaCNvGoXDVQZE84sAl1naG7t
	uC9pQlQ5OmOGNFMYDD9Zv1aPrQmke1uHVm9QOUAwj7ls4/mJK/ZCdUk1ABb7woI5wRLlr8+O/IQ
	XqF/uL+kixFSIcDRfZ91sC5B2RvwWkSsAf5sozw9T34beRdlDYYKeTmebz63BuxXNIzg=
X-Received: by 2002:a17:902:e74f:b0:2b2:58c7:2ce1 with SMTP id d9443c01a7336-2beb07da2dcmr167887845ad.36.1779763401302;
        Mon, 25 May 2026 19:43:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695a40sm99551665ad.17.2026.05.25.19.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 19:43:20 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Date: Tue, 26 May 2026 10:42:48 +0800
Subject: [PATCH v13 1/2] rust: fmt: fix {:p} printing stack addresses
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hashedptr-v13-1-324352716eb9@kylinos.cn>
References: <20260526-hashedptr-v13-0-324352716eb9@kylinos.cn>
In-Reply-To: <20260526-hashedptr-v13-0-324352716eb9@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779763387; l=1203;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=2TV7ebtbvkj1szJHQaiHLbPPgbAjz9bEw83GICTxwwE=;
 b=qgJF+WCDZqH7A01c5o2qNMx/eN9/dju+G7cYpMV+avZWSyr+KuFCGLcjI68wbpwt8wIExUVVi
 YWqSOvauoArCUdW2VhPdvA1BwC4yul4XJvcPvf+83Y1p3z7iy69MER9
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=

The `impl_fmt_adapter_forward!` macro forwards `Pointer` for
`Adapter<T>` by destructuring `self` into a local `t`, causing `{:p}`
to print the address of that temporary stack variable rather than the
actual pointer.

Remove `Pointer` from the macro and provide a manual impl for
`Adapter<&T>` that passes `self.0` directly.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 73afbc51ba33a..cd7d9664ff5b9 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -43,7 +43,14 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     UpperExp,
     UpperHex, //
 };
-impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
+impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
+
+impl<T: ?Sized + Pointer> Pointer for Adapter<&T> {
+    #[inline]
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        Pointer::fmt(self.0, f)
+    }
+}
 
 /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
 ///

-- 
2.43.0

