Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8DB18F2D8
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525710; cv=none; b=ZT+vkAeiwdFP2K3pC4skz7ZD382Cc/Z6JHILSlA1JztBSw6UmdhK2HzXRwG7mhDn/HE1z381GpKvtKraN577Fzsw1UHthlWjek1m3pIoQilL3RWqItgJd1OTFjO7CJbWUfIt9kr4Y20cxNrz+N1yV0SU4oxUWAxunLmuQmXTJME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525710; c=relaxed/simple;
	bh=ZFiDIMX0PjIK7KxSAeWlLey7+/mh5K+ji23nWIAmMLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYdomNdfQgCuDfE8ZD0u8xbLEzLqaBwO6fJt9h1SHD3jVRq2usxekvslyDdfTj1Yjow9sZyQiOqnd1UUrQlSMdkAknsA/lngVJY91UDzKjyqICHYoacJ6viti9QLLN8hXbEN0y8jd+QHlBkR7u8bwX9OKwHParXScuf5Z6SSmA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zp4RvMHe; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zp4RvMHe"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38246333e12so4231283f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 01:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732525707; x=1733130507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXAcH18gdxYq9GcIQcUwx7uYz5V1gi29j89//5ppp0s=;
        b=Zp4RvMHe8iIW5NNsFyWTQigkRso08GSYLL+ka585fYPJ8YyM7ePLDATDdcmNydZAZW
         NJcQJKluQknLNVzgjf7jqL4iQBiRt6WtCEEn4vCU6ao5DntWml7X8gIKfHNmtXsfl1of
         05+wLjAv2QNFI51i1UeGP8sJSbig0/q8n0YdYPXvWXavmQpi3kdkTSfELzSVQXxa4yEj
         8BdJuhA4hfb/xIZ3tHMduZpX3RyQnXAJ/81tLFcndIVZflGM3kiN5BTad9Y0OkSeNSwZ
         Zpf5eBoZz6NqLhPF3IMLllqVFsqwg6VUME9x3zyjYfjCDl+DYlC8FXo7P28bf2ZkMa7X
         9ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732525707; x=1733130507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXAcH18gdxYq9GcIQcUwx7uYz5V1gi29j89//5ppp0s=;
        b=N6rJQ+3OlgwqGyKNTioRbld/7RB7Xlc8QN29/VPOt1HhYo6+/CmGekdzVQBy0EVl3w
         2T6lC49uRqmCoFnk/2ONyn++iJM0tW6ZEnev8GTB5lnzfbjgdVc7ZjMNC32kUFqHRsI5
         5bgNDTUPxxTzY/Hk5zTf4mSJefLgkDqChz3Pn7itWCV8yOaj2XKDY/QXHjA+yeqvKoQt
         m178jqpTfn8VFOYOVZ6gfIm6sRHM9XB+845Vh4cDaMxVCm90zo8vMAqWSfeSUw2R6tS7
         ZmoERfLW8ErR9neF1BYSR1VC8O6flR3qy6KBV/VY+SJ7dENdax8WTeY1nDqGspHj9ZHh
         Z1DQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7md3xJsdzwIAiEBc7TGz1ulUgVEYotgBlK1J4tvmFRV2Xv3SGAUKumczeLbLKf/T0nXVSZYm8jglDC8QQvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh6KGpSodcn/9tOwwcb2zW8p5XLMxwtSOtfnFqkOTTORRRIyRl
	P/WvQiLySVhiEUw5zz7Ffq8k7VgA9DiPgdnnGXNS0iHCZCvvnthDenKE2PsR6TzZfORukuVI7W6
	3gomWeumC9MHscAMqAXb3QV04mmw3/Nfk478Q
X-Gm-Gg: ASbGnctilPi0zESs2gPh6obVsjlp+OHwwxx3ytqfIDzS++AONjM7MwSJnCvVOx5pFhU
	wZkOLf4xnh7aX88t4vAk77dY8xAU9PduaTpUHWBeeJ9Q2TpAISXQa0GMB9uEdQg==
