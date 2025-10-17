Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A263346A8
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 06:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760683711; cv=none; b=euBlv8FfzoqvBlAc3uQsIqN65+Wda7b5WnFB8N7rDUIfnquAexcqyZSpqvTaBOevvJFoSYEGfJ0x+EpDwHFivK0Dmy3msP78Glbbsjybkzlol690mstVmLnjoHNpKTS6pKKWlQ1usV64C+vxUX8oD5LWfnIgGj2Sjy9NjRvUbKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760683711; c=relaxed/simple;
	bh=FfyEjb8szo74nf/ADMSUeVfwtw7NpFaWSMEpPg5cAu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkbCOMmKKw/eptTjetmJVCQHLTqVoF0zuZOknXTGWswvPyyOVXRkaQ3IG/dQlXA6CVpeRq9E7dhUK4ojYZMAldP0HVgZsBVEkNUrkg0rjw8fCJXOyw4KPKy6ob5hUk9ad4ygUsmec9Hgk3eMew1rfYuM56bHc588s4jqWYQXEmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cE6HaxiB; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cE6HaxiB"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-87a092251eeso52815046d6.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 23:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760683709; x=1761288509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9thHk+LDvrFzyJQa2wHsHWT+JXdc3isPra4LuVj80H0=;
        b=cE6HaxiBKTXALq/lrIkmVDrp98QOgJOB3EJ6lsy8ibV/bZKaMvdoylghDl5tPT5vxN
         +XbMYiQgS1zF9gOxHrwdJGneNJ5KXhqM/eSinKqMFwbUW4JT+vUFSOW3KWZHhCNUKo6G
         fBGtyikyFWlwTDmppH/6ihvP+yJrl8qUdZQNWauKJ2aNWB4lt4Wk4ns3UeHJQieLe4FN
         l6F36YSkNxDgKKHRqADgw3OW5IiTJeYSZHvKW1ub61LhzQlvcqwZ+bVDv0afZT+MwaRp
         oTyyEPKbD93GP35fdUZhzblji4Xn0GetNn96MkjW4ItxbxaCtlZwt+Ppjun4h//nBHze
         moFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760683709; x=1761288509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9thHk+LDvrFzyJQa2wHsHWT+JXdc3isPra4LuVj80H0=;
        b=abvK8tptwS41vx+0jxlX1Hht3UH2F9lbZQt7PMgN36rKW9G2X8BsUnhXz+ig7G20eV
         gJ0HX8QSZM2ahgVhIIrXNtXmBU0jn63q/n4qOGsM3o0gt2ojsFKMuhyQSOkRHlfesT3S
         KFs62Y5NcOXSzZMhVPoxLJ+FI/kcbSIbFooFD696gbp9XrOTUG+F01qk524wLkRj/e2f
         Bfv6yL9dSrDqq/bvdA5QB01IXJW7YLjm4khSkkJUVh9CH92ijPYHOrNa5lGQDgZFIyYr
         z9V9DtbPOnWBcUhIBsI8q8svjZ0+GTbCRdD2jY+TiNEjfAXDhexCTKprxR/r/kbduzcq
         3HuA==
X-Forwarded-Encrypted: i=1; AJvYcCVqdGOB+MklJghSeO1eHhZIy95xPQH4fZadFpfy423cIq3JW5EjCXPXz8xozBmMM48ho4vZYOuIq342OTClpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpbKnF6pfvYxsr4sPaVUSVWMYcXRTtRg2ezJLIA5Qtqixt1QPx
	aUkMmWj5Aj3NosqtagCMTROugnKIWuCPhm7EEZ9RjTu99cl30aaPIBXW
X-Gm-Gg: ASbGncvmTYasBv+lcQxIHZs+LpgvfvUk2FAr8+NRQPb/83OajK9tvV4pH3j0XHs/3fg
	fLQEGLDkAOWT8EHSkTNWPeViEm5o8PSITOE0DegLVHr56gjMxaMbrkYFhLdLdEwxrpGNJPigAbh
	NNpYjmsRsbvA7F9j7TkNgDw+01Nho397pEtuFSqi3p4Zkl3gjQ5k/BsLVfn3WsoWvgca13nwsGM
	xQWgukYAds1tU7eG0QR3kA3BZ1vN22wJs8umCGCaZ5/qk/m5NOafdcw19HCCNYXz3zHLYrpl4td
	CZnM7G93Tv5M8u94uYiiH8gD8B0kMlp/nPUoX000XR9Pba17f24I6oUwOr52yzuyia9gIh3QlNr
	WeRN1jnQJXOvLq1YBagQAogYHusK02odbsWQyLqLT1gArDAGoBQgCexQwmsvwH0QIpLuId7FACt
	x55OawJnVBDPNrDa7Pk3tvMjn2jwdDNk7eT2oExmcgj+bGky6x04l/69gpL6nvqP9xRduVFR2gC
	224UwCMPbHyp/fIyxvBL9hU4Q==
