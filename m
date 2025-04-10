Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA95319007D
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 14:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293608; cv=none; b=ifTxsvUf8Va9WcnC3B/HeB5oTECPEQqST1PvEE3nOYwhFXw1bzZuf+XkYt9X3tQWGwwA4GeU9Z7fRwVamoFtsr3jeLSOaSK6R8SAmMbbpOcUJObIGQBmdGPZcgGSFQwxc7UWf4q7H+78rLlN4OuZGnBsQfRMA0/Qq5ZomqfPpLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293608; c=relaxed/simple;
	bh=DkhAAPA6kBndoYkMckkzv2wi0P9heqk3YlBHzr4h9/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DxWJLnzNufA1gvrfmo2YYW/ZAJeL2mzsE5bDwVPpOPPS24HzNDECvtacju1HBnZ2/YGw6D4RHy2BqIEoKFGcEf5lm6kSC/mBNPoXtoMoStULeAQJckJ79tToat960/CRe/giVL3mL4AXL+7IZbW8N5QNWikWEsVAXjtoa+U0t4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PEwJrfpG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PEwJrfpG"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1401198f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 07:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744293605; x=1744898405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkhAAPA6kBndoYkMckkzv2wi0P9heqk3YlBHzr4h9/E=;
        b=PEwJrfpGn6ScaQ5e28AfnospMcTNVwKp9z6oZ69cATuWsjKY/pE6OWUh62dBukTH+e
         wyhUOOhBnBTlO3FM4YwMd84no+o5VpPDGGp+Fe2weBXYXV1D5B5PpZgPb/PFxBvpYiml
         SdR16o+laSUEdagdoopbdRVKTEyzO174iGRHO8GuZKeMtaFgomHOqv8EWrkHTOyYqsQK
         3lEOKSsnsF3URSkcVRDVjFOFnBmvlFgyfVnkUYLR820xQbhW/I/iGKarF3wO/DxQgsCG
         1zYDxpOVrxK4IQcJpJAbPiMW/Wq9JljoHa5VTK8vdPS0b1PrU01TFk+krqmou7cNB3xz
         ffrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744293605; x=1744898405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkhAAPA6kBndoYkMckkzv2wi0P9heqk3YlBHzr4h9/E=;
        b=OPrLFqfYVC86K/VtaHjnLLTUaPZnWeqb9WPiTuGiiMkcYIrpjvbEqTPn+oxadNdlbd
         geLX/Z61UFZnp9IyV/AL4ThHLvxgyJnbyqqP9Dpe0IrlJoJY+Ym8kAHSjobZB392+RNr
         Ne9k+Udy9ebmkGKwDonaOASHzVTWC5bzZI72gcK+V3cF5eq/Fmq9/K4glvGlJf4ZTdrs
         u+SCh40MMz61e78sHgagel3TfnySwR7Iup+BpAVZCFdMoUHaIpR+q8IUrxGYN0YmdQIO
         G4rYWpeEybwThb/uBnLgk6fbOZdn4CrWbM4AMZmgfWJCPZ86MPbzvUDtew5ymv/dn7GL
         oolA==
X-Forwarded-Encrypted: i=1; AJvYcCWFCxiXU6mIv2HE+ADRNfAOENtyozbq8AgQIxll9IKdmQcvi7AIn0agUfB4L4I3d7BzAZSNd7boqYA/322/vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl36j8eG649eoAyxs/1Ubys/2ucxazS+7SLgQEseJkdbUR1eoz
	HcmPhAu1J6kxAEyiQ+NSt/m4JFeQw7Ij8WhCHrrrzZJek+e/kFsT1dUK4TeIfALODFgOZ7VXJ71
	lQot1xgTsE6BTMn9dxJWZY7Xm4ihok4azVPoK
X-Gm-Gg: ASbGnctlj52OZUleZ4M3FuFlbtxxsQATPvOxOozXDwoOwkvEyJU0VkBj1iedvW7aSKb
	GU4PcqAzgEX/igFHGKcN7+Y7C8fEuxt8LudXipNdnNA0o1lcMyjpoW+ryJ2ZAGpyZOjKhm/vgVm
	5HKqZZvUmTC+CNdtVgCw1eYJ2zDt4cPojeRM6j7Yb1Xpdas5S3TtZr
X-Google-Smtp-Source: AGHT+IE/4Ng88Ghh9b9cz333p4LRZHS/YvWGDKbEw/0wlaYZRQcOHJ8JrXhJUUMtdgnxLoX0Qa6IY3ujoMO0MRt8aoI=
X-Received: by 2002:a05:6000:2508:b0:39c:1efb:f7c4 with SMTP id
 ffacd0b85a97d-39d8f4dcd59mr2679780f8f.25.1744293605110; Thu, 10 Apr 2025
 07:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410115420.366349-1-panikiel@google.com> <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net> <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net>
In-Reply-To: <20250410133446.GF9833@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Apr 2025 15:59:53 +0200
X-Gm-Features: ATxdqUGg5HChMyH-0LvrurnU48biEJhkOG2za2uBeHgJDdc3xlU1wyOQmbxqTkg
Message-ID: <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 3:34=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Apr 10, 2025 at 03:27:55PM +0200, Miguel Ojeda wrote:
> > On Thu, Apr 10, 2025 at 3:26=E2=80=AFPM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >
> > > New compiler can't build old core?
> >
> > No, that is not intended to work -- `core` is tied to the compiler.
>
> OMFG, you just gave me another reason to hate on this rust-bucket of a
> language :-/ What language can't even build an old version of its own
> runtime :-(

I don't think there's anything unreasonable about having a place to
put logic that depends on compiler internals.

> Anyway, given this core nonsense is now CFI unsound, it is no longer
> suitable to build the kernel. So either refrain from using part of the
> core that trips this, or get it fixed asap.

I submitted a PR that I believe should fix it:
https://github.com/rust-lang/rust/pull/139632

Alice
