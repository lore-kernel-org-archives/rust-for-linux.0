Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E19925742F
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Jun 2026 07:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781854536; cv=pass; b=PnrNBR5hSB3m4dFy0GKQsXN969Q7973/5Q3KavZQtNTW9efxdQLJUGkBN6M8hTIeogMxvahItgvZEEFYpeUD4QWaRT+5QhZqLFdWchhop+B9mN0LUz8yPSMJ/ooTRoeKEuE7A4tbhjftVj71Pp9BxwZ5bf5hYzc+7+oCYCILUuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781854536; c=relaxed/simple;
	bh=PgpznmWTfKeHsYjsfVMp5oVfAhkgkjTmLkdMPDPvfDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=doGzBsshsGNwOtUGg8E3V7Lva/jXFvV7LViVuwJvc8YX8b5vuUMDxMS2vt0sTc/PJEMCXx2+jX4bJKeUEJbI2apy9r6YWYmKw2wxCdqvQalbYcYAdN9WEwRQ3uXjeaOlV3Lb4BVlmJVGMLRlAWa/tH9BtMqeKVrnT7TLA7wSuMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWnDl6Wg; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWnDl6Wg"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-137eb8e3491so77807c88.3
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Jun 2026 00:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781854534; cv=none;
        d=google.com; s=arc-20240605;
        b=HdR7QEyWRN62KC1NQdT+6NljTDRwdfs3Oz/2Evv10if5ym32RGEzoABgsQLSS5XEwC
         M6tdP5L09mkgGvkm6zO6fJEM9fYWbG/wGS+llKrgmMrvml0SzMnkweugf6lzq1LJW7cc
         YTQut7FgTbO4hGe8hs5i4Gk7dUyTE1gCH7G0UNmuQStsAZmQYUM48tIH4pagskeQIj2b
         qy7kSOX8NewTy4gmLn2QFjxAofzXWFKaKmVyhLMUmZS988aLwrrTsSK0BSG4Me4qhP5v
         1a7KodNuPBhyVz0L/n4+CoI3CGMLN5B4C9Qc68U1W3rcZcYxW3wcoLscbVxEDuN7TK8p
         IkBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aLf7BTX5ObBEVs+75Lc5EAILSkjjX8LL8BwTp8oMoCs=;
        fh=v2i47LS2jygMq06nYtK+PU85w9OaVzTEFY9ksZdzRII=;
        b=PkApoUPI1lvBGVjhjU1GodM/EWmlX4GjBQW52LV+z8OxDCfcxieNZV9e4/dsIYv+u3
         zvxpBcaVHze7QVBn1blLHiWuJ0OiwvwwppzL7j3xmYgABpvZiydyIk8NKHc0Vp5IorhC
         XdOJcm/qyBakeAa2PaxJ83mLqEUCy4syC0PqWifWZ57+Tm/qKSMtkaLX55lwd6mbxKyh
         fybVh5Quls8HD4IOQ4c3mFtD4nUxhlt3tzGZSi8L55RZiD59FXrSme7dBfg+0QifI0RK
         UfokF7OovEL7LSn5Yibw15nUhWN4GXPBv9MebMFEkB80OnUnuk1xQDx7SH3ntnswpjPr
         hKXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781854534; x=1782459334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLf7BTX5ObBEVs+75Lc5EAILSkjjX8LL8BwTp8oMoCs=;
        b=EWnDl6WgC8gGqZYk4vLFizDo+rAYsvNdSDT+Yy022lZ7Gfj7hxbbE0a0Fz08DJJgN7
         gjal7gtrCG7N19QfV38VSGkQcD1D924YqRBJZXujXxTy8ZdgMgZ1Jd738ICSXpC9Ny+2
         GewDvnVlRyYaMp6Kx/bXMrD9x4+yHOf+idAsc3ooRjhbX4vmJtno5awUdVu/llLiB26S
         oF6XYZsdtMuBoVZb1viUhNLpLAfUIqqOvG7dZcTWR/MjV5Fs2q7TcVFdWuXpxQKC8jg4
         BkPHmGjzMlKiUxkVfhm6wFxhZ90RDNbIygPmOmtOm8VQ6XRa3apThGhDHGXpS11FZ3FW
         Pi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781854534; x=1782459334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aLf7BTX5ObBEVs+75Lc5EAILSkjjX8LL8BwTp8oMoCs=;
        b=p6S24/1A3I7NzYW1LTlZVT0SNOwz3Qdgu0RLuRmVkhGghbnsSaKtSV1yyOvUDHXjmf
         a6MvrLV8g5y/MeBQCEY2nrOAKVSq1GcwwCW6NLd7vTVd3LbfssxfBq668L+MHxVmp84x
         H0IliC5X+r0JlUIl7k1/0G6VgSbzCOKSQmldKjHVgSZ34IDTL/ce+3qTKncGeoM3NnUj
         q78/vcblKejl6Zxu/aMqnfmyiIwOyhKD9nvbBthGwI7Y6CcMv2kczTJU2yyIoKYWvWAg
         5XcG3xG5gxJF7Y1L7+5V0PVwX7VxUYOnR5PwRwJoRjq4Fl3JAVES+m2IMiJD186WecOe
         az9A==
