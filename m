Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA406304BB3
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 11:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786699; cv=none; b=fwEzIroTSjAy/NEkZ6eReqvjJODAtOQdvAZjud005wTj70Iieu393HgjL1tGe74CcK7kmjZEIFHgyfaAbqFYtgUqlmwL3iKIIHvOjJzuokAcQrqwvRLd6GlJiuffOPXS9Q39r7aePG9+7bp0dBGTOIrtPre+jjm9MDCK0A57LXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786699; c=relaxed/simple;
	bh=idg6pyHKilZlHeXVaqALFwttDhgDixlpu8+RaFnMLXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meq4EHIQ2nyJcDQbiRsZ0Csn6ptz/oPptAIQzlfvkW872p4dVk2v2ovOte9bVPVg6T5nPkNRxScnwErhEA9bOurevI0MpLZaeDUOnlOQ7SAEX+NKrE1eXjGz51iHX/OX509M2IJ7RqbQHvncdyMTZHdwEsZLHlQEJ4ZKnZqRmD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9EuM6dO; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9EuM6dO"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8907ec50855so16734976d6.3
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 03:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767786697; x=1768391497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFhWg0yXknfBYjAjhY49eGT0he703gFuxz0J4Ryn4Hc=;
        b=j9EuM6dOjrhrYf0XNbUIy3yT+ZXTAszo1fBzDbTG840MZFDGxzx1I/BzndcI0g41Fj
         R/PjoR/PMYhAT1RWrGtnu0FRRvRon9/kZPGT6KyQJ1gDqpW4TIj3CLKRbFj7cjvLhqc6
         D3Qk9ToP46yZyg4wHTrpCyBTvgqSAKakfe65OiEBhviuDK1r38Wi/433N+O27H2PXo2G
         HXWJURICarfUwBoTDdC+Mwo846lRYHmnwNkUXiaGg9TrdliwJiAZNtWhmyYuxus/pnst
         Bbk6YTxUjvO+nR+DPlO7sLlT0CEyJ65JaBz4ITAcIO74Ah0MlbYZ9lMFqnVDm66AZqWT
         Z2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767786697; x=1768391497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eFhWg0yXknfBYjAjhY49eGT0he703gFuxz0J4Ryn4Hc=;
        b=Zs7JvCBOdbyDb0txVzGLpDOjEDsgktDJYsMCmezbCYSxk7bYQdimVGDyFKmND3UQz+
         BjTDK+wVFZjdWBgl/vFCPnQ4akgGcVw3ndaFy0TOaJPG3KdSLEYpwqa7Py2sDkSczr4v
         4RNCuGF0/W+ds9DgDHHZESkvPnA3Qoqdzrhg2GgpYJRr8mcPiqruupx9JHWpc4P/znnl
         0tG7uVCJjVxWwP8sQoxkDFy0sO7Ems6NnkF8rCmJHCxS5znd5+AcNXBajMkcdO8779dQ
         Ccdh9rKkdwYvGNoiG/J09Rcf2zZuHJrnr9vJg3axgYlmbWqtFx/dXg/vHOeNdnTN26L8
         +bpw==
X-Forwarded-Encrypted: i=1; AJvYcCVZvkezBU19zal97+vdqMajsuB4AylY0Ngtz+U+2OYMbiwODvI8ZTsNB4qhJIx2V0Nc/7AcLKcR9zNbKHaraw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6C7fnB3g7iyxq/HZHv0UZ76vNxIGbe2RvCKIvOAfYopbcMypM
	rI5BCTrh8ejbPfbj2Atj8c2rU4w6KEGozOO5wG82naxBjubzli69j4cQ
X-Gm-Gg: AY/fxX7flhZZLeAOs3mLXqKzyxy8A3whpKfuZcrsus23WO+QeJDCl9wAAzQodMsmd3b
	eXGRdDdXCdWU9zAo5Q4NkvgfjjhYNmBF1aCnbokyGGC8CZ/jrAUawZ3ZCI4WZE6ZudOprC+KNvI
	Av9VRNszeJRqdkNXE/aQLHCuA7YCW/1kOZr/7V0ItQNtuQ+CdtePM35vQ/QWMh6Jr2gBjBglbsw
	pndFcNk5DCR2WJylIRWwZen7xxQ3lu5+jzjXRfEhVLScfTZ8wu0gwcBjSJy71BOF+4t+yJSykZ2
	HycpoIxzFIOiu/Lj98rhldODXqjwmsx48U4hL0yeSmMiCDXHihh552WG05p6TQXvVhUm5zDOUQR
	mNUgobjT+0o2UM0GvSsiSzjD6ei2S/jGOvb0HeEHL0qJ3cPbrCx7qinHNVBXH1qI0af0MAlm9Qw
	M2veL2pGxzMYhed16i8/0MSRTcCKP2HKFAqBPTCqUzXruNgkfSaDh744Lakz/1rIApD4dRlqF9w
	FuJ4nn56B8j/8YxvAYOVdxXeg==
