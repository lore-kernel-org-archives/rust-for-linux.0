Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68AF199E84
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Aug 2024 13:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723554592; cv=none; b=DPcBQOH8CrpbD1qgTuJ6XIoTur9Tx7lLc2J6ot6y6wvBJc9vSdJeSmqs8lt/yepDsdMlqjMFGCIW9919HuMx6tWBH5ct8fJzuups2uIWf+b1PH7iwyuakVnuZxAUE6cxAu3H+kVXNTg9Vow7K5LgGqnCt2MCu63CB5DOeEAXQDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723554592; c=relaxed/simple;
	bh=dCyJA+kTivOT85eAV0f5NHRRUHeJB6AyDYce4DeF4b8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cw8sIYS9HLFRLkHNm9Xlw+x2V1fCFpvu94ldjL2g62Qr2yE+wPaNVfvMCt+mVKIG5JpXXdGDT5ToiXi3K5P+DsEqPbr0O9VAfZzOZGcVnop0yUUcE1E9afE8yzhIGI/HQTBeMXS7uge+th+PUkNlZaxhZnFe97quZMQq9th60p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOxCY77L; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOxCY77L"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-25e3bc751daso3425293fac.3
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Aug 2024 06:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723554590; x=1724159390; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URvOE3atvXH/sfYmILJwFvJ1GbR2SdR7EAIWhQgjYZI=;
        b=GOxCY77LyqGD4SOGPm2IfQvhT3kBkOdluoF89TCGn3pXjXDZsbECaGXXL4HgPBGJkO
         N9AEmuxUIBZvpQooqW6e04UAw9FJDnXF+enS4k0uJx9woRXBmrgQKY+ZJihHg/UEejvM
         0LSu0X8Kz+vMhkFnnDOMegmIu/2yk2KKhVc3okVy243GygyUhY+3GGceBBJGxxHzk+mv
         noWy61XuDg8MMsZv+m8wkWkARo3vyoupz4bpzF6GgPm/6e4uy2JZtBmhqfaoAQOp9AOi
         d/uTG85iwfbCQBp52JbWBe2REBmSkWjnoTOXUSyhwkVbRnn7uvEGXmBOdRkWVSdEuPd8
         7ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554590; x=1724159390;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URvOE3atvXH/sfYmILJwFvJ1GbR2SdR7EAIWhQgjYZI=;
        b=qA2xMSrNqVEWXbMzBYU4Gyc+iNw9NCx98LVIZp+SiGzcHT+7k6zTHw9r48pO3uaUac
         1QRtoCMNwyUnpeQhcCNYS29xwvYHqG0GXqRFrTig/0g6Cg8YnCj3z5cel68067Pt8UiP
         9jo3MtoLYkOlz3OdKeW2RZZIaF5RdklkDnj61sbsTqWtXRgbxRxn2+uro99+qFJSqftx
         JJrHfsDM8Z5QapvrLfzREWmkM1qnqL/Js9xYNlsuae5zZXiI97wTZuMuCrlZZAMhDKZX
         c9W7w4t9VTeSlDu0V60hMYF7fP4suWuu0dhGcOy8nzleM92cyfVdf0hqcloeTduYq/vy
         1hUA==
X-Forwarded-Encrypted: i=1; AJvYcCXoLJ78qs3SgRBiV8yXxWj87NYlzaFZIGqaoehwRwLSdAFgX6Zccd8Ysv2+mfdt0niHUQZe3MUcPvCmlQtPzYvUt/opbnkzaJGsqk34cig=
X-Gm-Message-State: AOJu0YxFwV16JUm2BPS40ak6o2MzmFbP/6AgpGuGhJXJ2jeeZaWkYrbV
	Jt3NMCVITN0NE12KMh1k9uBr5LPMyUrj5tRuTE08H3tcEj2tjtA0
X-Google-Smtp-Source: AGHT+IGH2hhy6WN/8tWZIjXtWMcVvmBjaJN5PdRf1AiHxdbnHEb9+QdAKzYstXN52fHC5KT/lkdfgA==
X-Received: by 2002:a05:6870:3308:b0:254:b420:5ab with SMTP id 586e51a60fabf-26fcb645b09mr3646015fac.8.1723554589710;
        Tue, 13 Aug 2024 06:09:49 -0700 (PDT)
Received: from ohnotp ([2001:f70:860:4100:e712:ac1a:da07:2e53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c697a06b2asm1428572a12.54.2024.08.13.06.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:09:49 -0700 (PDT)
Date: Tue, 13 Aug 2024 22:09:36 +0900
From: Yutaro Ohno <yutaro.ono.418@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Aswin Unnikrishnan <aswinunni01@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Yutaro Ohno <yutaro.ono.418@gmail.com>, rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: macros: fix indentation in `module!`'s doc comment
Message-ID: <ZrtbEErNnBNNH0uF@ohnotp>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Clippy warns about list content in a doc comment that doesn't have extra
spaces at the beginning of a new line [1], like this:

```rust
/// * Do nothing.
/// * Then do something. Whatever it is needs done,
/// it should be done right now.
```

The suggested format is:

```rust
/// * Do nothing.
/// * Then do something. Whatever it is needs done,
///   it should be done right now.
```

This commit adds extra indentation to the `module!`'s doc comment to
suppress the warning.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#/doc_lazy_continuation [1]
Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>
---
 rust/macros/lib.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 159e75292970..5be0cb9db3ee 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -94,7 +94,7 @@
 ///   - `license`: ASCII string literal of the license of the kernel module (required).
 ///   - `alias`: array of ASCII string literals of the alias names of the kernel module.
 ///   - `firmware`: array of ASCII string literals of the firmware files of
-/// the kernel module.
+///     the kernel module.
 #[proc_macro]
 pub fn module(ts: TokenStream) -> TokenStream {
     module::module(ts)
-- 
2.46.0

