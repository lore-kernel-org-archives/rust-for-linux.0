Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CD82BEC2B
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 23:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788736231; cv=pass; b=AZdIshKsA4oGfXuWkhTRLMyS5EaF2FgQWD5Y253fmi9mNwARlnHJ8WsCg9Fs22iXChpMCI5BDUX3+h+ECdt/TeGTsbEDKSNZ5wRRzFR6RhwrETHQf3DQ3JdDDR8uzGJjxc9An7yDehn79IXQ5iX1Shqp1mGAqk8UKN/F0dtuN6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788736231; c=relaxed/simple;
	bh=Fjxrq1GKkJX8r8/5mRDVti7hvoYedIWEt85g8/eByOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UO9Bmy98aQMIg8CRsXaenOF9VDGc5SpQuPAloCSUM8PhBVGhA+h4c5lls8zGfMaBlgQ9SsLa/2AD6acS4hKOsPQ2t7JKW1LxJ4bMgP5BSaaqz/u0ZRDClr2znPoWUtf3zNVZGA43q9GSiPusFkqkxKJAws4QqjzFcGvoe0AXfts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ofaqqy0z; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ofaqqy0z"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso219708a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 06 Sep 2026 16:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788736228; cv=none;
        d=google.com; s=arc-20260327;
        b=LTuVrs/bbKs1RLgHErlV+daHDEOCw1VCKrevoiP4hAvRPdC5POTvlHC/lX7j0AEHg8
         IcqiWiVtAkVRnxyqBLkYhRcos5xCWlCIe5iqKxBEql51YJOwLQNV7HKLTFz+quCuzwf9
         CPHWyFqXUXRaxNpjB4ODg0m2h/UPsBnvnqhWN5OdNFSd4XrsdCqfeABhMPHc1MGLnJtV
         qyJ4V9FQ2gacpyE8siWkP9lqeKk2peMJhz8+fQlMzMlnCGtqksnjHiIBnkKICVC/pCwW
         I9jvnejjSRuM3EbjrY45m8219ZNyqPcbOD0E9wl/mGvV+UWj9k5juqgONzB2PDpGH5Tv
         YZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=59OMxQbrmPLZVc3H/IUZ2iNhcV4LVLLcoG5Axoww1Sg=;
        fh=2v1T+r3mMaiBEm1i4vQH8DBTNK08HzOKyD360chnL2w=;
        b=TBsJ0xysddAnw1vqr+weq+Xe8qTXSlT9L576ODHVlDvpZvwrFaLtN9JayNiX3htoTl
         EW6cw5AjD6/AfhVAgE20dngQ1wF6rIMc9/pFi/x5gBuuOjDyZwx3nBKYaIG/kwxOy4y9
         2lhwAq8h2UPXiRXbgHIGIO0re7Hms2a2MLvtvK442eu9AdLk4OOAUpohFMEZGGVIsOEp
         0Go9PUl4uxsdPjHqusn8JFN+v1gkQwVRtAEv9XW9ccuYfbCKeyjWUwH3XRA95Hbhgr3b
         LDMOY80v3SAZaGl27mxvVMgs7HVsePaKi9nh/U+HfIw+f8wyvF8s3qhDjA7hgsmJohpA
         B/7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788736228; x=1789341028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=59OMxQbrmPLZVc3H/IUZ2iNhcV4LVLLcoG5Axoww1Sg=;
        b=Ofaqqy0zcvCsH/zwFuTa6Zwn7JAqtFcScHWJGLf3fx9L7T24DPjrHJgyTDwlB7bu9Q
         hzqSYQ4v/HIk8qrXr0nOHE/UGGerP0jlRgZEFHWW+YCXPuEPhXX1LbfXLbOTgZJLaR7C
         gcpC5V2ts4Zv1z3uV7yRG7C2rL58TkoSLXmDNzcPR+ryUsfbtFccWiHEVuKfmHk6pT21
         uzwtrD9Rszt0EFvZRVEgZT1ZTU+fx4+us/Qvgq+aykGd4MC+8y2OmAvYc+6o2P+EgSWb
         vLhMe4NzKFcOxl7+DkOHeW4y/1nK8N3XpLbD3JSMUc59YiU1dn7XRvdiXWI4ESe0Hvtx
         PGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788736228; x=1789341028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59OMxQbrmPLZVc3H/IUZ2iNhcV4LVLLcoG5Axoww1Sg=;
        b=W+8qcPPI9uBIO6MmymXwC3h/wukFYNMeWhBZ+On5I410v0EmSQHMbDb/7J1JGCv1bB
         7V8J+te+pWrcwkiPN5tE9nzaV7+MU8KFduFoZlG6ydcrjBbYm2/BnKeDQUyInoEm+ueq
         eB8Sb2XNlIlJcvl2YpaxErl+ebMgfxZTam9O2UFQm4o9oY42g05CoOxYusbHx3lX0My2
         2UaL+AjL6ZjrO2dusbxxef90fmXQT0ayaDF6+Cl/2txvLEkufdntDcSCyGEIMPncoo+6
         fRLOxbzW3Ciqper0UZbG0ay3nfKtUufAcTJkykZ8IcWQ/zx9STteBBmTdJ/WwLAU8spH
         mlkQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8XsK32lmRATC/5VXAjFpNoQ/4VvlUZnoky1ipo4yERqRMnAWsxVvbwATmE65r3LTxC1kWwBZfzMfIy8KFRw==@vger.kernel.org
