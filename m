Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EAB65192
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 22:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788734922; cv=pass; b=eZgYVMtg70y/X4E9lcxh/NeokQZPbXD1m5Z4GHRAdkZctAllhvVxZ3bYeA8aN/vFITn82o5aZKYfixrfqqejU5JD7X0PE7KldrbeR5rmYqLwi1DgTZcMu6jJVJ0QW7QRaXhiL6IHCmGjYfqWqCGqsZYrroyl8CsfVHDamVDolLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788734922; c=relaxed/simple;
	bh=lkeGMZbNZ+oOAb5w3Su4GGZ0+Qo8jUQnPu7MPtxhGwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=byqPHfXYcMB2PetpKLNzvjOXtaGa3NmXF52oZqQOuC8JalIoP7EwnSTZzuKrXulQwbyvMmYUjw/w6UW39JsoPurzS/kAr/C0GZLhiW7KD9JqiA4a+gDhV7kJheUVwp4wVsLAsF1ccc+pmTVvlACYNzpnNva9Zaoh6hDQlo4tnD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nt4n78Wc; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nt4n78Wc"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad861b1so359551a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 06 Sep 2026 15:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788734921; cv=none;
        d=google.com; s=arc-20260327;
        b=YYJ3ziQBO2qbON/GzAXZsQYZeL0oQgh7E26hV4MHsau7iY3U3PBeuyBwdGenVfw0Mr
         cRpa4Fp6q4plvg8jXOj5qQFW1pYpar6CsNwjxWFhCc1RybmYOHS7nVG/A24UnOH1bfdI
         WpypjVWgUOD62oLsk1yy7oD9h3I6SmuvAV32EXq3JMPwdibAHQ2kk9wTrZZhBD11fbEe
         OwPMFtXXTawrUCGg/7X2gBpYZolsX1e3mK/n5mFZT2YYB8TZ1dZP50PvmY2IeCnWYsEO
         9+NtxiMg/LmOAOBPuznnuwkGWQ7pSXNzopUJ+Rfc6IwcYMyWzcpGXNH3/OY6f3oEyyVf
         fCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkeGMZbNZ+oOAb5w3Su4GGZ0+Qo8jUQnPu7MPtxhGwE=;
        fh=jr7vW4BEwC2rsovmSiywDFWGbE5PSJOfU/LvZXM+Fes=;
        b=o0+u7l6AZCxXhWujJLUVbfA0tM1CDqmlbFjxV3gpkv4PE+ubMnjcjJ4/ExZO2mRYBA
         WVWFM+YDblRwHZsEbCCOivtnlZlWpuboZpuLzAwH14Lhxi/95pUPTyQSHEdBhk6VsFnp
         sglszjZzvpa/VynrX4eIQpsUzwTPlGNT1SO5rDx2aaNqmq3REYFm4BvMxy+Ru3zFJZOt
         8KBXs1RCXs6mXmMEdG90LN/1BvtHBQIpgQizcen02LN/f5odbyge7YDu5exrUh+pKiYb
         A6YKHwMEDk7WPe9UikdaOTuJdIBy787BBj8wQPx0Vx6Hzes37vpuVeNXMInxV8XTqzOY
         eiGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788734921; x=1789339721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkeGMZbNZ+oOAb5w3Su4GGZ0+Qo8jUQnPu7MPtxhGwE=;
        b=nt4n78Wckh4fQcIpf5Y/Eb8aqYWBiECWAI/phzUgL8AHrzzprVhxd492K+5dMxxrbA
         neWOETIMl5k9gxpGdkccXiBNNgDKrXhMK8JpmQ7Y/WDS7K9iiBaCmxPKjCPkcWXnzr9I
         YnsBm5wjR6gOzgdLuqjQFm0DUcN/7eUETvVjv9jjv9wCA2mHM7D+x4WMpkVmtHqoMWtP
         /Fe6L+BPVyl4I0wSmawhR7DgOyxxV79ifAJySE1RF0/rFYQ3R2Ko2f06TVgw2klnEIpP
         StUP9UBgMOJO8VlgrynBH+kFa0FlbOXoUnPoN3P4YodUoRp6jq7YnpmGAjKt80ZkzDsi
         C7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788734921; x=1789339721;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkeGMZbNZ+oOAb5w3Su4GGZ0+Qo8jUQnPu7MPtxhGwE=;
        b=Mni3GPubPt0Kn5aA+bsCQafJhV1/I6PFIwySkmAO02ZMcUGxmNv6rcAev+L+gZEHof
         F7Zq+tw678mA6ENTLdbkrFG3r3PeP9xlXcqd7nTzWOmLsxV4QIJ1qAb2PS8/mvBeKtN7
         jobej2/Tdj1OWg5q7sfEm8G5GUX+UbgMw+xZ0iLKO7fRew8+CI5ya2+ydLvel9DiPOjy
         ScTL888fVF8uVSJSsAX+WjV4vP0b3E59usmLXYOgBCuGt2OslEd2ewF8rAO3vy468pbF
         vg3pk9XSQfRo+k5dZUy23brQKV9KbSnv/gc6O2Iio0Ipk73DcKgcCPrLcD2OgnrAP+J6
         tedQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF+6jnxpygSJbKGPb42YPvvdRMVjyW26yZ2jp8fDjjND2VdP/QgpQdSIbN8wUXGbYcOWKY5LjjhpqBtxZjdQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ntCeuLpQYF3gn7EG013FCVZuSmdWAvBjwnfI9lTgJxhX3OifG/
	dcgsHaCTx6yIlrrWDDJMVgx4PKNWvHZRB72UAY8Wva/Ah1cnTiPVutYtBNAq6ZTP1HUrJnhYbZP
	VIoODXW8d2ofOAFJHn36aBrE2cKCEQVU=
