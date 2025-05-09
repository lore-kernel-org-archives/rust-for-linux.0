Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6554964E
	for <rust-for-linux@vger.kernel.org>; Fri,  9 May 2025 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781922; cv=none; b=lXtfzUki7wl5VRRZILp/RZ6QndXkpyb9EUlulzheBH/HCDDXXKWUtAsRajFJX9V8mqzrrdWXbocyxhqxeem80JSSNyNVUI109zwBN2PSzjhuWn/x7PCQJsLAJcuOMNyMkRTqVYVxbLydhubHgBNBL/XihS0qOie6sWEZtEkeWis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781922; c=relaxed/simple;
	bh=Ci/t6dlu80O2JuGu3DUlOlvoakx7dZpPT5xzy04MF3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGA/Z5gzOtPPffAVQDOuEPCiNVTFpzIQZV43ts2RPI29tjEOe06W7dU04i0oLe5d3fmfpjaYAxh+otoy3z8QUsfsl2IT+uFRX7PzI0u8A9qIm4Yw/WUMnD72qTDzvDScC4b2v5CgDKTU2LIqTTffKMj9nGI38AbkSmJ/2czfWb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y0m10W+/; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y0m10W+/"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476ab588f32so29450161cf.2
        for <rust-for-linux@vger.kernel.org>; Fri, 09 May 2025 02:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746781920; x=1747386720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqOryqskqRvQ8bx+Wjf9vUcQYnHMdUoN2Z5HJ3jNYUA=;
        b=Y0m10W+/4eEh/QjuG9CybJ4s4uD2kXLOVnX4haGHeMQgnLD4wjIq8es4J0PLgC8xVE
         VdiPDPsYPoA63pS8xYaxhqs9/Lkt2HPgnExyNjDPbJ3p19TczHD2IT5PtADXQfrhn3u9
         zoHdoKh4/nUhGZxFzX0P6iEbDpA3opvX4FNLZNETwKFrs0FS+FUC/gMQdLmXuJi60fSP
         UMD9paG/nube03dMaQGs3PJtbgrfNxPekIg2nMMOWShYRSIE2dhieKUMlmgTV67mLeMI
         Ai+Hf/Rxkbbh8X8TsgQViLTivtfOSrG/0MFyWyS9SjgUrR5fVlnPEC47HXdHghQo/pjK
         httA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781920; x=1747386720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqOryqskqRvQ8bx+Wjf9vUcQYnHMdUoN2Z5HJ3jNYUA=;
        b=CoZ1MI4tPZsyDP0xgwF50SHgNpfUs0LTGb84R2elymOMVWxeK/e2cxEyO/XqenCtpW
         EGlRvcWSI3/6O66+l7D93iVy+hVyUIn0IP7qzkhidVuhtub7b3ZI6TRPo7VB1QZeKI4P
         fVuDaG5p5BtByyVWYhQnqDfx1LQZjDwqRpfkDnPANbBJ4Eznjuni34cOIX4ufAel0F5y
         N3QNdG9QcohC95QRntOI9rJcv2jnjoNReCSQSiCKRtJ2l1+xkIU5kMxCGeDH10F2mxjv
         8krRQKsujHOr426Kh0Ujl184loyyf9KvOXiPdY2jtOS6z45yRnQisBRPRFipr7oybQlh
         4W9g==
X-Forwarded-Encrypted: i=1; AJvYcCX67z/g0391KhV35ORCZElxXkjtU6V+/Ngd8JmTKIba2jcZ4dffdZKeXbKZ1msHW+kzIftEo1jnBt9H/B18DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlIKDqideL91wIyb1TFo4pEC/KHV7pawS2NDg5eiUVBgiCoUWN
	AbqoyCF6PHBc0Os93ial7lW7eT6PVT4NhriQ9snJxHGwGSRHtzOvoWKWlff1Ka9V95WYjjxyUhy
	+4QXxZ+Lh8t2Ny9OEe194wzYBoEpcZaxAQUm3
X-Gm-Gg: ASbGnctr74xTrxnqt322lFBBxxdyKDtyifnfEqqAp+duZKq1qqU6VWc5dhKErwphxlJ
	uUQsC60q8SAj/kMbZAHyH9Xva3aO3V6PdK2YR8r+NhhIBncoRRF1YwEaD5dwsv05zuC10uBwM5U
	IveHBOHyzFmL04xkXdBN1qmoALEVD5u9kn6oGozlBFRgXi4DShW5g=
X-Google-Smtp-Source: AGHT+IFlirV44fJeIqumI+ufd/Qr9Q/v5a/Fg/xwhsZmRAokCZsEllXBa5Ze2evO1cIXYt++e/Jy6nrAg0xfT6uDtEM=
X-Received: by 2002:a05:620a:f13:b0:7c5:9a09:cb73 with SMTP id
 af79cd13be357-7cd0110453amr416174285a.23.1746781919858; Fri, 09 May 2025
 02:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410132649.GE9833@noisy.programming.kicks-ass.net>
 <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net> <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
 <20250416202040.GD38216@noisy.programming.kicks-ass.net> <202504161442.66CE2596@keescook>
 <20250417081818.GJ38216@noisy.programming.kicks-ass.net> <CANiq72kjDM0cKALVy4POEzhfdT4nO7tqz0Pm7xM+3=_0+L1t=A@mail.gmail.com>
 <CANiq72muSS+NNs5fxp4GPKWWhyXT95spvbGsZz6AJnK8RerUqQ@mail.gmail.com>
 <aB3A0Qe5WqmxXQJt@google.com> <CANiq72=NymSwziZw1a0PUNyJ=TCN5tkr3PojJRQ0sjqFWDjz-g@mail.gmail.com>
In-Reply-To: <CANiq72=NymSwziZw1a0PUNyJ=TCN5tkr3PojJRQ0sjqFWDjz-g@mail.gmail.com>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Fri, 9 May 2025 11:11:48 +0200
X-Gm-Features: ATxdqUFNtz40aZaXy527JX_9a4RrdQI_LkIIgT_Hz3D0wk_Vdl1WGRXF-uEInLU
Message-ID: <CAM5zL5psM0ED0A5ZkEdNi34q2itfyMCi+QRBtG-5URUsChUU6A@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 11:04=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, May 9, 2025 at 10:46=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Actually ... I don't think putting it on CFI_AUTO_DEFAULT the right
> > approach.
> >
> > Shouldn't the depends on clause go on `config FINEIBT` instead? After
> > all, the current patch just means that you can't make FineIBT the
> > default option. But you can still pass kcfi=3Dfineibt on boot to enble
> > FineIBT which would result in the same crash.
>
> I thought the intention was to avoid disabling FineIBT at config time:
> https://lore.kernel.org/all/202504161442.66CE2596@keescook/

I think you mean enabling FineIBT - yes, this patch does exactly that,
it's still possible to enable it by hand with cfi=3D

> If another approach is needed, then we can change it on top if that is
> OK (I am about to submit the PR).

Putting it on CONFIG_FINEIBT was my initial idea, but it turns out
that this creates a dependency cycle in Kconfig:

error: recursive dependency detected!
        symbol RUST depends on CALL_PADDING
        symbol CALL_PADDING is selected by FINEIBT
        symbol FINEIBT depends on RUST

Not sure if it's possible to make it work.
