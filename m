Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4511314A4F9
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 14:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768658427; cv=none; b=SF6IIFbipo/QssMWe2tOzLQT7R01zv+71kmutuuLA3CkXplAOFJVIJEcSYn55z/CCQxD/dJWWRN3HZOHkBAURoxb5SWKgae2jsYIsCayqLKMPDz9FDXJqUWKdqeGUmp4jZ9X6ICNBZYOXrFIhczFMFTSbaT+10EXSruqJQ9TozA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768658427; c=relaxed/simple;
	bh=LP+ORoEV3x/QOEgVwF/qJFp8kv1xIYx689aAuRe32Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzXXdvqnS2NePeY6pubiH/MatXj5TARfe9lUioa4GsoUlIJnLUBY02RPC6BFT2IeZr6OA2I5ZJJ81WK0hySrdA5lDe+Z3PA2G4kNZV6Gov4tcOrwNv68pcQKRYrvsqO+aBRNshS59B+86t1CqGNSSHV0fSiHhPDHiMGNwHeYpsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gd6Ucvqi; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gd6Ucvqi"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88a2f2e5445so37005986d6.1
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 06:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768658425; x=1769263225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsJhzSv+BLOqNKc20ETcfR3RCpxEZPWqckGeyhc9dbE=;
        b=gd6UcvqiAMfl4rZbbuBXq/cWWRQP57hXakHoglN8YbILHkhEYF5HlAa+JPYSsEQ6Uj
         tTA3y2A5stoHkT42CrGyCIhZ1UsczEHl4fmUGoHd8duv7Tpdshr2dsJeZ8wr4iBX0q0D
         4bhKJHH/oq/5kxTvlKDmQHe+anVvgIRyUumvj+GyMQqn8LhF1vNRYrlHrzmhc1/JF54f
         GkYP9WMEKMfW5+III08WMzavdVICPYDF9VqG+DOY8JZ62kA3RnwYq0TBgrpY6Jc+pXZZ
         i4VM6M+woMuKlrpD8JCgcI92emRZQ6UvYVzyu+a5pruZL/rbLXLoa2WTaZnTKthvky5J
         Ph7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768658425; x=1769263225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JsJhzSv+BLOqNKc20ETcfR3RCpxEZPWqckGeyhc9dbE=;
        b=amvDSG/Ck5leqeXo/tynsDlpVFxQSYEsFeUckPIHGiL9nISUStDsWUU1VYtknLMqYT
         JmdyCk43RORJU9kg3KyXBaOlSjwbQRDpVZWNGbE/ry6F429MAWYtpqFssWJnFhzJVNUs
         aNEjFadibDbC6/IHW6aXagzA4mP3xt0EqemlQ8Fg9Y9x8Atb0MIe164y8siB6e7IlhU4
         7rSbAuu+KGKLCXyvog6t3JZJN+yfTXda0U17Y2cIA7ZDvctEMFcwil4MkDzIt8hEpk7h
         Buv5Bh/Sbo+yIHoeVV7+hsgLcVyld30dNSLjTj+eB5pRCmJ8tvzgQIILioWkthEZVoJp
         JZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCUkPpqBbcFa1322uLHb3TBP66RiTFLPFM+LNhc1ylh12zEQDblkUpNtlGKftdpfiEFeQFE7sv4Y7T1Fi2q1Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEIcd+YEgt7yHEXZOgjnNBq2kFTS+7dhE1e2Nq2lGU+Ha07cDx
	Y7DKHrk31CoH8EUl0bFkdtWDItSHM0bOw8rjdziF6ZjWQy4Pm8/c/fsM
X-Gm-Gg: AY/fxX5O+Uj1T5/9bmE5weP1ovF0tGB0I4PnSk2PlU2PAnLStdPHv3dvOEYdwgIQX6z
	ZxnIQuhmc7wB88O3bOSXzcABjrBruP+edo8jw8dE3jmvysIo/6F6Bvy9AK5XSA9a5AINPaO2Ksc
	dwyV0Ug6mL5WdNcbPqetIfCuf3rEDcjhKuMPdkOgl/pCMpULHk8U3lzFDRekawk/cG4tXr44Q8P
	3AfX7CH/K0ucZPK8eDH4KkLuI/R+Uu5ujw7gwIkpq7yfNcoQLHLRRla1tCgeqDqjPg9EIUOpRBR
	4Zy5UyHPbwCoj58E6mD8URLNzcbEOAA0Cau++aqPPNUsaP/FegBDSWQzITcZfcoQW26JYC9RpmW
	MYu1MsnhOsVQDD4OLvhInJnchH9T9p5by7KYS4ts++flO2o3oup9/9K50ZSnjhZtqS1FAVJgD/x
	U1Xt694u+Mp3bf5lhJKUFxsm72zoYEHhVp1avsEwu9PLd/OmroO1qo6gU1E33pZ++9aNfd7Jgeb
	Bimfq/wucDMyGg=
X-Received: by 2002:ac8:5d13:0:b0:4ff:b211:6aa6 with SMTP id d75a77b69052e-502a1e08f85mr93551061cf.27.1768658424583;
        Sat, 17 Jan 2026 06:00:24 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1ef9847sm44608071cf.26.2026.01.17.06.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 06:00:24 -0800 (PST)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 52A8AF4006E;
	Sat, 17 Jan 2026 09:00:22 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sat, 17 Jan 2026 09:00:22 -0500
