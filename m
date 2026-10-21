Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792592511;
	b=OcbSsA2iiIH4PkL9kAlYMAM0R8Q3cepLVtVR7DmHKqHayDNln2y8p2Zs7RDgmgvaJ4ry
	 KgVPRRGL/RDmXQjq8A0QUMGUV9z1crh9GNPxsyhAbjfSs3oK7Y+5nU2gP2Pi03PQ2KpsP
	 M0ozk1pBl8riIZrPC681XavYZG0otexrgmJjp/DVXzLqWmlT/KaoefRfbBF8x/OiKzCzp
	 dV9fe/MoL7MlJXWmZzTJsIYMhS6ljAoeZ4vFCuNE5PPjKVTdl6UGigz9UHAljv+CQ1U6U
	 bPYcsUoh92BBxYLA9bc3CmLeTJl/jdP8MrDnhnjIFhNXEzRtTwcavIJPQDUpGFvqPOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MU18pqCbstum74MRC3E2tHjDA1YVe+OVt1wpMi/79KY=;
	b=Nc7EkJ1Nq9RrVIHN3DIJG4OmgtIFy+/WigTlymWsg4uVrwcL7gxaYI30ExPXsoZ16OtE
	 cQE4wrOkOQv6FVNxCTxou0RXU9QNj+SyG0LaR7EqimNPnq1658fgLwhrRr6lMX9cJTJU8
	 0+M/E45qbEmWwUnTIg92KvyWYifh5oeHGe2Btv5sTJyRqhFi8RBegMA6b7p3MhL7rxlKJ
	 7YMheAUekSDV8Zx6isR9RxL9Lv5WcwX4jGqs2OSeMhb5gcu8Sj1p511CO0l3Man6IRIOy
	 zg9CvQWtHaAtzgGaEtyS8qvuPSVAKF25V5O1zxW5DutP32Iyfy4gJa907VeuaLZVAjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=l5+o7Utq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617EE606A319
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 14:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 617EE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=l5+o7Utq
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-533202fe429so382561cf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 07:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792592510; cv=none;
        d=google.com; s=arc-20260327;
        b=oBldfwYWVy6BqExhp+nGWdQetsBDBKc1vvdzxPQFz0I7kbvHP46YP8PD3n+vRM3sAd
         CuatEtPcy5t3q2g0hdaErjqo2d34bkqYdAN8yJc1tmpxSnbyoW0fCj8fS7TgmaTwR5So
         N01RoKepNtfS4Gu1/4r33tE4K452GBDForbQIrOMzv3iaET1bsTwrKjauvV13Yk+yfNo
         Rus5tsoBW1VaiLyDoRJbfxt0uNICr/r7WbL5LyqS6OlB5dHYM5TgHsAS3LTpWzdQcZuD
         pp/7JqGNPX63zNwnBIzaSQrfpmg8uMta9SF7GFilvY6TBns+1i3hlNKvYLVOcfR7IyEb
         mFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MU18pqCbstum74MRC3E2tHjDA1YVe+OVt1wpMi/79KY=;
        fh=jrOp+M5GmyzAQbm4NGcjdfOgzTgO9rahqteffdXU5EA=;
        b=eVtoNq95/EJvlEVBfeui5LnbRShzWmJtGimRDYl/XEhgufViRynsvjUKcKsC4ot5gS
         czrIS5jjySOacx8//rjbDAxAjosxQs1J42l7Mi/JuWQXn/VA8+oCRi690RxsYcYgPHn0
         ecBXyzFBjaeVqbHn4jLmbkpYT3I4BqXSEMjP6/P5FLyHRxGL7d0KE+T+5vxI39P1vSA3
         bsu9CDWlf9Xeft6XC5vCXy0ZrtzzDC+C/DIOlzsiV611bz92O0Kw8k9jDsHg2KQwHpUz
         iySTnOfTAUaC0tSGZ1Dwd5O3s6/oJ3I3cTS1sTYzrIKasztnZNz/m2lOUNymUATNsSuR
         T3Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792592510; x=1793197310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MU18pqCbstum74MRC3E2tHjDA1YVe+OVt1wpMi/79KY=;
        b=l5+o7Utq61mROPIt5HXnx8jgflP/Qv9DkDoMgdY7mgu7+kVqtAbf/ncplBw8fDdWDr
         uouuxKe9h9OtAthEFkkWMpXcqRefbWtk7l5UGaNB20iQrQjAlJ9yoLkAKPfiL2Ge1fnM
         Eee/oeU1O781sVFAtxAO4Poiy/jonahaK7BpuVU+MI05oQcnG7T/10SOtWZXADOWHmMm
         9GbP9ERsqephsYQ1W5sBXcnSj8glmb9Qj19dVN8QRvk3K4mZVdr6iWsOkd5U4NOVJIEv
         qnfRWETgIbkTvaSTcu525XnSsVe+fqztDkgnPLtJ//xBK3xbw8P5yovkveWzH3nbZw4h
         uZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592510; x=1793197310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MU18pqCbstum74MRC3E2tHjDA1YVe+OVt1wpMi/79KY=;
        b=UWIEDW4mc+DF3huNVukj7MGR+2PIJR90f5o49jmFRnPCMH/h/IUoRm7zHjJHTB+jc+
         v4BEJN1S8o4cTAj7Z5Y37R14/Fja/ymKNJNwJejV10MDjYziOtGxvKPMCJ8nu0UqkRZ7
         yb9C6xvS1SH/vb9/gF7MYeyW4Jfi6DlHO4+kC/mBR4VWD/Kzupch0LDI/X4A5icD/kS+
         PQ1Xmxonlc7NclZvGg18J09lzQttrBCg81V963Z08SuXC0wmP1Aqs/p5b12zTkdVUD3u
         RZOAxUETGHlTSU9oIXVMY6thLf3YbpfT2lgvOq+4IxE4RX5E5/alUjUUKTM7EannGgjh
         7ZKg==