X-Google-Smtp-Source: AGHT+IFH0acmgHQ6EWCtnqhwKaHJRPHfquNTd9/V7OoNJZcXx2+Bls4fC+zwkD99ObEzyVSuRYfHAQ==
X-Received: by 2002:ad4:5dc8:0:b0:88a:306b:f05a with SMTP id 6a1803df08f44-890841a56d1mr24709466d6.24.1767786696474;
        Wed, 07 Jan 2026 03:51:36 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077253305sm33343796d6.41.2026.01.07.03.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:51:36 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 340D0F40068;
	Wed,  7 Jan 2026 06:51:35 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 07 Jan 2026 06:51:35 -0500
X-ME-Sender: <xms:x0heaf_XjM8EldP7mZl_zowHomLP-0MXv_xDds5LsWx_DjphFQPC-w>
    <xme:x0heabpSfCmlgyjpQXDGdqjqwuVdgkxFRolmdFXVbMUQGWXNBgJTxzz7sVaZD5S0w
    km2S3EclWZgFtLJn1jwilL12tkxP9Kd0txl2zn-9hO5j2YylnNqLA>
X-ME-Received: <xmr:x0heaYlzu_tFXU4QxcfYGOCxoupKaRJNgKb9kawPSvS-OpSF9EjGFZUt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddvleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedtteeluedtteevuedttdduvefhffdvgeduffefleeuheevtddugfdvveeigedu
    geenucffohhmrghinhepvgigphhirhgvshdrhhhofienucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrd
    hfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthht
    ohepfedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrdhhihhnuggsohhrgh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhujhhithgrrdhtohhmohhnohhrihes
    ghhmrghilhdrtghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtg
    homhdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopeif
    ihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhi
    nhgrrhhordhorhhgpdhrtghpthhtohepmhgrthhtshhtkeeksehgmhgrihhlrdgtohhmpd
    hrtghpthhtoheplhhinhhmrghgjeesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:x0heaQacsUW0VmkipHTcgOP7bzaqt_FAwgGghK4qfmqIeaGBHJ4FIQ>
    <xmx:x0headt2TuVedR_biaKOaZiD9V9dQ9scTL5ryadW6DQKUU173jY_jg>
    <xmx:x0heaZq66LkmUtgAaxDhfccsF2mnCj3uLyV3TTIAsrFDbBgTIIV_Lw>
    <xmx:x0heaXnl4kpjDj3sVzT5Vi3EOgsLlwv6aJOBq3fVP2TrLU9YiwZKLA>
    <xmx:x0heaZSH49OXE6qcQRj4fsclvKNnwvgMD-Sq42Nmr6vDCcC-Is5bcBLF>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 06:51:34 -0500 (EST)
Date: Wed, 7 Jan 2026 19:51:29 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com,
	lyude@redhat.com, will@kernel.org, peterz@infradead.org,
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
	catalin.marinas@arm.com, ojeda@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
	dakr@kernel.org, mark.rutland@arm.com, frederic@kernel.org,
	tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
	sboyd@kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
	jack@suse.cz, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of read_volatile
Message-ID: <aV5IwaxcIF4XJvg3@tardis-2.local>
References: <L2dmGLLYJbusZn9axfRubM0hIOSTuny2cW3uyUhOVGvck7lQxTzDe0Xxf8Hw2cLxICT8kdmNAE74e-LV7YrReg==@protonmail.internalid>
 <20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
 <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
 <20260106.222826.2155269977755242640.fujita.tomonori@gmail.com>
 <87cy3livfk.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cy3livfk.fsf@t14s.mail-host-address-is-not-set>

On Wed, Jan 07, 2026 at 11:11:43AM +0100, Andreas Hindborg wrote:
> FUJITA Tomonori <fujita.tomonori@gmail.com> writes:
> 
[...]
> >>>
> >> 
> >> This is a potentially racy read. As far as I recall, we determined that
> >> using read_once is the proper way to handle the situation.
> >> 
> >> I do not think it makes a difference that the read is done by C code.
> >
> > What does "racy read" mean here?
> >
> > The C side doesn't use WRITE_ONCE() or READ_ONCE for node.expires. How
> > would using READ_ONCE() on the Rust side make a difference?
> 
> Data races like this are UB in Rust. As far as I understand, using this
> READ_ONCE implementation or a relaxed atomic read would make the read
> well defined. I am not aware if this is only the case if all writes to
> the location from C also use atomic operations or WRITE_ONCE. @Boqun?
> 

I took a look into this, the current C code is probably fine (i.e.
without READ_ONCE() or WRITE_ONCE()) because the accesses are

1) protected by timer base locking or
2) in a timer callback which provides exclusive accesses to .expires as
   well. Note that hrtimer_cancel() doesn't need to access .expires, so
   a timer callback racing with a hrtimer_cancel() is fine.

(I may miss one or two cases, but most of the cases are fine)

The problem in Rust code is that HrTimer::expires() is a pub function,
so in 2) a HrTimer::expires() can race with hrtimer_forward(), which
causes data races.

We either change hrtimer C code to support such a usage (against data
races) or change the usage of this HrTimer::expires() function. Using
READ_ONCE() here won't work. (Yes, we could say assuming all plain
writes on .expires in C are atomic as some other code does, but hrtimer
doesn't rely on this, so I don't think we should either)

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
