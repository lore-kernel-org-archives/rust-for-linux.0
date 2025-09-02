Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B697C2E0917
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Sep 2025 15:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756827077; cv=none; b=ak1IZe5jlZhWkZvpnqMh5QJSjJrqEn9BBht9gek0TcMRcBY9zFS4iIYBZhQ7MW1cqDgJSDWY93KXgWNxP4MIhjtA/cZ3746oZ35opAdXYZf0vAUuZ55oeCoZzyIDprMRzK3YXdjfkxCJ2i/0bFT62AFoNYK+8KxHpUUf7W3LD0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756827077; c=relaxed/simple;
	bh=jBj+N/EIx366pIxKlDVWGntYHrjdw8xEwfU0BWbWz4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z52W5567oF4z30I3xO96gip6/CZAxo7EJZ8vtchh8x1FplMx1IG9QZbKI1bh3lOFcGGsf+Vid2gGMnf5jMHkl08zlCSPGIGqQu6rLcvYHyI+g4y0JbeT4zEJixrdEU1Aa3iRTomudQJf2On6YDM7pESl8EPsLKRoTSrZZkAxCuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Pe+im1Di; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Pe+im1Di"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61c78dc8b12so706966a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Sep 2025 08:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1756827073; x=1757431873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcK0Vupw08S0kwUSmWzaPvW7Lg7imOqYDDKVTQ4jI1I=;
        b=Pe+im1DiWe7i/uYAhCn57MA78AE5pdkV/T5W8CNyYznFF4lM2iTebm/fPCo8TU3wJD
         cRz6Bpm4/7qhZQMnb4qJzF6fSVjMvriJ/eCh9WTLC+yLuYFRb4p6fqEU/WTdhJRsT42P
         5L91y+bcK6phuQUqVvznNwdqPMzoCBiO+S/VqP5ojBX7SzHJJc6Yk11e5dniwU3Eh/xe
         3M/m0//Cz3uFKVACs8b+xJegRHtC2kpJMmllnwRNutQCR+afAaINirmwvr5S68OmybPt
         L+7oxiFsLLltM/xEsakBO7F3Ez7bu2Shtlo3SWuJz+BPsW1PqAjJhyMGqIPPNK8H4GM3
         HRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827073; x=1757431873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcK0Vupw08S0kwUSmWzaPvW7Lg7imOqYDDKVTQ4jI1I=;
        b=uT7RJHy2dtW3jFIN6tpXXA3lpP1sW+qG3G47GgJd0OcRSpZd1bYDQs9/3GFSgqQm8l
         NKDC7PjMWrVTf/Zc6cFaV0034/CnUqEjPJaGonRcQcXPpZB3KBJblUXwPTjV9MGluq0P
         D0iWPntUHMxYs3lZbIMX3PnpsaTwbbL1tGstW/xqdkIkAuxwS//fmORkAE79e1mHibO7
         +2dSsZP9Wu95+Jn/kPC716Hz88VQ8GWnKD5QnCemSQWbO/44lz0sYwto3z6G3owuwOex
         HfxAL8xEioAVWt8BxzMmW2wT02sUN0GLkbTk3V2hEDXjkGVa3jhG4P/pgwC+GYg25yKN
         LEdw==
X-Forwarded-Encrypted: i=1; AJvYcCXDvzUq965kB0AIHnUvvppkexXTQTJDmTx7FUzXg+wZy+xeMRJOOMj4jQiQ7NSe8qtRVLmiWHpPFO18jTzDRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFk6+mMYtiIygQm+2YFeArDWoHkmP1OR7pwWPNW6VAvdwKqPmW
	uZjKlg1d3car0KKv3nnJ9STMNR/RCzQihpr1nUE7NI7Wkfyj+dIHMF9nMBuV4lz/FcQSvfgDTHy
	hJyI4hNTM0VyZvQQY6iqHmYIEOKduNOPlqWeK9rkOTA==
X-Gm-Gg: ASbGncuuMtP2inSwOpV/IhOzhJ6bPmLHUI4Fxzp95Tm73qhwAmq/kgbS/h81EFFS6AV
	ab4Ns5GAb8nVYZNyNkyEpSA+wk60yNoziziKFJIWAb3DP09PvOoZuukxfQT9YUIiFpEoLdq02Em
	yL7oeZ4FGMPaObXg42XkYLVk0uh6+HYVVh7ee7UrfdIT+DR4OJJGq+B/8EI3kmpUFVZfhog8cqp
	PUoGSHpbfvAd7QtcweykA8=
