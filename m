Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C403646A5ED
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947860; cv=pass; b=cgSbQws//DLJVKcbjUr/b61UqrUUUKBYM7V7u9/6B6DReRQLbABxvAX/AqH6wcrf2X5ZT2v3pl0jH8MO111w1iKIkEIzGlRScANKZU5z25p4c2Wsaa2nQ9/p82P9HXmHe9wFBss9wiyogrezt4nkGOMjOJZap3A5NVMNs8Uui6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947860; c=relaxed/simple;
	bh=ia2re+9iOb/U/vaZMay9+iYR2/lW9ghV9YH/Si3nrTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNPKW3TBh+vwkS7cftLFlVtguXIfGJscDyazaWrwQ+CNglhh40jX1MQ5ltwbMHJ6uBOpgCPJ3mPC+hh0IqgKxlpurKj+UdxLEi7y+1VmCqVH/AE0yAC/kIpqvgtWn2clV1VGieFGGUO/yTPqd6XmYfmyFssf4VxuIXO8SrHIlSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6FeqG85; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6FeqG85"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a7671cd317so3395301fa.0
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 06:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790947857; cv=none;
        d=google.com; s=arc-20260327;
        b=l5kfGAUY3LCoALdOfYCWiqiGvRTzAzAnD47hFs/jXUZ53qlMneLEmVpghTIOR6rY/K
         bb66Vwnshvd7jsIzW7SGkgWKk68T2QwOPc2BTAvO8Fxrf2+spFv/svf1dFohQ7AdNGcM
         6DV1srltU3HuYj6uFiiOp5LKqS1hlOhtieNgzIS1NkWnyioVQNYV1cZCYkZTQ3sqf0gi
         Q6HXgWWxiysK5A+aMuWTYuYE+MdaEtBFL3jvsHuokTY563dUiY+Fjn9sZKbQOEGnjGHe
         PMRYwaSPrem1XcqsBWrx9QI/iW1UYG/ACpuGdMdPf6YliHxxndxsrHk2wHQ+N9cs0CRz
         sh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B1FpGj0yBhxUpVXrxwiHMICnDIkcdO8hLxgI/nPHHt0=;
        fh=GJyJaXolJwUNJdvWlewyGc/29KsIUsFRZaHTpPwzPgQ=;
        b=GmImJXVeSpWVr49ce0eZMUg1a+lL5cL42eBWdtsQHeQeejxPZ7JmMj39aKWnaVPz/m
         42tdlH5cdDFgXGdRRoChcE4hPISSTOKNYBFWVUQ97fjmZPzSMD9QtNs1C7+J3aLBDb42
         RyWo0On5G1IBtt9eNOF7TwCzq6nKxA8ly/bdBOmZmO3Drc/F4Yl7oDIfJkhY1frepH8e
         sEbjEdj0h2Cw9q6GHlWqsp66Huj2rQnMCOlbVHWKfGWfZfb+S8aao3f8yBEQfo4qG25I
         hQvSsYjIF+KCAAb+CTJaHQB33yONVVbN+DST4TdtAl/leP1YkaepgOU1qe79BXEO+24P
         ZDxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947857; x=1791552657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1FpGj0yBhxUpVXrxwiHMICnDIkcdO8hLxgI/nPHHt0=;
        b=h6FeqG85xpaTXwyZIihvFmeIYXlkcUnLJv0SrP07oZVZvjfgjRPXX9kDfbvWBxOyQ3
         8fXTBDuW+IZP7kpu8Lkt8RDZ8M2otfrwPwqDGWpPPFsbHRZ5LptHmuYbn3E9Emlh/gZL
         WpvGNI1wR0IKZ+LxmaEdLWp9Ee9nXZpSP58X25JnxtwdK6mCAkt+81rwytSnotSWQSHL
         z+OejZkHwE5GwJPTLxJqC5w47IQ7rj38DksqAa5UIqPHzH4WO5xaUA3pm8J73e/i3CYv
         lRub1fsIcMdgi3Yo4T0sXiQIi55E0fkxuZRrDUnKRGKQDV5nl5+hCwH938Lr2EMGSpJG
         CWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947857; x=1791552657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1FpGj0yBhxUpVXrxwiHMICnDIkcdO8hLxgI/nPHHt0=;
        b=s/VS+vQTGZidhIUpBE2bPnkcLHwhouyjKI3/CYmd5GAWqY57kpWvaydZlsEu7paFmY
         PNrtXDyqJRU0pSM8RDJc4EddsEsE5CTZDwoq1WfoBqmyRBOM6cFMhOl0jZ1nkJJtf+Bz
         qB8UAE8S9888kLOZa+vpvB9JI6ChE9ng1i1nfqXqvIYlw5m763YLdQZ7CsBnRVORvi7d
         a2YQgrMcQUiGYlNEnLSftbnyZgU64x22S59HNO/J/+YpSyJC0FYzn3mCyK/AUVyh9/rE
         FIBE8FU/SL+El/SsYs0C8WqMy/qglpJRZ28+eM2oTXcIdl1vYd643l+1i+WAF6KVyzDJ
         FbdA==
