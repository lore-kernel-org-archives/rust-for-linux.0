Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D891C218593
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749662670; cv=none; b=aJHYa7fKtSNdihd2WZU89ItudHg53ZMQIgIKsormswfqvtbDvaZa8QQegKgcS9qU7XmC+wiBt+nzIH7GEEvaAcGn1947SsCwFsIOUN7pLLaaDdfkzPAg1XQhbEAyJ9CUVvbTLCELD3T1zVQXgOZWPYrlt6xjbUNQMWajui9KBi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749662670; c=relaxed/simple;
	bh=UEtaR4QFXoWG5mFkO6pOWfp4vS5WT0e1+nwbfyCMPhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oht7eb/IfOWWF6/mVzNRwk2Thc07K3S9JMEyBN1sL90EBDSZ4C4ERV/OjRBe236h+UKiJNq+NAS+oRJK1zn8011A/JTY+NJh/STXt9v6ODdp55POaI155H1a8cYauYm8+d2hEK9GsrKgQJ1aNiIivH3qwWyZMSfk12RICDN93lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EqcURWLx; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EqcURWLx"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2cc57330163so11939fac.2
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 10:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749662668; x=1750267468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSGkIw7lXPoOOQ6xsmLGULxOdNRYgMzOtzpFjJzQIBE=;
        b=EqcURWLxj/yJOelUagSjzGBEBgnV4yOUJVSwyz01ARl7cu5kntMsD83hSVxbXepXhw
         OSARt3JXqOr7eXqivB2JAzGpDJBzb8tCEKDqMVAKAuhDAp/y+Zy3HiYfnBOk54fxTZoR
         ZoEjhHBXgh/JLy6xkngjWuTZUEb6O4zGvdAH3Kls5k0nrwKBVcljqNkMBHa3B+NSO+a/
         lWsNks70nuOMk6G3zs/frpwkyukUuRBXmz8eKDGMD74blzxWfWSUWZpcbxaQW6+0Bntl
         NTKRFM8Zlb/rLkDIHGcggyXeTnuz6yWdOC4HKDJ2elCL9bcNGU6aDb7A1WZi03/Gyeiy
         ojIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749662668; x=1750267468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSGkIw7lXPoOOQ6xsmLGULxOdNRYgMzOtzpFjJzQIBE=;
        b=QXVpk9wwdzr2AEzBDJmhgjBD+vw2tuix4bYpkTrvnxmgDX3ZCElEW3xJWUNcBJ0gdL
         yX+4mEmBCbpWVfDosRZrib+rX/jihZGTfSGXZ3ld64cmWg3Tv+xNosB8s1l5nrxoSVlN
         Cww3m4xdDKIVrS1DAvuSQBPnJzCzVXrGvPo65Yltiig6EEw8szHPhikozkfuyuRPkr2Q
         LsgVveOAf4M+NQaAr5A6KOxL4vhCuqkec3kOU3eHQyXCRZmasaqii/FOHfobZCjhZzhJ
         GMylEeh6trdVjIXzQtxdn+d3+Q6Ka6o4CXwMfxMsB1e5gBQfNjkqZNSxHOb0kRUwcOB0
         jqBw==
X-Forwarded-Encrypted: i=1; AJvYcCUTcfC+Jb/5fK3iWTBgk+kp+0m/5xosDkwuCpPldyy1giKG073W4EmzrVnCsKRYSPpZ1dTaTxf8RipXTnR+iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEBrL2bOgrxEzWrT+v+QiqeiJQcACp92j0Mpm8E9Tcb7t4+P85
	1F0/x/pkjJDlusdkP6hDj3pzg6nZf7ePNVjeEyhnqGk6qHbQ9l8b2vQfCweCqDC2uGbLWl9k9gD
	zVeIXWxvlUiJVsNP93EkIM1c6/pOtAYyXOxNhlVMt
X-Gm-Gg: ASbGnctv6poA0FMJ4f7i5PUQ+YHIsASNNRpBedq82X9fXXydXjEAlQ/33rU2duB0ZDV
	nZfmFKORZpazFU1bErXnzp1QAf3n8vCmyoQo4Z5uikjVcETQe2cnruQOSVKwpwKXjSmgaLZRe3K
	oLYA89BGZFkYp3IFX0/KxpYnkeyCHqteky430lkKMj2Qv5WRn9GZusIKWAujKVxS7n17cRNZn0R
	A==
X-Google-Smtp-Source: AGHT+IHDg8JRnLesFPl1JibUsTLTfDGDn0XZA+uvbAbHEWDtg3wuwb5nGOyTn+G0bLzDeQzprxGqSlM6xctnYJhmBSs=
X-Received: by 2002:a05:6870:170b:b0:29e:6394:fd4a with SMTP id
 586e51a60fabf-2ea96b78087mr2556511fac.2.1749662667786; Wed, 11 Jun 2025
 10:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602135231.1615281-1-bqe@google.com> <20250602135231.1615281-4-bqe@google.com>
 <LGWNtyhjCByj6PPHMsGCwo-WBkCCUuCOn_cUuwlwHPhfRZ4TdDR97a3u63ACSIvJQZF2SyAInyX90iMkERX2MK3Up-R6jazWHWhFzTIWah4=@protonmail.com>
In-Reply-To: <LGWNtyhjCByj6PPHMsGCwo-WBkCCUuCOn_cUuwlwHPhfRZ4TdDR97a3u63ACSIvJQZF2SyAInyX90iMkERX2MK3Up-R6jazWHWhFzTIWah4=@protonmail.com>
From: Burak Emir <bqe@google.com>
Date: Wed, 11 Jun 2025 19:24:16 +0200
X-Gm-Features: AX0GCFs7WUVNcSH5-pbXuRcq_xrq1pRsTFNiXrQfUtQYZGhl32F3isfEx9mg9UE
Message-ID: <CACQBu=VX_x97dJcjUUs_=fxYmtitcrNd8NB+5K8Cqu2+9yoXqg@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] rust: add bitmap API.
To: Pekka Ristola <pekkarr@protonmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Carlos LLama <cmllamas@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 11:20=E2=80=AFPM Pekka Ristola <pekkarr@protonmail.c=
om> wrote:
>
> On Monday, June 2nd, 2025 at 16.53, Burak Emir <bqe@google.com> wrote:


[...]
>
> > +    ($cond:expr, $($arg:tt)+) =3D> {
> > +        #[cfg(RUST_BITMAP_HARDENED)]
>
> The config name should be prefixed with `CONFIG_`.
>
> > +        assert!($e, $($arg)*);
>
> `$e` is not defined, it should be `$cond`.
>

Thanks for pointing out the macro and config mistakes around
CONFIG_RUST_BITMAP_HARDENED.
Fixing all these.

I could not get kunit to enable RUST_BITMAP_HARDENED - now I understand why=
!
Also added the missing test now, exercised the code and observed the
fault (though [should_panic] does not seem to work).

Cheers,
- Burak