X-Google-Smtp-Source: AGHT+IE+OQhREcTfAKueVgcaqoVBWDnV0rrbEkwbQowdAdSPH7dvgYIlFA0qd/qkJIo9gO5cQhqStvOzQrQOvhhAWD4=
X-Received: by 2002:a5d:47cc:0:b0:382:506b:f627 with SMTP id
 ffacd0b85a97d-38260bea7a0mr14291058f8f.57.1732525707135; Mon, 25 Nov 2024
 01:08:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123180323.255997-1-ojeda@kernel.org>
In-Reply-To: <20241123180323.255997-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Nov 2024 10:08:14 +0100
Message-ID: <CAH5fLggg5f0KpaObVtZc7WaxHjUqbhCDsn5CwnA5-3df2HEjnw@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: set `bindgen`'s Rust target version
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Christian Poveda <git@pvdrz.com>, =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 7:03=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Each `bindgen` release may upgrade the list of Rust targets. For instance=
,
> currently, in their master branch [1], the latest ones are:
>
>     Nightly =3D> {
>         vectorcall_abi: #124485,
>         ptr_metadata: #81513,
>         layout_for_ptr: #69835,
>     },
>     Stable_1_77(77) =3D> { offset_of: #106655 },
>     Stable_1_73(73) =3D> { thiscall_abi: #42202 },
>     Stable_1_71(71) =3D> { c_unwind_abi: #106075 },
>     Stable_1_68(68) =3D> { abi_efiapi: #105795 },
>
> By default, the highest stable release in their list is used, and users
> are expected to set one if they need to support older Rust versions
> (e.g. see [2]).
>
> Thus, over time, new Rust features are used by default, and at some
> point, it is likely that `bindgen` will emit Rust code that requires a
> Rust version higher than our minimum (or perhaps enabling an unstable
> feature). Currently, there is no problem because the maximum they have,
> as seen above, is Rust 1.77.0, and our current minimum is Rust 1.78.0.
>
> Therefore, set a Rust target explicitly now to prevent going forward in
> time too much and thus getting potential build failures at some point.
>
> Since we also support a minimum `bindgen` version, and since `bindgen`
> does not support passing unknown Rust target versions, we need to use
> the list of our minimum `bindgen` version, rather than the latest. So,
> since `bindgen` 0.65.1 had this list [3], we need to use Rust 1.68.0:
>
>     /// Rust stable 1.64
>     ///  * `core_ffi_c` ([Tracking issue](https://github.com/rust-lang/ru=
st/issues/94501))
>     =3D> Stable_1_64 =3D> 1.64;
>     /// Rust stable 1.68
>     ///  * `abi_efiapi` calling convention ([Tracking issue](https://gith=
ub.com/rust-lang/rust/issues/65815))
>     =3D> Stable_1_68 =3D> 1.68;
>     /// Nightly rust
>     ///  * `thiscall` calling convention ([Tracking issue](https://github=
.com/rust-lang/rust/issues/42202))
>     ///  * `vectorcall` calling convention (no tracking issue)
>     ///  * `c_unwind` calling convention ([Tracking issue](https://github=
.com/rust-lang/rust/issues/74990))
>     =3D> Nightly =3D> nightly;
>
>     ...
>
>     /// Latest stable release of Rust
>     pub const LATEST_STABLE_RUST: RustTarget =3D RustTarget::Stable_1_68;
>
> Thus add the `--rust-target 1.68` parameter. Add a comment as well
> explaining this.
>
> An alternative would be to use the currently running (i.e. actual) `rustc=
`
> and `bindgen` versions to pick a "better" Rust target version. However,
> that would introduce more moving parts depending on the user setup and
> is also more complex to implement.
>
> Cc: Christian Poveda <git@pvdrz.com>
> Cc: Emilio Cobos =C3=81lvarez <emilio@crisal.io>
> Link: https://github.com/rust-lang/rust-bindgen/blob/21c60f473f4e824d4aa9=
b2b508056320d474b110/bindgen/features.rs#L97-L105 [1]
> Link: https://github.com/rust-lang/rust-bindgen/issues/2960 [2]
> Link: https://github.com/rust-lang/rust-bindgen/blob/7d243056d335fdc4537f=
7bca73c06d01aae24ddc/bindgen/features.rs#L131-L150 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Just to double-check, the problem is that bindgen currently doesn't
get any information about the rustc we're using, so it may generate
code invalid on the rustc we are actually using?

Alice