X-Gm-Gg: AYBFou1Qmt90Zp2EeMlJ8Ekn40S4GqEg+d7OOQSjcrMR7NBI3YMQ47h6+dqW3FmJCxp
	wcLjx5399qVK4cu/cMdsVrbm8FDHA8ZO2FLcB+YV4lBGpBeVo0itJlM/JqIOg6wB2x0/a89GNiN
	JYuIdI9Jvlx7CHBN7d9ocphotcSYpfALTWe8fyzbxFmoVbk4gi9dFNRjYNdF++a6XUAMDSkw4hG
	9EpeyY8RBsY0lNOHfR9LYx2lXZtOOoTisXd2gcsHjacjcd58zwLsyBP2UV19/I/UX1ZXqidpaEX
	VaxCclyqta6Yo8CnTPnauRDcTaLmyksArNFX3p1+msDrIeWwIaEh5uHydUyuZepPJBL6inbLA9T
	ZJC/MFmh76BT7AMwLsE0L3XS5Ua9Q2AuK5eFpXD3mrECyqS00ZTumXCEeMPyppGlVDVe8eUY=
X-Received: by 2002:a17:90b:4c03:b0:398:bac7:72d0 with SMTP id
 98e67ed59e1d1-39b3d86acf2mr11403642a91.5.1788734920700; Sun, 06 Sep 2026
 15:48:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906215822.1201022-1-jhubbard@nvidia.com>
In-Reply-To: <20260906215822.1201022-1-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Sep 2026 00:48:26 +0200
X-Gm-Features: AcwNN1XFuhjogPVE1Fbcq7HeHPZK1wuDdjtRKlEb-R9udRbJcc54SrcVTu5koIw
Message-ID: <CANiq72noJ-4Sx6Lj32yGWTm_pzmMkH1Ue37W1y2anzpmN9mMeA@mail.gmail.com>
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

Thanks! Looks good to me.

We have been getting 0.73.0 and 0.73.1 fixed for a correctness issue I
noticed and I didn't see these yet -- I definitely recommend avoiding
those versions for kernel builds.

Cheers,
Miguel
