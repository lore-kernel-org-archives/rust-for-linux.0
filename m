Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C978C38D6A2
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 23:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788220713; cv=pass; b=kmJwgiL9Knp0eSbJImIYfZ/7zc4h+12sjKJZJUKGgJXyHdri6uSeHGCFkhJt87ssuaYCwekuCgp/6Qvjl1d6XKTH7z6D+BE1RPYdUWipHiqI/H+XxoOwf3jcJGleJ/SzjZBVZjhwTfSNvhy7zU7F5WImLPXn831w81NTTZQQ08w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788220713; c=relaxed/simple;
	bh=gq8M4lNwSzXC6zL/jcxwOPlAL4IOPPEKifg4VKRpULg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zd9BxkF53kyRDCAKszGCKdpNTbDNHZWK8aVri5VDVALaT+w1VBoxSNPlVD5SD6IHsCsAyLkzykXEhByM7CwG+++rpD7btMpZxkCg92UnjEK8lup/qjcZaljBKwbMES+waNgjuhmhYTBECpmyc9quDPD2XIIRWVuB42lZyMGgniw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjWdzUtT; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjWdzUtT"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbe41618110so723065a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 16:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788220711; cv=none;
        d=google.com; s=arc-20260327;
        b=SGIvreXI7X0Nck8fMBSvvOgSkKlZBMhrH+iw0hpoZhexkyPU+GDhBYhrlafDHkAYXT
         s+E7hYDqs2PNCe9R63abA8TtUCjGNu+9vbzTAtP4CYPdZlDuFX5LDJa4CWeLzoZCsbrz
         3Dc9nhTUNBa/wMLBp/1oCk4zmVqCXJfjFlpylyQ+z5ZqmSXkh9hRaSniiKHO62MRnsUN
         U8O84OrtysqdyJTLhu0SxJ9F2GXoMFmino/kH9qqcE6M0EQrJ+6+8HTTpqjwJLvTmPxW
         VV907Gevx/L1hlrbJJKENj1lzXRaL+oZbeUdQCpcoWnO4+0QN56fPL32Mgpwbzb3VrZO
         DtmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jFkDjzBSEP5ruc3j0hthDGHVj2a68n2Lpt3bgktnp8E=;
        fh=MTJct6xshp7NspZNiJ5N+nTzuiCQ74nRSCBipAeYNro=;
        b=aT3Rug8uwrPX0K8Qab8pBSurcBMzGFZjSWOisWU1Xdg+MtmYJsaIbWWeJ13K73nbFY
         yM88ZFnYctAzI4W+KCLOhCghemh4vNVtaVOuR9SS14Dg2gxffMtk4Enhs4X2apkUpgY4
         wTdUpW5GaS2NyBrNBuX/O6MHjGElAu/zTkZWcXpFS1CxVMxjn2HVMA0aEi2FkhVHkMJt
         BALb6GpOxAwVpyE9FNMRdSic4f1rAfiLH2G4zl6t7MmqiFtai1Ifg1iAGITttEiHFAro
         JKwsVvx8h2Al3A3WmLYZm89z/4y8ULHymmsc74oh5NXts1jiVrsb1JhlC8ZH20i7+jC3
         zKyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788220711; x=1788825511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jFkDjzBSEP5ruc3j0hthDGHVj2a68n2Lpt3bgktnp8E=;
        b=mjWdzUtTGwNwcVPEGWfSzmUm5dwJ7/FCxyTBpFBkTPlQIKuiWpst1XSdY0zFMcQZ4H
         IFjTpKTPsDlDxEB1xrMcGDLMpUJUl+c74bM9Sd+r+HUYwNL4ss+8MB9RPBhKdoY+uEYM
         MXN2oS3LONJKL8A92xRS+2S4s3f2fQn8nmBaXB9jLIbdVQ+uYoJq+3Mu/0n934AXLi7f
         Bzy7yKJuTDY6uBcRMicvImulPIomAP/xljUNYNk0GHzjK78xs4lNFipQ3R/uDOdMeoe+
         C7hsj7R+yg0b8sQLzJUNT+o0kHsauYX9TkRTZrJFU+dV3I6Mg+tCteZtNEDATyfQI+c1
         5jKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788220711; x=1788825511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFkDjzBSEP5ruc3j0hthDGHVj2a68n2Lpt3bgktnp8E=;
        b=jYJ1NR/ZsLydVowv3stnx3I8YuEmNX0D7lvJGIOldtz8fnqyUeiMUT3wGLDCHYCKz4
         pN3BZUQjBAD92wHYO4ANP+M4j9OrxtEv011IIQk9SYZDhvHBxVaQbnGXeq20dCK0HVa0
         B/BwwAiEUPRwlKCtj5oojU08pednOcVehzRl4ZK5jokREjl9mLScto2Bhj2Ct0+T45zq
         +mLySiSNPw1JlUNH4UwTSjbkSPeE4pcikyloqNwKWTQ0e5cb82E0gX3sFc7WNf+XGWxK
         Xq062IfAqdXwD6EBPlB0U7Ose5OLYHsSQkaSWCHMjq8c4tWovjdP/RJkJfCFmuozZqF9
         d/MQ==
