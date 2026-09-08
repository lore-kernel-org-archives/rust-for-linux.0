Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ED63B47DD
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 21:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903333; cv=pass; b=qbyQRe5lekyzy9GwxdATG7ZiRZwOYexdkt1f6OIIwrxuyz43iQu2Ydn7uPMSTwSml+A3qru8wOTHT8ObaaCC96QMJMX7B4WmFpAPLbXJjFFFmBFBdyNzpjUrumi5DKftFtjwtBpArVlWrgk1j7K+irlgS1hN58n+N6zGmlODxz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903333; c=relaxed/simple;
	bh=Ih9aNAHPmb3atmae8ogQ3aGNGlgXNmwTkwSV+CuwpQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvzTjO9qleHPaKQxr/RnXU31dyPFAUwDkdZeWQFkXxCZytNEBlAHs9kB8BGt2maLW8cC3cKodOYehZK0XifMVVUvTDmqYqaeu271sw3vSmzwIc010ppVCy/0mw8S0D3TZb6WNHazYBptItzh89hEnuBuMfWqAKowHH+A760WR1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNIOo14D; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNIOo14D"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396673bd283so874429a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 14:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788903332; cv=none;
        d=google.com; s=arc-20260327;
        b=PW4jmPkOh6KX/WVsQNL/5pJ2LOlbl+yjVLqIHUSMXD5BhHQjNo+0W24/jX2ICVy413
         0jpVsczkU6PNEVOIIgdTR6A/N77WLAQYjjVfEdzWM0y8kLpJkL4Sv90mS5R9moxvel42
         k+vl4EsTSVQdRJ6H4rCszuTsmWbBPKsnytlNx+L0hq8+b2DvcWgq0C0haXGAxhvl0kkr
         XnXHVjNGVEoscKAuVuZo3EueGSVhqW6acYfEu2HsbWCPCbenZ5tSe2P0U7HHHqDDMEWD
         6XXCot6hl4cgFeguZHkc1+FZ5bDb/yfoVM1APNTQO8CWYootyZlMYqQ4r5l2ruJf4m7W
         2RTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y7pAMbndvfBt65mnzcKTzmmfGUDejmm01Bt7ape8n2o=;
        fh=OQTjDO1VSnNr6xGEzBHjQb4YEUR5jtZKt9KNzqfCO9A=;
        b=PnWcYMXiA4AlpRvpoiGwxAb6tjbQXeY6d4Iz0hZ49TxUNSBZ5SHU1H0C6lV8hTqW5v
         FOQUZiTpYOgkhj0f2DCeXcvsbuep4TAWwQrcl+IEC7hOozKTrjatRL9ZIZd8JsQ7xw1k
         p+1HAN8aJ30BLbN8oB1fyfPCkmxH9BUyQP0iQgMhy5MJ3PQrgRuTITjTgdWcU2Y0eCaW
         nVRxFiIBtqJEq0Pmi4f0CP+m02XgsdhL3FgtZlL0FrB95oylP5UlY+4ra1ShWiwn/lkG
         2TG5Me4N7KHOE5AKEFAIXT0GVvWpfhCNlS0oAsDfxv8bVTPr71XQfD5pa7DzPV4Vyz0v
         YSjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903332; x=1789508132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7pAMbndvfBt65mnzcKTzmmfGUDejmm01Bt7ape8n2o=;
        b=PNIOo14D6ouU51DNkiTt5srlB7XYE/62PPRqqou5MG/6n+e6EtZkCIHfExIlKwFrel
         7RORbFMZaVA6IT1kDpimhA2GeufN2VQM67l3HKCuAqsZ6ZoaZStPClnyjgl1XNUmnE8e
         JclOW08sO22tZx1gBn25K9D+BIsPSLI0HCDwt/Dw31drB+04OE9dqNGb1NXEMVKmYvkx
         Nd4THEAOE5lSBHpnw1TYNtx3Ny9DQE8oA8BWmuifldRNeYYz7t5LXYioMqlwiQAWfeAK
         MUjdi36mbH7/dqrES7lxFwtIAhb2NfQXMMZRuvOAczLXnfr2LTL8dVQNustofgoxjfVh
         YvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903332; x=1789508132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7pAMbndvfBt65mnzcKTzmmfGUDejmm01Bt7ape8n2o=;
        b=plDVuaiXrh4ZcDCIory39+Lg5Tc1afcuLuCGSPWyECeBkG2OGMIwNtxDEbW8PXCxJk
         rwIJwprRxCugwLjWewmdEXoWzGeFE+bRf5UvLH8cfyYCwRTeR5uGT3tHKFrqQ2fQoVhx
         wz5j5vJRkwRByTro8jXSdBZ+iMwsWbZSu4HZb776sR/AzO9TuqVrD+86v7eiQ96zLxCx
         qn7u+Zey+etZeBGkXvbmTq3nRatfH/lBB7gjqQdBYVbqKLZgnIBpQEvDZtVQi1+/DSVG
         B61bYA8ihtn5gKisDchU5os324yGtZ8HzNsm0vyhELm5MY5B9Xze7tmxyK1qzG+5Wzah
         VBDg==
