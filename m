Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3E55490E
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Apr 2024 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713777959; cv=none; b=mXq0IdohiBuxqfvxib5Mx1r1n+3PycvkQxq6byS2/p5dnw8U6yYUO/5+pBlIqryMMUwAdrO0uGn0zhA7XuDo8XGywEb6ouYzkuFBR1RzS5/b7YTKfOQtnxDqWPujmlQfa+5nJtUij2/dxf5/0/X0SV8LcyIZXJ+cDWaa0nZzDRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713777959; c=relaxed/simple;
	bh=ye+YDeypngJNVRNApH4ApNOV3asObjEsmLgFOfVV0AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHQDTcbWV43JhtTIU+DDsYPU72Mjfg7lZx2f5vOeW2Xbu4DXDmwTq4Mq9nE+DeKU872YPtBQbbPA+t0hJaV8Yn0h/CxM7INv/A6tueDgpJCV+IN+ghS+EgiSnee0VoR06goxbhk0/mXogA0hNvMxnf3kzO6KY//lcIbRHZa8Ld0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=twZsfRK3; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="twZsfRK3"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7ec48a0306bso1625298241.0
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Apr 2024 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713777956; x=1714382756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u02hciJF/25Uzt60NJ0xbu51k6rfBNzWcPBLcSlUo80=;
        b=twZsfRK3ziG0zUb1bCJXi8C9F56uvM1GjgJNPIFDkI+Z/QqUDW+ujcsdzCaqKqm6YL
         0mwFX8clbtzZmG6070BsZODiLVFyOvnD9XXXEFVhSNgbJa0vXnevR4Kz9VVs0QcAzSBB
         MTJdLjhLWgnrhN6kicMs/vxU2u9W+ompDL1GQFXLDh3IWDKiAlmn4fQzxPjv8J2WyOcR
         f1j3Q9UnrLDBTFGS/5EHfOQZiO8BfXIwB07OIpsnXNfGtRJrjuUzSR8rnLymI7Hq8I9C
         ibyqWof0mrDVQXnYgcspRBgnNYcU+HCmfE0doCBJq3F1rejFI/Mu28ItdnoSk0oF0N0T
         0hbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713777956; x=1714382756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u02hciJF/25Uzt60NJ0xbu51k6rfBNzWcPBLcSlUo80=;
        b=vMNAZnsWlRC91HPXw7SmDqApMLaODiZSd5n8dwSiFKeRI5qjK3F2eTpBYbtmmMdNzp
         mc4nJWRl5h265nka9Cc8tGeSLI4NOxVh5m4jcPhtzgLqJpP+C9z5M6wAWDVBIwWzmEt0
         yOBZL0sr2xrIyFQK86ltc3Aj0FOcjbRuUfWtwJB0hBOV4DoaWG3ElH1hOtXh8zo0qPcE
         A/KuvicBNWCDVjmP5sryeoLculWT3kJFm0eP7kaqNFuTA35oI4Y1SoLrnOaM+53KN8VX
         AiWIG3QCFkerCt9rC4fyBWO63bfJvGJ/QsAWJmH0s7QIlTEaQWYykrjla3EMVrkIxR7J
         n/pw==
X-Forwarded-Encrypted: i=1; AJvYcCXzrS5X0N5X5Ym8d70On3/i1VYHpHOUQ2qTcPh9m1CGQG6+AUVpBzCt/LJTPjig+EuMNcYTQ6X+bnFGjBWjLqEnA9sMsDQ6X3GafjMmmqc=
X-Gm-Message-State: AOJu0YwoH6m1AEoOz8jQrO95H3AyLq/UyrJqrhdPVuFDSIicmae95C1n
	yq888TKEhR+1KzWc0tH+l1UmDEvpKv3n3oCxSVEExiOprPp3egCcG5spoL4Co1qVAxBztPgDGl0
	sgsw53ol1fgX60LONHY5eG16pTZUfejDNqfcO
X-Google-Smtp-Source: AGHT+IFzbvs5nDCKVidubFmVhCqyTJZpX1MSVwcFBpjxWlOvQIwOZ8sgogJwUEo36R0OhEd8C3NQ+lrl6rjs+COe24c=
X-Received: by 2002:a05:6122:2008:b0:4d4:34b2:9a89 with SMTP id
 l8-20020a056122200800b004d434b29a89mr13136946vkd.8.1713777956098; Mon, 22 Apr
 2024 02:25:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240422091215.526688-1-ojeda@kernel.org>
In-Reply-To: <20240422091215.526688-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 22 Apr 2024 11:25:45 +0200
Message-ID: <CAH5fLgg=v28bFJE1izZ-WF7uBLcr7D2o6Yr2ihdPAz205MiGGw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: remove unneeded `@rustc_cfg` to avoid ICE
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 11:13=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> When KUnit tests are enabled, under very big kernel configurations
> (e.g. `allyesconfig`), we can trigger a `rustdoc` ICE [1]:
>
>       RUSTDOC TK rust/kernel/lib.rs
>     error: the compiler unexpectedly panicked. this is a bug.
>
> The reason is that this build step has a duplicated `@rustc_cfg` argument=
,
> which contains the kernel configuration, and thus a lot of arguments. The
> factor 2 happens to be enough to reach the ICE.
>
> Thus remove the unneeded `@rustc_cfg`. By doing so, we clean up the
> command and workaround the ICE.
>
> The ICE has been fixed in the upcoming Rust 1.79 [2].
>
> Cc: stable@vger.kernel.org
> Fixes: a66d733da801 ("rust: support running Rust documentation tests as K=
Unit ones")
> Link: https://github.com/rust-lang/rust/issues/122722 [1]
> Link: https://github.com/rust-lang/rust/pull/122840 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
