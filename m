Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369A41CEE8D
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 08:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737535131; cv=none; b=H3c8Aah0oohNpi1mQlAYY9OX0DcqtRKF6o4DB4B8i3TsJt4SOb3BhN+HhNrPA5P9iM3t1K0dOKYgtr4NmNM7hd7kpHFnuj4JZuRuUHj9jFiKquwILeQVo57IW/X+XFvhdDdPB7nGgcfDce3CY4Lv8BR6lpEyuCxqHkIbfYLMaQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737535131; c=relaxed/simple;
	bh=J1PZ54vssI6jPaqsAH0gCww+a1TM3BmEpIr7INz4ib4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPeFZ3bFcPZnMDSIdIcJRNdJ1RJxSei4DJRrj8xskA0pZyOdFM2jDOwbXG961G0N9rRrYwhyZXFxTFsi36j9D1NRkXCJiQck9rPKlDjsmXXxlt3frZh8D66NZhNngIhMKdHrBu9gjaX6hvG7fxb3FltGbvYzBpaDv6VJTWkixE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MHbrmYcm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MHbrmYcm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361f796586so72186295e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 00:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737535128; x=1738139928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxsC/lnPLJHrCczRJkEAqLDOauntTBgxm3137kAbTzA=;
        b=MHbrmYcmlHjAIRWXpsaboxmfDamPaFycWBdXfnhEsOkjE7JXPY9RLxPYNoFzgSsKH8
         mSJBqVhgDtzeMbAYNx9lQ8BUlMmbz2knaANIkjvRae0CHqPvk7ve9/Q+7ZacguucpjYE
         4XaYNoDu0w3KbMTOj4rH8vu+4B/e9zZo2P6qyfOP6bdzw12rR2+vA7SPBDDcrLSxoIUP
         bNGmvyLB0NZfQev5/0gxmPmSp33HncQiFPyusggi7lbRjSpOzQBIgZU7oYIOXGjg5F0i
         030g2JPG0I0u7Dt/AzLcpSt2tHXFv9EQV4hn7tAPSjey3AGvd37NYiOCwL6mQa32/CoY
         idNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737535128; x=1738139928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxsC/lnPLJHrCczRJkEAqLDOauntTBgxm3137kAbTzA=;
        b=CfNXUh5q/j1R/Tm+VzwD8cJd430ha/IKkZusPhOZ9qycbipMtoQ+Z9Pq9D2QSzEarb
         k+o8MRWs3Hx6c8n72LODbt5SyHixKhVUKLoKUg/UqxRHpdm7xwRNQQ+Z1UkLqn90znyJ
         bo9pVXuZsbIUWtEeii7T7CN9zutygtyxaI1NOTMfzB57nuMQt9mAtwxD7ky1/ZU/dYA5
         G/8jsjuOyhfs+ESkwQqerLJSt2VRTyrGfFrpKAAVWA3l4OE9hZjdxpTzqKXIBbw59PCf
         Y/bQ9IwCl1rwi8eTk0YstGWCmBY0hzdvF4V+0EXVQ3+vZ0a0JjvBcj+97oa43vXSoGGF
         tnug==
X-Forwarded-Encrypted: i=1; AJvYcCWIWg2G6lwvXLysaODdPDH1isu9QJ4z98MrQY7RbyXdS6R0QNEafqHIrKt0x0/0tF8BpAsiVoSb7xuiFHcUiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLpGxwH1Z/UhsfqYOH4rwtnKRlN/EfJ01AhmGXlBvyhLPhtzyq
	RUSnJjkniTnw9pJBF+TkQSWJiZmIiWe5hylxkoE2/4RUvmUbmiGSSibTwFMrXlXIQl2pRxgAOCs
	MkywG6mS4hNEw3QOEGvi+bhNstKCujqDKz1hY
X-Gm-Gg: ASbGnctZhdRHJ3NURSh0zuOCFBwX5G9h44NFyDPIL4RA/uPLzxNYltXMS0qJm6sG2zG
	7Ue7zTUVv2FO8UCx78G6pugs2A5IkkV6WJXYnCYQ7XXHorXRLvYD1q2uFpXfb0BPA1kZHMkclAD
	MH2Axj
X-Google-Smtp-Source: AGHT+IFPuvOfZfw1b6egw4r7DiMV0eyONzBkuus91kMgCRJ74Pd+1Y2LSEfTb91ly597gdda1T7Uy2XI5S2InOftVvU=
X-Received: by 2002:a05:6000:bc4:b0:38b:d8a5:df43 with SMTP id
 ffacd0b85a97d-38bf565a587mr18003489f8f.21.1737535128333; Wed, 22 Jan 2025
 00:38:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-gendwarfksyms-kasan-rust-v1-1-5ee5658f4fb6@google.com>
In-Reply-To: <20250122-gendwarfksyms-kasan-rust-v1-1-5ee5658f4fb6@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 22 Jan 2025 09:38:35 +0100
X-Gm-Features: AbW1kvZg0Mv8xtaENSsxfpITIl4lLLkLfFgL_7of5oMVFQxtjMmJFBs2fAK6yX8
Message-ID: <CAH5fLgiyNBn3CtS8EBRsCHCSo1OyafhA2i8rM7VykWsaOMxK1w@mail.gmail.com>
Subject: Re: [PATCH] rust: Do not export generated KASAN ODR symbols
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 1:14=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> ASAN generates sppecial synthetic symbols to help check for ODR

Typo: sppecial

> violations. These synthetic symbols lack debug information, so
> gendwarfksyms emits warnings when processing them. No code should ever
> have a dependency on these symbols, so we should not be exporting them,
> just like the __cfi symbols.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index ab300bfb46f6a3e386b86d58120d7aeddc57da37..4f212bd41e74ec9f25445d3af=
76818332f288e15 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -329,7 +329,7 @@ $(obj)/bindings/bindings_helpers_generated.rs: privat=
e bindgen_target_extra =3D ;
>  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c =
FORCE
>         $(call if_changed_dep,bindgen)
>
> -rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && =
$$3!~/__cfi/ { printf $(2),$$3 }'
> +rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && =
$$3!~/__cfi/ && $$3!~/__odr_asan/ { printf $(2),$$3 }'
>
>  quiet_cmd_exports =3D EXPORTS $@
>        cmd_exports =3D \
>
> ---
> base-commit: 0939156bc07c9fd2b554d9813352c386dacfc3d9
> change-id: 20250116-gendwarfksyms-kasan-rust-2bdbac027f88
>
> Best regards,
> --
> Matthew Maurer <mmaurer@google.com>
>
