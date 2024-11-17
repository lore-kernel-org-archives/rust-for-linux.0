Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1C418054
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 20:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731875610; cv=none; b=tuGpNmjtruHgF80/8sX3sQGQBtqA7ZGrnJADa/pD1d/fRVe9mgGVhmLu1NBZbJhkyoKlw3iP5nNdudZYvwn13LtDVO1kHkLnclCRyn1MDqiP+I/jkHvhNcFfXocvzpdMrE4MFDb93lbVZnKLHwXTO/JQReafYtE0++mBm4tUC1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731875610; c=relaxed/simple;
	bh=3y9ixcxyUAi+RcOZKGlULt5p1mpPb8hnnQY04gkonks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+6IceBRswtcfgOwllVGwudQc0EAb6UiaMvB8kbUp4yJSkm1cMbuCKiyuyJCIiPIR9LZKky0qhazZReF1u9J869u32OYDgT7xzKZPPIPh74BCqHsPwjM2B0+utTjxJW/OxSRmOEsyNxmG8fwsxT6AWQxknrTpJfwbJjTmgGoH40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IujU+6lI; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IujU+6lI"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7ea7e2204d1so699104a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 12:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731875608; x=1732480408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3y9ixcxyUAi+RcOZKGlULt5p1mpPb8hnnQY04gkonks=;
        b=IujU+6lIcWSj6CoRp3Aau1h3kJ6BOi/i3/iX8+EbFnHOvPFW5CqFDduEwJohIKK/wW
         vzvt6Uu6zLHDhFi45DlgBUHNpplXrq3YTStvQqfp5YFEfCJCnZqN6piZvX/A7/ul1jxS
         v7OVMG1GX1l7OZjmgMfB+UWRT/LOoHOS5DOv+OdzvI+bQSvKwKNNI6r16cNiMpaIeA6m
         FoU96RMJJJB0LU4rHUx3b7pryGddlo+h9UdHSJuYeKkKzbkwmsmPPgOdQbkQ6YMmSFg+
         SH2Ra8ubZ+DidVhM4H8z9gwGQ32sLixNRrZSwUhVz8DnEpiRuErU+qhJtF8RZWiNHRXi
         xupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731875608; x=1732480408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3y9ixcxyUAi+RcOZKGlULt5p1mpPb8hnnQY04gkonks=;
        b=bevOUyzijhZbWTof5QBXy1DXFSO5/I04RDqORu+fBXuwmk/aqtCzYHS7HPPbLmF2Cs
         nC3laV6SAksimI4XwAqVolWXBhO5A+upaXuGqWOhujtgp801lGJFXT/99nC3H9q8IM5c
         /WCXrskG6E7D+Q3i1qStg0jJQUp3lZpFcebYXyrlHiAqIZkgPW8TMrnO5SmcgNLZtojW
         Zub892fv004CImWZONaeFtX5NaKi3dKmU+sNiuyomh3HQCEb1SYV60fA2CimgJ1h6aqE
         nU9xXCeQJxxmGkF5S0zREIshqbDLkSQY/Kv5W0LmcdtIPWyvQh0iAMv7PMF5pIykr+rx
         Zi4g==
X-Forwarded-Encrypted: i=1; AJvYcCVqDEf/xDDfksFf4mpvnK2uTJGdlws+M/wnL7pYbu91q0QC3IOjc/+ythDzKdurqSSKP0YGwxjk+bICuS1vqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ57+x8ynAskbQbw2eiQO1zNObhRRfn40UWvu7wvrHQ1cRGwKh
	56amXN0fit5FKUiJCJVWg/uruOfXHsbD2vcUe++mNKQbltpJ2zk/n2MHvihb3aTjFFthjr2lmCY
	BoaN5fgXf2jZsa1j9947knd5QPw8=
X-Google-Smtp-Source: AGHT+IFXJMlCX3EEMQwnHnggJ8V95hjXcqULEw3mJKri6MrPF4RJnCQDuJl/9p/7nvCk2+lTANsNYCdQdzAfcy91nD4=
X-Received: by 2002:a17:90b:3a81:b0:2e9:4a0c:252f with SMTP id
 98e67ed59e1d1-2ea154b68fdmr4938512a91.1.1731875608437; Sun, 17 Nov 2024
 12:33:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116195221.373332-1-daniel@sedlak.dev> <20241116195221.373332-3-daniel@sedlak.dev>
 <CANiq72ndAQs4EyY22pAJdjD2x+eXsBJGYXFebuVj_zD77nqfYg@mail.gmail.com> <CAMFZ4eQQELStY48SLsRzm3BkKOs6y8AOnQ1A27HjHAufeEiD9A@mail.gmail.com>
In-Reply-To: <CAMFZ4eQQELStY48SLsRzm3BkKOs6y8AOnQ1A27HjHAufeEiD9A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 Nov 2024 21:33:16 +0100
Message-ID: <CANiq72kTzQ7dzJfG5PxYKfSUafJ9vGz66u57oaEAyNuaBQ-iXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kernel: rbtree: replace unwraps with functional
 programming paradigms
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Matt Gilbride <mattgilbride@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 17, 2024 at 7:36=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> w=
rote:
>
> But if you think that it is unnecessary, then I will only tackle the
> previous scope
> of this issue as you mentioned.

Let's see what others think.

(To clarify, I am happy with the change I quoted for instance)

> I am not sure, whether I am using the clippy right, I am compiling with
> `make LLVM=3D1 CLIPPY=3D1`, however, no clippy warnings are triggered.

That should work -- are you building the doctests? (i.e.
`CONFIG_RUST_KERNEL_DOCTESTS`).

The warnings I am getting are `clippy::map_flatten` ones.

> Also sorry for my question, but which new version of what do you mean? Cl=
ippy?

I meant the future version of this patch, i.e. v2.

> Thank you for your valuable insights!

You're welcome :)

By the way, for v2, the patches need to have some description in the
commit message (apart from the title and the tags, I mean). Thanks!

Cheers,
Miguel
