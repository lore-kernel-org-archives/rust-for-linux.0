Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9762EA739
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753194613; cv=none; b=kb5o3H7w18WmSkaL9uyHt06aQyG7dpu7F5pm79SqQ7uezI6en2cEIf6zBzpoDcVX+X7qfCe2VkCurNQs+JwMJbEyRM8Yu85YMX7mMBYw/3tWvMyOAGxVireSZO7eyha1q/hZf7sPe5zIJbUMIEnkIpmIBo5ewXWk4Xn9lPa9ldY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753194613; c=relaxed/simple;
	bh=p7mRw0ExDuhcHRwUscU2zY43D+jma4R5i0QM1Sy7Cok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVG3u7r0MWHDvMTYR6W7hqVYDyQBhWI/2Hmn9cfydkTzvZIqebmwulGqaYsLV+pxdvYQbkjVmeVaBLokLlZR5/JZ0XdMmjoLkTZ2xfCfmlUjtYN55uMnC969quzYKDb7AvDLuwwiiO8FHizvRrfNq3fpmm7zmfEueSjJvZZkr5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=JWRNp8dS; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="JWRNp8dS"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b3bdab4bf19so4250106a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1753194610; x=1753799410; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8DedHc8U3sGS0hetHRKcucqLT47kGDJbYOpKzUGUwhI=;
        b=JWRNp8dSwOtl7MxJfBclJ4D/Mi/sBT39Jbjf9bfv409NrzDJf3ZgTUxWVFOE+/vTDV
         StBykTY8eBHagQ8566j3fKVFjIANSCaWUVMgBifZ7wW55FUgtcMmtYTrZv6boyDpOm0Z
         RM8B8SDIDqywPX3HldTKn0sDeu9aqoLl9blMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753194610; x=1753799410;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DedHc8U3sGS0hetHRKcucqLT47kGDJbYOpKzUGUwhI=;
        b=qXchz7sPzcWW4tb+btBJsFJ4ZcP6NGpcpQtQyNce9zYFEfGjP8IAGv22GqBdCrhg43
         bFSGTYncf/YPrI+RZ9w7KVIGR0t1w/z5bj9QP9hP9nOgPjAeHIxQCxpH0aa3sfkro/u/
         kzSPqZfPUAIsnzAOCGmHVwweRCimFYRKYklPM4L0YpP6potqkhlN2E8iagPooPvfCYsX
         PtN41jtCiMWQKvgwgnYESDwgY8Y0uQ+KCqYOXF8a/5XZWRMC3/v7W4JM1loa5fP58x3s
         W5hZhMAbaNlkcA0UKIvu3EAq1uXPvdJhSPA26KdUBJ6tTNkRdABYVhCFnSaOeIh1Td+t
         Wl3g==
X-Forwarded-Encrypted: i=1; AJvYcCX1FcIM6/Bv0YNTPJqdBxhuZGX7+JtBlfjUH5cKX5KOyuQEjzQBqwCZGGOQhBE0C5URiAIDLMU7hFrvaOORvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMYL7ddwk3WKrqg124BDopbxuRz/gtkz0EBOpph0tKr76uG03J
	7hxdRMfhFlSUfEGdQ3fuzRZ+Afc21BpobnZgBdbdjYpO6VoMh8fzszTGxu7m6huS4gk=
X-Gm-Gg: ASbGncvA1wxcUQmV/w9XQc7HVVUMrgsB47xHDkzi5CTqjHuFecXnTufHr26HYuuGSH9
	oZEecN2Jl2qKgVB2vA0aztX/hOC0ULcfruEVWlw2KJMSLta+M0zEABdnBix11nAs6zV7UMN8r/k
	dzM8PfPIm9E52sZbl0YzShfvwMBzDsXSObc0BdYHm/E8tsJ5o/ha2IieUP+n0vUlvxn4ZCrHnq8
	/DFdVbBn53t27oIfByekCL5LAuYVl2raIpj6Lr7nWxTVImf5bobEW/vbdn1qnP5D4FpgqJycFm1
	IcdBxID45nKyysfv2+qjfx5Z6yVNCTvZHKWaUX0VtnwsUR0XpuMsgw+EQYgclNPKcPAUts29Uu5
	Z1kfLHymvYHPtqLlTenWEYJsg/n5RjNr72fAk64+qZQbGAhDtJwBEHYqJXoY=
X-Google-Smtp-Source: AGHT+IFPEQ8MNFfHaXUFgjDu3vJ32lBL2IqvUMLNtxAsQckcMo5/PtrbE2PCJLBx72Rm2QMrsmcvfw==
X-Received: by 2002:a17:90b:180f:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-31c9e6fb9b9mr37249807a91.8.1753194610250;
        Tue, 22 Jul 2025 07:30:10 -0700 (PDT)
