Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E364C31B822
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Oct 2025 19:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761940774; cv=none; b=F5/x9DQkNbP0sHuSEx1cqq/xSdIyIftsnSWj98FxrFkTGdWHnqs8x5jxonJyVFCH5ULTPB/3CzT7eRLbETI9+awMvqvCR1wc0aqFOO6beavY2X6osz5SY4Qwv5YBvCVTismY7+g0VDoeZZ32gLgq74rkFlrMvqRFu6M8/Xj475M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761940774; c=relaxed/simple;
	bh=ik1a8gZCy8OHc0UXQ1M5tX69fdcP0uB4uz3wGzgfqYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXBOtGe9m4vev8srkk6yqQII/+NbHfhZrqcSaXVRIK/zkgcpEDS2+TilLlu5TAzObf+p4sNEiSkTqyhpoR2ixsjJXRIac6eWoXlx+9+vP9DDurbEcIwg7xVfitDxf2xp+cTMvOSxC1b0Cw7o3kLRYqvBLIqZkAqJ411k8sxH3cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkDybfQq; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkDybfQq"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88032235d68so13144376d6.3
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Oct 2025 12:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761940772; x=1762545572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Iyen6dvY92B9sLWrKqEv//LwHqaAqRQqY1+ybrCM0Y=;
        b=DkDybfQq/tuUPI/rIuwIuPjnSBIw3YHzZRvoev7TakyPxqhDofuaLdHBpAaOs2/8hf
         AQyr0SlcwvRwy6nuzOYpEU9L3SlalwAYnlEFobNGEl32pOZpA6bTskkMVrWT95gxOXNH
         EiM1eXqD6pD1HX4MErg+Ker89lVh8j2P5HW+LJFPronFS041PxulHPRyITA26I75akCY
         AkA917JSpAj3xN/ss3VeMqOnAeZ9z/2fekzA4mAgSkw4Tn2RTeSsuXEKUpqIJzE3lbz6
         5e5PqDxrvlDLN7OiPtrhPRKYfY+1mkgw1TobmgdxLXQf+QYxk0moOPRYkjCn2/z1Aezn
         2rbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761940772; x=1762545572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Iyen6dvY92B9sLWrKqEv//LwHqaAqRQqY1+ybrCM0Y=;
        b=c3QiRUr4NKMri5+/1iIODsZhOcmjjikorAzKaGRgkl+3TxN3sqBN7m5slNp1dX2tGE
         0K8eMbsNR9Q8Pw8NpbQYV3EcTE+3FU62vKJx+5VZKPA6F8/oBZPFwqxAo0LA3L/ENUiZ
         GawUPmUvlbeVgX/rbpDojbo6OhFRL6UeWZVYtwi65JkfLlT9R+ASuMdABddRf/NIw2Xl
         /3rpw7Nx9uyYwSGS5R4xN7wxgQTLEz8OfnMNFKBLe9y3rIBKxPwgOvtPuvDNyygtpv/j
         RvbGqsxbBrMzhjfUtBGsa3maUluFjjMvSgIfZdPK7/MjOCjJ0qDSHuFLzpiiBYR71DjZ
         vcNg==
X-Forwarded-Encrypted: i=1; AJvYcCVZJSzRFRP1OrcgjdhzaoOsYlcud/RpCfSW7QhSzMqcyADQeNP9+1AGdZiYQE9Q1psPhi+4TLMqXGIOLpHfsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc5rZ1qNsqriL1J9OtYAE8OpflYg33VjLIHj2TljZ2kfdX1gp4
	JxGEI7j+dQYIBbGkOuL7FcIt9cZ1u6mG+Y8UENKJ6xw/ZYOvUCETbt5w
X-Gm-Gg: ASbGncvSLo+nHLylC0AM0YsEKn9BnxnrHPWvB/T/6UAq3y02uaDzcmIczOONkW3GC1R
	9yDEGgHf5SJxeG+9645ak3p364V2jVZHNsaVGa9c1ZBb+hnDKmX3AxVFztA7PQeHIHYUtEvi1N1
	mJZ8mlx3mTNqLlDKMmAIesr40e5QAi04YlHruWiv8KbI2paqofDKjczuPDxQOWDcWRQRIEhPz9g
	ECfH2fMjbkFen6s3P7BckHLpkc2lBqSDkTjNHC52mnx0TwWQ1gUqVM6jch39oCMWz9YPDBVqTot
	MsbTdlACugXu4b58eaUkPhdUSKQemm8LeFU/AxhwQ+n15fejZsZNRLINQ9FhBsP6Ge9qV4J+JUA
	NdyWU475KIJVIfTRPlgifmAwK9URnN6fawdaawgGYH2aBnlwaYxuBLyYbzuma557Fb0g0pMC+k0
	uae7rHIAGiF6KWKsxZxQw66VPvidWprAFlGmKV8lNSaNVls1oAQ46l/nDutAKB+G1OUdkjM5oti
	/DUHQe5Sieuw7w=
X-Google-Smtp-Source: AGHT+IGfg364yBfQ6pTjAFa6RKxm15WKlYb2bY+1rBy9kaSNNc/J4bnrGgtFJE+IhOXSrcpxI52U/Q==
X-Received: by 2002:a05:6214:470b:b0:880:3a3d:8a25 with SMTP id 6a1803df08f44-8803a3dc9abmr31936456d6.49.1761940771721;
        Fri, 31 Oct 2025 12:59:31 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-880360ffca8sm16996426d6.27.2025.10.31.12.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 12:59:31 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 49027F4006B;
	Fri, 31 Oct 2025 15:59:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 31 Oct 2025 15:59:30 -0400