X-Forwarded-Encrypted: i=1; AKwUvBxc53xqZH5wsB1IYGr1pqAoRVkEY7YhG+/AZgcReRZGE69vwc3X+hr6JnrCkhbanxt9qTJi4N1tMQEbp37D7A==@vger.kernel.org
X-Gm-Message-State: AFuF++k+5FsDP3ZCCvv7HsdB5RMdF/trAqDPc3uAi+qi8oiB/OPTDSyi
	i7uC2HH0ldjo9Ynjni+3sr4f7tMlkMhLjZIwOkQMqIqIg9uG3qPTz7OXgb/inJQ8Vls1R9h9TdM
	sFnNyyYhcKzt1PzdAyWKqVFeehXZBJug=
X-Gm-Gg: AYBFou1jnfCkGpzsW3ygxduSUO/hto2nr5opp7otG+g1/lGxIce9QUtut3+Vklip8Nb
	i5M9NdmjHnOUUua2UXgfqRChtICowaAwQnNZ1VMnX0YA+HUR0tQBbR+7JB/UFzFujF1C5VUbZxs
	Dvlz5sIfOsXAwAK0uWUyV0l1IK5/kZi50mzriEgJacdpfWI0LYxDfZeTpoNs1gJDcLh3vgukapX
	rbULG2u+U5iMC+SSmfsmDBJHx+spdY8TwIWou8MlWrYhOTzjlH4a/d9T0Pcsi1aizAcjGtstqeJ
	uZXhjirIQesEhwHgNeQvGXzBm0T+GDcUJ9hGS/SrTtOiHjJm87X/vsWMviJHXTsXEw/mA4MGQam
	Ng6paTjVAUFv0hHva9xzu9vOPUzMAOmHu8anOD3P1GT+gbtAAMRUDba0NAnn8LFjCEYpc/klqFs
	pwqI7e+OaQs6vLuOnAGG49OJppE0DADAwKXp1d06SQO6vNJA6hqNw=
X-Received: by 2002:a17:90b:3ccf:b0:39b:34ef:3b24 with SMTP id
 98e67ed59e1d1-39b3d5aaa70mr22748600a91.1.1788903331609; Tue, 08 Sep 2026
 14:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908170539.345207-1-ojeda@kernel.org>
In-Reply-To: <20260908170539.345207-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 23:35:18 +0200
X-Gm-Features: AcwNN1UgNfvavHHRk8c1vcqAAwrO6dRloNQXkFX7IxIu_0dbYHQkxC2fQ8lYnuk
Message-ID: <CANiq72=fEYa1PygH-XJHONQKqf53dZFuGc-Z7wd4M7yeREq8Vw@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `unknown_lints` in generated bindings for
 Rust < 1.88
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 7:06=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Starting with bindgen 0.73.2 [1], `#[allow(unnecessary_transmutes)]`
> are used, even when `--rust-target 1.85` is passed.
>
> However, the lint was introduced in Rust 1.88.0. Thus building with
> older Rust versions warns like:
>
>     error: unknown lint: `unnecessary_transmutes`
>          --> rust/uapi/uapi_generated.rs:26294:13
>           |
>     26294 |     #[allow(unnecessary_transmutes)]
>           |             ^^^^^^^^^^^^^^^^^^^^^^
>           |
>           =3D note: `-D unknown-lints` implied by `-D warnings`
>           =3D help: to override `-D warnings` add `#[allow(unknown_lints)=
]`
>
> Thus allow `unknown_lints` in the generated bindings -- only when buildin=
g
> with older Rust versions.
>
> I have asked upstream if this is intentional [1], i.e. if we are supposed
> to always allow unknown lints in case `bindgen` uses such attributes,
> or whether it is an oversight.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Cc: Emilio Cobos =C3=81lvarez <emilio@crisal.io>
> Link: https://github.com/rust-lang/rust-bindgen/pull/3455 [1]
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied early to `rust-fixes`, but tags still welcome for a day or so -- th=
anks!

    [ Emilio said it wasn't intentional -- we will work around it for now
      on the kernel side. - Miguel ]

    [ Removed the `cfg` for `allow(unnecessary_transmutes)` as suggested by
      Gary. - Miguel ]

Cheers,
Miguel
