Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D3522126C
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 06:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760683472; cv=none; b=MPaUk44FvsIhojROhb9TDk0IKTEL68LCLujsUaJFMcM7gOYquyxOi4upXPrMAYtPj7RbLdGfCTwqc53SN0Pt+7Gx551xtM8p1GrF8pbEB09Vmbkchwh22PlN1/t4Z/LOfgFWa94jQ6SN6+GvcXENkA6bPauEp4RBYGX0VD3jd3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760683472; c=relaxed/simple;
	bh=BDYJe6PNunn/0k2BqgARb9bckODw3/amZPmZQ0FqkLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUk7ZDHjwbwxb+gkTupcaJv8gRWQPAyK9qN+lc/V3enWBIa0Ayy/p7a7hJCx2HY0my5/WhigHm70aPdhQQF8iyMoDJMf0/n1aWTsx/M/5nTSHP2ZRrFQB4hKdWjOn0e1TreBn4Fo+hucOaeGzn5E7ip+LB2NHV3Wmq2dJWUV/uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QH/peHRf; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QH/peHRf"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-88e525f912fso235235985a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 23:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760683469; x=1761288269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdQOJu+gX3yCYZwuj6cSNlL9IWXhHAMIWJr7en6kkpE=;
        b=QH/peHRf/pl2plGqgpZIRczltPI9e4c360DmAcY704cIoCC+lhxxnHyzCRaDeY7ekH
         3F2acckxEXG1cOT2rSofAgvKfKEqgTwKY9nmIp7aob1hzQtT3ggZpsXCBGRAFeZn6+XV
         shKsLibZak3zCDrijSdhCcrlxS/jw0SdkOZDCI8h3+9LF/n4Zqe28B5ED8a/fRBoN9zv
         bcxErnAfJ4GMRHUZB7KTLrdJE3WN5b5cmpkgIftbyti5QVYb+EGSoCO2F4YpbQ7a+du3
         twDqNUMxRgXZGeXWnABvtkavXAY4VI7vDda0G9esKp73Awgaw5SSC/dh2qyL/sHsIko8
         UjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760683469; x=1761288269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdQOJu+gX3yCYZwuj6cSNlL9IWXhHAMIWJr7en6kkpE=;
        b=KZ40CRu5leXxoqtzNcKcLyCRw4S8UjzX8JGHyHlilLOqjcWWX3KGEV8H4rrwsO4zLD
         Wkv1Z/ucjSSV8f7K0TLo/nqwom0AKN36PQabMU8pM0wSS5APYJbWQvwu0W5A6gxhfgsz
         2SH+GXvm9PMlZejdow6yxEk9bq+t+agloXPyDxxmeMtBq4ojg/gwhGbAEzt4+O4IZadV
         JWv/bDKeMBsStLfvuPD0PN6ZRU1buO/RYHktL9xOk80/ezYUqsZD/4iF/4uqfGHv38QQ
         m/cSAe8VIsyJD7c1WT1wsDwpwTByRN9OWh1AUrWtxhR7AbFGuzWWt8KQCh3la9IZZR36
         KjNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPDzsPuiTmrnJGbVYH1SAmd+SE4xwsljEAg+gDppaaws9TR+23ygOS6UoMGkvuAQLmMa9awMT+wiNl9TXU2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YygA2SIbdFc3Wv/enSJmYuRuGpeGu78eCv8S3N3SoTLsEAWw4U3
	U10ygh5nR5ekcxkriKaKgv8Zf119oEfJ55vRJwXnNUdZcIbRYNhQzQyv
X-Gm-Gg: ASbGncsdXG958AgN/76ExDdkU/4mgmeBcaJN77WO6pcAY6fOdNG6HRmACDp5lEYz0oK
	UaFD/PYLriAj3jl72z4wXhTWPpZDsKHJaBC0AHavyTS6MkNH2+/IhKlKxvQZSIWaWLqRxyBP9kv
	FMxpFduOf+49GvtW+nTv4lxHRiGbVq+kDfeVhOrP3sAVLDnxtNzMn4bgFlML5TWfNEmbo4inISs
	kfh9SEDCQAxMv9v+NQd+PyA1tRtnHzOMplKw+JIBTGmPGrDJ4AaKO+TC65oRI/kIU2ga3c0MKf/
	bAUByAd2NGOBnqdQ8AHDath1E+u9uMyBBRfo8mIlG4ufJEhnhmq4phl6IfgqnRrnIp8s/Z7jvnS
	GMiZf26DRcuEgOpbNvlY/GjyEJx46Y+sGCnoGbE14zFFVhW659rqoBX65t+xJrD51xBJw7C3ozR
	aN5kEe9w01+XsAG1FBbMkWStGZxr49NZvqqbnVoIA78POhfA5b3d8/UkA0EFOJKeTOQcADfXySf
	G/V
X-Google-Smtp-Source: AGHT+IEQ8ihcX/a0NkqD/Y0IMx7r27QxdXDPS292+Iv5nMGUgyI/zu/K6oUx2tP+qAXlPzYjLWhemg==
X-Received: by 2002:a05:622a:293:b0:4e8:a442:d6b3 with SMTP id d75a77b69052e-4e8a442da26mr4031411cf.37.1760683469088;
        Thu, 16 Oct 2025 23:44:29 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e88d6b7a1csm46464101cf.29.2025.10.16.23.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 23:44:28 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id E18C8F40069;
	Fri, 17 Oct 2025 02:44:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 17 Oct 2025 02:44:27 -0400
