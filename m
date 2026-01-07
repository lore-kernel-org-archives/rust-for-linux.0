Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8853D318EF9
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 17:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767806432; cv=none; b=SfbSpAGKE3bHTyBgdR6+PGdW2/vYKLZx56UVJoWYhnFf15lUYf9gwECpHId9vZHtsoDgR43EOrs3H1HSgt3AzVJ+WddRcdTVYiibLEUoT7otZDyUO12bGb27WylqxRGJEFKlJjF0aGtB3o/oUaZ26nYTM2BPjhMXeembr3n9kqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767806432; c=relaxed/simple;
	bh=KUpD6KCQe61lNW7GbQCUxH7GXj+Ky1DU6YNCh+KrgpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ni7mnkC7A1BsxDtG6JpccN0GDjhVyeI5hp6SVMhwGU7942128Cxm2cxnV44f32RU7EpwzOviV1K0x7TDaEHbd467OxGcsUOg0nERjS9otnxfrxe8htqEzWelo28cwxzdIljQw7YOi4a+FTRYBfVjy5xop7DCY8F6MlhtpvwUgtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=opbE/SeR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="opbE/SeR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477563e28a3so8509555e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 09:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767806414; x=1768411214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRy5fH1n38mo+sOFbeTTlvmv+c1GGGjbAeVVADLZqRs=;
        b=opbE/SeR7z6vV6rFdyicJZ0eetARDyx4OzGyo1adzRAuQ0/5Iyroye1VV5wlFYwnsy
         siP87AnC2vFobeTsCBTwWB6KA74qJHTQCGuerbIOyx/ujxcdMcF8Z+hZp4JfZLQnsjPS
         gtJzuw659U6LrbpD0snmAjc3HC4FNCeP+udAk2SmH40kx9RIcgo967eTU3zsvszhp8bm
         XlXhX6Fae45RthXLIr8Dj04adlIRYOA28sdi1IqvW92k2J2MTmTiY0QDne+/fByiCeSm
         YYpWV2jPma+fKp72XSLahouFwi66Zufg14xcmtQB29w4VBExjhFYYnv1JUX+N5Wu8xkg
         XJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767806414; x=1768411214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRy5fH1n38mo+sOFbeTTlvmv+c1GGGjbAeVVADLZqRs=;
        b=EEkKM8mxx0+kcJEV58yejM3cn1yM7H5tpZngVvwRftvFULM6O1u9MxVZhfOh2mc+oN
         O/rGNf+XVLIW5/mzcdo1wCEhkDiB6CLi/Yyz8nfag66oePeDIpXyP/TPtb+MXMb8dcnM
         R4161wLv9bVuY74k4x0V7Ion9dSj+gorgl2fylm23wgxO5VwUZz/86ShXxAVgrkcydpV
         qZaaEBy1TF8n1Q2ecwe8HzmD8CcI5v6783a9m7weLbVnNv19O+pgwjxXxec69LjkA3Kh
         bb1xAge/u82jyMJ6WIuNtorLfJ/c7izhQP0czSYItxMyGWwIZq99EJCJUCX2+RrEL5Zb
         AkiA==
X-Forwarded-Encrypted: i=1; AJvYcCVtWDQtKy/MsBdyGxrjLObCvMDUuCVPPCsaHVrfME6be5YabwO1FHF/5t1Ui8hjwXusTv7InGYSeVlxheRS9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo6K+g35sEab//tF1VrlCsP/xw6rJMZKfVc4KDZeG2TQ2XKqF0
	wHYXldjH+Sv17djM0lyzjrSNXHmXLa1+//Z7fkFUuL3dttoYO11XC3g/gfmSX0Z+kyhFRgXWHw4
	+m1ZXkv8ti343xN4VGyge/qkZzToIjYlA+0ZAUNUb
