Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261AE2D9ECB
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277617; cv=pass; b=HZm9CX3ULJl6D9CC6wJ3Na4qGbw7vwkjZ80Rn45RWlBL8FZ+zIxCO1RCoTMwuEQX8Z0aSPyrgZKhxKeW7T/IqG/j2HeslPdc0Xu4Z8L9veqC0Kd4/iaPkdp7HBBYK/cGaZAmdKtXjrwGAUU3LnIQApuf3cXK1lwLLjjj3Y2NHmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277617; c=relaxed/simple;
	bh=SQMQ2nNoMlvs5BNEFGHnf/DZ8k1Iwt1ytZQm0Fd8SoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=nS1inPAbsN7DsVH4RM+fgfd9eGHKRun5wtbjGHiid554+tDPH6/5ekB1YnXst1/90qyTGbIbyFKV/lxhI/U35wrBF6393ksM7roRkOcq7QWblHKc/Wi822fqCU5uD2KF1JEGZ5/+sXGcUfMmarUTdjhOOGpQNSPDFnw3SEDxkPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2KIofvk; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2KIofvk"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bd801b40dbso196334eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 07:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774277615; cv=none;
        d=google.com; s=arc-20240605;
        b=eCvH6aesAGWRRefpXl7k2s4osZgt9TcU1FbfFDsDlzuFMEpMzCQAfMgpKlxzdvH6bE
         OtvqqHqP8ufCv3kwzUpCh1rTeOzay0yJJ/0R/86HsLve4+yZpsO5aDBs2RrSWZ/cHTUK
         BBX3sM+21X4IzDcllpQ3hInOh3MUCeV2eKL+9C0JwvL498BY7GG+CWGiPvV6pfaDf/kG
         cDR2Pe9TrSNOl3ZYffzPs5nSj+VI3ZA11iP7HP9oPOc9LRRJFrz3tmq/p3xJkEdLINf2
         rK/7k4JbYRNc7xE95ZUgnIsucGWnYjRSuBPN+SzCDpBH9JNgVjQyT+lq7KVdk4ivbG4P
         iNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LI8/dUz99GIMIFX7jL9A6Uqav/8pN6H5Y3gQQrLVq3g=;
        fh=yK4XHLIWEEWp3//3XUtiF80sVlULOothbMUsucZV64U=;
        b=hK6ljOaUKTEIhHk0TLAgGdX++rmkbpn1o2s+Smv1Lr8BADvTUFN8SbmqZHI1yfvXbR
         s3KjIRqEfUELFulT6uYPhgoYL9/JR38d1Jp08qOPAy1j/C4KzRgzU8vs2Ywb4x0pi4jV
         t/OUN53Pr9SonRpwiWv1X9OlorFT2Vi3mK0Xg4wyGR5rOTr/qvKt0LXlQyR4EVx7lxha
         daeviMGTmE0c2mZrek4NxmumUGOrSc2KNPgEaijEfOdgHSSLAaZ7DeQV5Ac5QW2znf4D
         PD9fZWS6uHOVC3QUpNEvkEkUzIuwLDVWb/efHvUwAlk8I5Jg4xWk5+FnJPwXKkzx5l66
         xnhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774277615; x=1774882415; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LI8/dUz99GIMIFX7jL9A6Uqav/8pN6H5Y3gQQrLVq3g=;
        b=H2KIofvkg6+R/rwuu2MKJgcRoUn0XNzw00h5MA26cQcJesqSCrGPkSvR7d2mBkRxhO
         NhBQgNMbGnC+kEy49birGI1Mab3iLuVgGBYbkhvXmdIFclq+L4TjRXljyot6tczYHZIy
         gZl/ookvI8+HopAtLVltzbhDtRYuMpXxT/X9X8s5PAiQXrGjLH1QMBFPrX3IBfEuFIHW
         ESf6rq2whtrGZUDrfvEuZOx+1LWtiBFaVRt2GpnsV3eXRlUtyQ4omr0eVga0S5isWHxr
         Js/F8QhQaSvxnNvhS3eSdySH0pgmLepQugWi3OnkpPjxYaSFTE/QVsHvecmtCCKUPbCL
         UvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277615; x=1774882415;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LI8/dUz99GIMIFX7jL9A6Uqav/8pN6H5Y3gQQrLVq3g=;
        b=EMUwrTAJJj8UmVUlxwZLPTlkMpRTHLqANtxMzIoUUbcBpYR+VVtkDjyK1dd0oefmPD
         HMGZasRX+76gUl+uD/XU6DU3Pt7v+HkXHCME31iCNShdOCrTHmawF3SPK8qywgvObxPF
         /IjDpjFndnR/zZHBOeZhGu3O7ukzznT6RBrFUGRlScUMORV69fatEYnHDFeQ5Ew0zRLt
         enXDNWmJZerS7ZFs/8p/eJlx0lyp0V40Is2J++H7sY9EgMF55JUHvNVFva8Hhg64q4b+
         HegYLZ8dVI1ewqe8VMqKA29tHOWU4iLZjhhCXpRFlfTfZKI1/6mKz1JScJibX0Jb5igK
         ABqA==