X-Gm-Message-State: AFuF++n1chf5xToREH1Amlljx5TX3lHjHLl0CckqoZVQXD4DbW9hunhU
	ExB1vxOmJws3OqCCt8rg1HgUaxEp+qMIB0e2sLyAb3YkpPsGYfETUnaqMJ60stVlaIiYCnsl/iJ
	MGlpjFoTF7nElvCQCyxSACoG6WfcolMo=
X-Gm-Gg: AYBFou296t1YpXSxaak9xcVav12hfZdUXnUGXXtgDskHPW2lxTsIGpRB9uIEPaQ00+z
	JmTupQdH5N8bYTcNZo/X0oHT7XpQbsPYIFgPI2rnx4wGOayzfhr+MC/zN0SW6hYXGqyKt6DkC5z
	EUwcbyh87545P/VuhjxEo85Yf5m8ytzaGq9c1gGWRmhMZ27OST+OFuVSpjlIQ8P/LZsKKidCcNL
	dmxDXXdf34si1orM/EMGQ1UBiWY17K6ri2mYeg/NnT5/aplMq+/y0w2hyuU9L/WE7YW8VyqJicn
	LXbGe7nv5zdswoMhZa9NMAhf3aC7b+1VznrLpfsXHeWpQQ4GNb6f7pRKUJ5q7/sD91+DhhjRtYi
	7YxtyAZtkXu0Vi67JfZ5NqY0hA7XbTNpjcPPMEDaZA/inmQyMuXg624B117eQ
X-Received: by 2002:a17:90b:2801:b0:38f:aa76:88b with SMTP id
 98e67ed59e1d1-39b3d7d056fmr11080614a91.4.1788736228492; Sun, 06 Sep 2026
 16:10:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906215822.1201022-1-jhubbard@nvidia.com>
In-Reply-To: <20260906215822.1201022-1-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Sep 2026 01:10:15 +0200
X-Gm-Features: AcwNN1VE9lAzlRGVnbfPGx5EagVVFyfn-8b1hQLu3mh_1rHNMQOtFDHOWeHKFuI
Message-ID: <CANiq72=5ccep_GNF+D2P=QatYLUe+uyvEE2z2i=wMVgLKeYnbQ@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `clippy::as_underscore` in the generated bindings
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 11:58=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> A CLIPPY=3D1 build emitted about 15000 `as _` conversion warnings, all of
> them in bindgen's generated output and none in hand-written code.
>
> bindgen 0.73 returns each bitfield read through a trailing `as _`, and
> 0.72 returns it through a transmute, which the lint ignores. The
> bindings and uapi crates allow `clippy::all` over the generated code.
> That group does not cover `clippy::as_underscore`, a restriction lint.
>
> The minimum supported bindgen is 0.71.1, and 0.72 does not emit the
> cast, so upstream CI may not see these warnings yet.
>
> Allow `clippy::as_underscore` by name in the bindings and uapi crates.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Applied to `rust-fixes` so that we get it into linux-next since this
sort of thing can be quite annoying -- thanks!

    [ The lint messages look like:

        error: using `as _` conversion
             --> rust/bindings/bindings_generated.rs:18947:9
              |
        18947 |         self._bitfield_1.get_const::<0usize, 16u8>() as u32=
 as _
              |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^-
              |                                                            =
    |
              |
        help: consider giving the type explicitly: `u32`
              |
              =3D help: for further information visit
https://rust-lang.github.io/rust-clippy/rust-1.98.0/index.html#as_underscor=
e
              =3D note: `-D clippy::as-underscore` implied by `-D warnings`
              =3D help: to override `-D warnings` add
`#[allow(clippy::as_underscore)]`

        - Miguel ]

    [ Removed CI sentence. - Miguel ]

    Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).

Technically it is not needed in 6.12.y since the lint is not enabled,
but it doesn't hurt, may help downstream trees and may simplify future
backports.

Cheers,
Miguel