X-Gm-Gg: AY/fxX7AZjkLrV0SAeMCLMnQsxn1oKyUVgmUwO2lJ92wCpCTojm2+6gQa/jBUTETaFb
	3nzUoKCvG5+YevtmSBKQu8asvV6ZQOGvL24wbn2eq+A85/mChNmxiZSjvDKAhxYlBUgE77TAtzI
	fDfEuF6qeeonSgR0go8EfuUUG5SBjWAo1jHSHq69JnBn90D3lJ1RpIosrPkz9uUtrveW3RBtfbo
	+vyon8JuUyqYQ3xmWOQlSAlfqwtV8s2BTqAG0wuMDTqyMKzqCdJMkTsjsCiN//1JhnIMW+DVIug
	b5JOqyHi2itHPns39IjcLjJlxA==
X-Google-Smtp-Source: AGHT+IES2BCgIHC8UvkeKbuiCB7AOJmtwd092OnVh2NXwXkFh43aBtyxjz/pRFYpMrPlZLP8pLqsTDJIeTu9jTFCsIg=
X-Received: by 2002:a05:600c:3d96:b0:47d:403a:277 with SMTP id
 5b1f17b1804b1-47d8483cc42mr32887415e9.4.1767806414436; Wed, 07 Jan 2026
 09:20:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107-move-rust_helper-define-v1-1-4109d58ef275@google.com> <aV5vwMe_AiyQ8ePB@tardis-2.local>
In-Reply-To: <aV5vwMe_AiyQ8ePB@tardis-2.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Jan 2026 18:20:02 +0100
X-Gm-Features: AQt7F2qxIlAPRMJEs1YvrkfThTapiFfVUaSHvGj6dDM6mostuYhDY-jx_cbZnzU
Message-ID: <CAH5fLghgm2pPdKen2rv6MeSXAYG_j_eCqvM0b=VbTbUM9eswKg@mail.gmail.com>
Subject: Re: [PATCH] rust: move #define __rust_helper out of atomic.c
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 5:10=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> wr=
ote:
>
> On Wed, Jan 07, 2026 at 02:14:13PM +0000, Alice Ryhl wrote:
> > We were lucky that atomic.c is the first file in helpers.c so that we
> > may use the define from it in the follow-up headers [1], but this is
> > fragile. Thus, move it to helpers.c.
> >
>
> I reword a bit to make it clear that we need this changes for inline
> helpers:
>
>         In order to support inline helpers [1], we need to have __rust_he=
lper
>         defined for all helper files. Current we are lucky that atomic.c =
is the
>         first file in helpers.c, but this is fragile. Thus, move it to
>         helpers.c.
>
> Let me know if you have futher suggestion.

Sounds good to me.

> > diff --git a/scripts/atomic/gen-rust-atomic-helpers.sh b/scripts/atomic=
/gen-rust-atomic-helpers.sh
> > index 45b1e100ed7c63108ee6cb07e48a17668f860d47..a3732153af29f415e397e17=
cab6e75cb5d7efafc 100755
> > --- a/scripts/atomic/gen-rust-atomic-helpers.sh
> > +++ b/scripts/atomic/gen-rust-atomic-helpers.sh
>
> whenever we changed scripts/atomic/* we need to rerun
> scripts/atomic/gen-atomics.sh to calculate a new hash value of the
> generated files, so we are missing this:

I tried running it but I got an error from grep about no file input or
something like that. I couldn't figure out what argument I needed to
pass to the script.

> diff --git a/rust/helpers/atomic.c b/rust/helpers/atomic.c
> index a48605628ed7..4b24eceef5fc 100644
> --- a/rust/helpers/atomic.c
> +++ b/rust/helpers/atomic.c
> @@ -1032,4 +1032,4 @@ rust_helper_atomic64_dec_if_positive(atomic64_t *v)
>  }
>
>  #endif /* _RUST_ATOMIC_API_H */
> -// 615a0e0c98b5973a47fe4fa65e92935051ca00ed
> +// e4edb6174dd42a265284958f00a7cea7ddb464b1
>
> I queued with this change for the rust-sync PR of 7.0, thanks!

Thanks!

Alice
