Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E050A2AE77
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768655516; cv=none; b=NmXSSnfP6qG8NBZiSFSXhUrFpBnLIrIO4ZvAkO5nmILlE6TwzskkK2tSmoa1omlod0pra0ru/9ydYlu7iVG/nUamQLfNrZJKP/MmYC+uq6Hcyueb6a5S222exM+CYfuyuQaYei7qgGXRrnzZ4cRp6LU+cVOm9rtCyXB3aLd/5GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768655516; c=relaxed/simple;
	bh=F9+NetmOvfbgFjslgvJwK7ZP49AbY0olv9NCAZ1pnFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XC/9rTrRlDI99neSqP/cvFAcxPQWX0Ei45i50S5dwR8EGmvYVh1DGBMckwp6Ta92owYjaSsdZVz2PCK6knSEYYbxaVsjkvntj3C7jIADJ+6WY3SKLcbMUMJygGPmxbrTIrddUhkIKHaDlahzrdS1qlQCRFI/wbSC9ahPOGisiLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTV4OR8Q; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTV4OR8Q"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8c6a5c57e01so218372785a.2
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 05:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768655514; x=1769260314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTrHmEc1BYd79fY4MjqTS6sMPKSqsWTUhgoBbfphsL0=;
        b=aTV4OR8Q2kYqFCxCHgWuOCs6uGDptnVVby5EGdflQys6tPoN8E0WKgpNfzfznFXipc
         f4Ogy97L9qWgA9asx0cIzgbn8z3kSEyc67zXuNAbQYS65VUQt6Z1f+CU8dlM0+4ueCc2
         QJm99nH29WPvYC/zjwth0x4FWfH1gnDVPzTCdKBt9N7ub8jEFKv04VLsD5oxFYvSt7D4
         vXih48KYKQsC+9u533SVsmXT5En5wUslWAVhaD0kg+y95A6E4deHPWNG3uSoUuJcC4JP
         kKGnnbGtt8wWvqRpSIo9LzY0JSUtcn+eMBVeZ4YrlBef6pXoJvqFRDibrlT07Xay3nn2
         2ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768655514; x=1769260314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BTrHmEc1BYd79fY4MjqTS6sMPKSqsWTUhgoBbfphsL0=;
        b=Fd8Sj2PcnQokL2d8T3qOsUAejDedQ8yDuze2CIuBxfoizeffviOJF1zWqxGAk2VbDb
         SPEkJdad8FDggLVHqvpISisJmghNacuDOiR+XNxrm609Qk6KspHTQ0vDfCodbuIIIDPB
         pj5MjJngapVaabMoxL6QCDABxpP2ttwDnd4MCkFwDBG9YV3EpMmsFTECBUlvnXqQxePB
         DrRO1Ruu0wiU4CGS3lSN9iYBXWmQLPr5mHw1beMhk1Q49LeNNUkin1GB2k4TGpBZVE4W
         4S5Ws2p6y2HHp7HJYTRdyvDsb6z90trI2RNgl1Pr+9d78wVpE0LyTOycDirgl0HbsSsX
         c80A==
X-Forwarded-Encrypted: i=1; AJvYcCW8ON7NxX9fXpsyRqmKVOkGW4vt3zu+Asa3V2mVlV4P9/5ffIzqw2lZ2+CPORWcj4rgRbCiE3tNDQR9MasJNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZBZ1REQLx9G+AQEoV9v9VtEs5NC7xQ5KsEyqwmW/C0b2hCsM
	6kwG8l7HkHl6u4O/C/05HHlyrxegktRVxosAV9IcevWsC9LYo0dPQmiz
X-Gm-Gg: AY/fxX6gKa0HmibABHq5zIbu8MQH5SM0pVbho4V2AaxwgbtRgbNptIV+dRdiqaEbPWd
	rmlI7hWvXe2YE7gE57hGHTtM81Gs7rjEmTcKV/Is1YEGlueckQ7o+Oz5Ju/ISwTwuDiczYSBbom
	Agl07ORobjUrCzUDKNtQ6oTNY1CbPKmy0TzusAsEaE1HJ/wxlIOOjiM+dOXOPodh5Zv10bR7HKe
	w4NMyRDa+mBGcIGRXwh9k7of4/JEv8sgDFknI0nAI1zNJUgs8VpYTQLXoiVqIeaArtTObIQot5F
	z/k8FDOlNub5ghQCjIMrWCZMc6w5oIzU7zIZcpWnNpr2mLzsV0ProKfBYnlyF5foZCGL+zAqVIB
	ovnxU+5Bncs3EMD2l0cvvbX+1mZQgD7KR0QLEdUpMg05F4c4gMktr16BG4B04mqXZX4RW2A6Rt2
	I1xiiFzyq7fAWEIfTQdyFC/6mOqJY7EBv7ukbrwdcFVEq5ABANOJ8yeSsgX7b0Xrwhmzon42CMb
	xl3fXfy9SBAOug=