Received: from sidongui-MacBookPro.local ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29ddcbsm12216798a91.36.2025.07.22.07.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 07:30:09 -0700 (PDT)
Date: Tue, 22 Jul 2025 23:30:03 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Benno Lossin <lossin@kernel.org>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Subject: Re: [PATCH 2/4] rust: io_uring: introduce rust abstraction for
 io-uring cmd
Message-ID: <aH-ga6WdOpkbRK3T@sidongui-MacBookPro.local>
References: <20250719143358.22363-1-sidong.yang@furiosa.ai>
 <20250719143358.22363-3-sidong.yang@furiosa.ai>
 <CADUfDZoBrnDpnTOxiDq6pBkctJ3NDJq7Wcqm2pUu_ooqMy8yyw@mail.gmail.com>
 <aH3OsKD6l18pLG92@sidongui-MacBookPro.local>
 <CADUfDZrLKrf6evTXQ03cJ1W4kj0gxsF9Bopu+i2SjkBObXKnMA@mail.gmail.com>
 <aH5g-Q_hu6neI5em@sidongui-MacBookPro.local>
 <DBHVI5WDLCY3.33K0F1UAJSHPK@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DBHVI5WDLCY3.33K0F1UAJSHPK@kernel.org>

On Mon, Jul 21, 2025 at 06:28:09PM +0200, Benno Lossin wrote:
> On Mon Jul 21, 2025 at 5:47 PM CEST, Sidong Yang wrote:
> > On Mon, Jul 21, 2025 at 11:04:31AM -0400, Caleb Sander Mateos wrote:
> >> On Mon, Jul 21, 2025 at 1:23 AM Sidong Yang <sidong.yang@furiosa.ai> wrote:
> >> > On Sun, Jul 20, 2025 at 03:10:28PM -0400, Caleb Sander Mateos wrote:
> >> > > On Sat, Jul 19, 2025 at 10:34 AM Sidong Yang <sidong.yang@furiosa.ai> wrote:
> >> > > > +    }
> >> > > > +
> >> > > > +    // Called by consumers of io_uring_cmd, if they originally returned -EIOCBQUEUED upon receiving the command
> >> > > > +    #[inline]
> >> > > > +    pub fn done(self, ret: isize, res2: u64, issue_flags: u32) {
> >> > >
> >> > > I don't think it's safe to move io_uring_cmd. io_uring_cmd_done(), for
> >> > > example, calls cmd_to_io_kiocb() to turn struct io_uring_cmd *ioucmd
> >> > > into struct io_kiocb *req via a pointer cast. And struct io_kiocb's
> >> > > definitely need to be pinned in memory. For example,
> >> > > io_req_normal_work_add() inserts the struct io_kiocb into a linked
> >> > > list. Probably some sort of pinning is necessary for IoUringCmd.
> >> >
> >> > Understood, Normally the users wouldn't create IoUringCmd than use borrowed cmd
> >> > in uring_cmd() callback. How about change to &mut self and also uring_cmd provides
> >> > &mut IoUringCmd for arg.
> >> 
> >> I'm still a little worried about exposing &mut IoUringCmd without
> >> pinning. It would allow swapping the fields of two IoUringCmd's (and
> >> therefore struct io_uring_cmd's), for example. If a struct
> >> io_uring_cmd belongs to a struct io_kiocb linked into task_list,
> >> swapping it with another struct io_uring_cmd would result in
> >> io_uring_cmd_work() being invoked on the wrong struct io_uring_cmd.
> >> Maybe it would be okay if IoUringCmd had an invariant that the struct
> >> io_uring_cmd is not on the task work list. But I would feel safer with
> >> using Pin<&mut IoUringCmd>. I don't have much experience with Rust in
> >> the kernel, though, so I would welcome other opinions.
> >
> > I've thought about this deeply. You're right. exposing &mut without
> > pinning make it unsafe.
> 
> > User also can make *mut and memmove to anywhere without unsafe block.
> 
> How so? Using `*mut T` always needs unsafe.

You're right. Please forget about this.
> 
> > It's safest to get NonNull from from_raw and it returns
> > Pin<&mut IoUringCmd>.
> 
> I don't think you need `NonNull<T>`.

NonNull<T> gurantees that it's not null. It could be also dangling but it's
safer than *mut T. Could you tell me why I don't need it?

> 
> > from_raw() name is weird. it should be from_nonnnull()? Also, done()
> > would get Pin<&mut Self>.
> 
> That sounds reasonable.
> 
> Are you certain that it's an exclusive reference?

As far as I know, yes.

Thanks,
Sidong
> 
> ---
> Cheers,
> Benno