X-Google-Smtp-Source: AGHT+IEKl6ub2GpFRNfTcXXCBN0bOVcioIRBk8P4vMvbVGGNxUqt0lxnw7DMma/kBpbsiuZsk9Z/rQ==
X-Received: by 2002:a05:622a:118b:b0:4b0:ca36:90 with SMTP id d75a77b69052e-4e89cdeab2dmr36112261cf.8.1760683708684;
        Thu, 16 Oct 2025 23:48:28 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e881c8a20csm59703181cf.16.2025.10.16.23.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 23:48:27 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 272D8F4006A;
	Fri, 17 Oct 2025 02:48:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 17 Oct 2025 02:48:26 -0400
X-ME-Sender: <xms:uebxaIsvMTcnjwpPoT0xXasDde84kr6xdCjqUtB3HuRMVy0cA1K3Xg>
    <xme:uebxaKxVP9mr6UJXLvxDCXIVRUsGtY0ARooiRRA0LBxsqoBh5tvPg079JR3Gl9LKo
    bFgM3apo72EE7hYt8OsTzD179esBM3C8BtwAIhg89MIeF2MyONZFkI>
X-ME-Received: <xmr:uebxaP35TeabTQK3HeYuTlpZc_b1ioWFrrxZ81ehIJK_w6KmyznE64jyIW65vf0EG7-qtuEk5v24J03CIKtu8RgNK0bRpBUN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdekgeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepfedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegurghvihgurdhlrghighhhthdrlhhinhhugiesghhmrghilhdrtghomhdprh
    gtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehruhhsthdq
    fhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtgh
    hlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhdrrghlmh
    gvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehmihhnghhosehrvggu
    hhgrthdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrgh
    dprhgtphhtthhopehjuhhrihdrlhgvlhhlihesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:uubxaHyhldY5ITjg0gMJ3Z8_6E8mMwR0Vtgg-o_sPSaGXvQDU_-j3g>
    <xmx:uubxaPNqfDLTeWuvBQv6RWgnZCzkxlRcxKtn7VhGUCgkFV03HyVGLA>
    <xmx:uubxaM75FKm1kQJwUym3VZURGyjk9v4bQfAZUTB17gf-EVHSLiJCaA>
    <xmx:uubxaGfFDSHMIxVbXsaD4qHZX26aGL7ld3xjM2XKSOWxfuGEjIafzQ>
    <xmx:uubxaCg7JVzRAKBgyAxZIe_R-kZiTqXVVwfxMVi7_5O6LKQ2X6gbazGa>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Oct 2025 02:48:25 -0400 (EDT)
Date: Thu, 16 Oct 2025 23:48:24 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ingo Molnar <mingo@redhat.com>,	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,	Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,	Valentin Schneider <vschneid@redhat.com>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,	David Woodhouse <dwmw@amazon.co.uk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH v13 05/17] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <aPHmuA9kXSn438v5@tardis.local>
References: <20251013155205.2004838-1-lyude@redhat.com>
 <20251013155205.2004838-6-lyude@redhat.com>
 <20251016222421.512ca8d1@pumpkin>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016222421.512ca8d1@pumpkin>

On Thu, Oct 16, 2025 at 10:24:21PM +0100, David Laight wrote:
> On Mon, 13 Oct 2025 11:48:07 -0400
> Lyude Paul <lyude@redhat.com> wrote:
> 
> > From: Boqun Feng <boqun.feng@gmail.com>
> > 
> > Currently the nested interrupt disabling and enabling is present by
> > _irqsave() and _irqrestore() APIs, which are relatively unsafe, for
> > example:
> > 
> > 	<interrupts are enabled as beginning>
> > 	spin_lock_irqsave(l1, flag1);
> > 	spin_lock_irqsave(l2, flag2);
> > 	spin_unlock_irqrestore(l1, flags1);
> > 	<l2 is still held but interrupts are enabled>
> > 	// accesses to interrupt-disable protect data will cause races.
> 
> To do this right you have to correctly 'nest' the flags even though
> the locks are chained.
> So you should have:
> 	spin_unlock_irqrestore(l1, flags2);
> Which is one reason why schemes that save the interrupt state in the
> lock are completely broken.
> 
> Did you consider a scheme where the interrupt disable count is held in a
> per-cpu variable (rather than on-stack)?
> It might have to be the same per-cpu variable that is used for disabling
> pre-emption.
> If you add (say) 256 to disable interrupts and do the hardware disable
> when the count ends up between 256 and 511 and the enable on the opposite
> transition I think it should work.
> An interrupt after the increment will be fine - it can't do a process
> switch.
> 

This patch is exactly about using percpu (in this case it's the preempt
count) to track interrupt disabling nested level and enabling interrupts
when the count reaches to 0 ;-)

Regards,
Boqun

> The read-add-write doesn't even need to be atomic.
> The problem is a process switch and that can only happen when the only
> value is zero - so it doesn't matter it is can from a different cpu!
> 
> I know some systems (I think including x86) have only incremented such a
> counter instead of doing the hardware interrupt disable.
> When an interrupt happens they realise it shouldn't have, block the IRQ,
> remember there is a deferred interrupt, and return from the ISR.
> This is good for very short disables - because the chance of an IRQ
> is low.
> 
> 	David
>  
