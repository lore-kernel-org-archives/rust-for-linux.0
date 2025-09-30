Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332A123817D
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Sep 2025 20:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759263185; cv=none; b=h1/9DHr5VTBcWnCxT45EE2lBIQKQD3TRDASrUYu9oWJhxPBEX7kkcQyMRBFL8ONjdTBNmoGKGxbRzWr70Nn57fPjLOYyNeW30yJhZIkUf7JYWx/T68J8s4iAarAJEPCtPwfokr64j2he6U0KvjOgFwz94TSKXI6057kRH5H80cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759263185; c=relaxed/simple;
	bh=uZ2S6dKSY8g1rbmRM06pb3DssGvzzzn78HdItZZ7jqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3yWlK5/4LPCoS5bLHvVTNHZJBETBHh2690GbTvijFGMaxvNoNZ3Je5x4zrx25t8SgSGUhtpK7OdBbrHuphy0R7AqBhFhsqIpoV4o5ijJnioOnpg5sBoqtVxEYRvC5pXbi0JOJoCDC16DvmhkPXENkOLIw+kSYYbLyUyPg76uEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0TRGPzD; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0TRGPzD"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-58075580105so1066664e87.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Sep 2025 13:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759263181; x=1759867981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vy7D8szbhIRwtgr1N1d15ZOmlMfXdraquxLR+CvWcVg=;
        b=g0TRGPzDupQAninCxfXz0BXWIYAFvJpbUdNKW1UM0XMOnr5vySRZ3QhVO3uIJL6VNN
         VenOsiDxbaahecsm82k5kwFRN/7aR7jDGAf1xsXTCe1o3UyRbTGnx6voSDW+NI2RJEhC
         ZUP69hGAkWEM00vn0iAn6X/6FZlYI80UkJ417J6RuEsUY+oPY4PxATGPcMZxNcCTrqCo
         j72M4LSUvmiBoXphfQ3FwYwFPLx/NjrBep7XWjV5aADpizZcxTCgmBumEt63b9OK2BFB
         JvYoMwOGn8xrMM1/DuMIS+2V8cWILReVBIUl7oggYp1GFoWPuQnYYDLrZwuW+k0O6o9v
         aNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759263181; x=1759867981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vy7D8szbhIRwtgr1N1d15ZOmlMfXdraquxLR+CvWcVg=;
        b=GguuMEqFnQ7Q7fz+YSopKu//4QnRYbYj8DRakubrJ+hiZgeaDcKG34sj2ffoOqHJO8
         B++7B4MeRHhdvbErDCzrvl/QrgGoO9W4PdtYDoweLZjYkll/MmhFGJBFJClAzzyO99Go
         gvDgLqZGtSnTLZCd0tsLHsEnUheTIiKzmUpCxtFscB7PmnkHDbRQsbFJhl6ifXZ3NhSM
         jAk8sGQ1F/KC36dfvshKsrhU85XsTmXyPp+a8DH8YK9ZOsZ1f+S4EjKGc9Y/Xtj3R+9r
         39ivp0V55TI7TQPkNKmT6/N9QxRgNlhrwVkc5BoJAhnoaDgunfPhn/L82eTqHQyJZ4DI
         ivtw==
X-Forwarded-Encrypted: i=1; AJvYcCV70onLbtGLUPeFBvUuTeSIBAaWsN6NiNdg6kVmhW5gZTPfikGp5y6IafeihlE7bL1J5WBT/ntkS1OSjKi1jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY70ttfn39TZcQX7688aqaI2oKE2ToQQKd5KMlm69E3EQIUgwF
	JsSAo/p3wpC4gz5UKmo4B5OCe9iqm9zIZSNKEA9ixbkTa6XP9+LgJoqT+ZdHCXIWjrNl1e1A/Hc
	JilvQXJ0ZvlgcshaHPd92rq5v60rInQ4=
X-Gm-Gg: ASbGncsJikoyTMKdxT/Ye9TCCjXpVWb4+cYK2KIHLoxr9PEbEBMtRLdiseumfv6hjq1
	QwVV8JsudzmSNqGYjkrGP53QW/7KrrlSvIG4vlAO0d4kjieb2nxBRNr/5Z2GPq0Jtxjb7Bik2ax
	FxC4QTncJRCShbBQDm4dp9dCMnJu4M/kKp3JPkStj3qw4JjEgg+3eu8Es3xnBXOpt/Aw+D5/RJD
	a1HbsdeluHlfGjQ+kFx3TskWpeDC58KwShzy3IE+vVjQcU8coDHBrgUWYMJLAy8z311XPFuFb6a
	wE3JQW/+JF90f+o+rHcKSAAh7fx/bGUOa9KYH375Iq2XxmRCYrJgYmbLwiBU
X-Google-Smtp-Source: AGHT+IFtvw/2t0q6x52tfdQq5Jy2e/VSbjt1lzNtaWguSG6A/2TPrH6YJ+0urbPzdntmF9O0R56v9RKpZ+3tGWsFzOA=
X-Received: by 2002:a05:6512:3b9a:b0:55f:5965:e4e5 with SMTP id
 2adb3069b0e04-58af9f3d196mr109397e87.6.1759263181040; Tue, 30 Sep 2025
 13:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
In-Reply-To: <cover.1755235180.git.y.j3ms.n@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Sep 2025 22:12:42 +0200
X-Gm-Features: AS18NWCr6YpjKIG8ty5QsX8lB_uHMxpdXprhMtC5CD6I1cvtweLAmRebm3I8mVk
Message-ID: <CANiq72nbERSOWKRUTJ96YYKCDeAoHLBuiVP+XkDUKg7JYkoyiA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] rust: add `TryFrom` and `Into` derive macros
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 7:32=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> wr=
ote:
>
> This patch series introduces derive macros for `TryFrom` and `Into`
> traits.

I took a quick look -- it is a nice series!

Some notes:

  - My biggest concern is the overflow caveat, which is a fairly big
one if one, especially if one is dealing with runtime values.

    Can we do better? Accessing the discriminant via `as` is available
in const context, and you already have every variant easily available,
so can we check that every variant fits in the relevant target types?

    For instance, by creating some item-level const blocks
(`static_assert!`s) -- dummy example for an unsigned-to-unsigned case:

        const _: () =3D { assert! (E::A as u128 <=3D u8::MAX as u128); };
        const _: () =3D { assert! (E::B as u128 <=3D u8::MAX as u128); };
        ...

    and so on. There may be better ways to do it -- I just quickly
brute forced it that unsigned case with what you already had for
handling variants:

        variants.iter().map(|variant| {
            quote! {
                const _: () =3D { assert!(#enum_ident::#variant as u128
<=3D #ty::MAX as u128); };
            }
        });

    Maybe this was already discussed elsewhere and there is a reason
not to do something like this, but it seems to me that we should try
to avoid that risk.

  - On other news, I will post in the coming days the `syn` patches,
and my plan is to merge them for next cycle, so when those are out,
Benno thought you could give them a go (we can still merge this with
your current approach and then convert, but still, more `syn` users
and converting the existing macros would be nice :).

    (By the way, the linked patches about converting the existing
macros to `syn` are an RFC in the sense that they cannot be applied,
but having `syn` itself is something we already agreed on a long time
ago.)

  - Couple nits: typo arise -> arises, and I would do `repr-rust`
instead of `repr-rs` since that is the anchor in the reference that
you are linking.

Thanks a lot!

Cheers,
Miguel
