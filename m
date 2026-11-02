Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599357;
	b=H1TEPYN4MHYbx8O5nFUIjtrFbOn198bBo7derzh5F/U/wDC3xvm2HHK3pQcsdzHrDGPB
	 t91UU7XndnJwMBaaykhby5o9bbWSPQkOMd9A0LS8UtM5R1nMiFI97ZIdxxiGRQ/Aglwe2
	 YQdENuVBsoJgJeaWu9/I1/tgX1eYBvMX4GXpG5zLBMVuB1IrUnlMeCE1nJmiyvh2RYq8Z
	 Kcai0S6wOql2uD7L67pmf0Tn4DeCDY7TGAC96IsAdK1F+UhM+h8zJl80Wmo2IZjPoZGoj
	 X2FNVYlqq3ejDu34VUQzqw5W7ICppz04fPzqzT0HHMI2rG/CIOgm6IPq5Zw5YYG0v/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599357;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type;
	bh=QVqvMqk4u+JlZzNJJ2w9X65onVE+yQ82LguoHb35TXU=;
	b=v5PpNChK1+binfvJ9/GC1U2J+NRlBHz2KfE7bkNH0DAANHm9Raz5oCfm0uXRDHuGHrnq
	 FBski1R5KWNgRONovGYiveDX9GdzxAHkc9VT3G2bn5IDGiWaSQpkIE9S/0EhWQ+5WLgBe
	 CI0bNFJBfr9HEImmblr4ZmweKeAxm/s1PfOtRCWdLeo0ZbrXUHxEURU7iXJUJrCgRK0Uu
	 DkMpFbSt2QsYo2jBWFYBlUOAOtaHXr63QzrDNobvkNaNyIpogDTLftPKtCvjfFan4T/bB
	 mAFJTmhKFqJh9OXmSBGPsFZLR3eM9UiDI/5wwGPhV6BmbfSfIMlVqu3k002ms+WFiLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GkWIELgf;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CE8606A32C
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 06:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7CE8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GkWIELgf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793599355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QVqvMqk4u+JlZzNJJ2w9X65onVE+yQ82LguoHb35TXU=;
	b=GkWIELgfgUGhm6fevCENmN8rV9Il8w98LCXP2OxVVD1yiEBblLaJFj5dMYtMtneWayFkX5
	AcL+AQPuWLNPUM/U5SUUm1vKIxcwIAZLI3llKHNwclYib3jhhWrQta2wf1q8FTNnMn3mV6
	J5Fzd7NiJe8e/sxT3sQMll+vijo3/m0=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-wG2XdQrQNF-LBdvsBWOBCA-1; Mon, 02 Nov 2026 01:02:34 -0500
X-MC-Unique: wG2XdQrQNF-LBdvsBWOBCA-1
X-Mimecast-MFC-AGG-ID: wG2XdQrQNF-LBdvsBWOBCA_1793599353
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so4442841eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Nov 2026 22:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793599353; x=1794204153;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QVqvMqk4u+JlZzNJJ2w9X65onVE+yQ82LguoHb35TXU=;
        b=qSmV6sY23ZoQLJZD7eJhKvBsuiw9vQFG2ROXvoupl/GhatWv4G3tcwC+a/gOMX4GZu
         hTt9UHa6cw7vjLM0J0WoHUtUAZfNv9ctLSm8G+0xsoI4BrxOuIvNvoG+yHXf+lvvQiDU
         HaitPgZu8Io30QOt8+7z3Qid3+LWYaqsqTapjvQZebpymQ9Dpq5GIfBJ3RJUJvgYGaMA
         3V0LAtntYhTDpXcCsgB6oSreKJUPcdC+tVSPZrTyjwakgmSI9Q8kjWQP1i1RJWUUwaqw
         QGmM0nW+xRryftR0o3PakJC+VIf2vw/nYgPkYHnx9eU7YzR0YWYYd1twUTxfLSX0GNho
         iZgA==
