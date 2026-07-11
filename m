Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54B03932FC
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 10:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783766548; cv=pass; b=ranpRkDxg3aYan/8xW+YmqXUGIVc+Ez3KbJjKla/3OqhPXQg7d4lMHpdsQY9X/jok3angKpbrVo7Z3Uiwc7f59mDAyE6axOvOZ3ppMd+18MNpzpiFoJ0KY4WrLPpNvAlbYuDzd5b6ysVVzA2li6E36D4NewYv6FW4UDm4Wo6NgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783766548; c=relaxed/simple;
	bh=ZK9WeG3J9uEPNTxat5hyh2FKzwExrGft5Eo1ADNBVRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CDMyeADvqrGcmOkGZRVGCJv68+7Mk+KvTyHhGN06icA3ZL7HlzXqfpa4ERuPUjghp9PyuRHbclAwFxPsoPOYr+lKguAvgwah8pDyiRJu1s088NlBDX/9YunFC2c7nsWu7PLWvsYSxwFWJFO+KIzVl4rj6ZvrM1Z5k9o4m72Ot74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eD3Knpvb; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eD3Knpvb"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47def004ba8so198103f8f.0
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 03:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783766544; cv=none;
        d=google.com; s=arc-20260327;
        b=M0eZUqO9oxa309Nr8Fp5QjYXgeYD6s7r63tp9rrNHspKOf1ptBE81wYHn+GuMCTM9+
         CRUtV1jiYLYcZeathFJ/udkz0OKMSNNi94qS5zQiLltUIWwiOvZpmpVeMtsr1gS+Bz9z
         yUGS9w39cixaEm8MC6feFayqtXaHqPrRmD7EQiMW1iA8A5E9sRGg8j+YngiZ6HhtD7Lc
         J5Gikd/WabCWlKDkpWjzgC5CvhcK5hP3R4CmPHg4QqGkD8X8BJOP3qz4rTbgTtLDIO3x
         YUA/2XJKNLsxUFrfK9XpxucrD1coayFCVa+YJNcC0IXQzm5R7R06P7G00eS3FXihaTJm
         lF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oqGxORgBGNlD8LL7UvYs/8QG/oPlZjaTxntXt4g1KlM=;
        fh=K0hEWOzlRqwo5gEGm9UAVvssmoVE43SnVZkaWaGDFTo=;
        b=MPNbSTsAGkyjciGtc7CEKTaJCtJ8L0a6HkH03inj+4orL3EBk2RCE/ucrwTa2PD5FN
         DxPAyIGTTX5Rx90+xSk+hs5N52k8uDUg1url5xCDa30YYlrD/bvE49wu5vqtoKHNS0RF
         sJC41/eXmh8YYMbk/sfRnlPW9XyN8zswAjSL6AtPOBV49Ia76oWIuF4t30e6qhGvJkXd
         jx5hXd/LWqPSW9kWnauvzVUBQmijHGocuuQN/405CR8WGvmflY/AQ3WAViIjo4g8usxV
         sWIvUyMb34B10DuO7x9nojQessSreYjX6unPiPvf3RbyTovexkONXzfj13j9n0REXl23
         06FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783766544; x=1784371344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oqGxORgBGNlD8LL7UvYs/8QG/oPlZjaTxntXt4g1KlM=;
        b=eD3KnpvbT8iw9sJRc5/elRCJkbJK+kZSgkxjedDef6z21PtbEWXKNPNkP5af/bGVVy
         nXaspd6S/FdgxHwK10hx7G5xcFPM5IXgE+MZ7851XSyWTiB5P5MuhehtTJPM9nPE01sq
         SKz/f5dmRjKRg9nN+RnvSoUQ6N3FJk7Me5yzbRRPqW50VHrgAjlfmzeTbojZcnksMc3s
         cZmxbnWveB8jGRowBHf3xTs3Fog3Dvjfk8ji9gS/dxJnEzaSETgRchJ5KaA2jfbPbEOt
         ju/3bSJ+V3njJ9sCNaUWCYXGatdcZiDFPul77GNyOA0/JdLOrjY6/skKgTnqrW7Pw6eB
         FdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783766544; x=1784371344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqGxORgBGNlD8LL7UvYs/8QG/oPlZjaTxntXt4g1KlM=;
        b=dB+OyvB31gDybcYbrHT8jFzcVf0zYPhvP2SVT+SMaoplJsna46gQu3y0OXgMBjNFFG
         LdALmcseYrwN4nBwJYPUTOieyXBan4bPkP7dhvOKnWMuPq8Fn9J85p3mWkLr7mG0JDHz
         l1evvhAaxRDTJaeziwXA8UloREYXzz+7nMW2S/SLLi1ZZ4Ph/NfND5968MirT1OqEkXd
         xHWnlVeg/9uXOIuyWYVywTbr05535eJidR6F2LZNFNoC0aszGhJdEScxcCBjO5Lo7Dls
         UkOY2+VN5b5Z0pG/zzlCkVUPLC+daFEAyfvI+04knWLxT/q0QhxKXpI3ywvmBsy7ey/9
         iZCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdBjoaZ74LaBMBr8bCCFpSrsOddfq9QRAq60QC4XNw4etT2ribjF1dHQkxoVpceAHqLoyNMVujtwRYVn+f3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9DK+mOUGAkfyltD+P0nmN+UYN5HSquwB0GnP7fhIuKhPLn/pf
	eJQQec8174HHdKbxCWS+kpqM2xcebGj6JbW3LLR0pkBOZkFttfpuSeffUYmUC7gYIqHfnHREctI
	pD4WZBuU7NiA6iO4eEH02oKfKFFeSAPA5Nh2KCeI4
