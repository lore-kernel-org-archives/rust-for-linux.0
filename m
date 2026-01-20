Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E7E311967
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924885; cv=none; b=l3F7MGXrOpxmyx3hLCvCn3WMsVmUULin2qI3oxN67uHNJr3s9Uq6r027m4jDAQLeQt9sz2a9tHDB3/E3+1sY0XWdq0OX4M4aYZYB2Bnc6+otyxbEV1kdX3ISLOyFNp66m/Y5b5bujAm9BL9oWpMba7SMLTWHLQFxBjbSolj5uvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924885; c=relaxed/simple;
	bh=KEgCwIHV91V/HRggN5GK/V4JBaIXW7US9kJ8q/CbBhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uoZVcAN303Ti4IvH74BWFSJcNZGAS1EFDN3QiV2wBR8L8jgf+BgDPugWtblfBpsFmavzzDR973AOXkTj8/QvcbqoxB1bRAJJKBu4+moqMcWhSQiaGc93wN2IKDWq02g1vvP41A/UvI7OuulPoZtTZI/qJzKDgP55kOENHKeUd5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqOE/4zJ; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqOE/4zJ"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-40438a46d7cso3287167fac.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768924883; x=1769529683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyXouSFdgGvsNJv0Rfk+0bxHd/9nuw4emSyLP3jbzKo=;
        b=GqOE/4zJUaF7gLiRzufjybOMIwikkmDaarfet7YEEOxLGwW6Dm9QBX8CSwYZuT+vlA
         fkGZbQwW4e3wqlMT5uNdUpHjuQS2EHI80WVlnT5NXaCqLhqKht97shElY/CmkqjfNy+y
         MSA3+GQW0z6gN5cKGJF9+iCgYke9bRQZgwS4WUVoWE4hGRFgU5tnHquBqcYhsadoaESK
         Emn+QQcqy1HGgp2iLrlpfnq3LxdpgCvqcrSGQDonL3NnMX2IHezOghqiugZEGQxKUOTS
         8he4PZJHaU+uOasUADwtDKj3n05cyodKWIISigqdj0gulIaEeHoXF/lAtsjUZLyXiiyO
         8VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768924883; x=1769529683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyXouSFdgGvsNJv0Rfk+0bxHd/9nuw4emSyLP3jbzKo=;
        b=Rmulgt5ImOB5eKKxIRaNJV0Gc14/JxikkAYFNlOULlzNz2y3VO08KusPy6W2oZfNko
         E9JebUzxMd6mN9nLLFRHpaoV5U5R51p7olDZWBdnK3/lSNhndOSN/GYEkeqihidRHLxz
         23whn6OgWPnE+hctleObid/AdV543DLV7hK9AMaDs6L66pDEmFhq3pBZ1GCk0KUa9i1z
         D9ysM6gc/jjOntMokHBG6yaMY0YBSmvFZ5W11ylQu4XbMJRGnmzcmRecXIDmSTldKpdJ
         UERPDDYj0lsgUGSiQi4YGeF2GreD6XozzsHCTNxkjVV0hA2Fxlqbhj9paMiEjhaJzqNi
         x19w==
X-Forwarded-Encrypted: i=1; AJvYcCWx4yHyGiVhdkcVzYrP+0TOdKXy1SWhpHxQdQqHbUJL3mAhDuJCfzvi/QLm7r7cv+067F6wqF1sb9dAHmVdfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw78IsDBqFWW5lHVeDzVdaAzf5AaeQRTd53UnKTsuUplcLE78Kt
	CVZySGyHu+pmJdEEl7AIfhBJ2CmgBh2Jhqk1+3pSdBebP4jRGIjaWH/0ghaeqQ==
X-Gm-Gg: AZuq6aKQnf6mlKk5lIvgFA7+MHB9jPYLxdOrdEupu4nt8BTgr5/2N8v9zc9su/yg9CX
	Q+XlRbdhiSycBpP8nhAS/HYWjs4EYKYRj8Di19zYhADkGCxHHDTjffxVHjbriaDDT2Zy5sp4Rkb
	Zi1r+t+MM9CcoQ7OGlJnmPgKlC25HRkQGnLC0grfF2lICYOSKPylhQ0Rq1r6xL3v3lXp/jRkX7/
	dOJlhPfGg2ERSH11GD0TgksY+TTBzTZK4IrGCWo3CWyX1fp6kEaWrR3CIkl3qEm1gdleu/765Iq
	PdZmZge7JW1H+E9e5ivoPBaz2xRY+P0mptfjEieg29xTAwJlIMv059d+BUdYjq5X3DCvvX01Adj
	hT8/KfgzffVeBNyZZrN/8elOF9T3KI6HlTUZXYLsuLUGlsGiUhSyyANq+FVm8fLyEwhTVatAGLk
	M18dxxJqy/fW1cWWbqUOFYbnKgR/EscK6PK2THlzeulozO7pzoLJHX6oXQH5++4j7zDm3lb5Thm
	XCq5wPGU/+/qt23/UdBuXWzhQ==
