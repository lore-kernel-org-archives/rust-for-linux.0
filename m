Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1255233D4F8
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101320; cv=pass; b=hCG6u5e/3wrhlEcBOWAdMgrngfukL/lZ6AbyRZn93nBm/CeKZGQuEeoEyMgDVsDTTwYCoSU4N56VjPgpvIzJNM7JWqCXXtRXmOVvAjSVuhdqwkmOwER2uNXhB9VfD8NTwhPMjO1SwpQeEtNfPvDNvLu+Za2VtpREJgVi0kR6Od8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101320; c=relaxed/simple;
	bh=otnJdxOShOrpo0XykFB4iWQbCQIWNQByJ+F53etT5HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J2FQMmO8xV8n6UdcdVEwVDXyU4TxiZF+Y6TwX+qXzBO2qcNwLzFUeLkhhj5mK+pn+0nse9NV1SxJjyx9xxCSKrLeR4mGVkACshKEYD1HpdCaxyQIdwsATe/LN1jN8QwAUhmliE7f/luLfaIdq7whRoXTu8Dav+tMY7uNX2ZtoJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0+MlddY; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0+MlddY"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304e86ecebfso447393eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 07:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781101318; cv=none;
        d=google.com; s=arc-20240605;
        b=P+QJLHTjh34dXZQxHBwoP6M37D0qWMqGnDqbD4yQ6L88qg25826LW7RFGPvexvhTp8
         VopaJHt4qZJAgR4Oxi2X2ox6mi29wXT2HtwjaOKgs6IDs6/CS2gmhZ1bk2lfX9FAyF0L
         RfhRc00ur5zWwC+tZxT5ZwSG4vpGClMbGM4MO8gdo++U/yBw5g27lNafQNOylDGKu3iD
         CeF5hOYlLTdetR8wQGl0dZq2KkjiHNPTFWGHv08xUWxQL6l8KmKdBt6EAPr/BDn8idpM
         lE64sl83FPRScZdfaIXo+xqz9rpvbP/C2OmyvMt9MPoRzZpMFRIlia8kg5v7kgThjGk3
         9NEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=otnJdxOShOrpo0XykFB4iWQbCQIWNQByJ+F53etT5HA=;
        fh=WkcI1+BDh5lgAH+2k/Wbf6XQHghdnbJPxsHpFggKasA=;
        b=jE3W38Chyb5ynmE3/uKuRdpYHrsPE2ezFenC77eOpGsiJOOtRtkVQF9YiyEN+AIz1R
         Gh5pAtDtYzS2Z5Ob6eM/cINTknWugiBoSWk0gmpYc/mfR4jAePMSzrwL2ELoFBtdlyQ3
         UsldZ04X7K5Ml7SR4jIBJCTG7YjMgs7JxfZ0jMY/aeE7EmA+/Iu2fogIWg2CxS6tEMSr
         ELKw/0KAj334/j4t8TFpZXPdfTep2oHRtpWUJB5AOBGQsPufHtStsmHC9cE6UPOcyYVN
         AIkNfnB8LqHWE/jJRR3KzMVqsXDpvDqWC4EuTDX/gkg10/jsM3rnhBvy+c+vEr9UOLw5
         78zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781101318; x=1781706118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otnJdxOShOrpo0XykFB4iWQbCQIWNQByJ+F53etT5HA=;
        b=f0+MlddYfGf7ApvjB4kGj7/pJHImKm55l7qO1bpWOLCLvwlxeSGqVsddBRWv338sUr
         W615xj5B5QPaB7aKiajmFqrYjH84vxmUyHTX3vXqZIWsoeJzP8o7IW5pUeuAiOWCHOpl
         E2OoDh1hzlb19n2sx+KZMRKvUdYPWd4/DhyguDBo3ELcJd2uWPgW86AR5r7iodcRpEOF
         7aNXh3owOmNq6MaDzr5XgmS4dlV3Vqzh6JX1hIHWTAMSNdPHePBd5lFY3YyphhA6bf0t
         XJwRnDEWxLOyc66VrSZZP9+tg+3zkhV7+KdOvnes/LOUpVIIWaYbdjmSfchi4wWd2Kbs
         tyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781101318; x=1781706118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=otnJdxOShOrpo0XykFB4iWQbCQIWNQByJ+F53etT5HA=;
        b=osprRnlSUsoWqWegWmAjBb4aE4MNHBSoSjb1HObAbgDWMEGSlDNJrrYv8gzrdzB97o
         bmSqyWat1BIugN7dOKbBBmarKiGw2yiRx1qNGRzYl82bFhMpdP6dKpVIpjUyAptjB9iR
         4qAbLBzzF6Ab72LX/jOPD+PKFs6SgVU7aT963fUOn4PSbpnTw620X5VfiNkbusqHgYuD
         o02ooaIs0AWsqB4PE0xf2IdcIZxrGqFZxsEomPXDMj0X1EQs9RGfReH2AtSSsJ27KySv
         g6OYOjTwOK4kGIZzitfSvzyVzxxms3SbxLDGYR4tXGmvHjE7t/Jakcq7Gg+wy/s5SkpA
         vezA==
