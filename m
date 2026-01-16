Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138E2224AF7
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 15:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578033; cv=pass; b=R8OD+XUlrR19Xe2SlJS8KlNiJgTQP7aXurqNuCN6rnBgs9DVu/ulNyk1zwPgZTHvcLZKLjiVBCtLxxtcSLAtnmyA62/p9Qk6sygPXZ9+A3YBWEpSq/eF5rojyUgC7eB6SmpNeaqHVDPcdY7wbV1Fe74KhyFCGoFMfsqQH8JUizE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578033; c=relaxed/simple;
	bh=zz5B9GzA4K5YTReLf3hudrxQz7bzvHDgzJa/PZXCjPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekyEiDyaH3aUUp2biPoDchWZKLMUo0MfivDFGCb8XlK7pLVClheR1PFtpaTTEgMC+UYGyEIsKiXAVsPCDTElFefDxo1KuqDam9pd8Ake1hI7i2ZF3aVk22q850fW9USH4RLRrnMUDEn9miayXqF8pR08g/yRn0JIHHx4gJKgQS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkvNG7HK; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkvNG7HK"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37fd6e91990so20698861fa.3
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 07:40:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768578030; cv=none;
        d=google.com; s=arc-20240605;
        b=Pcicq0YNDv21nQeopOBmGWtf6jWS99+81HGmNx+emvfB0hkuTDKbqlmaGtzqYRUyXh
         C2/ZZHlPQi60+j72QPjOPeQZooVuf2NAdidMa6asxzVW4Br5H3sMdZNUlWZbvxAYvmQ9
         cmuoM4JU+7svVZmQ8HEE4jF0kPMB8S30Y+GDnV1qst1Amw9bKBPb8q3voT9T8Xr7CTeQ
         jEA4hmUUD9PTn4rOn80aLGDTWGIZlGy21KinHGiXy0kKTbRu7YtjUY0j0TtfCzp+uEHJ
         MINaMyx+DXB3O0RRCAJ0JyfnYVZwMCC19xVqYB0OXFnGvugaaxVpcXJaZGeHlWyYHSL2
         SGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hrfd7PsHzChMkZbg+owAnrPTBdwgV29QmhT/KXd5Quc=;
        fh=Erxs8aDJHyuE/6es9Ui65CmnHQ3FLhLz60NP6yzA1uU=;
        b=PbywC3NsevC+DCxpWvTY3DVj4qZNAfTGiVBSzFlFndlJ8TV3CulYbhyCliBMqMgls+
         dcWebJOGTZ7+b06k4KdnQMANozjHGtMKzhfSmBvP4e8Z+HgNLwznB1MIW6OFfecLG/PF
         PayY0JdrWq3w3Ez3k1sNuhkn1s2mY7yEDigwDqYcFgOY8z1l+WQPEqbE9JtEpp/kc7HB
         +ON8WFoUG2uw9yH01slrRsrrydLAMXoyOu6D9Kkie0RSpH0H4HHg7Ibnt7BmjxfWHrRK
         NjDqWSQ2+324H4YMKlONae97hBbh3ovP9uPfGJq4kd+FPmEYI6Xe0DnpHL+oDCVNR59t
         p0HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768578030; x=1769182830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hrfd7PsHzChMkZbg+owAnrPTBdwgV29QmhT/KXd5Quc=;
        b=DkvNG7HK3gh9ZRP2n3DpvzVsABnvrs2NjO8YcBQuSHV8Zr7Pv7lhcBn/3CGDl71CRe
         BCcVfFAkqkS3JbQNf3AzpTmJ8b8VPjdy7fbO5bkO4SDQVdoZD0VS6FqJ0lYALDeM2PwF
         5/3cQuSvyXbPrHQjI/4cXrSA88YsSFGMiJqW8JU6qt9y81BoE1BRX/uhxW6/3CFC9ROk
         6Jog/aQ7XFwZbr2twB4IIQ8SikOFzX37/IG5Qi5PsGuzFulCvMEwybOeiGu2FLTxjUPm
         Bvbdybr+q1sWCmirpJy4gRzlgGg23xHp/FcMehKvReQBm0V124i6zws7ujvpTIh/igFn
         IhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768578030; x=1769182830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hrfd7PsHzChMkZbg+owAnrPTBdwgV29QmhT/KXd5Quc=;
        b=ck2eqsoAYCx+/aF0r7YMsL+1froRMcvkSyekO8jBDRnuNdUdeoLWZUkYu3BvvPALdP
         I91qeZW7jhZJ0fhfZI0snOL4ZC5ANAeMgnPOlotc5akU1TwQ6nmGXXDlDu7WbmW4/g6z
         XfLnco/8ALeWf4mQuR48Vj114cDgTEi+9pRAG/rla9xacMVfeU2Z1MsCm+rxcSmGI/DB
         K8nEG5kOVKDiRaQzjGFc+QoBkI16aZQCYkIR89dOp+S3bHGYUroUJHOvFLgd/QGjeEQi
         9C4seClAd/5tzu4yXdSWf+fNtWuL4jPaUXQ3c22CUyXEh3Gy6VEEynuMWMVtuLKHQzre
         wAfg==
X-Forwarded-Encrypted: i=1; AJvYcCWmxBgkFz3+CjdT0RI7ET7xk1AxQSZAsgAYSQFgIKC1sa18Y0cAJ1xaX9tqbjpkgeYCBFMQRh8BUEe/RPRQig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdK0KZaHmq1tQFs8FgOYfpPTFD4YPSCMbrCTy7fgepVu8fPM1Q
	aW1+FcwazaEekTsiaZvstEME/ECu08YCmGtf4slwZG0vBMet9lG/LI+hOwyyi5bEAfGoye15cfJ
	iCT8QaejwmxmtP9cwFg5zbptAh4KtwOI=
