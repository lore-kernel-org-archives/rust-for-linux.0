Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C4D3FA5D8
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725921; cv=pass; b=Af7UacvXyMMNGgWGwU0nwmz06WmOr/hyF70SrnXmgPv+qt6LaEla06XjoK6NIgPdz3s8AbX0awU3GjApaS8zHFrJuBq/HUr5ZQQbs7j2Qoqx6V4KlEL6Q7i2oAkMbfKJpl4JOfZpvJT4gjLIDeVm9ijzCPrZJif8KdVwiQmONro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725921; c=relaxed/simple;
	bh=0baEcWrjmejXzOJCA9gRgLFh8qlYszDa3Bn+Q3mqPvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xdzd33+yD3M5M979Hdw6GzwEvqeIVu5R7IJSom07m1UYa4no0rmBgz3QDGRVNHEu4LeWY2Blzff3ssrCPRJ/IIiNdFHv4BIzGK8Bk30HYF92npz6kh6ux93SmhaA6g3GIlShHtke+jMeelMnlqIrZOWcdwPbJpf0FgvRgp9/otk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSdqn9b4; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSdqn9b4"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bb87c90deso361326eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 02:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782725916; cv=none;
        d=google.com; s=arc-20260327;
        b=mTPPUQuDUFw0wZhZD3OZgV+8xK/mC22LkivBcFIKIarFAMUM8lzc7vEyzvJFkfmKDK
         QEWIDHtA/HwJIqDsa4t0ybWBnXg2k8iJVOdkxVUn7Ap4bzFGDsS4TsX9a6M79qfwxaRN
         DkPPZM0c8nA8l85dtrG/winrK/jVhGNDNGPoQVpPRpUMDUvjYuDSj4OXGFmyFWksNvmw
         koFfm9agxmACzQ6mH2g7tuBlB/vEzobno/zj1KM6c+XvxrTg6NGeXJ9eEy0wOoHxuprp
         9pEZnulyluf1AS3RmHIWs+o8wNDEelAs04+DdzfMz310tW2z0tP5cl/yyIorFbFvWgkx
         pHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0baEcWrjmejXzOJCA9gRgLFh8qlYszDa3Bn+Q3mqPvw=;
        fh=FFEaIvpGiYyP2CLI00D4WrOXk4xs0oVJPwjb8X3m50k=;
        b=hmKco/so4aQ5Z86rtlGbsAcu6GCxF3HeHoN9TWspBuVtdkS3MlTXy0wGacyoDeF4E8
         KSrUo4Geg0kNyBPC4Fizbo2X28jj7Of1YZz5PB3vrdlio7s4p6IiY7IIkZIwG+waFtgg
         th712OnYNSKHAAapuWMZF41ZyDhpkhwoe/UGaPuraIDyYmVQ3s2y+iHRpJPpzrTdlgKR
         MXW2q6OX403G+HyXNH0Jd2YRczLC/sMrN9YWoWgciW3wBSazQBJ/9HcrZvN6QDBSxWxL
         FH6yycHoAW1XJxJSbu9IZSt6g20vqRZUWzw1Lwb7F/WJx93MoJUWvlB1XUhndzwjpa2t
         Tlig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782725916; x=1783330716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0baEcWrjmejXzOJCA9gRgLFh8qlYszDa3Bn+Q3mqPvw=;
        b=kSdqn9b4JmJ4IRxHrStSsXzVwe2mceTc8YgXVXf1I67WQkWfSPD7fb3JljLJSyGju+
         775KuywlCGlVYCe55vHRhdZYyiF+n5diwAyItuH1h8rTpMusOhe3cTObHA7N/KZaQXkm
         qOF9H8QCnDLuslT/H/cfd/KiuC5LTGWsBkk3++KqZ1rZN0FOSuRLvNDw6k3zPgfIHbCE
         zgT5AaBn3xOyZ3YNDqEuyzDFCCro/xdgNcQeHl16rbzc4uonWs5Sk96ZcRALVTB7EZsG
         7IFRxX23Iqk682c1xCuK1S7j3PGJQQiOBaBCCVXKD3TXxn7ggz5k1qtOsNQfaf2Z6ViE
         s0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725916; x=1783330716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0baEcWrjmejXzOJCA9gRgLFh8qlYszDa3Bn+Q3mqPvw=;
        b=jtcPaLndqGivFWtAlU5cErDvFPrcOLC7A8WaipRfADzDYDYsFwDHfFLsfP+viNyOQl
         LOM5ecZ5OZiOS5j2xb1nxg+1uCofNbkFE/9jOmkZMECLCGrElWSwl04MjUEuzbiRRFD2
         OMqDWkWy/6Bh2l3c03A5srB3SkFomCLnoTxm2+1+f46prdUCa+mgrNsx7D1whJHxKDHN
         UFant03g+bWLSaOZwwX51ZTYq/tVsmykqTEgArHENOmLpaX4qSFdzfv2u8UgG/wyLvMv
         ofrdpJI2ssP+jNDSSi43wtWoyjOg5lEg81DLtCeEBnsYzDWLaMhqF3bztx2y4MUtdehg
         eMJg==