X-ME-Sender: <xms:IhUFacccSkfnWblQ65-BNGAvHR9Trml7hfJfCV8JCqyMojBF7RdnoA>
    <xme:IhUFaVzabmAdsNspNnI8XDlKZ5tV51HZmwgXnl8IsO5DFF9O5dDOzdzLf7UOPDq7J
    iMBl2WP3sRoL_IVdP-4dElIsH1vlKIJQkLZ7ePsvhLJlL5R2lZ_rA>
X-ME-Received: <xmr:IhUFadKr3NZREz7vJQjIXErgVM36jNyilp8IkFwRveCR1fs2AUvfJCtmXBfn7yYBxzN9CZwMLmGI3284oAl3taFid8Ehr7DE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujedtfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    ihuhguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhn
    uhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuh
    htrhhonhhigidruggvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtoh
    hllhgrsghorhgrrdgtohhmpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhm
    pdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    epjhhurhhirdhlvghllhhisehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:IhUFaeszn_PGY45eAljR22aE3YnFPpK0IPqp8-eOist3GzG2tQ9Ruw>
    <xmx:IhUFafTEY37fDHhP6KWngtwsag2wO3_KhjTatUD7NjHWGat7E0kOPw>
    <xmx:IhUFafRR5HueIgG-nP5PZzdyRDeZj6dNunkWhZwuTVjgNwuaiG-VpQ>
    <xmx:IhUFabo4xHyosp7fidZvLmOjHghsjZ7xrngFcXj_H54UFWfe2OwLRQ>
    <xmx:IhUFafCOYdPNgX9E7mZyQgSd8RBBoEHsEFuABh8aVGfyXT93kUpfKIBj>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Oct 2025 15:59:29 -0400 (EDT)
Date: Fri, 31 Oct 2025 12:59:28 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH v13 03/17] preempt: Introduce HARDIRQ_DISABLE_BITS
Message-ID: <aQUVIMElF674xTao@tardis.local>
References: <20251013155205.2004838-1-lyude@redhat.com>
 <20251013155205.2004838-4-lyude@redhat.com>
 <87pla386cp.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pla386cp.fsf@t14s.mail-host-address-is-not-set>

On Fri, Oct 31, 2025 at 03:59:34PM +0100, Andreas Hindborg wrote:
> Lyude Paul <lyude@redhat.com> writes:
> 
> > From: Boqun Feng <boqun.feng@gmail.com>
> >
> > In order to support preempt_disable()-like interrupt disabling, that is,
> > using part of preempt_count() to track interrupt disabling nested level,
> > change the preempt_count() layout to contain 8-bit HARDIRQ_DISABLE
> > count.
> >
> > Note that HARDIRQ_BITS and NMI_BITS are reduced by 1 because of this,
> > and it changes the maximum of their (hardirq and nmi) nesting level.
> >
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  include/linux/preempt.h | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/preempt.h b/include/linux/preempt.h
> > index 9580b972e1545..bbd2e51363d8f 100644
> > --- a/include/linux/preempt.h
> > +++ b/include/linux/preempt.h
> > @@ -17,6 +17,8 @@
> >   *
> >   * - bits 0-7 are the preemption count (max preemption depth: 256)
> >   * - bits 8-15 are the softirq count (max # of softirqs: 256)
> > + * - bits 16-23 are the hardirq disable count (max # of hardirq disable: 256)
> > + * - bits 24-27 are the hardirq count (max # of hardirqs: 16)
> >   * - bit 28 is the NMI flag (no nesting count, tracked separately)
> >   *
> >   * The hardirq count could in theory be the same as the number of
> > @@ -30,29 +32,34 @@
> >   *
> >   *         PREEMPT_MASK:	0x000000ff
> >   *         SOFTIRQ_MASK:	0x0000ff00
> > - *         HARDIRQ_MASK:	0x000f0000
> > + * HARDIRQ_DISABLE_MASK:	0x00ff0000
> > + *         HARDIRQ_MASK:	0x0f000000
> >   *             NMI_MASK:	0x10000000
> >   * PREEMPT_NEED_RESCHED:	0x80000000
> >   */
> >  #define PREEMPT_BITS	8
> >  #define SOFTIRQ_BITS	8
> > +#define HARDIRQ_DISABLE_BITS	8
> >  #define HARDIRQ_BITS	4
> >  #define NMI_BITS	1
> >  
> >  #define PREEMPT_SHIFT	0
> >  #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
> > -#define HARDIRQ_SHIFT	(SOFTIRQ_SHIFT + SOFTIRQ_BITS)
> > +#define HARDIRQ_DISABLE_SHIFT	(SOFTIRQ_SHIFT + SOFTIRQ_BITS)
> > +#define HARDIRQ_SHIFT	(HARDIRQ_DISABLE_SHIFT + HARDIRQ_DISABLE_BITS)
> >  #define NMI_SHIFT	(HARDIRQ_SHIFT + HARDIRQ_BITS)
> >  
> >  #define __IRQ_MASK(x)	((1UL << (x))-1)
> >  
> >  #define PREEMPT_MASK	(__IRQ_MASK(PREEMPT_BITS) << PREEMPT_SHIFT)
> >  #define SOFTIRQ_MASK	(__IRQ_MASK(SOFTIRQ_BITS) << SOFTIRQ_SHIFT)
> > +#define HARDIRQ_DISABLE_MASK	(__IRQ_MASK(SOFTIRQ_BITS) << HARDIRQ_DISABLE_SHIFT)
> 
> Should this be HARDIRQ_DISABLE_BITS rather than SOFTIRQ_BITS ?
> 

Good catch! Yes, it' should be HARDIRQ_DISABLE_BITS. Thank you!

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