X-Gm-Gg: AY/fxX4Rx7sKrj6OeVLXElalIwjr2DS+51RCDPeJCgCH4N9JBCrvS4HhF3vrD5M0hmC
	6b6zUyc5t7A9iE57Ee+BspXtGHOHgQ0HNwtcBU8iTEfwT+QeLzgUSa+JwqP6Ecb8iA7yFLl2Lgn
	VBN3jEghCGW6aOqOiGJL972W8eRpnBN6+U6Z8gKexe5ZmYQYN8jLGT+DYA/uSsBiS9PGZeH48s4
	ZkMFBVGU/S3H7x1VKxn+1Jxmk0VskpcZ6k+MePTmCq9ubNuq1JhZqL7+UU1e9V+4Fd/2JyR1ZlD
	RSGm9HzRdfYlTN9WULIcueK7Y+7s7iZ9PTw/FIGqGiVXdVgqNrRN/Hh7Vh34mOTm2QaEnQ/kj5W
	bRsFmxYWRHUc+LIG6bJqqgCS/zwTyQC7V2BFGM297Rw==
X-Received: by 2002:a05:651c:f16:b0:383:1aba:bbb4 with SMTP id
 38308e7fff4ca-38386c4f724mr8943211fa.30.1768578029799; Fri, 16 Jan 2026
 07:40:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114181934.1782470-1-lossin@kernel.org> <20260114181934.1782470-10-lossin@kernel.org>
 <CAJ-ks9=kvTBHLzepFUqtYn_FOroP3CU0QhyNwBRyH_tHF4p50A@mail.gmail.com>
 <DFPIYDMDHC6V.3CT62XJBRQJOD@kernel.org> <CAJ-ks9m-nsn5KTAvSJfu=1kOiKmoadC1X0=zp0GphkX8ZCF53w@mail.gmail.com>
 <DFPWOMZOX6CI.27JJBKSO6IONE@kernel.org>
In-Reply-To: <DFPWOMZOX6CI.27JJBKSO6IONE@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 16 Jan 2026 10:39:53 -0500
X-Gm-Features: AZwV_QjU5AkYbbE9aDzkJq8pNLlf1PJL7P6ll74-1eIbVoJ4sId3t_F8j8dk6og
Message-ID: <CAJ-ks9mcwoSfRwBhvZTDkQk=Rt+YPWtfK_6rDqnkSb2mi7Ok-g@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] rust: pin-init: rewrite the initializer macros
 using `syn`
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Alban Kurti <kurti@invicto.ai>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 4:28=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Fri Jan 16, 2026 at 1:19 AM CET, Tamir Duberstein wrote:
> > On Thu, Jan 15, 2026 at 5:43=E2=80=AFPM Benno Lossin <lossin@kernel.org=
> wrote:
> >>
> >> On Thu Jan 15, 2026 at 10:45 PM CET, Tamir Duberstein wrote:
> >> > On Wed, Jan 14, 2026 at 1:20=E2=80=AFPM Benno Lossin <lossin@kernel.=
org> wrote:
> >> >>
> >> >> Rewrite the initializer macros `[pin_]init!` using `syn`. No functi=
onal
> >> >> changes intended aside from improved error messages on syntactic an=
d
> >> >> semantical errors. For example if one forgets to use `<-` with an
> >> >> initializer (and instead uses `:`):
> >> >>
> >> >> <snip>
> >> >>
> >> >> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> >> Signed-off-by: Benno Lossin <lossin@kernel.org>
> >> >> ---
> >> >>
> >> >> <snip>
> >> >>
> >> >> -#[cfg(kernel)]
> >> >> -pub use ::macros::paste;
> >> >> -#[cfg(not(kernel))]
> >> >> -pub use ::paste::paste;
> >> >
> >> > Now that `cfg(kernel)` is gone, can we also remove it from `rust/Mak=
efile`
> >> > and `scripts/generate_rust_analyzer.py`? That is already done for
> >> > pin-init in patch 3 of this series:
> >> > https://lore.kernel.org/all/20260114181934.1782470-4-lossin@kernel.o=
rg/.
> >>
> >> I'm still using `cfg(kernel)` in `src/lib.rs` for linking to the std
> >> Box and Arc types.
> >
> > Are you sure? I'm not seeing it. It looks like the crate is no_std
> > unless the std feature is activated and no features are activated in
> > the kernel.
>
> Yes:
>
>     $ rg 'cfg.*kernel'
>
>     src/lib.rs
>     260:#![cfg_attr(not(kernel), doc =3D "[`Arc<T>`]: alloc::alloc::sync:=
:Arc")]
>     261:#![cfg_attr(not(kernel), doc =3D "[`Box<T>`]: alloc::alloc::boxed=
::Box")]
>     921:#[cfg_attr(not(kernel), doc =3D "[`Arc<T>`]: alloc::alloc::sync::=
Arc")]
>     922:#[cfg_attr(not(kernel), doc =3D "[`Box<T>`]: alloc::alloc::boxed:=
:Box")]
>     1020:#[cfg_attr(not(kernel), doc =3D "[`Arc<T>`]: alloc::alloc::sync:=
:Arc")]
>     1021:#[cfg_attr(not(kernel), doc =3D "[`Box<T>`]: alloc::alloc::boxed=
::Box")]
>
> >> Also I don't want to have to reintroduce all that infrastructure when =
I
> >> inevitably have to add new kernel workarounds.
> >
> > Then why remove it for pin-init?
>
> I don't understand, what is removed where? In patch 3 the `--cfg kernel`
> is kept in all locations.

You're right, I must've misread. It's fine to keep & sorry for the noise.