X-ME-Sender: <xms:9pVraQsV5oJN1rQdTdjBt-ExxigFukmdJ31P10iGGqgxfmxu05yEyw>
    <xme:9pVradVW5YP28Iir6vzjqg72HTtziJi7555HGmcQDNvzW9LFoPYdIfoKwsF8l3VeQ
    7WmYDvEfEHnliozpt5D0tTSI1BpuvXTTRATDr3AcXu6rilfGtssOg>
X-ME-Received: <xmr:9pVraZFd3U12EFPEMOGATk-3r_O4bQkXgLbIIzbMHfv5cv-bTnlE6Sju>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedvtddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhiedtieekleduledtgfelvdejffdvjeevvdefjedugeegffekjeeiiefhieff
    veenucffohhmrghinhepthigthdrhihouhenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshho
    nhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngh
    eppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvdei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopehprghulhhmtghksehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihgrmhdrhhhofihlvghtthesohhrrggtlhgvrdgtohhmpdhrtghpthhtoh
    epghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepohhjvggurgeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrd
    gtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhmghhroh
    hsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:9pVrafbTrfB068wBICe6Z8_1eu8RFdQbAF25tJ3s1Mhw3VJ-bSBxwQ>
    <xmx:9pVraeEYwpc-LLQRA86eWvNyQfKaNal5nV10_JxIpbMIQTo8-SQC-w>
    <xmx:9pVracwDRWB3ltXhAmiG89ng2m26pSJQAp53i3eqhdnDpqUL7Nn1Gw>
    <xmx:9pVraYGhLIU7S3ilSOqwWQwLErk7XMKY5amXHWL384_LETHULZYH-A>
    <xmx:9pVraZtCS_j9nz0_k3kR_mLxt3pWq345KBB8CG4oxjnLPJ6Wm4NM-tsR>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 09:00:21 -0500 (EST)
Date: Sat, 17 Jan 2026 22:00:19 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org, maple-tree@lists.infradead.org,
	linux-mm@kvack.org
Subject: Re: [PATCH RFC 0/2] rcu box container for Rust + maple tree load_rcu
Message-ID: <aWuV858wU3MeYeaX@tardis-2.local>
References: <20260116-rcu-box-v1-0-38ebfbcd53f0@google.com>
 <aWrSkAPFkdH_tvtN@tardis-2.local>
 <aWt4muGXbe7lBmXt@google.com>
 <aWt8Ze-otTkexNIe@tardis-2.local>
 <aWuKqLERqpNz9qtz@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWuKqLERqpNz9qtz@google.com>

On Sat, Jan 17, 2026 at 01:12:08PM +0000, Alice Ryhl wrote:
[...]
> > > 1) "relaxed atomic" does not sound like something that provides an
> > >    address dependency to me.
> > 
> > If you look at rcu_dereference(), it's a READ_ONCE(), which is the same
> > as a relaxed atomic load, and yes in LKMM, relaxed atomic load provides
> > address dependency (Please see the DEPENDENCY part in
> > tools/memory-model/Documentation/explanation.txt).
> 
> You argued that we should rename READ_ONCE() to atomic load on that
> other patch series because "atomic load" naming is better than what LKMM
> normally uses. Fine, but relaxed atomic load is a much worse name than

To be clear, in that series, my argument was not about naming, it's
about READ_ONCE() being more powerful than atomic load (no, not because
of address dependency, they are the same on that, it's because of the
behaviors of them regarding a current access on the same memory
location), and we want user to specify the intention more clearly.

> READ_ONCE() if what you want to convey is "has address dependency".
> That's not what "relaxed" means!
> 

Also note that my previous reply was explaining why we don't need to
call rcu_dereference() from Rust, because implementation-wise the
LKMM relaxed atomic load provides the address dependency. Depending on
what we want to do, we can limit this address dependency only to
rcu_dereference() and make it a special case, this means we disallow the
address dependency provided by the "relaxed" in normal cases. Or we can
add a Consume ordering (a type alias to Relaxed) that makes user to
explicitly use it when they rely on the address dependency. I think
either would resolve your concern about the name of "relaxed".

> I suppose you can argue that the word "relaxed" means different things
> in LKMM than it does elsewhere, but I looked over the doc you mentioned,
> and there the LKMM calls said operation READ_ONCE(). The word "relaxed"
> does not appear even once. If we're going to change terminology / use
> new terminology, let's at least pick terminology that's not
> contradictory with the rest of the world.
> 
> > > 2) How do you intend to provide mutable access? By waiting a grace
> > >    period?
> > 
> > Please see the {read_}copy_update() in the RCU patches that I linked.
> > In short, you don't wait a grace for mutable access, since in RCU,
> > readers don't block updaters, but instead updater will copy the object,
> > atomically update the pointer and then get an `RcuOld`,
> > which you can either synchronize_rcu() or {call,kfree}_rcu().
> 
> Hm, ok. I don't really need that. What I want rcu for is the internal
> maple tree data structure, so mtree_load() doesn't need to block on the
> maple tree internal spinlock. The contents of the box would be protected
> by a separate lock (probably via LockedBy).
> 

You mean after `load_rcu()`, we could access mutably by a lock? You need
to hold that lock and the rcu_read_lock() while mutably accessing the
return of `load_rcu()`, right? That is basically using RCU as a proof
for existence.

Regards,
Boqun
