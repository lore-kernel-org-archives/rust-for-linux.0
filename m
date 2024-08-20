Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2181BBBE8
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 17:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724174929; cv=none; b=C+ZvBcxO1T8DvL27hoMhxIPn8TWqphNgmRddk/m7ctwd79fek+n8+LXCa2uf0VUBAEstmFiNeh/sAj2Ae1TjUf/TnmvUN5vTiAOy4TJbh9d1KEoimvefIkLo3DflyTWvg2fM4XXcWG9a8hUfkT1ke5vX8x6qAEtVbEgT9nWw2+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724174929; c=relaxed/simple;
	bh=QEDqYF9tb9faubrQz3i+oeJSL+hsxPawYdSfJmGCtpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kX26AH6jM1Of/ZbN4vhO4y2lfdBJFrlAaJ0fv4QXZ0novdbxC2r4bQEcXAJG/XSGI9GsDFgVOE0ngFwBQo/luNmvTc+TlIKEgNTpo7oooP/swFqMG7KIGfMQha9klFrRdRF+CxqFMFRfcn6cUuvyau9EEgtjoQABRG8L4+GBSEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kl2m+WSn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kl2m+WSn"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so44677085e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 10:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724174926; x=1724779726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEDqYF9tb9faubrQz3i+oeJSL+hsxPawYdSfJmGCtpI=;
        b=kl2m+WSnKWHkuhxYo5D46P/KMVYpAx7c4snZMqKtCL96oEqmJRV2YO7KFw6GvogbaT
         T3JTtZoygp6BH6ko8f5ksUv1uEtVf9GsENxU1Xw557KK41qHMqs1fEdiEkKlj/pop6Ei
         wo0qGfC3su8Zi55aV4W0l+YIxo5ZiZtyPW/PxrRMxQs8OgyrinLbu/Hemqq7njxSNCCf
         fWpmET4n4z7zQEUztjNBa+x6FzR3kUsL2KZm4/vxsEddA0VdoOLgoXWf4TEJNk/xKmPm
         xUpKyG2aGcSz16mQ0DCIQ+zfe8cmZn6VxrFPQ1nKR4T5lsq0nGFMnA5bZluyvTxlfbFK
         xW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724174926; x=1724779726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEDqYF9tb9faubrQz3i+oeJSL+hsxPawYdSfJmGCtpI=;
        b=tdWd1V+UY5+Zm6PPVYDnAqEsfE8Ku7S4w42FmPVpie+cUa2XY6F68u/5CyqyX5NRSx
         zfm3la8kaUs7hCSLJhzAXAMdemtqS46nYOqvT1VGXrthTWvnlA941Wc8vuPqDwZrPf2A
         4aNzDmY0zemQetAFNXOXFYpzfuVFnse5bKXgwsPzYvJ+ijXQm/VOmbud+KJtOAEKZOet
         Z7T+c5tmi5hwMT1g0rYXOuJnJl5O+mU5JHkUwWMOoxxUom1SS865sFPZKT55zDPN0xvi
         lCFtJ+YdiLqz0nOZJA6hMY9n0K3Yckw0OqelcE+rVT5vwAMiz0LWXOQeiNcfilWql0lu
         EUhA==
X-Forwarded-Encrypted: i=1; AJvYcCW65ktylvOvmjAAReyfpfDipia9EDho1oVaPGuSSRSioIKDa/os9KyTIE9rjdF1S4i4YQ6dLDb3yMu1ieooaCteDYQygDE3+xRURjE9MMc=
X-Gm-Message-State: AOJu0YyFzSSTaw3MQMUMc5N9fBSHMx7TsTc9yHxCH5L852qehubdfGio
	HLqsNfmOnqwc6uu4FY++O6qU27ZeqqiMjXpjLTRwM/zWYyTxT+Oc7Fv4/du+ynXZf7Ruxx1IFoz
	Gwvy5Y0ASJasAPDIpdGLPHHo8wZY=
X-Google-Smtp-Source: AGHT+IGitQHRfAd0itDJQOQ9rh5X2apcGEYOAqUE0xfkpsvvjjfPeeI7rKisTxbX8CrCHdrFTSs99yFb27u2h+eDJZk=
X-Received: by 2002:a05:600c:1da0:b0:426:5b21:97fa with SMTP id
 5b1f17b1804b1-42abd2449edmr616875e9.29.1724174925358; Tue, 20 Aug 2024
 10:28:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com> <CANiq72=jxS-LtTMPdtFCmO0T2ajNZO+XLywqeevE4FyNhtyNBA@mail.gmail.com>
In-Reply-To: <CANiq72=jxS-LtTMPdtFCmO0T2ajNZO+XLywqeevE4FyNhtyNBA@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 20 Aug 2024 19:28:34 +0200
Message-ID: <CA+fCnZfbHUJZOWBksYC8N30OWxXG8bJ=-pzkwEcHA4Jpc-b7FA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Rust KASAN Support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, dvyukov@google.com, ojeda@kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	ryabinin.a.a@gmail.com, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 4:20=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Aug 19, 2024 at 11:35=E2=80=AFPM Matthew Maurer <mmaurer@google.c=
om> wrote:
> >
> > This patch series requires the target.json array support patch [1] as
> > the x86_64 target.json file currently produced does not mark itself as =
KASAN
> > capable, and is rebased on top of the KASAN Makefile rewrite [2].
> >
> > Differences from v2 [3]:
> > 1. Rebased on top of the maintainer's cleanup of the Makefile.
>
> Andrey/KASAN: whenever you are happy with this series, assuming it
> happens for this cycle, do you have a preference/constraint where to
> land this through? I am asking since we will likely need the
> target.json patch for another series that may land this cycle too
> (Rust KCFI). I asked Masahiro as well what he preferred to do, e.g. if
> he wants to take everything (KCFI, KASAN, SCS) through Kbuild, that is
> great too.

No preferences, feel free to take this through any tree. Thanks!
