Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC084071FA
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 19:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781550798; cv=pass; b=lSEF+ChkcxIrOWTfKRBh5AJsHXpiAd7awA/a160urHgGwW6SC24sLIXivOpJtOaCsM5R1pxQ/oqzaKskHUpxV1P4o60vnw1os9TnMkakWFhNCEE6XnVwsWwfiynfM03oMgXjaBmbfuEqi62N37eJu43k+yI87AJIyySjvk3bU8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781550798; c=relaxed/simple;
	bh=kLZMPxzGOp4vcbv0OYH1G4I3wQTyyqhsXCKBiQoU1UM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knf8JLA9CYFf76aZ7gz071qN6WJ8WiPululCabzpo2D2VokF/3cVmTnXbgTO/RqmFpoV91jzbrClalZdjOEo2bwQKkQgTbBu+pGfEA3vQlBQrzZO2YYKYSQ/Mo4Je6tn1zLh3LR8mMMqSOCO2hlK2qOY69kbPd3AbNDqGGLiGvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlpxCQAh; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlpxCQAh"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-660456349d9so3809818d50.3
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 12:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781550796; cv=none;
        d=google.com; s=arc-20240605;
        b=Y19O7vb/3UAxIFzUOAKZrUKqqaoiKECddq2nhYJ4df+lCCj4WFQWUSAS4UdeuPiSrW
         bGZpms+6G+29Y8EZFj4+b1WaeQFFeaTYwruVRUy76p3qLmjqrs38cD6JDXPYz2Ppm6aa
         CziLZ6+LoEx5Ws4jJgNEiEDNl52Cq16b844+hxRGgh3nYVAU0b1pDd0eu06pvl4ULdBS
         Tmu7i0MMKeD9+N1QCXyzS7hHjXXHzKD60FIVs5O5zSVWhCOe1RBLW3segJ+k8sqmODq9
         Z/eFBXmpgyGkh0PgQmrYp3qbfwG5nvFO1gnoKK1fQIfSFs5hyonJIzhsZpSbl0wC0Pcm
         mVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=38qKItmGfuBmcICtGQtCIlHBoGGdLVK4+VsUOHyMjJE=;
        fh=pYa81uU62TENz++WK6h3/qa/QmzdueN/gcf1uvAPy2A=;
        b=AJa/+LAm2zEFJiUds3zzCJiVZGfUUaXeT3Oxj+f9pRNqJijv3Tbc9FzJ11gWRkAUe3
         vTozfViuxgKmxucH/XnmUwQb2MRWPDMXnuNxjMPBPuRj3cUCn3RImW6au9yoS+Bu8omO
         CpZ6WKWkMG9/kvQxGBvHHZCF2J6jxP0lEV9K6w7rnxt+W9eyksoI1LRnzFZNQFGsMfFm
         cRCwl/tGg8+kYLOFCA7vV3VYFPvRtQVyDFI05lhF0K7jkQlpqRnthR/QuFJInBos9Vj4
         3jigz4KAW5MOQXf1BYTUKjv/RaleGCbvI2M6Zvha3zMbkho6RLvnQJEPKUMn0piAZmv8
         v1yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781550796; x=1782155596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38qKItmGfuBmcICtGQtCIlHBoGGdLVK4+VsUOHyMjJE=;
        b=BlpxCQAhSQCGviKGR8K4OODF3x0nlxNCCz2tXtHHSrbNYNM7qLae2rY9M4j31+hOvt
         0i6fPLRoDrk+d+Vo5gRGsBfJuHiJBvXGxVHHzZeyUeIHfDlFd7mpMa4YmOVMN56fvSSX
         BC0ZFwa8W8HsOJVMYbH6iNGslfu77nmMxQzyYktLbowGOh3I9PMSPH+NA3GhLZTfgfPY
         M2c9/T1RU1XqwfXOChG1sgmFWQNkEnNoyEmEFjfgwAjjgmnj0NbwoIiDUGX89F1x2tFx
         9KEO2sTHkZ2BFk9OkRWqWVJBajKrS4ynn7lmmbDae4tCzENbCIlHG0bSRdnkBVKsqq91
         gOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781550796; x=1782155596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=38qKItmGfuBmcICtGQtCIlHBoGGdLVK4+VsUOHyMjJE=;
        b=DYJeyNkthZLBXJET3er85D+J5TVlRKfiL6HOkBJQCdZQ5SEstSeL71RbP2Q/BR24TE
         hYBXGzRL/1OfMQYswYBNuMSvoNXA+BQir7+WimBZJnvs9xzVhi8Bh/lFbu+jVNzSosz6
         m9s0eygHmIxB+3V3aP4cXrNgA3YKuw/+4c3FxruE7uKKGRUqMB50yX33wJ/SqqKJRogU
         2UB0QQs8SY9QZ3+8Mk9S0DhcsldJAnRDceSn0c455Od9UCIrpRGUdjIsjJvmrOGRiA+c
         6PE2A5cWp7x3kWrcDszkhCsM1ZyMw5I7PUZfOAjebCugocwXnKVWgM4loyJwNJuKnR2J
         NQvg==
