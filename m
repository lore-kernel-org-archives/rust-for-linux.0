Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBD72D5C83
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 11:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773401223; cv=pass; b=uZ5JkBKpD0d5fpM921Y5rYL0f1arJJFcpr/aB3YmTH2YyfsXk71PzxdRt5bJ0YKHoSxNSGhVyv7ECvzhgYZgFPOzI23y57RKi4hVzCfRCC4U2/Rm8mHH9GvXTxhSQe6DP54ozw+bKugI5eVxJJ8ryF8eLDelaBlfhTvdW4C7GkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773401223; c=relaxed/simple;
	bh=jnMh7CQ75SMaurcHZVRFV4YMPwob9GfacjlNlW+nAaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tw+WjmS8SEp3Y1wDhu0KWCVKQaPYO4oR3J+UoAsS1SnmQWX7NnL301JGQyOUZeOhoqYB8HZg4a6CqNykBbw7JTTRpY7g0nEOrsfa6rS8OG9kE77Wstcf0ZsIjvmAdrIdIcUSMpFYKqqq+j3AlmcYREHUY+x+Yo15OHKdbu6jpG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l4cWeSBj; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l4cWeSBj"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439c6fc2910so1669908f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 04:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773401220; cv=none;
        d=google.com; s=arc-20240605;
        b=ehhZZkvqxQYQpcRO7gTzxesCWzhRHRTbO9sLnMylhi3CvmAWIOdjxn4UAPVntLhQVX
         vMeUgDkhmB0QeHGomzqbeWORuZrnKs4JFqwqbUvtOLvKY/xN5xuqdkOnYgq1IrWZIY9l
         7vHmMqStyDIR4W35SB1b0GiwwCVw2AcbRMaXvWSXfMJur9ldPB3lhORQEgT2FYcyiyIV
         GYdc5m5oInsfnGRNDypRX5Rf80cht9i35tRhl/skzpf33BLlcHmjaBpRimDCOComUCWD
         bcYPGLYX3aVTTZtO91DZl2qfKuM7JoySo0NXfUP4OK3eAHxyHTSKL1NrxmjfKG9Cmc/H
         QDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oyt+ZfMfYxDKRVuKbiCNT4uX/OXqUN9qFlMYleYX9OI=;
        fh=H+5f18qdgKyRFFUGEJu2GTy0hWXFCA0aEDEmB81qQUE=;
        b=OaGk7F6yUBsSciKXlpizl9Jx759gIvz6GOXhm0PZn85LuGOYQsn/p1wHMsTwPJsL/E
         F+2R1O4lRebW1LHRipqbbRXUgjn2BJelH0f+77TAAOaVmC0szWPCn5gH4CKjojQPpkW7
         UGw7XEbUHtf7hMtuGA1yQz6UjiSC2AGQSp1HEnpXi/OU8JXcKbgGh2q3xIDfOjAQgWxU
         clQlYDZeHEVhf6fNdtzFvmr7YKiSdztAaTU8DtasVdmd750W7dSjlRJ5ARDcDRHstgWz
         MnosskUS5y1vZ2UoNYXsN4i+d0PV0cJ0lilie8kJvxFNc+N7RFdNg1NMXwURosTnw12o
         bqkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773401220; x=1774006020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oyt+ZfMfYxDKRVuKbiCNT4uX/OXqUN9qFlMYleYX9OI=;
        b=l4cWeSBjQJnrFUz/Az27q8iRbt6RwdABoo6NKayONY5jple1+0kNbhTEFybYf1iplk
         yFaYrgSKSSkyYbmVvqYo/JqtpNfdBJMQJF4xULaXcc4k8bXXxInUmNQmQO//pHdHUVDZ
         BrdIaygiVlNcSt1QbcyqyLT2vxU12m9SQl/6brNkkTK9ucxXsvyA4pDGXLEhZCaU2V3L
         s/ukd7K8QvED1EguKUSJDYJRgJ/oCXNpAGYVG2n5Kz90TiFHLtiygEmtjSWrikUMxbig
         rTSxvhGUSl3NfmPiQKZzVL77E8CVs0fF98tTmIUQPDTFstaQJstixyRRuJzDYUL2yysW
         1/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773401220; x=1774006020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oyt+ZfMfYxDKRVuKbiCNT4uX/OXqUN9qFlMYleYX9OI=;
        b=TrYtz7yRd1mN+CnddlkKnrpJXRAupbJx5/aLpy3P+3ywBrlGLDbcqpg1jEnGfvXRvk
         8/YDUskBwM6A/qOD4iGyXxvuMrbZund5W5bT5G8/0Rw8+WV45R7jZqLYHaDo9FmQy5qo
         nKeOJ+cGGKRXADlxqHJFzHFicOVnoZCqn/QZljyXGqJH9HMQdYjBaZJEdSfUaDEmXAqR
         6VFLui6vZMc9VtHiX3hDdkU2VQReWz2gLQuIClPi8woRpJRZJPr7ZxklvDA2IB/2EKK5
         6ruAd7s7GiiAGbgGpB+HJw2VUJV/vB9MPZe5TtKZNdaZ5Hcb0NkSUjDih+AZDVDUq93m
         hLPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKfANBcfIjvlvVpcYqcJ2nb/WSjnjvc9RkuhcAh2LJcv9K0P146DxZ1zOuIky+mJ5jzLy20fZS3Av0NWsoVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlZ+CNbWypcuLgKnzCreaIbj59O/dx8RQOi2saTy7IuOvv+YTP
	qyZwGyw2dnImI8/wKT8Qnxy/HJZ59MG8rKDCHA141492YoW7JiDcuJ4arB3ehUDDuKnV1SO8pmZ
	DRF+xvkYRnKeZWNX23cSLJ/czbXn/UpseFcHeudWM