X-Received: by 2002:a05:6214:cc1:b0:892:68f8:aaa6 with SMTP id 6a1803df08f44-8942dd29578mr77537336d6.18.1768655513740;
        Sat, 17 Jan 2026 05:11:53 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6b22bb7cbsm154629785a.39.2026.01.17.05.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 05:11:53 -0800 (PST)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6D76CF40070;
	Sat, 17 Jan 2026 08:11:52 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sat, 17 Jan 2026 08:11:52 -0500
X-ME-Sender: <xms:mIpraatouuzYmY290PICbgo-cUjJ8YERdLYtdps-8CE5PUvoFiSQFg>
    <xme:mIprafWx7i08mFu3COd79g5ZIRMx-wD1ke3oj52cc39PGqEq4IrdHBt3_JL2nPlnU
    WO9zfBF8ucNXitKVaiJbrcOdOIUzJySLi8LPKISqiDsQjNX92jNpw>
X-ME-Received: <xmr:mIpraTHqN9021MJgEklW0YJorHzIgFQZyHze1He0zNc-KbmczYITFscF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedukeelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:mIpraRZ0E7gQgihiTBQGdk8NJzk5LHjpDnTsajNwQqCynVnyNvCabA>
    <xmx:mIpraYEGZCkdhSLth-YP0-uFI4SBokX8bsf6KZSefEJ9ZP1LCK-8tA>
    <xmx:mIpraezwNK35Y-fH7Km4_s8sjxZ88bvhgy2T3d4O0SuvtsnG1uNU2Q>
    <xmx:mIpraSFY3y_AZlldHk6dUC5yFgvZYgveNpl1JLcNkKFgoy1vEiRCoQ>
    <xmx:mIprabvE9lGOY8-3epT5PTdzFEn1xPI2GBg5_OGF8Og5Nk64i3jcIzXQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 08:11:51 -0500 (EST)
Date: Sat, 17 Jan 2026 21:11:49 +0800
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
Message-ID: <aWuKlR4a-VJhBeWj@tardis-2.local>
References: <20260116-rcu-box-v1-0-38ebfbcd53f0@google.com>
 <aWrSkAPFkdH_tvtN@tardis-2.local>
 <aWt4muGXbe7lBmXt@google.com>
 <aWt8Ze-otTkexNIe@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWt8Ze-otTkexNIe@tardis-2.local>

On Sat, Jan 17, 2026 at 08:11:17PM +0800, Boqun Feng wrote:
[...]
> > > > An RcuBox is like a Box except that it lets you obtain a &T that
> > > > outlives the box by a grace period. It does not allow mutable access to
> > > 
> > > I think the `RcuBox` can be folded into the more generic RCU pointer api
> > > [1], e.g. Rcu<Box<RcuBoxInner<T>>> where RcuBoxInner<T>: HasRcuHead. The
> > > benefits are at least 1) we use relaxed atomic read for RCU readers
> > > which guarantees address dependency that RCU needs under LKMM (while in
> > > the RcuBox here, we just use plain reads), 2) we also support mutable
> > > access as well.
> > 
> > 1) But mtree_load() does use rcu_dereference() to obtain the pointer?

I see, I need to change my reply to "RcuOld" below..

[...]

> > 
> > Hmm, so I looked over [2], and I think my RcuBox is an RcuOld<_> rather
> > than an Rcu<_> under this model. Though I can't afford to pay
> 
> I don't think so, `RcuOld` represents an unpublished object while `Rcu`
> represents a published object, you can update an `Rcu` pointer to
> another object, which is normally how you update with RCU. But maybe
> it's easy to discuss this with updater side code in picture.
> 

I think a more accurate reply should be `RcuOld` is still not designed
for the usage of `RcuBox`. You're right that `RcuBox` is not an `Rcu<_>`
since `RcuBox` don't have the atomic pointer part, instead it relies
other atomic pointer operations to work (for example, the
rcu_dereference() in mtree_load()).

`RcuBox` represents an object pointed (and protected) by RCU.

`Rcu<_>` is an atomic pointer that maintains read and update for RCU, in
your usage, you don't need it because maple tree does that for you.

`RcuOld<_>` works with `Rcu<_>` to provide an API for users to decide
how to handle RCU reclaim. In Rcu + RcuOld design, RcuBox is just a Box
because these two pointer types handle reclaim + accesses.


We will need to use `Rcu` and `RcuOld` where the RCU access code is in
Rust.


I think there are similarities between `RcuOld` and `RcuBox`, but they
are sort of designed with different usages in mind, lemme think more..

Regards,
Boqun
 
> > synchronize_rcu() for cleanup - I need kfree_rcu().
> > 
> 
> That's something we can add later, for example, we can give `Rcu` (we
> can add the similar thing to `RcuOld`) a generic const like:
> 
>     struct Rcu<P, const ASYNC: u64 = 0>(..)
> 
> where Rcu<P, 0> use synchronize_rcu() and Rcu<P, 1> use kfree_rcu() or
> call_rcu() (once we have HasRcuHead support).
> 
> Regards,
> Boqun
> 
> > Alice
