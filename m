Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3242C34252C
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 18:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204080; cv=none; b=QkMjaZE84PUDP0Aso1cjbWbKfuG7PDwH3WftcVpi4KfW/C7oPoXH4I86NPn+N5EcxxdiroNOu6X0/apaS6qFjYaQdbZ9yT1Fedc6+g79Efb8nbr52UdtsXXOl2lcmu6Yca8Mht9DyCuyqw55gOp0aiI+X6fZiA5idMg+1ZsUCK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204080; c=relaxed/simple;
	bh=Xrya9vPc4OFCd/rd8ebPFG2j++JPZk62jnZUUWoJIZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpgWQm7cERb6JavPm49IsxnGFArzobEXoFmrAbMKd5UZdPo1ryXGqDl0+NFyxNXbAYsqWfNTzYI9LYWBWmsNwDx54jzizvqL5dHSDrnwTe/Fx+9HPa53T49F9lY8tqm4e9rSabSAielL1Uio5hwu09o4dMndw7oMGNu1bqBz524=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7+YwwK+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7+YwwK+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5F01F00A3E
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781204079;
	bh=MaDmRmwgYsd4Biu5yzQqwaVdX45NdX+3T8JkxMPsWnk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D7+YwwK+Hza0Q4Bsx1wxS9J/fwu4YtYzUfJtHfBp+59ZriQKktbyOAMQst4gc9FLc
	 KEvmD9Dw+JORsJb4Tsgw/xuF0AX+FvPFK2JIFTMf+Ym+lGt27xosUs/JpVHYfglBrc
	 e+FVpGY0k8ssT9Fe5CcXRoQCdIjXZQIFXEBBCsz4oUujYrThOrUuJ9v/fk3l4M/gWl
	 WkQ/rNgf/gK9x0nSClwD9+qlCyOD5MtzZgVsTdQzIyf8GnEpHF/DrY6uSIGYC2H/8a
	 a9Cn1OpaZy3T73NesAm07wz/2Bg0Woy5pe1+CZIzlZHxaM956jkdFh4iHKBK3jfeCH
	 OUWO0G3WRKBgg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa66893e9fso171840e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 11:54:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8GrCtStIEFE45S1yt18z1IiAMjwUUqFJ/jNF3qrMgrJfxzCteKK+fVcS/8gSe0kKO6L+qErYKkDPBSnnS8Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfTWP3zXVxZ6AuSXN5bsR9/dJ+Q9BlbuqN5mQcjrY2gty39CUW
	f4FtWWziHIBozzSmPuMOYWg9GpzcrVCPuDhRlznH43zFPqQn2AQzsGwFsYw9UPsRlfAX25Tx7A7
	SM8qJW2CwYbfdvpFR22Kcmw1t6AazjwI=
X-Received: by 2002:a05:6512:3c9f:b0:5aa:6cd6:a7f2 with SMTP id
 2adb3069b0e04-5ad27fb49b8mr1187268e87.38.1781204077898; Thu, 11 Jun 2026
 11:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611055538.61425-1-ojeda@kernel.org> <20260611055538.61425-2-ojeda@kernel.org>
In-Reply-To: <20260611055538.61425-2-ojeda@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 11 Jun 2026 11:54:01 -0700
X-Gmail-Original-Message-ID: <CAJ-ks9nHYyrVHEb=XTibmg1RwCMbsf5F3imdMxCFR5ARBG5Z6Q@mail.gmail.com>
X-Gm-Features: AVVi8Cf-80P3oZmQqQd7K3MDJl1nvkOdPbfQqQhB-0DKtOY08zBpCDytKIxpKb8
Message-ID: <CAJ-ks9nHYyrVHEb=XTibmg1RwCMbsf5F3imdMxCFR5ARBG5Z6Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] MAINTAINERS: add Tamir Duberstein as Rust reviewer
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 10:55=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Tamir has been involved with the Rust for Linux project for more than
> a year and a half now. He has been working on improving the integration
> between the kernel and the Rust language and tooling: he led the effort
> to replace the kernel's own `CStr` type with the standard library's,
> and reworked the rust-analyzer integration, among other things.
>
> He is already the maintainer of the `RUST [RUST-ANALYZER]` and `XARRAY AP=
I
> [RUST]` entries. In addition, he has been active reviewing Rust code in
> the mailing list.
>
> He is also a long-time contributor to the upstream Rust project, includin=
g
> on topics that matter for the Linux kernel [1].
>
> His expertise with the language and its tooling will be very useful to
> have around in the future. Thus add him to the `RUST` entry as reviewer.
>
> Link: https://github.com/rust-lang/rust/pull/139994 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d34aeaa415a..813c75e930ad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23394,6 +23394,7 @@ R:      Alice Ryhl <aliceryhl@google.com>
>  R:     Trevor Gross <tmgross@umich.edu>
>  R:     Danilo Krummrich <dakr@kernel.org>
>  R:     Daniel Almeida <daniel.almeida@collabora.com>
> +R:     Tamir Duberstein <tamird@kernel.org>
>  L:     rust-for-linux@vger.kernel.org
>  S:     Supported
>  W:     https://rust-for-linux.com
> --
> 2.54.0
>

Thanks for your trust!

Acked-by: Tamir Duberstein <tamird@kernel.org>