X-Gm-Gg: AfdE7cmEC3jaPBMtDzjZgtomQgQxf0St+x4Md0U6T4kYE2nLALim4QDQMn9dnRmdo9B
	QNkwHhtjjxxCFlAygTwQzrxafQcjIFTv5pkOOXx6EyHcRwtZZg3Iuov1TQDRkcp1IWkZOREz5eQ
	rN+8UA0taB1hilKE/AzTZiqHIOvdPfPqs24CMs0i/EHXzFmJLsfrjj4ogTy/lKuZRj6K91jjptu
	DABKYp0PqohYnfchGc+Am6+SsDRfsUvfqCURlCJZ+AggohR8LXMbPE8d4gNCFdpEOKULSrnxCmS
	nN2bqjvltbTzvCUrTs6AdOOB7Rg=
X-Received: by 2002:a05:6000:41fb:b0:47d:ec60:658e with SMTP id
 ffacd0b85a97d-47f2dc96134mr2326312f8f.25.1783766543772; Sat, 11 Jul 2026
 03:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
 <2026071046-musty-subfloor-53ec@gregkh> <CA+ba3EP9PO3ccBu1VK53WeR_2cT9MaGC_5dPcy9QKnvHBXX5fA@mail.gmail.com>
In-Reply-To: <CA+ba3EP9PO3ccBu1VK53WeR_2cT9MaGC_5dPcy9QKnvHBXX5fA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 11 Jul 2026 12:42:11 +0200
X-Gm-Features: AUfX_mw68Rh4128jI6TPB-0at46Ehu9ADaKDHQGsuo4C6t65HU7RmVBUkDYM-2Q
Message-ID: <CAH5fLghOSPYA+uYmUB18VfPhc9PtDWaH0Khc=7EAN7DQt=8L4w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] rust_binder : Implement dynamic debug logging mask
To: Jahnavi Nitheesha Mandava <jahnavimn@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 12:29=E2=80=AFPM Jahnavi Nitheesha Mandava
<jahnavimn@google.com> wrote:
>
> On Fri, Jul 10, 2026 at 8:31=E2=80=AFPM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Jul 10, 2026 at 02:32:51PM +0000, Jahnavi MN via B4 Relay wrote=
:
> > > When a user-space application sends malformed data or makes a
> > > lifecycle mistake, the driver rejects it with a generic error code
> > > (like -EINVAL). Without internal logs, the driver acts as a
> > > "black box," forcing developers to guess which check failed.
> > >
> > > In the legacy C Binder driver, this issue is solved using a dynamic
> > > debug_mask module parameter that toggles verbose logs for specific
> > > subsystems. This series brings the same critical capability to the
> > > Rust Binder driver to provide developers with clear, real-time
> > > feedback.
> > >
> > > Instead of rebuilds, reboots, or guessing:
> > > - Developers can enable logs instantly on a running device by writing=
 to
> > >   `/sys/module/rust_binder/parameters/debug_mask`.
> > > - It prints the exact reason for failures (such as alignment errors,
> > >   mismatched call stacks, or invalid handle references) directly into
> > >   `dmesg`, reducing debugging time from hours to seconds.
> > > - It protects system logs by keeping logging off by default and only
> > >   enabling it when developers are actively troubleshooting.
> > >
> > > Based on top of:
> > > https://lore.kernel.org/rust-for-linux/20260707-upgrade-poll-v6-0-4b8=
fae7bf1d9@google.com/
> > >
> > > Signed-off-by: Jahnavi MN <jahnavimn@google.com>
> >
> > Patches 5 and 7 did not apply to my tree, can you rebase against the
> > char-misc-testing branch and send just those?  Other ones are now all
> > queued up, nice work!
> >
> > thanks,
> >
> > greg k-h
>
> Hi Greg,
>
> Thanks! I will rebase and resubmit only patches 5 and 7 as a new
> version (v3) of this series shortly.
>
> Regarding the feedback I received on Patch 1 (using the BIT macro
> and Atomic<u32>), since Patch 1 is already queued, I will send those
> cleanups as a separate, follow-up patch. Does that sound good?

Since it's only queued in char-misc-testing and not char-misc-next, I
don't think it's too late to change the patches themselves. So I guess
you could also resend the entire series based on top of commit
f8d269390cd2 ("rust_binder: update Process::node_refs to use
SpinLock") from testing?

Alice