X-Forwarded-Encrypted: i=1; AFNElJ8Uo3Lc+2IzSheR0hshXhvluHfwbQW1wcQIP1jvF4HzrIupwVgme2aeyG8MssR2nj2rnGPeH26wya3Yc9lyjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVnNyGXnikYvHakOe0lGIrjIhfWwJc+rlyP0SL9OB0b0urhUr/
	16plBhkVBuuuJuxVi5WG5ft2NaIXubuNRZsvLWL7vwIeBic1WHScBcqDgWa71NkKTuQAP3GERfM
	T0rjV0nO5xErSgGM2GtNufhZAbHeZr1Y=
X-Gm-Gg: Acq92OFN2r81NXHrPZ40IMnctvjfxmjep1f/rJijLCdTU1pNfyGxG5vG6m1ZUb9KPi0
	ZR//0AYmOQiOvAnM1EyAdSy7frgBehVUm48S9LOmiBp45Yti583Y3pA24Msm17MlPJ5mnlki4U/
	oNyHh+tMtdnUGPOnVi5329JpO4HMSstJyXSE56TBadNf+i9S8AHRPapadj9Y1Egte6tV2LGY2cX
	sogw22oaGVMVgxj0xuGXZ2VBoqBtiFqR2ppyyasiFRqtbCgbHJFZoGLa5+gv8CA5iT0R7jjMxGm
	jcuU
X-Received: by 2002:a05:690e:4410:b0:660:433f:b0e6 with SMTP id
 956f58d0204a3-66277fc7b00mr9375231d50.26.1781550795073; Mon, 15 Jun 2026
 12:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522172558.137415-1-ekffu200098@gmail.com>
 <CABFDxMH8icJ2HAw0iTotg0ipYSGDX8ffiTv3e4SmXu1vQ798jg@mail.gmail.com> <CANiq72=-=eE4X1MWGvPPEY2wJs=h-f5rt8_j229ALWJ=y2meRw@mail.gmail.com>
In-Reply-To: <CANiq72=-=eE4X1MWGvPPEY2wJs=h-f5rt8_j229ALWJ=y2meRw@mail.gmail.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Tue, 16 Jun 2026 04:13:02 +0900
X-Gm-Features: AVVi8CeAwPryTV8s1rymTDDWp8I0pZ35nOllOWxSj-gQ494NtbKW7Vp0PCYH9Q8
Message-ID: <CABFDxMGUBBVYe+H3QTfmYKozjHi-40brCTZaU6ETNdJyWQib2A@mail.gmail.com>
Subject: Re: [PATCH v2] rust: time: warn and assert out-of-range input in
 fsleep() and udelay()
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: a.hindborg@kernel.org, boqun@kernel.org, fujita.tomonori@gmail.com, 
	frederic@kernel.org, lyude@redhat.com, tglx@kernel.org, 
	anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jun 16, 2026 at 3:43=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Jun 15, 2026 at 8:15=E2=80=AFPM Sang-Heon Jeon <ekffu200098@gmail=
.com> wrote:
> >
> > We're now in a new merge window.
> > Gentle ping. Any feedback is welcome :)
>
> In case it clarifies: the merge window is for PRs, i.e. it is when
> Linus merges everything from maintainers, rather than when maintainers
> apply the patches (generally speaking -- there are exceptions of
> course), which is a "previous step" if that makes sense.
>
> This means that, in general, your patch may be applied after the merge
> window closes in a couple weeks, and then it would be sent to Linus in
> the next merge window in a couple months.

You're right. Some subsystems have their own tree policies, but that's
not my main point.
It was just a friendly nudge to keep the clock ticking :)

> As for a bit of feedback below, in case it helps... :)
>
> > > +/// will sleep for at least the maximum value in the range and warns=
 once.
>
> Not sure if they timekeeping maintainers will want to promise that it
> warns (and once) or not (i.e. it is EB, after all), but it sounds fine
> to me.
>
> > > +        pr_warn_once!("attempted to udelay() with out of range delta=
\n");
>
> Perhaps:
>
>    pr_warn_once!("Attempted to call `udelay()` with out of range delta\n"=
);
>
> But it is up to the maintainers.

Both are fine with me.

> You could also consider splitting the patch into two, but it is not major=
.

IMHO, it's a bit too small to split, but I can do it if you'd prefer.

> Finally, perhaps you could take the chance to adopt the "kernel
> vertical" style since we are adding an import.

Ah, I missed it. Thanks for pointing this out. I'll wait for the
timekeeping maintainers' review and apply it together :)

> I hope this helps & thanks!

Thanks for the kind review. It really helps a lot.

> Cheers,
> Miguel

Best Regards,
Sang-Heon Jeon