X-ME-Sender: <xms:y-XxaLvPTd45Bt7v2-cOVfskxgVindt7y_SCCOazPYYSzDcIH-fPQA>
    <xme:y-XxaByqmgR-kNy5TNnoSWASeTi5WYXkWEq0oP9R1Rj_PmDeUIfopgHnNI1BYyIwZ
    fhQJO75BTNjjIpUwo_FsNjWIxso0Hb_n12yWkQNPL4Z160qUB0p>
X-ME-Received: <xmr:y-XxaK2NTWFIwYtlK4CJUjdFoDfzhuWqH59tHwRJ2HiM1UrU0Mu7CJrEvgHHSuv0SPnuDtyushTSs3BaGmcOtgH5YQSqGkzR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdekgeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtrodttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeeitdefvefhteeklefgtefhgeelkeefffelvdevhfehueektdevhfettddvteev
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepfedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegsvh
    grnhgrshhstghhvgesrggtmhdrohhrghdprhgtphhtthhopehlhihuuggvsehrvgguhhgr
    thdrtghomhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegurghnihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdrtgho
    mhdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhopehjuh
    hrihdrlhgvlhhlihesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:y-XxaGyjV5qbjprM-tOkshZxrIXfxgvQqdov4dSBfvo4BR1MVfyN3w>
    <xmx:y-XxaCPeFMOJmN5tKI_QbvdNT4Tl1I4ES4vmPOsEWaPm8UjyI-ESaA>
    <xmx:y-XxaD4luwGqnXsDXQqyHiKgkeZx3wcx6EX7pooYWaLCJ2GFzuQpmA>
    <xmx:y-XxaBfkFFYfH6lV0tVBDmrs3UwM4vRiAYa173TZp1sLWNDCEpb9RA>
    <xmx:y-XxaBhs_z97M0KQYBZRXfnIX8Ohlp41ICmUF2Jw3CxdKINmPoaM025U>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Oct 2025 02:44:27 -0400 (EDT)
Date: Thu, 16 Oct 2025 23:44:25 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Bart Van Assche <bvanassche@acm.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,	Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
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
Message-ID: <aPHlySQJQpDmgHAm@tardis.local>
References: <20251013155205.2004838-1-lyude@redhat.com>
 <20251013155205.2004838-6-lyude@redhat.com>
 <7a98eb42-bc54-4f22-bc85-0f6d41f39fc7@acm.org>
 <20251016081513.GB3289052@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016081513.GB3289052@noisy.programming.kicks-ass.net>

On Thu, Oct 16, 2025 at 10:15:13AM +0200, Peter Zijlstra wrote:
> On Wed, Oct 15, 2025 at 01:54:05PM -0700, Bart Van Assche wrote:
> 
> > > This also makes the wrapper of interrupt-disabling locks on Rust easier
> > > to design.
> > 
> > Is a new counter really required to fix the issues that exist in the
> > above examples? Has it been considered to remove the spin_lock_irqsave()
> > and spin_lock_irqrestore() definitions, to introduce a macro that saves
> > the interrupt state in a local variable and restores the interrupt state
> > from the same local variable? With this new macro, the first two examples
> > above would be changed into the following (this code has not been tested
> > in any way):
> 
> So the thing is that actually frobbing the hardware interrupt state is
> relatively expensive. On x86 things like PUSHF/POPF/CLI/STI are
> definitely on the 'nice to avoid' side of things.
> 
> Various people have written patches to avoid them on x86, and while none
> of them have made it, they did show benefit (notably PowerPC already
> does something tricky because for them it is *really* expensive).
> 
> So in that regard, keeping this counter allows us to strictly reduce the
> places where we have to touch IF. The interface is nicer too, so a win
> all-round.
> 
> My main objection to all this has been that they add to the interface
> instead of replace the interface. Ideally this would implement
> spin_lock_irq() and spin_lock_irqsave() in terms of the new
> spin_lock_irq_disable() and then we go do tree wide cleanups over a few
> cycles.
> 

Right, that would be the ideal case, however I did an experiment on
ARM64 trying to implement spin_lock_irq() with the new API (actually
it's implementing local_irq_disable() with the new API), here are my
findings:

1. At least in my test env, in start_kernel() we call
   local_irq_disable() while irq is already disabled, that means we
   expect unpaired local_irq_disable() + local_irq_enable().

2. My half-baked debugging tool found out we have code like:

    __pm_runtime_resume():
      spin_lock_irqsave();
      rpm_resume():
        rpm_callback():
          __rpm_callback():
            spin_unlock_irq();
            spin_lock_irq();
      spin_lock_irqrestore();

  this works if __pm_runtime_resume() never gets called while irq is
  already disabled, but if we were to implement spin_lock_irq() with the
  new API, it would be broken.

All in all, local_irq_disable(), local_irq_save() and the new API have
semantic-wise differences, while they behave almost the same if the
interrupt disabling scopes are properly nested, but we do have
"creative" usages: 1) shows we have code actually depends on unpaired
_disable() + _enable() and 2) shows we have "buggy" code that relys on
the semantic difference to work.

In an ideal world, we should find out all 1) and 2) and adjust that to
avoid a new interface, but I feel like, especially because of the
existence of 2), that is punishing the good code because of bad code ;-)
So adding the new API first, making it easy to use and difficult to
misuse and consolidating all APIs later seems more reasonable to me.

Regards,
Boqun

> The problem is that that requires non-trivial per architecture work and
> they've so far tried to avoid this...
