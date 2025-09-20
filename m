Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4157306492
	for <rust-for-linux@vger.kernel.org>; Sat, 20 Sep 2025 17:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758388356; cv=none; b=cMvvC/R2B+KUc7vuZXQ4/MgJE7HYU5nGNtTbbBXA6jWRh+HlBA76it394szjrdG/lO+RGT64Ar/Gd7R/xjP/O5XAqwYBW0bSKMRdRk4xZNOFxput3RQSpXkMOYcWyf1u/wGLX+DtqIX4dNk6Hr4hA2ViiMKrqZzcutO8fKOdjZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758388356; c=relaxed/simple;
	bh=Gj1Ep/MJST8CACxWAubynz7i+zMqcF8h49oVjFnLgOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MIKNpL3sBEv7c48HrNnmfE3sw0ADtIrK1+MgkOVy0HpSzR/vaX0X6kujju0ZaUKU0WjWP3UXZZtQN7lGFHt+qdOkhQLNMjX7BrdA6+vOIOku+AQL8A3Lml0erd+fOFoijCnWCQIEYt+rbGGBGHsmURRBs6BW7wt0MBYnzlgn/sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3IVZQezj; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3IVZQezj"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso1519369f8f.3
        for <rust-for-linux@vger.kernel.org>; Sat, 20 Sep 2025 10:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758388353; x=1758993153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gj1Ep/MJST8CACxWAubynz7i+zMqcF8h49oVjFnLgOM=;
        b=3IVZQezjkGRGY6jnZJUt2i+7WB3R0jDFvJ7S3CpqjSTX0Go0KM4dgBQaC5qeaLM7SZ
         MZBOmRWse7OxHunxwEPMleKziE8OpjqcsTBIFIxckSMSeiGfl8VsnlNDRedpN4cWYrcM
         63JobxUMPd9Ef2Fl/w8VvBA+lm3xJVXO9cueYXQLd9IEFQ6K/HM6axlSV5PG3+/7zabB
         lHRSh2NHXozM1z4/MIpktKncf6rHZ8cHoZT2+HSXtMLajrVoOvztL1PBd51XkXNQs6EP
         46qB+neSN+QgJ07PjdIAEdajmKfXNbjW4FNJT5ulbl+YMeoogNGxYcy/T1WSFKEGZsq1
         tLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758388353; x=1758993153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gj1Ep/MJST8CACxWAubynz7i+zMqcF8h49oVjFnLgOM=;
        b=f/FWPIzYBAYTTSndM3V+cfsIGGvsK/4xfcOX2x1IutCS14GFok3OLK97beWn1zCmLH
         c/YV/skRJ9ZlkWZXrxBoaavCbeZ10MekW1IPmvnYNeb/VtwvHWTMw6C3WwWUhayxddV1
         9nf3r8LbU9v656ChePBSrbuiLAQm2wE7FSRlVLowNwHDvDuhkJM6OzIzC085Q5IS3BxF
         CmuB9dzTE/Q9DOddHxc2unOVLzRVjV/wSdtg/rJOeTuCBrdjg+4qBr2g5isGGjBB2poc
         l1oN36YnZ1FQF1NrUsTu0Ndu40BVRnK6XKuKlsyNibqcEvPvsI9nRPDWQ9aIaD3nhgYQ
         ytrg==
X-Forwarded-Encrypted: i=1; AJvYcCV/QDCHlWm8v0xdSNLCeGC3wvLssctykVafqUpU6YzWrsv5+HZ2w/yUiRS9xEfwec5Yr8xGfTrDzby4XDYvCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMZRvrjpONLqQjzDWk+ya1ccD4OTeHrGyWqqOQOlc6+o1qTF57
	lgiaeE/OXJoq/ovg7s1WNZ+12AQE6z3s2u7ZaXiM7AGNOhFym4P2P675rxGlMJkRvwT7uUj8xQq
	PRgv1VfhkrJ0HfiVMKPDpi/e3VVL/EqIc3RVxcrxx