X-Forwarded-Encrypted: i=1; AJvYcCUVV8pxPB0xtP6rUlVo80+yiLOt8YUtP3humOwH8dAKzRPzjvKAgq5dLAVFybYUyLxTU4Pd7O9zDE5/mijYuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvViuWmr6TktHjZyElxqMoj/tZrYYkDgn6t6YBzjXIStDqolHt
	bJ5oGyaD1O81XRDuLocHNRwfa7PBYmFC47IT0EWptdYsvCg+YGonkk6yDQMf9HTokU4cecKoEqZ
	VvPtmXF/sHFh6FCOYlTqjC1SQ2i69hk8=
X-Gm-Gg: ATEYQzxwVYVkZSYHpyHpKkS3qcJ2Gr9LSKJCoFl95GHNyror9zXGCiFMKtT7icwr57P
	XjrrmL1eXztQwJ9IDjM4Y3EaLzMy+ljnQJ0qnKtNZWAJhf3lkjttjM7+KpzKiGR4nvOPCmAWUOM
	Ux/eVbKVihHS4iNKH5UXUkJ3TpUGk/Q6AaV1+8t7GHW8n6g8f7OxNRg8STSrKyye7u9VR/YPlIH
	JSnJ6APh9DLY3rHo3/F3uYm3BGePxtFB3l+ZXK8Go5vGOwtAEShRIAmWPhaepakWDIG3IPUQIol
	cYDn7tdw4iRq0JTHsuiv9XAxWMTC4NMT9yE1ZO3ipP3V6CO07riu6OM19DyB749qMPq2GkteSH3
	mSWDa4Nv40Hu9NVV/1sTJbvA=
X-Received: by 2002:a05:7300:3215:b0:2c1:27c:758c with SMTP id
 5a478bee46e88-2c109938d44mr2357139eec.8.1774277615132; Mon, 23 Mar 2026
 07:53:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260322193830.89324-1-ojeda@kernel.org>
 <4fba0163-547e-4099-8b37-5d8429bda6da@sirena.org.uk>
In-Reply-To: <4fba0163-547e-4099-8b37-5d8429bda6da@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 15:53:21 +0100
X-Gm-Features: AQROBzBN4j7-1buNPtn5ON4A_wtJBuiQQ3UlTVe5clvsCt_bKh7FB_BsDwGf67A
Message-ID: <CANiq72nmFsnoP3dv_-0PWH0XBpf0OuPzNR2CP9Hw56Z+RVifAg@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <ojeda@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Jean Delvare <khali@linux-fr.org>, 
	linux-kernel@vger.kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, linux@armlinux.org.uk, 
	llvm@lists.linux.dev, lossin@kernel.org, mark.rutland@arm.com, 
	mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 2:54=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Callers should never treat NULL any differently to any other non-error
> pointer, this is not a value intended for inspection by users.
>
> Having specific handling for NULLs is very much not a preferred
> interface, and most things shouldn't.  The caller should probably have
> it's own !CONFIG_REGULATOR checks rather than using the return value.

Yeah, that is the understanding I got from reading both the docs and
the comment, but I think the docs (i.e. not the comment in the stub)
could point that `NULL` is one possible pointer value (perhaps
including discouraging relying on particular values at the same time,
and perhaps mentioning `!CONFIG_REGULATOR`).

i.e. to me, "Pointer to a struct regulator corresponding to the
regulator producer," sounds in the docs a bit too much like it will be
a valid one... no?

Another perspective is that, when one reads the rendered docs:

  https://docs.kernel.org/driver-api/regulator.html#c.regulator_get

one sees the postconditions, but they happen to not apply in all cases
(in fact, perhaps not having the "Returns" there would increase the
chances one realizes that, but I understand that you want them to
treat it as fully opaque as much as possible).

It could also help things like AI review systems which may only notice
the docs and not the comment inside the stub.

Perhaps it could be at least a one-line comment in the real
definition, even if not in the rendered docs, to have a chance for
others to notice.

I don't know -- I hope that helps, in any case. Perhaps Daniel can
tell us what he thought when he was writing the code, as another
perspective, i.e. whether it was the docs or not the issue.

Thanks!

Cheers,
Miguel