X-Received: by 2002:a05:6830:6a12:b0:7c9:5bef:e9b with SMTP id 46e09a7af769-7cfdfe21e9dmr7501113a34.3.1768918029463;
        Tue, 20 Jan 2026 06:07:09 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf000b80sm8639228a34.0.2026.01.20.06.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:07:09 -0800 (PST)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id C6219F40069;
	Tue, 20 Jan 2026 09:07:06 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 20 Jan 2026 09:07:06 -0500
X-ME-Sender: <xms:CoxvaY8oGFFIjsu8VKC_elbc3tfGKNFNuBGzy2Ae6bR_lGVgAcAWew>
    <xme:Coxvaegb-qWiupOEhDACJxe3lxOtrDVIPdDZNgbNXMhBvT8TDP56N1ngEyOC26H4x
    39NmTwe55y0rEqMg3xQviZGSCwo2c_u7iff3u2079-aLNsLlAoUSw>
X-ME-Received: <xmr:Coxvae7QUmusPXsp-kQ5CF-0e0opzmYz3tGB-zeesBT4t9vFtmbKnTiW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedtieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdeh
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedviedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesgh
    hoohhglhgvrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsjhhorhhnfegpghhh
    sehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:CoxvaTbQOHCP5AjlX9Tu1ekoCkORdWJTGgV-JqeDd-v8HjCobjSzJA>
    <xmx:CoxvaTfiuYAh8RmJhLamF0Irw8DNXnPipxzx08bLbQnZlD6aZkSdYg>
    <xmx:CoxvaY6QnkPBKY6MSYKRCQjv7vDzXnK0wOZfPJ3YIfm6-pc465cd-w>
    <xmx:CoxvaXVmJfpjGmDFYp7EePz2aYDX65qrG0B0nrtJx8AvBAe9x-YTiA>
    <xmx:CoxvaXZ5JiTWCb-yfZUMKvLtdFa4jSNGq9jkbRH8R8ql1kf8Cc75gN0g>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 09:07:06 -0500 (EST)
Date: Tue, 20 Jan 2026 22:07:04 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH 4/5] rust: sync: atomic: Add Atomic<*mut T> support
Message-ID: <aW-MCLIk74gsDump@tardis-2.local>
References: <20260117122243.24404-1-boqun.feng@gmail.com>
 <20260117122243.24404-5-boqun.feng@gmail.com>
 <DFR0Z3KHYS62.37Y0R286DPTUQ@garyguo.net>
 <aWxfV4Y3fnNR0Kje@tardis-2.local>
 <aW9276jXCz0S-Ec6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW9276jXCz0S-Ec6@google.com>

On Tue, Jan 20, 2026 at 12:37:03PM +0000, Alice Ryhl wrote:
> On Sun, Jan 18, 2026 at 12:19:35PM +0800, Boqun Feng wrote:
> > On Sat, Jan 17, 2026 at 05:03:15PM +0000, Gary Guo wrote:
> > > On Sat Jan 17, 2026 at 12:22 PM GMT, Boqun Feng wrote:
> > > > +// SAFETY:
> > > > +//
> > > > +// - `*mut T` has the same size and alignment with `*const c_void`, and is round-trip
> > > > +//   transmutable to `*const c_void`.
> > > > +// - `*mut T` is safe to transfer between execution contexts. See the safety requirement of
> > > > +//   [`AtomicType`].
> > > > +unsafe impl<T: Sized> super::AtomicType for *mut T {
> > > > +    type Repr = *const c_void;
> > > > +}
> > > 
> > > How about *const T?
> > > 
> > 
> > In general I want to avoid const raw pointers since it provides very
> > little extra compared to mut raw pointers. For compiler optimization,
> > provenenace is more important than "const vs mut" modifier, for
> > dereference, it's unsafe anyway and users need to provide reasoning
> > (including knowing the provenance and other accesses may happen to the
> > same address), so I feel the type difference of "*const T" vs "*mut T"
> > doesn't do anything extra either.
> > 
> > Think about it, in Rust std, there are two pointer types only maps to
> > "*mut T": NonNull<T> (as_ptr() returns a `*mut T`) and AtomicPtr<T>
> > (as_ptr() returns a `*mut *mut T`). And there is no type like
> > NonNullConst<T> and AtomicConstPtr<T>. This is a lint to me that we may
> > not need to support `*const T` in most cases.
> > 
> > But maybe I'm missing something? If you have a good reason, we can
> > obviously add the support for `*const T`.
> 
> It was pretty inconvenient in:
> https://lore.kernel.org/all/20260117-upgrade-poll-v1-1-179437b7bd49@google.com/
> since I had to cast_mut() a bunch of places.
> 

Let's add it then ;-)

https://lore.kernel.org/rust-for-linux/20260120140503.62804-1-boqun.feng@gmail.com/

Regards,
Boqun

> Alice
