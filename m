Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4BD24634B
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936746; cv=none; b=IUPv3akRH37CW4IDcJlnyRR9UW/GSwBqzVAzRExRdrYwVTbLZwxK4J/r97NHx3vSCH+iz2vK/0LaW12St8/NThiXshA7vglJzpcBPATagdkeA0vXuWlauJt4djXwvyFw5UZzEbxqy7FS9o2iqhzoEJ26KSLUS0KmEvvYEleazPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936746; c=relaxed/simple;
	bh=ePy1A7cWbZusdxSFAOTOyj9lF0UotDEIMy2djGwgCxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Li8lasuwkBZWbsXW2afClmRyJmZFVBrIWySIllftrRYEuX5W/yTNLG1vHBKLhCES33mfRgQZZxKqxQ6EynQ0PHpVzyG2s3eNBxGGqIXNkT8j9eaOEUXIL4E0Mt6vJlxvkBwFf+0H9I3f8/4P0R/6CaOLFY19C4lulz9fJs+1H/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2gkZSOw; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2gkZSOw"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ef60e500d7so47685477b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 09:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733936743; x=1734541543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pj/eNcgFBMMfrop9h5elSlXNykpIvukWbNjOYdZZ7E=;
        b=S2gkZSOw8w0i1A4/FgSaxPZaEqi5uAWmyhX2QIgefvqpC7hk6pNLO8Dj7a2/KdgJZo
         9pVlf9qM8GuRJK7p7ewVBUd3+71ZhPiHm+6BPxe0q1InUKGxDbP5mg5yBcoRZkV0QoPN
         3YM/2TVDw+UAaNA/aOzfAp5nLlFgFcEq0SZUx9L3d492GCSNB6VRTCGyhfPtNyckKbLG
         EuPCiYgVRoTKYysCAF0td3cZXkRjn1mD1GxHxS7bKE+nsdyZBpIU7Em4nhR117829CQS
         L5yRlZ9GPDOMc/RdQ4Sal6VXS6Xy0Z3C5qgSHrbxQn4s/VMTBOWltf8PrWtBHtAoUnYI
         cKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733936743; x=1734541543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9pj/eNcgFBMMfrop9h5elSlXNykpIvukWbNjOYdZZ7E=;
        b=gEMUGeVdnq+HoVuFWnO+il/ldt5t8rB+/93QR8xYLIFT+Urw6KnVlachZTg8YSX0Rp
         caSADZMvNOhyu1SLo8TR7TnV4F3+pSJ0eL37dq7RI1tkc4jT6ASA2APp45zRFVpDQ7jf
         MaN2PZwly7fCECy1uU1TSOTv4qTx9pI3OAKNWBAiLuhhtRgxlDx2t1NIfCGaPBIUaYCe
         TA2p7429EO4vxozSg6EvZ32MJta3Tl4G/FnSMi51oBB7I3OvLGJ7VSL9LyGcjdmCcVgY
         TrT/0BfmlWWriuvE+ZdGf7jozgzYoTY/34snx+hCABMSaggNsj1bCloplpqjeA7Pndvf
         T99w==
X-Forwarded-Encrypted: i=1; AJvYcCUaGwSl7YaXQb+cmN5F0vw9aXFPVEQuQPsOeaOBaTBkMp2cwJQxJxIq3scelKEdEcZ8KDT6EZ2EIzHZgMN3/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2F3v0hEqJSUKt9jVi4nY4yIXRhuOnBFzlyeKoDRInodFmmT1W
	qUA9/6g6uRfgQdbykIL1JsFLikXD+h9QEHJMdn9xLQbQSAai7VBXj+Z2rfxLXFPdG9wMCqpiQ/L
	tNuay2hvuf5phiBe5YCjkkTJukHk=
X-Gm-Gg: ASbGncvkWdz/1CfLyxNdKQr2mMyxfeALoX6BDPVQRNG6g6qvddBF2NYGFsj+jZrUPw0
	eqNCKnnK4Bep16CR9sINe8EcZo6rwZyzT62OYAowUCgFcA/s2fsCCVTbhQN5kBuBCWGg=
X-Google-Smtp-Source: AGHT+IEsmpNhBhWdbJSs4BOKd/3tSGKRS0WlHIdRFj8k8N+aUT82tq40c7WZxi4mtAWPDOyMmMCDVZ8N0q+hw2vnwr4=
X-Received: by 2002:a05:6902:110b:b0:e38:8263:7990 with SMTP id
 3f1490d57ef6-e3da2aa8ff0mr143609276.48.1733936743628; Wed, 11 Dec 2024
 09:05:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
 <20241211020507.103687-1-dev.json2@gmail.com> <CANiq72nxqdZzD-TtZbnHOdmMxMkXuafquWpsHOeW5rWFJbhKZA@mail.gmail.com>
In-Reply-To: <CANiq72nxqdZzD-TtZbnHOdmMxMkXuafquWpsHOeW5rWFJbhKZA@mail.gmail.com>
From: jos <dev.json2@gmail.com>
Date: Wed, 11 Dec 2024 09:05:32 -0800
Message-ID: <CAOJvc-aJJoUh-YSNwWX21vT4O8tuLSOVb10w=WUV7cFcPJvf9g@mail.gmail.com>
Subject: Re: [PATCH v4] rust: sync: add #[must_use] to Lock::try_lock
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	boris.chen.czy@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Can't we use the same warning message as Guard?

> #[must_use =3D "the lock unlocks immediately when the guard is unused"]

That is what I originally had in my first patch and how I understood
the annotation should be phrased, but @Boqun Feng maybe you can chime
in with your input?

>> +    /// Note that `T` is `#[must_use]` but `Option<T>` is not.
>
> Should this be a comment, i.e. `//`, rather than part of the documentatio=
n?

Agreed, after reading more documentation conventions
(https://github.com/rust-lang/rfcs/blob/master/text/1574-more-api-documenta=
tion-conventions.md),
this should not be part of the rustdocs.

> I would also reword to explain the "what", not just "why", e.g. something=
 like:
>
>    // `Option<T>` is not `#[must_use]` even if `T` is, thus the
> attribute is needed here.

Thank you for the insight, I can see how there is missing clarity in
the current comment, will update in the next patch.

Thanks,
Jason


On Wed, Dec 11, 2024 at 1:45=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Dec 11, 2024 at 3:05=E2=80=AFAM Jason Devers <dev.json2@gmail.com=
> wrote:
> >
> > +    /// Note that `T` is `#[must_use]` but `Option<T>` is not.
>
> Should this be a comment, i.e. `//`, rather than part of the documentatio=
n?
>
> I would also reword to explain the "what", not just "why", e.g. something=
 like:
>
>     // `Option<T>` is not `#[must_use]` even if `T` is, thus the
> attribute is needed here.
>
> Cheers,
> Miguel
