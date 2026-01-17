Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8277D2248AE
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768664392; cv=none; b=goWkzW9UE6rCHrY2IHrco3JbMrNNT0MlAehFvgwcBbhrmwH4z5dOMVDel1tALAmxHEKz/jznixiNnVnYFMrj+fzxxTwE/jr9qu185jtwdMCzRm7Ah62fqlm81YWG85J8fhAOer28Z2TLuKKAWyREVu/so68uv2hUkJcPR16tZYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768664392; c=relaxed/simple;
	bh=c5ukZxvOx3XxqLMLZ0Qq3WedxhGaSgozV+pTMWZLD8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqUTlhiUyVNtS6Fvi4hPPubi0H5kCgPOf6eBlzlJw4RD4q543JweCFmCDKNFYWy5b5pMPiaBbT1z5TbVsgQl48bb68VsEBp9//GZpGgbZ+1KV1s/4VTH9JzRqKREY3eaHF2MVaHvHDgrbB1fyM7qtSIQve2TWg680KjCaMVBzco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nz2LLOFK; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nz2LLOFK"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c69ffb226eso356725985a.1
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 07:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768664390; x=1769269190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsFwJU0uorXcDejUHSz8mT5Xd1nNN5P7vGbzkPiWNoc=;
        b=Nz2LLOFKWxMLty6p6md1zG72q5To12QNClOU5AbzDry1rdX2WKl6JxdMhMJ2ut5sLO
         jchrgckLaNK2YoRUIjA9z7VG/33R0Qx3tzJlEE3YrDQNmQeG8EjV4wNzc4/UIWpHwDVC
         uOnAvrBEnW1wePra1VQAA+5ordBaxHI49v+EU8w6A89rT4f4JLck8QTZBkMtS73GybrV
         cYwj14GnwTlLi/bb+a68hjBDWHouPnUX/FjENEUScOZ8vrDN3yoeBkTG/sza2lpvGK4s
         KSD4HGlkHscgpFSPRy5PYoQpUHoRqHLaIbQs+590bXEk+gcz/rSxkw32Wta2XN6o/EQT
         NrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768664390; x=1769269190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MsFwJU0uorXcDejUHSz8mT5Xd1nNN5P7vGbzkPiWNoc=;
        b=Kn+KUFgQQbk9onZWyK/5AfM/TvTxUV9NcTQOpHO1B26QL7pHMkFwwmaw+e9j4wGMED
         AOFi3tV1V1pM85NiWaRXJY2aSttGjpJWuJ/2yffrTHf7gLNKR0Dq1UPxOHyGbRtmRCHk
         nIFN4SmaFgJHb0uEiErzMwvr5g+PnQGIWYSaTuPBWLCk84pI2mAju2SHXMhyttRDhr5X
         GDbAx5HAavqTNx/l+LmVcTbNvgZmd1tKCFHpNW8fkJYnxjE3BIXlAEmgvVJHT8oMM33R
         6VZr9N6Menv5Yhd8CLZa/yGn9xC9zx+hAHT3xoyLk1Vgm2lWU8bgLP3OOF/ddJ8Vu59O
         cVzA==
X-Forwarded-Encrypted: i=1; AJvYcCVhWUUG4es0VUBEDOnlvUIDhpoHKbvpl81ONGReT6SPaUYk4SrfD3J1suEawPtQ0jclnxGJedeV4ZHzfMjvtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN16iABBoqqEvUmABfn/FJaUB7+zAX7nd0vhvZYNjDymDcqGtF
	FIzmMJX4caW6I3Aq6NmbJDilUwrCwzRsjCSgfnf6rOJRjAWiOpLZyIik
X-Gm-Gg: AY/fxX5zhM27PnlUGcKmW958beqwtOrcGAG2dLA5JZugAYF1cXcdovfXQONgcQNsijr
	8yYgGgfGVDpydXYMNHK88d5wdlivZi07KvPtw2i1DjGWqNEFTi3U0iIABWePWHnJqXsU5aQkBib
	nqtiYwK3CTjkO7UuzxtgHzAgmpwb+bwm6tbSGkAIG37LoQN6mp+fDsRmiICdLN9hBQDkTa50y6U
	mZPvtCkDeRAN1haHtHmB7+OE3rV7T8UbIS+WaMmoP1TaL+aaqKCxFHYARCNR4QVnZLztn7AtxC5
	PHO810nFSw0Y1za0t+EvTqybkou+9PzLdgilQAKqv456UJLqqMmDnQ9A/fsSfgyZyJJBW3dfIQj
	3ISY/J11o6UEBe7b2345cmIgbb6PB8VLq1jb26kzg+RGZ3maGSOvNCAQyxhOy6ASeaDO70L7sMK
	9c6Vw+FFpwMOXXrWigcXARVkqj+p0fL4923AYLdpeA/kLW54ADb1QJdBumkrn6AVy6jzAyDiKRp
	gcadBJJb+ze64A=