X-Forwarded-Encrypted: i=1; AFNElJ+VQpbKJ2ex5HqZZjarSwG50Pjhlbn+Rh/syICbmDfzSNaNTFxIH7eZexjrkWbkENoghqRwYIbMvwU/uXfBvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx70QKJYh9NG2faoy1qlwocLWviBQI9EgLjFsF0NpL+2lKf0tb0
	hkA9UzFxlzWyZR+uapGHOtIjEHLNHrXB8IdcoQkllR6AB0WY99K1eAUSSMsYCc6Mqv7K0I8bgDu
	/HF5hsylSoAor8tUe6kPP0cdFdsWZr98=
X-Gm-Gg: Acq92OGjiM0/0xlIKeRH1eK7/fyQH+wu7oiem8zA8nwLoNeDkB6zh+AjGBvEnEWPRxO
	D0ECSS6yFCtyTT9taQSQ7eWEfd0JpxLzSaxsDEE6NrL4G0Cnp4PHYzV5lbWjk2Yv/ycIUeI9wJz
	FevJLTjlD4s2qK0TGHmjyfpTGx0Iddt7iIY8WTgCmDLLGD05Thz41jFQqaS66BVFirNVkpyXO0B
	3QkosRNlfh+3lEMlsZVfLaKGiqM/vzYp3dLr6ZCULV7ym62e6OQonCtpzcwyq2tttj7LEwb0tKH
	5HYEJoxCaDURdGmObf8A3JyMbuDICZ55gubtaMtAlre6/lo7R25/UdtF1oWLy93Up/BiyxsS82Y
	HrxGm9yl0kjABO0WAeFowBXme3y5fEp4h2g==
X-Received: by 2002:a05:7300:fd16:b0:2f0:ddce:8468 with SMTP id
 5a478bee46e88-307d6065464mr2350441eec.8.1781101318239; Wed, 10 Jun 2026
 07:21:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610035544.3333022-1-georgeandrout13@gmail.com> <20260610133241.374115-1-georgeandrout13@gmail.com>
In-Reply-To: <20260610133241.374115-1-georgeandrout13@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jun 2026 16:21:45 +0200
X-Gm-Features: AVVi8Cf0_8XDg6aB6_Kr9pMEvAv3RJDADC4urLLbrhO_vb7xc0BbHKTeZfAUHSc
Message-ID: <CANiq72=FTNz7MdOL=V08sDjfEDOPbGw1jFH=9VvqqqKM0LvRWQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: add ownership assertion to Node::add_death
To: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 3:32=E2=80=AFPM Georgios Androutsopoulos
<georgeandrout13@gmail.com> wrote:
>
> debug_assert!(is_valid);

If the Binder maintainers decide they want the `pr_warn!` (`_once`?),
then this could go inside the `if` with a `false` condition.

Cheers,
Miguel