X-Forwarded-Encrypted: i=1; AHgh+RrArMSF7c4vwXBZpu21t00DGNOTlFI2A3/i62RY5cRpKgnhyk/tdym0d2XfL9PJRqP5uzLByBFDgeayxudJeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFTJFLo0tfoFTUjnGZm7dYqH11nGFovlQd0Q89k5zTUabr9W8q
	mFMp/0spuhwIWn4pvNiHOpIsAcQL88Aa/oqAwyEjQJwvmTEJi1rsfu4pof0pPnBLllq2dkZVpDP
	3guXNatdtjBLOyAgxBKYjXtbk/w8zDkc=
X-Gm-Gg: AfdE7cke7dtx0d992bRRJkumOgF2coLw0HFaBpUeDs1U+TRtyRjK/zXlBqTFqXwwNjP
	EyjsSrE+JbW1G1msBmyCNhnBjkeYwQYEZ6HWMM0W2IBZg12nRxfp8YYCIArtkYP7Ew5pTRabpwO
	bpwkX2p2VZv5cU8m5C7ZpidYqbeLsRTr15VWGtzr33FvedIADSw0CexS+s1Szr7YvhCpUiedIEU
	yMxeeFiFkA/EfFgG40Zs+8TEFsoM8+uG0P9MYNGqlswESqSSkpocFX8lMcwfJEFFvAgVzt02pgk
	RGsFo+pc0ks5VBHBLXGpye+2z+8Ff4tRsZktNR79x6jbp5jr4MY1q7Ryw533DfftoxZfBjfPQqa
	YXkE7WHPJpzWf
X-Received: by 2002:a05:7300:e6c6:b0:2d5:9438:2a02 with SMTP id
 5a478bee46e88-30c84ad9f55mr7563457eec.1.1782725915854; Mon, 29 Jun 2026
 02:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-backport-cfg_select-v1-0-388d5d31d9d4@nikableh.moe>
In-Reply-To: <20260629-backport-cfg_select-v1-0-388d5d31d9d4@nikableh.moe>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jun 2026 11:38:22 +0200
X-Gm-Features: AVVi8Cd-mNVCE6A1aYsBrPZBgzhwLBfrMS9qm0R8xBziILhTrnWvbaBviPHRvC8
Message-ID: <CANiq72kG8k3mk+Xjr6q7aKg212QUNtZk5w4rxV=UGR5UXKE_ng@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kernel: add cfg_select! and use it for
 config-based selection
To: Nika Krasnova <nika@nikableh.moe>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Yury Norov <yury.norov@gmail.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 5:52=E2=80=AFAM Nika Krasnova <nika@nikableh.moe> w=
rote:
>
> The standard library gained core::cfg_select! for exactly this (stable
> since Rust 1.95.0): one macro that emits the first arm whose cfg
> predicate holds. The kernel's MSRV is 1.85.0, so it is not yet
> available.

We can use unstable features before the are stable -- from a quick
look, `cfg_match!` (its previous name) has been there since Rust
1.74.0, with the new name since Rust 1.89.0, and with the latest
behavior change since Rust 1.91.0. (I didn't take a close look, just
going by the tracking issue).

When something like this happens, we typically want to consider
whether it makes sense to reuse (internally) the original (if it makes
sense -- probably not here) or "forward"/re-export to the upstream one
when behavior matches.

For instance, instead of waiting for the MSRV bump, could we already
use the upstream one since Rust 1.91.0? That means that we are already
sure we are using the upstream one as-is.

Or is there a reason to avoid that?

Thanks!

Cheers,
Miguel