X-Received: by 2002:a05:620a:128a:b0:8c6:a84e:2a2d with SMTP id af79cd13be357-8c6a84e2ee8mr540589085a.31.1768664390250;
        Sat, 17 Jan 2026 07:39:50 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a70f1fe1sm448624185a.0.2026.01.17.07.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 07:39:49 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id E79BEF40076;
	Sat, 17 Jan 2026 10:39:48 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 17 Jan 2026 10:39:48 -0500
X-ME-Sender: <xms:RK1rab7rMRnYmsuxO2M1OdMHbLRJ20HzxQGGz1hSxMBvL3L2kKxgXg>
    <xme:RK1raQyTGMwWDE-CnPIbW4LvN47vOtGrZw5YPszRdp09rnr04-lKWyypz0OfxziFm
    h8sTsqbwxqJAunQsRoo1wmXXgA4Uo2a_BTBE3yCIRm41oDwmcW9>
X-ME-Received: <xmr:RK1rafxqe0j0nt1CDDmhNxFXOsqrVhhr9viUfCa1T363Z3G6Z80GHbkt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedvudelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprg
    hulhhmtghksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihgrmhdrhhhofihlvght
    thesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvg
    htpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghj
    ohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsih
    hnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:RK1raYWsq87pmfvRbXi5JFYKA_KCUBH5rc8-Mh499582NEFspw52aQ>
    <xmx:RK1racTHO9OTXGWTd7Wnhwlih0XeJmAB1RGE3NlLFjGVsnwaNSHX6g>
    <xmx:RK1raXNseBlDOCe-yq54TrACSTafu1k1JEYQ2xxtYpx1H86yRv8lQQ>
    <xmx:RK1raZw6CtwWC6dWv9737pBYAt5rbNe75kHWG8wKFyHucpyyabEaKg>
    <xmx:RK1raRq1F5u7Sb-JBFPV5Zyr8y0nl5XkLXjd6h2Kjb2wBYoAbWbfzQfi>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 10:39:48 -0500 (EST)
Date: Sat, 17 Jan 2026 23:39:46 +0800
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
Message-ID: <aWutQuJAaBXG2JY1@tardis-2.local>
References: <20260116-rcu-box-v1-0-38ebfbcd53f0@google.com>
 <aWrSkAPFkdH_tvtN@tardis-2.local>
 <aWt4muGXbe7lBmXt@google.com>
 <aWt8Ze-otTkexNIe@tardis-2.local>
 <aWuKlR4a-VJhBeWj@tardis-2.local>
 <aWuOtUa0mPDrnbke@google.com>
 <aWuXHkGZlMvr0uxD@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWuXHkGZlMvr0uxD@tardis-2.local>

On Sat, Jan 17, 2026 at 10:05:18PM +0800, Boqun Feng wrote:
> On Sat, Jan 17, 2026 at 01:29:25PM +0000, Alice Ryhl wrote:
> > On Sat, Jan 17, 2026 at 09:11:49PM +0800, Boqun Feng wrote:
> > > In Rcu + RcuOld design, RcuBox is just a Box
> > > because these two pointer types handle reclaim + accesses.
> > 
> > How would that work? Dropping my RcuBox<_> must use kfree_rcu() or
> > synchronize_rcu() or it is unsound. So it can't just be a Box.
> > 
> 
> RcuOld<P: ForeignOwnable> will call synchronize_rcu() before dropping
> `P`. And I think we can have an asynchronous drop pointer type like
> `RcuOld<P, Async>` that requires `P` is a type like `Box<HasRcuHead>`,

One blocker on that is Drop impls cannot be specialized. We probably
need a different pointer type like RcuOldAsync...

Regards,
Boqun

> and the drop of `RcuOld<Box<HasRcuHead>, Async>` would be `call_rcu()`
> or `kfree_rcu()`.
> 
> Regards,
> Boqun
> 
> > Alice
