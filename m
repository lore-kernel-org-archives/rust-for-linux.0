Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AA52F8BDC
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Sep 2025 10:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756808592; cv=none; b=I394GG4seo47zbFt1KZnK3gwex/7oduBQ71OGIxOaK1S3mML8g7mG+SN8D19sW895jSwdP1h/PnOKnj7gzHdrVtXBmy9CVpjYB0K+3rWk7z+KmVAlrKJi/3pN5of+b7gTIUGzu/20dEzIH6/ADc8oOSHLoK79MVCliQh+VU2dao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756808592; c=relaxed/simple;
	bh=ak6o9wfTp5ryXXDPf6XC/P1UWDMbG95VtmT3E3nrYhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoVvc7S0upg88ACDXEsmBjy3jfcHSl87v8USCdeNbB697cBanLKp/3gJwr/tXeB5GsV0Q6rlKKKhSeUvQ33DK6wyUra4/MSmTmedqu9bAgEf4pphzProIJUUnT8xYBmTBN12LjgI1dVfqX5vsi496hdvH3JROQNS/mJOu/5IDiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=NnJ2AwpV; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="NnJ2AwpV"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32b02d88d80so44507a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Sep 2025 03:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1756808590; x=1757413390; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FiTS8gxM3M1BxU9qGDpyd7c4JddJzb5cIrv8kDeiKxU=;
        b=NnJ2AwpVAacprqgWWfpyHRoGiTuDLZQ4hjcTP9xeOhVaq1eYPuSXsBM3uvohyNsVOv
         8FiN2/pICcS06DijmGpYMNy+yq/7E3aMfASCAsNkfnT+vijtwJxr2/n0djHgtBIny/TX
         RPVLZeH08g0qdNLluDlRZLLBibZ2+tILMnEXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756808590; x=1757413390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FiTS8gxM3M1BxU9qGDpyd7c4JddJzb5cIrv8kDeiKxU=;
        b=vY5wXhbnd7kW8g5gZsIYfVdW0GP5QXscOvexjVHLQDkYUnnbunWcCjC686y5NA4oSC
         gNocoH+eSlyXmU/qDWj4nmDx0mv4aR6NsU5uSKa1EiBQp+N+t0lAsRGP02YxVQXsiG/c
         jlOzyqwhGrqfeh1HDtIcJYycQelAcC/+4qHMbT0mctYgaSw6NTtsjs68JaqL8aRGXVfx
         cWb/QMX3oZKt6lEtCDO5i0YmBNbXPBjqS92NmwO0ecKQU2+C/AoheTGLA/WlMe1pB9YM
         Nu7Oq/AS9k6dTuCOd6PZWa/xIJFvxpm1sv1Z1vyH3mOdNB3QHUvTGnLvmwvbHVFiE1Ew
         r1/g==
X-Forwarded-Encrypted: i=1; AJvYcCW2spXmsCZb1u2n9UpZ3dhk0JbL09ho7hGPIlSdis/CQu6hdcLEcfR4KE8eDCP6tulkeH52Y5JvpQusYwMZbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi2jieb7ZHVY6HLfb0ibwh0C09u/47QgU4sSdfiJojJvnUVO2D
	Cav8SGdV5LJJmhu7BIKGYa8FxRRMVUhHFHfMIxi+OemD5hXuRLAeT6g0jYtm76A2ANQ=
X-Gm-Gg: ASbGncu3myj2UZr0lp5QM4a4fNMLqXIY4sncTftHIPDw5rJxJ2gFCfFK2NqsFETlw5c
	PeVc/9sTTZdhBLyKBmP96Ms0eHE5UCh6SuJgr2KNi+6VGU+Xn4y3E1rm7IZwO2ikqJ+SzTZWYFj
	oynDHQUsHXhXRRy7Voo5hDuKhF4e2HEK5/E5KIjbBBuQT5y2X0yRw23BKg9WPbR1KkcQ0HJhWI5
	FyIeD0lzbPuvsCibbXE1asaATtRS6UkM7J15huyvauobl22ylLpwL8+AQypX2DKCVzL6T4yc8kW
	aphgOP6V1FZPo3xyGAok3Ck6qYBwUYNEiJHij/kdf5okgO1xjFcFXviDCjTgxah+qZr9Bxaj78h
	UEo890BovUeASaZ1R+phghxX31f8wR9UpPn8ri6n5KXonpTHtuICsNfE6kF09wbBJ
