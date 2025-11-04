Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C345532F760
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266952; cv=none; b=Q5lkSvA2w7SmXbya9BoYhOs8kzOuOjLpDQDQmKEdr0iWQm14wGnpNxFJdktHlBv5mqhSgHUmDMpoWe5/ICVp5nrr2u5zawqIyvKJ6cjitz8/QL1dG+Nh6WdguVIoLnUxkiiRWMC56Jm8vRnwp5/1heZpBGAURS0ps7v+hM3BaW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266952; c=relaxed/simple;
	bh=zOvuDFw8E3IMboZLcv+wNk+hwh0bnRBGIEk5JfF2cuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gA0C55OR5/1xtKh2rzC224ld7J///iTL+XMkju1BqA4itaLeXMEGGCEE+AfPWEnbEecX8bPMTa0aHKBKr3HiOi3TVBxaHl+lO5ztqUkTE4IIFmxZwfTrd4no+prDS1no0cSURDVa8sgHIlb1kaRR9xrw1O7EliywyYJ736+90SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1xphYpK; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1xphYpK"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7c532e3a165so3370521a34.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 06:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762266950; x=1762871750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOvuDFw8E3IMboZLcv+wNk+hwh0bnRBGIEk5JfF2cuE=;
        b=m1xphYpKE6hDDnSX/bgO73cESnLzldtv8//tiYH6P57octFb7Psl1F6IOVnJPmuRmQ
         gMwCeKPgrxsO/Z34rnyjCseJd3Sx2aGkn2GfYQz5kU2z6AimgEUShG9jSuuLvMMAEjO/
         54Z5N7EaxON/RMceMfuND+M290HJYtFyQM9SLC79VOsxa18NV7PxTuOSBp74MogI40ns
         sTNpgXDkdf4ysAa0Dhu53FBmI9KcwPbK8sGeW7v72iYZ1iEKaFukkvGBOQprTggZorcz
         17It+r5DbYgPG4PJHokFiBIeglTcu4QKdUb9TXKxAFMIHWnsPMJOUnO4mvE8V71gQlUe
         CjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762266950; x=1762871750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOvuDFw8E3IMboZLcv+wNk+hwh0bnRBGIEk5JfF2cuE=;
        b=jvqgHmCM4GVcF76dDMIg67QalKlTEb58S8WWq3pS6W6qDOATySPb4KSUk7wQuMHdTm
         4nuiGMuifUO8Y33CbWz5efWop7KkzrUjmt+keWQTgXGaCx3uiM9U34Op5FC883xWb2iV
         53sk9k6cz/W2pE5sUSHT7RQ+dWPEh4V5X7eMHUjysgmClkqZLL9oaCv09l0wCtNIhPWU
         drOODvyJ/+e9/EtILspptGjBGq2AUYPjXJsZtXCSgaDLUGJdYxvxwPKf7lhXDzNq1t7z
         7mIzwy9382Q4n+EkyZ/lSDn8Xwwoy4QdzrJAgCr9Z/5XDGb6Uc5362Rq3PpoJjrJ9tg+
         sxNw==
X-Forwarded-Encrypted: i=1; AJvYcCWfIPZJPFqBzsYMqJr0FY9VQF2qw1SY5tbku9ZvyLlUnL3Zpn37oVb+54vsWXVkc60mpG4vyYfilXqMi+/Lvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJq6kW3caGrm48aLT2+UqgzJWLVgoXmmr71t12Arv5F0EK1AVx
	VmohI9uF1LvyETRMnaUDWoSk1hh9PMREyifAcSRoXwzF7AlDeKn1K9kRPVj6KdEbcmLSW+eQqbN
	pdoHNUtQzsc+7HoMcwjIROB6R4PCcNSE=
X-Gm-Gg: ASbGncuen8+Js4ryX5o0c1EXIFbC7fj510BO8G4B+EdvKBgah3Ksh3pZl8c6co7hUC7
	GCghYEkcvh9BUA8eeWWMuHF6UDJU7G9R2RhWMWwzXuLIdB38UdO8Iqkr+W63VhUElqNfuv63DAo
	tlRf0N49bcUlCIM3wrE97ImcBhtApqTQsRRT7WHaW/b8aXl4FTsZNVQ6/ykmjQbh5XBMcOt8lLv
	8TCPcMHPPmpoI+u6B3mbzQaUPdaIi0es2+SlOykgTtZuiY4zULH7R/N3lah
X-Google-Smtp-Source: AGHT+IH4OCkFruz7BGxua5FpIyeWRlYQkDUOWfGwgmmxmCKwpvX6Z4Dm1zHFn09KPDIAh4UKGSRMn0mdbsaJbqb/nak=
X-Received: by 2002:a05:6808:1791:b0:44d:a99e:45c7 with SMTP id
 5614622812f47-44f95fe6b3dmr6712173b6e.61.1762266949648; Tue, 04 Nov 2025
 06:35:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com> <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2> <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com> <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
In-Reply-To: <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
From: Guillaume Gomez <guillaume1.gomez@gmail.com>
Date: Tue, 4 Nov 2025 15:35:38 +0100
X-Gm-Features: AWmQ_bkVG2efaCRVFs-QREr4TF_4XAydKse4BHYewSEAhSr6252jH2iQIzSA-jQ
Message-ID: <CAAOQCfQ_d_C7oZ9uq2siJHn1+m+j059qYUMBvTWOnQ5Etk91ug@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>, nouveau@lists.freedesktop.org, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You can use `cfg(doc)` and `cfg(doctest)` to only include parts of the
docs when running doctests (if that's what this is about).

Le mar. 4 nov. 2025 =C3=A0 15:07, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> a =C3=A9crit :
>
> On Tue, Nov 4, 2025 at 2:42=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
> >
> > What I'm more worried about is that it might be a PITA to write. :/ But
> > maybe the core folks have an example for how this could be done cleanly
> > and in a reusable way (i.e. we don't want to duplicate the dummy list
> > creation code for every example).
>
> Using a shared module/file may be good enough, as long as the `#[path
> =3D ...] mod ...;` or `include!(...)` is hidden with `#`, i.e. as long
> as the user does not need to see that to understand the example.
>
> But, yeah, we have already a few places in the tree with fake `mod
> bindings` for doctests and things like that.
>
> Cc'ing Guillaume in case there is a better way to do this. The "have
> something applied to several parts of docs" has come up before for
> references too (the "external references map" I proposed).
>
> In any case, even if the example does not run, it is still way better
> to have it at least build instead of completely ignored, because that
> means it will not become stale.
>
> Cheers,
> Miguel