X-Forwarded-Encrypted: i=1; AKwUvBwBEZulqUr+xRKWxQ3LtXgZ9qvOt4TVIE3t7gWBEJ7pjhdhNt8IZxGkWcQVqk5hkDF/eNbtBhK4OispwUx7jQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKgpmMVy3NDXWluzGRIecIwNniZcpZR89Ol8bAYLSR5lyLWfx5a
	bIQkYIksx3kTt3cvIVJEMA1B034twQYfxvqAKiQHQVgGB1IvaKfCsU0l0iPqeZQGMiUyHJg3PQS
	nvw8GAn3gLPb7FqJgn6Rl94DKj3NGjNAxdNjls3L2
X-Gm-Gg: AYBFou0vrRSUJtoCwu7mHNaPSOos7j8oSBMlft9X3PfsuK8RFaBAVs6WnWMnqhN3yMS
	2YQcAODUXAb3IVATQ3KU1xdTnpobraqt9n89Q3rUFXYSc9T5Ew8XmV0IjmIcmPFJsta8yEJ7Jng
	XrESX8qfaEuiqnZb4NaMbFdOrCwkPrYEoQLgrFLIk4TFKfV+cPOlCksi3UnJxdhiMcVhe/Xe40t
	S/mChLZjhks/bdn3tG5PeeVH652OUhie9IYf2M2KvONOj/v9u1uESBY288NbI9TEaRMs3g1ppr4
	KNO0mPh+U+Po8jdzFLzVq/s/XmuuJQnqREKrJPSOthh3xqjmdomqxB+kZwjPpZoeVPk/YzDcvO7
	taDsmNrIGBcniVPLEG+B4UUJuHWWbYxqvWs4doBvcUyyN+kn9QVWXjQZBMmoghRWgrOVD
X-Received: by 2002:a05:622a:354:b0:536:78de:775f with SMTP id
 d75a77b69052e-5368b3f333cmr33969951cf.15.1792592508742; Wed, 21 Oct 2026
 07:21:48 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019151243.1595858-1-gprocida@google.com> <CANiq72nqq4oGBWVtSMBhXS6G4H7fYg07ysD7SjnOWWt7R9_ajw@mail.gmail.com>
In-Reply-To: <CANiq72nqq4oGBWVtSMBhXS6G4H7fYg07ysD7SjnOWWt7R9_ajw@mail.gmail.com>
From: Giuliano Procida <gprocida@google.com>
Date: Wed, 21 Oct 2026 15:21:11 +0100
X-Gm-Features: AclHuK_l_GB8NMqOM7xhy5i6_g75rv7YJWm1OfYD9VBDfvjZnP8GuutQTREMq9c
Message-ID: <CAGvU0HnBuoVMf2JwEhRCijxRn9MPnrX=yxxbo3YywT+RqCTheg@mail.gmail.com>
Subject: Re: [PATCH] rust: exports: emit ___EXPORT_SYMBOL without C declarations
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.

On Tue, 20 Oct 2026 at 20:22, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 19, 2026 at 5:13=E2=80=AFPM Giuliano Procida <gprocida@google=
.com> wrote:
> >
> > This change defines `EXPORT_SYMBOL_RUST_GPL(sym)` using
> > `___EXPORT_SYMBOL` directly:
> >
> >         asm(__stringify(___EXPORT_SYMBOL(sym, "GPL", "")))
> >
> > matching the `__ASSEMBLY__` path in `include/linux/export.h`.
>
> Hmm... It says it matches the `__ASSEMBLY__` path, but it matches the
> `#else` path, no?

The description was AI generated, but it is accurate. Both paths use the
triple-underscore three-argument macro alone.

...
#elif defined(__ASSEMBLY__)

#define __EXPORT_SYMBOL(sym, license, ns) \
        ___EXPORT_SYMBOL(sym, license, ns)

#else
...

> Cc'ing the `RUST` entry and modules too.
>
> In addition, I wonder if we should avoid hardcoding the particular
> form of that `asm(...` and instead expose it from the C header. That
> way we avoid repetition and getting it out-of-sync -- that was part of
> the original reasoning.

I wondered the same thing, but that would introduce yet another intermediat=
e
macro.

> By the way, I am right that you noticed this via GCC builds?

No, Android kernels have been built with Clang for years.

We post-process DWARF information with STG for ABI purposes and noticed
this interesting side effect there.

> (Nit: please write the commit message in the imperative form:
> https://docs.kernel.org/process/submitting-patches.html#describe-your-cha=
nges)

I will do so in the next version.

> Thanks!
>
> Cheers,
> Miguel