X-Forwarded-Encrypted: i=1; AKwUvBwv+WS/fM+SM/d7ftSEaAOPOzC/27zkZzI/L/JVDCCUr2lZpusW/67GOwjHMBRS2XYbBEH9uFv3RkORa/Zamw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK+wijdTNoB8j/aPMutLUYEgWNalhJEz8SO/kEl/pN62FE2r0rP
	55DyyCD0JsQqd6sdE46efJa8eThBhFrc/c15p+7cixrjJVKbE8qKV5qjXYEifWYPEKsqKViLF8g
	i8oulAFKd0BrImlvmL90dhzzJ7nxezCL/nCnnJEmQOA7PZFOr/aBbonNzLvqtmonrFPewvyypXv
	zC4HPYhCfpreI1hsR6n7PM8G2Lv7+O/1eqMLDFOb7NddY=
X-Gm-Gg: AYBFou2CvOw6S5TLaPiOSd0Lxv5YuVQAGcnOGAupwBkZOqK5Q3uok/rs8Uy+8D5hFt9
	cYvGEYnnvwKgq2X3BNp6qntkUnrJK0MuBSnCswpxXkn3W2wgtIPBbg5CEflGcPJeZDc01p9gudG
	UpmDVbq48ZrFkUTRukl/BW+oyfg2KNG7zNGBYd6Q8rpfXZm2/poc35FoWT3AGI5fUdWFWrVQygo
	Ydfd4AmW3CAlwvI
X-Received: by 2002:a05:7022:f903:b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1ac56d94becmr14324043c88.4.1793599353114;
        Sun, 01 Nov 2026 22:02:33 -0800 (PST)
X-Received: by 2002:a05:7022:f903:b0:143:3c9f:10a6 with SMTP id
 a92af1059eb24-1ac56d94becmr14324025c88.4.1793599352617; Sun, 01 Nov 2026
 22:02:32 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-drm-rust-next-v1-0-14a4ae469175@redhat.com>
 <20261026-drm-rust-next-v1-2-14a4ae469175@redhat.com> <DMERUEZT5R3O.2K65JB1FXYVR4@kernel.org>
In-Reply-To: <DMERUEZT5R3O.2K65JB1FXYVR4@kernel.org>
From: David Airlie <airlied@redhat.com>
Date: Mon, 2 Nov 2026 16:02:21 +1000
X-Gm-Features: AclHuK9LHWn1BebolAfE1FBkDldbsia4yVg1MKh18rCBAaEY3IqcLaZpvevtFHY
Message-ID: <CAMwc25pKs4jT63Ai2hE7qLu4kQfsf6h86EE3CbTB86hU6gjtXg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpu: nova-core: add support for GPU timer block.
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Lyude Paul <lyude@redhat.com>, 
	Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E9eAzUuta-UqgPVOl1u9R8zyiwQKn0Hewe73eQwlME8_1793599353
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

> > +#[pin_data]
>
> Why is this #[pin_data]?

cut-n-paste fail.
>
> > +pub(crate) struct Timer {
> > +    chipset: Chipset,
>
> Why does this carry the Chipset?

indeed don't need it.
>
> > +    sys_timer_offset_ns: i64,
> > +}
>
> More generally, what's the purpose of this struct? What does it represent?
>
> Nothing seems to tie this object to a particular GPU or prevents constructing
> multiple instances for the same GPU.
>
> It also doesn't seem to provide any access to the underlying HAL's functions?

At the moment this object has one job to store the 64-bit value from
when we init the timer to give it to GSP. Do we need an object for
that, I'm not sure, but handing around a 64-bit value
sys_timer_offset_ns seems a bit raw, and there may be some time in the
future we need to add more timer stuff.

>
> > +impl Timer {
> > +    pub(crate) fn new(bar: Bar0<'_>, chipset: Chipset) -> Result<Self> {
> > +        Ok(Self {
> > +            chipset,
> > +            sys_timer_offset_ns: hal::timer_hal(chipset).init(chipset, bar)?,
> > +        })
> > +    }
> > +
> > +    #[expect(dead_code)]
> > +    pub(crate) fn sys_timer_offset_ns(&self) -> i64 {
> > +        self.sys_timer_offset_ns
> > +    }
>
> What do we need this method for?

This just gets the offset value, I've added a comment on where this
value needs to end up once more GspInit is done.
>
> > +}
> > +
> > +pub(crate) fn get_cpu_time_ns() -> i64 {
> > +    Instant::<Monotonic>::now().as_nanos()
> > +}
>
> I don't think this helper adds much value, let's just make users call
> Instant::<Monotonic>::now().as_nanos() themselves.

Done.

Will be sending v2 soon.

Dave.

