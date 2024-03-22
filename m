Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8750F12E56
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Mar 2024 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711093891; cv=none; b=oOHSshZNG22gRZOrosgHPFvhZDIWoaQBx/GkNRepcxHAQzUvl3x4MvdbCx6mWwBkFAdiF0T4f7k+XhgeO7ofsdE0r9CAkpDlgYyxiMcpzRjdePKh7Te73oyFbA3cvO8wPHi/gWW/fEHRvChYhcsAaFtykUOdVdyquKPZ0R4QUQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711093891; c=relaxed/simple;
	bh=3hw5Rawy4Kch8rLIOp9e/R80qsdn1Iud8TwBWgH4EuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rC1JIbjWyNnRCtn9RR+5b+FKOqKP8zfWCFBLtTgcKwNcBnFJYK6v7GAcwup94vF78TgqfhBS0YIrRKeON9JdntW/tSufgtaIJRwQLu/M2Pr44PrAcMmuo9f9EMtNaOiHmKYHanvPmsZd4xtV4gaYLovrlsSeblwkbXLtV0HPonU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HcWmNbaV; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HcWmNbaV"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-7e0425e5aa8so848456241.3
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Mar 2024 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711093888; x=1711698688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UjpmRmSm7wnRaPwBJcqO6UsAFfeuNj9KOWlt7M4Keg=;
        b=HcWmNbaVm7dUJjFYJoE4XsIC372jdwSwbIAC7eWvMYq2zFLHPsZ8oCW+QovWud5wQN
         7wGo2EIATkEXMNmgq3mOWJA+RfTNq5sz55Cjpwa2u9SmhSrZ8n9KQmXawaugQYz6BweF
         Q6XZfgysyAtWTRwgmUn9B5Q+Dgy3P7XrQ1eul4gZnVJTpvBaYr4QhatKQWMllPGR7EFN
         fv7amZwR1sCQgC1NLsZpKZlCcfExJAwXSxLrryOMYBApm54VLGolBLJIgkSWE8IDQ+2G
         RulGi16XhekfVSUNoHQAzKCAMja40jgxF0I+4dH+3k7i+9bAfAZ28s9qTJ8e4DGtKNWi
         eOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711093888; x=1711698688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UjpmRmSm7wnRaPwBJcqO6UsAFfeuNj9KOWlt7M4Keg=;
        b=l2aBWd/wkeh/+Qug8qkil40Gf3Q0xhyp0fHz9ytjYdk0Gl5fKJJkqjA/f2XehkVQcG
         wAlZZHubKTKIzN5/zi0TlneJAj3Ra7LH8ISHgz8FIRxHVUr6NAbppPB3SLYth/EauNZi
         VCaJ/Iob1jm09gY6kYLF3FBq1k7C0D7GvXlmzlKvNj0BzHFUT0f+qLFCoN+elY5+OpfO
         pNmorJzY0eOTLd32FYRlu1e7V8Fog/cMrV3mE38TH6t2d8QN6lDVJm0Mxlj7ptnOeVis
         DLH4YjdahRiN58rh+/z061EVDwGjgtP3X19g1KXR2Y96+fcUS9KaGIfYVlv3Hur/6WL9
         sHhw==
X-Forwarded-Encrypted: i=1; AJvYcCUCjy/w7WKkSDzWVE+33I/lK1+FK5ufT3ypgm2NJJPtN3jxcWi151hnhuF2WAgG5siYXzvJnJ69eZZAG2y3kUAWtUUFLEpbBMH1dfHDtwU=
X-Gm-Message-State: AOJu0Yydyk3VOpV5APpcdnghR/7bCVRpuGsnu9tBCoUmVPpTTAnC7/hi
	qAEHnqsciXxJyScHgvxoKBZa9YaAQThqgIwvUPUi5oHbiJDLWZG9xWKKf/hJHdmWN6lDsgmSCRD
	hsuAAIOTHG/QlBdmBoyaVLlnSAS4fPyScfjGE
X-Google-Smtp-Source: AGHT+IGkCHjyLzrgLqx6n7pTmi0lSVRd7YABhXvFnWPq13wNH0YkWBQ6GV/YYvb9OYRGvEojYsBwYUyLx8JF6ZC/dyk=
X-Received: by 2002:a67:f80f:0:b0:475:fe91:a9c4 with SMTP id
 l15-20020a67f80f000000b00475fe91a9c4mr1888206vso.6.1711093888402; Fri, 22 Mar
 2024 00:51:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240320-rust-ktime_ms_delta-v1-1-ccb8672a0941@google.com> <87wmpxghxg.ffs@tglx>
In-Reply-To: <87wmpxghxg.ffs@tglx>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 22 Mar 2024 08:51:17 +0100
Message-ID: <CAH5fLgjFaduZ1AmfGGGo-kCNK-NO6qN9XK__Dz=VYHJ7dU4NvQ@mail.gmail.com>
Subject: Re: [PATCH] rust: time: add Ktime
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 2:18=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Wed, Mar 20 2024 at 10:08, Alice Ryhl wrote:
> > +impl Ktime {
> > +    /// Create a `Ktime` from a raw `ktime_t`.
> > +    #[inline]
> > +    pub fn from_raw(inner: bindings::ktime_t) -> Self {
> > +        Self { inner }
> > +    }
> > +
> > +    /// Get the current time using `CLOCK_MONOTONIC`.
> > +    #[inline]
> > +    pub fn ktime_get() -> Self {
> > +        // SAFETY: It is always safe to call `ktime_get`.
>
> That's not entirely correct. ktime_get() cannot be safely invoked from
> NMI context. That won't matter for driver writers obviously.
>
> Looks sensible otherwise.

Thanks for pointing that out. I will send a v2 with a reworded comment soon=
.

Alice
