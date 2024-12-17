Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4101E3DF7
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 23:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734477842; cv=none; b=Nad49IaK1ngRBeNUyNLv444kSBDZo/rEcfh8U60rhni/WYnDKloBkpcDiiiEfPzDDtvUC3NpOan6kmwxFm6MNRRPuZNeXKScNf1W9oZvDiK1fdyQzgqNzqwp6+XfcSKyndfJ3xwzP5N36ULKUFe3E6QeORQlEny6XXVXUfLD/Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734477842; c=relaxed/simple;
	bh=ymeaOJZmvE8wF6zmETmwV5TmbsaJXOM5YtfdgP5ab5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZgxEnWJb+QXldx9f8iDA/k8i4oTw8PeiJAlgjRRt3G6jRlLk1aWym8FywWSNAtMq6HJh4H4ofDdH4Qiu7tg9bkWm7BmuXFcrLByVHnxHJtsBGZnezu15BGyvXGVPkj1oe8Ac8YKqkjBB1uxaX2gZpQrFz6avv4TsSwdc2wOu9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDCy0B/q; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDCy0B/q"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ee6d0a57acso677019a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 15:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734477840; x=1735082640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVtWoayYzY8hJfY7Lxf04gTqooZ0qJtS1Arp5jV8vHE=;
        b=NDCy0B/qrXhwy5GnVJFeiyC8GImykJy/3sArXgCKTv2DM5EvMwPJbTP0u1YQrRxa87
         5Dd6xHQDG/xkVJfnl6Dfxk94qTchA3RDk4xktz5tMMJsrD2/MX3athXfe50iFE3sJ/6k
         M0cP9KtHiUmzDEzohYjJYN7qQEbbKF23WbFrINC4A5tfPQOOJdq4lt5obi9H/ARlwiPd
         uGO723Giq92qpvAlWAYpNaYWFjxtX1Ojown9DVTMfCG+bzF3JiDzIFlPK2oK7Zwd6BlQ
         grXX/wI8NqmX1dJrcxEHF/0SZ6LQlvuCx+G7+acDLjzxz/FOavUS1HenBMgVf+/S7LiS
         QhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734477840; x=1735082640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVtWoayYzY8hJfY7Lxf04gTqooZ0qJtS1Arp5jV8vHE=;
        b=G+GwUNhyte5boXvZp8yFPCySVhWj4EQZ/d1DJx3U+9TtokzJYVf4fouckU/w5tyNC0
         bgzov3SnhFOoTj7LfTLAyb+9h/AchEoz8DO31miSxcydOeFmf9zqPQD1FPjOtrI29+6h
         6UJCD92ej2crNSqJPfIXGT/de8HTv14gY81cLlgBg/V2LTWlu2q7MkpFGy/slzkfou6L
         q8KPUDoeL89dCMkz8Xkng6Hl8SO5c9nWeTxDJp+l3PxGKoqTuZ+2s9ScsBg68qwh0nCN
         pmDUMgg1yE/htzTFxTXg/uMn00/kCApJ0Hu+6R6iwRTuBv3AbjjB5x3WTP5c0gp6DzLo
         VCag==
X-Gm-Message-State: AOJu0YzHVb/WmvKClYu7SZQ40qWHMLNnqtiIhaMYoTiqWhDsNUTvQOm2
	9Kl/FgOtO6K39OIIpFTMOPwngDRk6GDLUMRSip/BRl6uwt7RcJUJuZb+lLQIFBOvj3a3pvD+Pni
	aQ3emGjERn1VotbXDS4jzk3FF6tTGvdXz
X-Gm-Gg: ASbGncvyq7SV3OmTAau2mJklz7yrgWlOcysTIXNAEf/kFLWVGvJ6CvBrTw8/POaj0UL
	dvYroP8xl+mDvLe+qqgCTJ4uGR5M/Mc/z96+S+A==
X-Google-Smtp-Source: AGHT+IEaR0cCHPbcK00uYDUpPp3wP5S0SNRKgThAFbPF/e9K9ol6IpcHQWmzi6hXtFqnt3rjgdl0aUP+s890+9iRacA=
X-Received: by 2002:a17:90b:5150:b0:2ee:f1e3:fd0c with SMTP id
 98e67ed59e1d1-2f2e93be001mr374989a91.8.1734477839757; Tue, 17 Dec 2024
 15:23:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cb953202-0dbe-4127-8a8e-6a75258c2116@gmail.com>
In-Reply-To: <cb953202-0dbe-4127-8a8e-6a75258c2116@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Dec 2024 00:23:47 +0100
Message-ID: <CANiq72kQAKeafOhh7iYCPMboPTWT+pce0b6ZgJodoyAy7Cj=dA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: workqueue: Enable execution of doctests
To: Dirk Behme <dirk.behme@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 3:35=E2=80=AFPM Dirk Behme <dirk.behme@gmail.com> w=
rote:
>
> The result is
>
>     # rust_doctest_kernel_workqueue_rs_0.location:
> rust/kernel/workqueue.rs:35
> rust_doctests_kernel: The value is: 42
>     ok 94 rust_doctest_kernel_workqueue_rs_0
>     # rust_doctest_kernel_workqueue_rs_3.location:
> rust/kernel/workqueue.rs:78
> rust_doctests_kernel: The value is: 24
> rust_doctests_kernel: The second value is: 42
>     ok 97 rust_doctest_kernel_workqueue_rs_3

Nit: normally you would indent "code blocks".

> Without this change the "The value ..." outputs are not there meaning
> that this test code is not run.
>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Trevor Gross <tmgross@umich.edu>
> Cc: Tejun Heo <tj@kernel.org>

Normally you do not need to use the Cc tag for reviewers/maintainers
that are supposed to take the patch.

> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>

This looks fine to me -- Tejun, are you picking it up? If so, please
feel free to add:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, if you prefer, I can put it through `rust-next`.

Thanks!

Cheers,
Miguel