X-Gm-Gg: ASbGncsHAphNp08ifWT0moIg1z4gkNhdg7qctF68lNQxkzc2rtG8QYop2li+EXXfOUl
	JZ8nXCrd8InetOMrsn0RSKJRS/9i+0fT1l4+UUOpCGKFHO4LCY/er5bucdWRdYg/v7QX79NvOyU
	KOakrgBKsTd5n7fENSVccTLbtza08LzXVUbYngq/sTUF/6No03y8idufioHAmPkDs8K6xdUmTto
	OGHQZ0=
X-Google-Smtp-Source: AGHT+IF+4bGibPipIgcJxYKVfn8BssHq8357Z0KdCsFz2M+fcQoYEotuvWkwJadILn9AOtmYWB0Q/o9Ht+aVSBuXwCM=
X-Received: by 2002:a05:6000:2c03:b0:3ee:2ae2:3f35 with SMTP id
 ffacd0b85a97d-3ee7bad118cmr5460258f8f.6.1758388352843; Sat, 20 Sep 2025
 10:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-clk-type-state-v2-0-1b97c11bb631@collabora.com>
 <20250910-clk-type-state-v2-1-1b97c11bb631@collabora.com> <aMG6JVMcMxVuX7De@tardis-2.local>
 <3D936C1B-FBA9-4964-859C-84BB665BBE3B@collabora.com> <175834480479.4354.6269916774389395049@lazor>
In-Reply-To: <175834480479.4354.6269916774389395049@lazor>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 20 Sep 2025 19:12:17 +0200
X-Gm-Features: AS18NWDvOSD7Ew9WoF-qENluBOtHGPEWpUP8mLuio2luAr2ur7aLvfUzGRJxJH0
Message-ID: <CAH5fLgib2a7UK0cYqy1cM6h_OZDMWf+JX+KpXXCJNTZchyfP5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: clk: implement Send and Sync
To: Stephen Boyd <sboyd@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 20, 2025 at 7:06=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Daniel Almeida (2025-09-10 11:47:30)
> > Hi Boqun,
> >
> > > On 10 Sep 2025, at 14:49, Boqun Feng <boqun.feng@gmail.com> wrote:
> > >
> > > On Wed, Sep 10, 2025 at 02:28:27PM -0300, Daniel Almeida wrote:
> > >> From: Alice Ryhl <aliceryhl@google.com>
> > >>
> > >> These traits are required for drivers to embed the Clk type in their=
 own
> > >> data structures because driver data structures are usually required =
to
> > >> be Send. See e.g. [1] for the kind of workaround that drivers curren=
tly
> > >> need due to lacking this annotation.
> > >>
> > >> Link: https://lore.kernel.org/rust-for-linux/20250812-tyr-v2-1-9e0f3=
dc9da95@collabora.com/ [1]
> > >> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > >> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > >> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > >> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > >> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > >
> > > This tag list looks a bit weird to me. Why is there a SoB from you
> > > before Alice's SoB? At least for the usage I'm familiar with, outside
> > > the case of Co-developed-bys, multiple SoBs is used for recording how
> > > the patches are routed. For example, if I have a patch that has my So=
B
> > > and I send it to you, you queue in your tree and then send out to oth=
er
> > > maintainers for merging, in general you would put your SoB after mine=
 in
> > > that case. But I don't think that's case here? Alice's patch has only
> > > her SoB:
> > >
> > > https://lore.kernel.org/rust-for-linux/20250904-clk-send-sync-v1-1-48=
d023320eb8@google.com/
> > >
> > > What's the intention of the SoB tag here?
> > >
> > > Otherwise the patch looks good to me. If we get the tag list resolved=
,
> > > feel free to add:
> > >
> > > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > >
> > > Regards,
> > > Boqun
> > >
> >
> > You have to include your SOB when submitting patches from others.
> >
> > This is something I tend to forget often, so I made sure it was there. =
The
> > order may be indeed off though.
>
> Yes the order is wrong. The first SoB should be the commit author.

One optoin is to just land the original patch:
https://lore.kernel.org/all/20250904-clk-send-sync-v1-1-48d023320eb8@google=
.com/

Alice
