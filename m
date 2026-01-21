Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FC23E9F90
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001253; cv=none; b=dWqh9FZMiHdlOsm7/gM+TGhETW4y4rg7rMfcvd9mSL6E1/pFVCM78LXd5V//Mw6Yhq0prIBWsg13bA37x/mSN5vB3y+BC7dGULwGLZQ6VxluvY1yIlMeC1z2UcEwMtXePJhDwq5Kq8pSsqDaqSFV4ITIES3FSmP/eJa1ruoliKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001253; c=relaxed/simple;
	bh=IeAeLFBrBEZGsR6NOogYV7pmwtcHYu0XB/ofvHW411o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2OVXJf/QT0jTCOGNNumtNVUHmYQR0pNZ9fO0pbiIQh0EtrAzcPh5++lrEpb8bioRhU3jBdNAn3XLcv+Li6TwNIt/bq5Ptdr0BN/ExHZiIe+lWaXxcgn7cTqRB9XetQFS9rRv5zEYvr3sKwAOqVKOc+RtJLkDi32B2NbxAKquUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnFc/D7W; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnFc/D7W"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50145d27b4cso67811911cf.2
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 05:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769001250; x=1769606050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HQDkqfe8wWRgLYxMvvzfKdW4MZONwsks3Mx1gvqFM4=;
        b=OnFc/D7Wjm35O4fqBza+uRWnYjZ58ZIMKAEyXbGfJvi20qrJ9qxBSdjtkZNMA2IbLM
         bsHoPQXMz2EAjSoAAwG21HWvU++YQtYBo6lHkH3dNODwOaxi6bPusc6cBDvPwvZUbYx3
         puJnj0RI+2vw+IZEuKHUpyfa4FDY8/ykK3b5z8SUpFlplFZs789rdpgUkoNHQFpo1xa6
         2nSTqalmL9zTokFuNbz0XwJ7Agl4iDD6LhizvSDVY697896Wbut4/0SSy7zyLcHz7bqR
         ydZEHAxZ1rCF+BGD2opfj4JzKVln6Oc5/G/RLHTbKLlr/vJTa/m3tcYqcvQ6zAEBikJ9
         vI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769001250; x=1769606050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/HQDkqfe8wWRgLYxMvvzfKdW4MZONwsks3Mx1gvqFM4=;
        b=HKI1kNYynf6rvbZUQf7tpBVWG6Es6XfbUNtX77lfXvxovgCEicAtffSi19kX1A53CW
         XfL22CzbYJeV6vTWZbA/TSnmfGu8QHw86bK0Cn1toWNsccC5WjHuuG4WmVoPUtr1bjMw
         rY5sKwYdlSdFY6FNocgQRA2JlIByUUW1Zqt3UsuIKQtgoSns8YiW3Qw49cj1xtowAvaH
         1YY3CdmlvGduBFp3Fkc//O2DwlWZVq6GL2cBEUhl/DMmDuMsNONb4JS2ehPaSWZHnt8H
         StV5F7WY38rhAGsewaAEtKvMAGia4XutMdRW3Rd8us0V8poEGTtaG5wwbW+XKQcT+XQj
         Lm0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvks8ED5PW4z0YaIUDQafSdi359GM0WtaySpy5D2QrMmZEq5vUwHqWnhebrzBVeO9gg3f0xCHgb+DR6uHTtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn6LPe3ACSwU8vy4TovdePQ1QHsVKWue1u0Ol6LdcFZcrMui1F
	dsLrGYdZUwXE3jjSEJFIcxFX5VSaR7fQ6q5e2oIHmtaHZKNCHDCxpxha
X-Gm-Gg: AZuq6aLEAkLcpRMSOLPCBJQpi0McbMEkjMR6t21P3mA0fT0MnBOrxsuLoGtrp4ibwcd
	MXBZpWZop81SNhbDyEVbIJO7tvI4ymEZtFtcywuSDE324Ss6BWEU+0z7ZQFrwgwc4Q2syy2EXa5
	SB9zGNSB1DkBt7hOK+u2doDkei/yh4fUvwOR4gk0vGbTLzt76oL3QeXdAMzNJtq4nH9LbNj6gE4
	o4k5abOTFK+CqI3Wh9fPb4gNQjt7WWDehH98DvAjqQekw0hoi6U/ZSeYyj5++AVWszDqeBV0aI1
	wCyp8A0YFVKKKXVP6mcL0NfZ5VSoKbDCB4xZyzRl5A+jbkVMfqp4k/z/UM3IWiWAuaeoJN41FlU
	84gPBcHhUZRRNef+zRp9pD7zcuwai8p97qfasdrz7OsoWSghwuGRhD2X7hkEGeK2b7EBl9i+H06
	Slzq1ymKgyEWJj9bDxuUSIPIa72f4Cw5HoNt5tjlW3tBF3IbulMdd5UdKoniNKSo8Wf5wvVhB9F
	i7R96UMiNOG5ygKh52lx8amRQ==
X-Received: by 2002:a05:622a:1805:b0:502:99c9:591e with SMTP id d75a77b69052e-502a16b3a66mr243793681cf.38.1769001250090;
        Wed, 21 Jan 2026 05:14:10 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d7302sm124098106d6.52.2026.01.21.05.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:14:09 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 007D7F4006A;
	Wed, 21 Jan 2026 08:14:08 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 21 Jan 2026 08:14:08 -0500