X-Google-Smtp-Source: AGHT+IGWCmV4r/pIo/9Wk0+jYQ9MaFKAPcMCdaaijBHwrZWR32/Er3eKPO5sjeX9rGf22Y8ZIdV76Q==
X-Received: by 2002:a17:90b:3d48:b0:321:cf49:2c04 with SMTP id 98e67ed59e1d1-32815433803mr14753274a91.9.1756808590452;
        Tue, 02 Sep 2025 03:23:10 -0700 (PDT)
Received: from sidongui-MacBookPro.local ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274572be3bsm12098423a91.2.2025.09.02.03.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 03:23:09 -0700 (PDT)
Date: Tue, 2 Sep 2025 19:23:04 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/5] io_uring/cmd: zero-init pdu in
 io_uring_cmd_prep() to avoid UB
Message-ID: <aLbFiChBnTNLBAyV@sidongui-MacBookPro.local>
References: <20250822125555.8620-1-sidong.yang@furiosa.ai>
 <20250822125555.8620-3-sidong.yang@furiosa.ai>
 <CADUfDZpsePAbEON_90frzrPCPBt-a=1sW2Q=i8BGS=+tZhudFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADUfDZpsePAbEON_90frzrPCPBt-a=1sW2Q=i8BGS=+tZhudFA@mail.gmail.com>

On Mon, Sep 01, 2025 at 05:34:28PM -0700, Caleb Sander Mateos wrote:
> On Fri, Aug 22, 2025 at 5:56 AM Sidong Yang <sidong.yang@furiosa.ai> wrote:
> >
> > The pdu field in io_uring_cmd may contain stale data when a request
> > object is recycled from the slab cache. Accessing uninitialized or
> > garbage memory can lead to undefined behavior in users of the pdu.
> >
> > Ensure the pdu buffer is cleared during io_uring_cmd_prep() so that
> > each command starts from a well-defined state. This avoids exposing
> > uninitialized memory and prevents potential misinterpretation of data
> > from previous requests.
> >
> > No functional change is intended other than guaranteeing that pdu is
> > always zero-initialized before use.
> >
> > Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> > ---
> >  io_uring/uring_cmd.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
> > index 053bac89b6c0..2492525d4e43 100644
> > --- a/io_uring/uring_cmd.c
> > +++ b/io_uring/uring_cmd.c
> > @@ -203,6 +203,7 @@ int io_uring_cmd_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
> >         if (!ac)
> >                 return -ENOMEM;
> >         ioucmd->sqe = sqe;
> > +       memset(&ioucmd->pdu, 0, sizeof(ioucmd->pdu));
> 
> Adding this overhead to every existing uring_cmd() implementation is
> unfortunate. Could we instead track the initialized/uninitialized
> state by using different types on the Rust side? The io_uring_cmd
> could start as an IoUringCmd, where the PDU field is MaybeUninit,
> write_pdu<T>() could return a new IoUringCmdPdu<T> that guarantees the
> PDU has been initialized.

I've found a flag IORING_URING_CMD_REISSUE that we could initialize
the pdu. In uring_cmd callback, we can fill zero when it's not reissued.
But I don't know that we could call T::default() in miscdevice. If we
make IoUringCmdPdu<T>, MiscDevice also should be MiscDevice<T>.

How about assign a byte in pdu for checking initialized? In uring_cmd(),
We could set a byte flag that it's not initialized. And we could return
error that it's not initialized in read_pdu().

Thanks,
Sidong

> 
> Best,
> Caleb
> 
> >         return 0;
> >  }
> >
> > --
> > 2.43.0
> >