X-Forwarded-Encrypted: i=1; AFNElJ+Rt+K6yH3OsJSi/JLI7i6/22vnIJ1O5E5A2lC2kOozl0UHNvx7lgPRX2Yf5g+KGUJVBtj+PjEG9zQ6nRezUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5I79QQhOoyATZthZkanYUOaWIujarXWkoOIeXHnkO62a56l4A
	m3Jmo5/e6Li8fWvRTF3j8gzyhqJufFX6AKZb8v4kwkeUtEwWHYRrLhj1PziFR76CjhIaOpDMbuG
	JnCLQoYQtUe6nmh/L8dCFZ+mJRkbgEAY=
X-Gm-Gg: AfdE7ckFIrzJo+WmJQ0Zsjb7Lf22h2fFAXjWLqc80SbuwGqfUmVDO4s1yutQym5qoSn
	B3RlkpHlBPn+u4/Gl0+zE9YMvL2mZZsnJcG6211zflx1ue6sZyvje40Lge8vX7N51eX+1WYlv5W
	BFIIy8HbSHiP7B+lQCxWa51/wl2LtK9nkY3wGeEQvOVNBxHgAafTbjh3Vc4wlsMYM/j2Sw9Sgta
	2JI3NWsenqjLRTgg1+BjOdjw3Jzt22eJ29ySavBU2ICMN4bR8n6IZo8vBEp6l5OIzU8DAUEiBK5
	C3aoPT70e8X8BdJh+3oKYIKKe2ayyYS0RJXL3c3zr4XUBgkhXATSD7lVkoLo7gca9/OcAyaAHZJ
	vMOEbRVvTIBPq
X-Received: by 2002:a05:7023:c009:b0:12c:888b:aa92 with SMTP id
 a92af1059eb24-139a20ae1d2mr596735c88.1.1781854534254; Fri, 19 Jun 2026
 00:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616132559.2245814-1-gary@kernel.org>
In-Reply-To: <20260616132559.2245814-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 19 Jun 2026 09:35:21 +0200
X-Gm-Features: AVVi8Cf-IFnA-pXIxZZahtdg6We4eiWi-htBnfQzvd1mNg5ax__2Rc1VPICswns
Message-ID: <CANiq72n-QC-DGUX1Cng0FTDbDM11t9N+6rUC4QxxBQtL9ntwMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: doctest: fix incorrect pattern in replacement
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Igor Korotin <igor.korotin@linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 3:27=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> The `-> Result<(), impl core::fmt::Debug>` string is generated by rustdoc
> and by adding "::" into the string it no longer finds anything, and makin=
g
> the line useless.
>
> Remove the "::" in the pattern. Omit it in the replacement too, for
> consistency with upstream rustdoc.
>
> Fixes: de7cd3e4d638 ("rust: use absolute paths in macros referencing core=
 and kernel")
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-fixes` -- thanks!

    [ Improved comments for consistency. Reworded to drop changelog and to
      fix typo. - Miguel ]

While it doesn't happen to hurt much at the moment, the change here
was not intended and we should be able to easily backport it, so:

Cc: stable@vger.kernel.org

Cheers,
Miguel