X-Google-Smtp-Source: AGHT+IHfeh6Hqg2wuUr1T9ZIp5X19Sz1uiwreq0YZoqgSSMikAA7y1UBWPbvIhSjDISnUiui2xuROLxBU38/us5t+3Q=
X-Received: by 2002:a05:6402:35c5:b0:61c:879f:a62 with SMTP id
 4fb4d7f45d1cf-61d0d371418mr6643108a12.3.1756827072932; Tue, 02 Sep 2025
 08:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822125555.8620-1-sidong.yang@furiosa.ai> <20250822125555.8620-3-sidong.yang@furiosa.ai>
 <CADUfDZpsePAbEON_90frzrPCPBt-a=1sW2Q=i8BGS=+tZhudFA@mail.gmail.com> <aLbFiChBnTNLBAyV@sidongui-MacBookPro.local>
In-Reply-To: <aLbFiChBnTNLBAyV@sidongui-MacBookPro.local>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Tue, 2 Sep 2025 08:31:00 -0700
X-Gm-Features: Ac12FXyLeKYXslC_9H_jnXi5qlR1DyFMS0jUeRzwyKLc83sHnrpgjFW25z8GvmY
Message-ID: <CADUfDZpPvj3R7kzWC9bQVV0iuCBOnKsNUFn=B3ivf7De5wCB8g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/5] io_uring/cmd: zero-init pdu in
 io_uring_cmd_prep() to avoid UB
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Jens Axboe <axboe@kernel.dk>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 3:23=E2=80=AFAM Sidong Yang <sidong.yang@furiosa.ai>=
 wrote:
>
> On Mon, Sep 01, 2025 at 05:34:28PM -0700, Caleb Sander Mateos wrote:
> > On Fri, Aug 22, 2025 at 5:56=E2=80=AFAM Sidong Yang <sidong.yang@furios=
a.ai> wrote:
> > >
> > > The pdu field in io_uring_cmd may contain stale data when a request
> > > object is recycled from the slab cache. Accessing uninitialized or
> > > garbage memory can lead to undefined behavior in users of the pdu.
> > >
> > > Ensure the pdu buffer is cleared during io_uring_cmd_prep() so that
> > > each command starts from a well-defined state. This avoids exposing
> > > uninitialized memory and prevents potential misinterpretation of data
> > > from previous requests.
> > >
> > > No functional change is intended other than guaranteeing that pdu is
> > > always zero-initialized before use.
> > >
> > > Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> > > ---
> > >  io_uring/uring_cmd.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
> > > index 053bac89b6c0..2492525d4e43 100644
> > > --- a/io_uring/uring_cmd.c
> > > +++ b/io_uring/uring_cmd.c
> > > @@ -203,6 +203,7 @@ int io_uring_cmd_prep(struct io_kiocb *req, const=
 struct io_uring_sqe *sqe)
> > >         if (!ac)
> > >                 return -ENOMEM;
> > >         ioucmd->sqe =3D sqe;
> > > +       memset(&ioucmd->pdu, 0, sizeof(ioucmd->pdu));
> >
> > Adding this overhead to every existing uring_cmd() implementation is
> > unfortunate. Could we instead track the initialized/uninitialized
> > state by using different types on the Rust side? The io_uring_cmd
> > could start as an IoUringCmd, where the PDU field is MaybeUninit,
> > write_pdu<T>() could return a new IoUringCmdPdu<T> that guarantees the
> > PDU has been initialized.
>
> I've found a flag IORING_URING_CMD_REISSUE that we could initialize
> the pdu. In uring_cmd callback, we can fill zero when it's not reissued.
> But I don't know that we could call T::default() in miscdevice. If we
> make IoUringCmdPdu<T>, MiscDevice also should be MiscDevice<T>.
>
> How about assign a byte in pdu for checking initialized? In uring_cmd(),
> We could set a byte flag that it's not initialized. And we could return
> error that it's not initialized in read_pdu().

Could we do the zero-initialization (or T::default()) in
MiscdeviceVTable::uring_cmd() if the IORING_URING_CMD_REISSUE flag
isn't set (i.e. on the initial issue)? That way, we avoid any
performance penalty for the existing C uring_cmd() implementations.
I'm not quite sure what you mean by "assign a byte in pdu for checking
initialized".

Best,
Caleb