X-ME-Sender: <xms:H9FwaT6QxyGAbq02ztxJgwthcxj-ep_vFFW8_qF2wco0e4hYfosIrA>
    <xme:H9FwaYydmotzjXwsBUcX6kWw0iV39_Nra-amxLAv0A-EdzQtYcGVTdf1uTgyE7kMj
    saWb_ykwgUSto98MXuuGUCD_0gG265YL5-hO5QETwbsIsEvJ89GFg>
X-ME-Received: <xmr:H9FwaXzjSFalaBqzn87ia9lgR2N1Yjf6YsJbPNhNut2FR_T3301XFWvV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeffeejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:H9FwaQX7al9e38e0O4NKXddNLn6d0hY0fH7ac6s5kq4fAM9xS95MgQ>
    <xmx:H9FwaUQ0N7NkeFHXrrQP4GyjuAwAU8USNw8_M8eIFD5eIKZokc9DEQ>
    <xmx:H9FwafOeAGHKVYy0YYU9_ShbhoA_0ueMN1XMwgzhM-NefIgXik-fCA>
    <xmx:H9FwaRy7ZjxD4UfFdS50NZ1LDTQwyTyiVe4znAPnA0ykVvCAKArP4w>
    <xmx:H9FwaZpr7TPPcyL4pbNxYn9iVeS9_3-cX7zxPcbmzoj4Te_-qU8Q1HyI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 08:14:07 -0500 (EST)
Date: Wed, 21 Jan 2026 21:14:05 +0800
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
Message-ID: <aXDRHerRiM7TzACy@tardis-2.local>
References: <20260116-rcu-box-v1-0-38ebfbcd53f0@google.com>
 <aWrSkAPFkdH_tvtN@tardis-2.local>
 <aWt4muGXbe7lBmXt@google.com>
 <aWt8Ze-otTkexNIe@tardis-2.local>
 <aWuKqLERqpNz9qtz@google.com>
 <aWuV858wU3MeYeaX@tardis-2.local>
 <aXDCTvyneWOeok2L@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXDCTvyneWOeok2L@google.com>

On Wed, Jan 21, 2026 at 12:10:54PM +0000, Alice Ryhl wrote:
> On Sat, Jan 17, 2026 at 10:00:19PM +0800, Boqun Feng wrote:
> > On Sat, Jan 17, 2026 at 01:12:08PM +0000, Alice Ryhl wrote:
> > [...]
> > > > > 1) "relaxed atomic" does not sound like something that provides an
> > > > >    address dependency to me.
> > > > 
> > > > If you look at rcu_dereference(), it's a READ_ONCE(), which is the same
> > > > as a relaxed atomic load, and yes in LKMM, relaxed atomic load provides
> > > > address dependency (Please see the DEPENDENCY part in
> > > > tools/memory-model/Documentation/explanation.txt).
> > > 
> > > You argued that we should rename READ_ONCE() to atomic load on that
> > > other patch series because "atomic load" naming is better than what LKMM
> > > normally uses. Fine, but relaxed atomic load is a much worse name than
> > 
> > To be clear, in that series, my argument was not about naming, it's
> > about READ_ONCE() being more powerful than atomic load (no, not because
> > of address dependency, they are the same on that, it's because of the
> > behaviors of them regarding a current access on the same memory
> > location), and we want user to specify the intention more clearly.
> 
> Expressing intent more clearly is fine with me. I still think it's weird
> for us to not have READ_ONCE() when it's a primitive operation of our
> memory model, though.
> 

But in our memory model, it's exact the same as atomic_read() (see
tools/memory-model/linux-kernel.def and search for "atomic_read"), so
why do we want to have both? ;-)

> And I also think we should consider using an implementation along the
> lines of what I shared for our atomic_load() or READ_ONCE() or whatever
> you wish to call it. The perf impact of helpers makes me sad.
> 

I'm not totally against that, it'll actually help Atomic as well, I also
hope that we can use `asm!()` to implement the cases where
`{read,write}_volatile()` cannot cover. However currently I would rely
on helper inlining to resolve this to avoid duplicate implementations.

> > > READ_ONCE() if what you want to convey is "has address dependency".
> > > That's not what "relaxed" means!
> > > 
> > 
> > Also note that my previous reply was explaining why we don't need to
> > call rcu_dereference() from Rust, because implementation-wise the
> > LKMM relaxed atomic load provides the address dependency. Depending on
> > what we want to do, we can limit this address dependency only to
> > rcu_dereference() and make it a special case, this means we disallow the
> > address dependency provided by the "relaxed" in normal cases. Or we can
> > add a Consume ordering (a type alias to Relaxed) that makes user to
> > explicitly use it when they rely on the address dependency. I think
> > either would resolve your concern about the name of "relaxed".
> 
> Yes, I suppose that would resolve my concern about the name.
> 
> Well, I do have one partial concern there, which is that the wrong name
> will show up in stack traces as long as helpers are used.
> 

I think it won't be a problem since in LKMM, atomic_read() and
READ_ONCE() are identical.

Regards,
Boqun

> > > I suppose you can argue that the word "relaxed" means different things
> > > in LKMM than it does elsewhere, but I looked over the doc you mentioned,
> > > and there the LKMM calls said operation READ_ONCE(). The word "relaxed"
> > > does not appear even once. If we're going to change terminology / use
> > > new terminology, let's at least pick terminology that's not
> > > contradictory with the rest of the world.
> > > 
[...]