X-Forwarded-Encrypted: i=1; AKwUvBx13rtSP7Fj4tTN9sPBXuZKLcSOVGUZlM1eMFwv0wF0uIl0V8VOGtbGzasUgWdm5kr+13d5A3/kkPtOSTbNfA==@vger.kernel.org
X-Gm-Message-State: AFuF++nV+QL5oaDi94XKdO+Ya4Sx9jh9NHCxRLc5MyX9Dr0uPALqOhqc
	WeqvKgEt3zuTi4P42Tshic0P4V6WITrr1gdISY4cQUMrRnAhMza6ZwhRftm3s4ARyjaOOW3TpA7
	i1PNb/v7pd9hhleYu8NZl2YoS+Sv7evY=
X-Gm-Gg: AYBFou3jn5isGcylPVVVbGrV2b/Yv0DcKUQmquV3ioa9XHHaI3U54bKfz1+NKYYDJXZ
	/iq4D/jhR4IdHqosYur4ZpNVs0hKxn9xVgg8aY7hdpwoLARsK/+y+/AFYN1kERDPGfh++G/qS52
	Pof21/wW+/HoVaZ7V97MCAkBy/wKlEUPfUF7rI6NrYcGEkMdCAN4na/O/0n+lKJoorndOEdt1dl
	qs3HZxY7DJRJPDXBLsfB/MeoRKmQlj7N/MANb0Zhcu9dSvwy2MGLSagSpIymfSoFm4c9cDxtqW4
	TkD2pM+gLHHQqrNl3ft5Y/QE1s0BNJGMBq9DMbL69mc8UKGsQWd/nMVPKIn90sVOvhMWD1PIufj
	nM69AdJJP6c0gbSCA7WLGWXq4wz97QkLuYUZXY6Q3ej7WpcYlOTXm8rYHN/TN
X-Received: by 2002:a17:903:1106:b0:2d7:1a3f:8db5 with SMTP id
 d9443c01a7336-2d74e0c729bmr248017115ad.4.1788220710754; Mon, 31 Aug 2026
 16:58:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828155033.2101924-1-gary@kernel.org>
In-Reply-To: <20260828155033.2101924-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 01:58:16 +0200
X-Gm-Features: AcwNN1WkufYBu2lKjhjtsnzCR1i2Pt93ridfbTIxD8I8LgL21h06FCEx5PaoO90
Message-ID: <CANiq72nKwM5n5vKWAmSiMEtUpsL=rAKpwuSa7bxM-CSVT7+N+w@mail.gmail.com>
Subject: Re: [PATCH] rust: pin-init: use irrefutable pattern for `stack_pin_init`
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Mohamad Alsadhan <mo@sdhn.cc>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 5:50=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> In Rust 1.100.0, `Infallible` will become an alias of `!`. The let
> binding in `stack_pin_init` will thus become unreachable and produce a
> "unreachable expression" warning for subsequent match, and thus will fail
> `-Dwarnings` build. For this macro, all we need to know is that the error
> type is uninhabited, so replace this with a irrefutable pattern instead.
>
> Reported-by: Mohamad Alsadhan <mo@sdhn.cc>
> Closes: https://github.com/Rust-for-Linux/pin-init/pull/171
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-fixes` -- thanks!

For stable, we will need a custom backport without
`feature(min_exhaustive_patterns)` (we could in principle enable that
one since it is available in Rust 1.77.0, but for stable I would avoid
it), so I wrote this tag:

    Cc: stable@vger.kernel.org # Needed in 7.1.y and later (for 6.12.y
and 6.18.y a custom one is needed).

    [ The error looks like (dummy reproducer):

          error: unreachable expression
             --> rust/kernel/sync.rs:177:5
              |
          177 |     pin_init::stack_pin_init!(let num =3D 42u32);
              |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
              |     |
              |     unreachable expression
              |     any code following this expression is unreachable
              |
              =3D note: `-D unreachable-code` implied by `-D warnings`
              =3D help: to override `-D warnings` add `#[allow(unreachable_=
code)]`
              =3D note: this error originates in the macro
`pin_init::stack_pin_init` (in Nightly builds, run with -Z
macro-backtrace for more info)

        - Miguel ]

    [ Reworded for typos. - Miguel ]

Cheers,
Miguel