X-Forwarded-Encrypted: i=1; AKwUvBxoQeZz72wKJcwOGCYQaLxYfAs7WZaoh/nLpgs3QYKfVRCYyzIKV1gePcQop14UMF0682hWWu/w2zQ3xHm69A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKlE+7hznol5JrGF/duvYeotZSgDjOIe1MRgoMbqYwk8a2RHZsf
	qq5hTIaGUCGLn2UHd7uosV6mnKfcAmI0bAWqC/F1Y6T5wUXyr0VGu/GgP2VPPq4qR2Wl0dPd9t7
	Ml/furjpE5gDQ3BvLdseFHipDf1R4is8=
X-Gm-Gg: AYBFou2ktLinnFj5wkoQ1q691ogsV/dT0MNNCExF46FBEyZIiRhRFLGM9j69c2GVntR
	tI0UyNxhaZvjF8AgI/ffHb3cHk+VzAmuFZ79VhY52e4/XFU17MEfdWSpXEQgg0geNSQbpY8jq+6
	zjWcQUtepr5rrNUHu33oxUHWguC8qkjM2FcGE0wd4RWGYmoTHDGbYqtpYi+1OAIiIuMOYnG0Q81
	M6lWFEJZrfGGkNeMydEySBr2Wbrx2oqB036OdSXPeUMf4AakLTsXUEsvLKcuT7SzHlNwcIDxJfz
	ZhX314F1qZH/J3yV+JJzt+brd0svnM3YyOY/HEWI5xSgkOnmrySBFXbrsgkSLfPM6MQqj61gVU3
	qYzUA5oftRUFxAy2Jb0u+dtJA9nyPWfUjaDlwaNhm7b5NFJXAOejcJG7QOIhOtmRpFeXJIbnrF1
	iulCaogUdDzA42D7GHOCzZc+MrbmWaf/h5JrMWiY38FQJOveUqgd4=
X-Received: by 2002:a2e:bcc7:0:b0:3a1:b658:fedf with SMTP id
 38308e7fff4ca-3a88767821cmr7384051fa.2.1790947856290; Fri, 02 Oct 2026
 06:30:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-no-io-statics-v1-1-a2386eb0d255@google.com>
In-Reply-To: <20260904-no-io-statics-v1-1-a2386eb0d255@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 15:30:41 +0200
X-Gm-Features: AclHuK9cc8hu5Dh_eJ_vtAf6ATjf5-6QgrrpNHSdmh2WEcAg84qW80l3cwIxWy8
Message-ID: <CANiq72mTR8rnEiLVspLXUBePMnvBVXw1qnCC3hVR0KP7n_ZWuA@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: add `no_io_statics` to `core-cfgs`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 11:31=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> In upstream Rust, PR #155625 moved `std::io::Error` into `core` under
> the `core_io` feature gate. To support decoding and formatting raw OS
> errors (`RawOsError`) from within `core` without depending on OS
> facilities, `core` introduced a global atomic pointer:
>
>         static OS_FUNCTIONS: atomic::AtomicPtr<OsFunctions>
>
> At runtime, `std` registers its OS error vtable with this pointer via
> `set_functions()`, which uses `core::sync::atomic` to modify the value
> of this atomic variable.
>
> To ensure that `core` does not introduce usage of `core::sync::atomic`
> into the kernel image, set the `no_io_statics` cfg, which removes this
> logic from the build.
>
> Note that changing the `OS_FUNCTIONS` global is only possible via the
> unstable `from_raw_os_error_with_functions()` function from `core`,
> which is called by `std`. There is no way for us to invoke it from the
> kernel, as we do not use `std`.
>
> Link: https://github.com/rust-lang/rust/pull/155625
> Link: https://github.com/rust-lang/rust/issues/154046
> Link: https://github.com/rust-lang/libs-team/issues/755
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-next` -- thanks everyone!

    [ Pass `-Aunused_variables` to `core` to avoid:

        error: unused variable: `f`
         --> .../library/core/src/io/error/os_functions.rs:9:36
          |
        9 | pub(super) unsafe fn set_functions(f: &'static OsFunctions) {
          |                                    ^ help: if this is
intentional, prefix it with an underscore: `_f`
          |
          =3D note: `-D unused-variables` implied by `-D warnings`
          =3D help: to override `-D warnings` add `#[allow(unused_variables=
)]`

      I sent a PR upstream [1] to clean it up and to add a test to check
      that `core` builds are warning-free with the `cfg` enabled, similar
      to what I added for other `cfg`s.

      Link: https://github.com/rust-lang/rust/pull/163633 [1]

        - Miguel ]

Cheers,
Miguel