X-Gm-Gg: ATEYQzybPPVZSBIyWgh5NOjxy153o9mhltvpRvXy8Pyee5bj9MPXLLr6mPdc5QJqDiu
	zzIeG/VKQlMXKuq3PkhCVMEV92mSbf3X1eXuRdG234S0ajEvUIwa7ejbeOzZuiMhdQPeVW3Ubfm
	v6xgoew2nQqlvqgKQS5tL9TRaTFO+g4Dxb8ti8iAg87BUJIiUHNsjvAGHPDrbvxUALu4n7pgq5o
	y0tc9fBgXXgSQ3a+XE1EH00qiOjU4jfdebVw6Orqp3c1Nu3EQcJ2inftyFSDhr9OQyN/RuTajal
	XhDxITwTZ24pNBiARxNKTXZ8WI/5B8UAO6zmldFKgt/4IGAml/kMFQ1KFj14b0qzXorSog==
X-Received: by 2002:a05:6000:18a6:b0:439:d73d:95e with SMTP id
 ffacd0b85a97d-43a04da8191mr6114695f8f.27.1773401219803; Fri, 13 Mar 2026
 04:26:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313091646.16938-1-work@onurozkan.dev> <abPeUBWpTB3mQRQs@google.com>
 <20260313141228.36ad6e43@nimda>
In-Reply-To: <20260313141228.36ad6e43@nimda>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Mar 2026 12:26:47 +0100
X-Gm-Features: AaiRm50G5PW7f-JOBV2MdV0GNAwCIyaeaW1Vc_JgUVMxQ2LNOQ5DdcEHR8VhrHE
Message-ID: <CAH5fLgiDvCaK7xu+R-cr8Cp8ABK0=xSQxXAJxKhSLRhtjH4fpQ@mail.gmail.com>
Subject: Re: [PATCH v1 RESEND 0/4] drm/tyr: implement GPU reset API
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 12:12=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.de=
v> wrote:
>
> On Fri, 13 Mar 2026 09:52:16 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Fri, Mar 13, 2026 at 12:16:40PM +0300, Onur =C3=96zkan wrote:
> > > This series adds GPU reset handling support for Tyr in a new module
> > > drivers/gpu/drm/tyr/driver.rs which encapsulates the low-level reset
> > > controller internals and exposes a ResetHandle API to the driver.
> > >
> > > The reset module owns reset state, queueing and execution ordering
> > > through OrderedQueue and handles duplicate/concurrent reset requests
> > > with a pending flag.
> > >
> > > Apart from the reset module, the first 3 patches:
> > >
> > > - Fixes a potential reset-complete stale state bug by clearing
> > > completed state before doing soft reset.
> > > - Adds Work::disable_sync() (wrapper of
> > > bindings::disable_work_sync).
> > > - Adds OrderedQueue support.
> > >
> > > Runtime tested on hardware by Deborah Brouwer (see [1]) and myself.
> > >
> > > [1]:
> > > https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/63#not=
e_3364131
> > >
> > > Link: https://gitlab.freedesktop.org/panfrost/linux/-/issues/28
> > > ---
> > >
> > > Onur =C3=96zkan (4):
> > >   drm/tyr: clear reset IRQ before soft reset
> > >   rust: add Work::disable_sync
> > >   rust: add ordered workqueue wrapper
> >
> > I actually added ordered workqueue support here:
> > https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c351c38f=
@google.com/
> >
> > Alice
>
> That's cool. I guess this will wait until your patch lands unless we
> want to combine them into a single series.

You can just say in your cover letter that your series depends on mine.

Alice
