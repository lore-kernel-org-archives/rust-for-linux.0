Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A625727A907
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 15:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354838; cv=none; b=SxrfFluZU42EyJTWZKv/KXaL4hkLy4JeTbDR1hpjqQtIdF1zDx+yeTw2InRXusmjn/DrASVTC5tZ3kjfQWdW7sGyP4gbsYmgRlgT4QmhWv+5CEI9C9D4Gkh7cO67nnF3QBWc+FJyrPThC2qBG+xDn9Wbl+vlBceDIsGjjbZyKcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354838; c=relaxed/simple;
	bh=i0LliBZZvCPjfGdcNIN3FJXdmIkOx2DHqsgOD50iyF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mq+ngEvkBa7/r5OkMrqeF0zA6sQ/pdG2RDZMkFYU5RmH1Ept4m4iDqkFP6Q9xWeljGuY4Q+Wf2UFPbbFs5EtePVYGeCA1ceJ1ZECAKN8MaPhYCQcHv7MY6gXf12LAht7HDHRSGim9Jzcb9LPgadoyzP2uZ//rQbWg6h/xr+Iqz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbN7AQOw; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbN7AQOw"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-888bd3bd639so53774576d6.1
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 07:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769354836; x=1769959636; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yy7k14o1sWbjI231i5MKZYrUy+zJJVej7vuLZUeWjds=;
        b=ZbN7AQOweyAszxTLHXlbmEgtcG79ieAGSwX021Wwdzs+h8rJb/TKkJ1wqtHRAC9bf0
         LIYd86HDBRty3w0jA8nDd7niZs85afiyIGaPaKVnAl9eHprIuUzPcGl5WLfYTbnW6g1C
         4yDAFuMPKiBe7KmxBTQBrQJDb5kkx1vLuYZ9mooTgctxWJFV4cw6/slF2NNQ/HXblPI4
         ZLAb1+eUCbgiETZbEcBz/zO4S7+Eca/P/9RrwchqzllEVsuIRM9w/Z6pXDiXk1/Ll04K
         zQaOP5jo58OakTj2ROjJmIdkXS8w8VF41rqA5GPZLUwcK71M2Tpo/hFOxdBuRIMAaV88
         wb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769354836; x=1769959636;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yy7k14o1sWbjI231i5MKZYrUy+zJJVej7vuLZUeWjds=;
        b=dHOHcttQcCGHMTAgsEsQdJdUs29gohzO2gZwkzZQm7ZSiIRgLR5nGYxIx4T0e7F3Kc
         FzBlLDR/Zxn9e9ZoGOY+lxJYJV9xTQN9GnSmZiGZ30e6xGFy1WP9LiMbLpqP8ADDoYyy
         tIoFTvRYSuLekLO7SXLPxfu/SMuZ2oljT6qdnkLUompTP7mJqW7aLna1bg5FqlhDrZce
         iNIoFltvsmpDdftNWjMJlmVuRnxPTfCCWNVMlX1NKFBn+ftvLmCYfITVz+fgx9AwnMA/
         Hoc727b3/3qwmfHEvKmY5bN1/KWSHs0ltQyS+jgf0IT4YEXcwgA7cya+QwsNQIIlkTNb
         2Tew==
X-Forwarded-Encrypted: i=1; AJvYcCVbngmNKPR6kMYfDl3V77odmNcOH1tOs94MhP/2L4IZ2+SCc61HEfNHeuXCNLxjhin46U2CqdS6RWeL64rwdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm0mODPDjhg3Nu+fl06KSCFir4Ww+E97b0Bn4FRRpYXZF5JH7p
	M7E3N7ovp0Aopf8QWJuW96OkHPCLpohej4w/N9bQCfDpddj+dREnCB3V
X-Gm-Gg: AZuq6aJ1NaljS5K1nxWXaP40Bovzv9TQBULDGmU+uTQ71cSeqoSC4Zs82dYSsuUY5xI
	emh71/w7JSm03mVzW7dkppTABLaDPZ/dSCf9xG+7d56x9RQSylgPcfq5UhWfeA69+NM1+GLqyAj
	jqbNYKpyP2l2Z2bd6Ws7tkXv3XoDTXvaUUHKSiQ73LB/Wt6EPE3riKyHi2BGZvUZoFtaNhfEBLZ
	3HYRGKO5ypaKra4p0x5uk68PjsrtypEFlLscNh8AF1ffnrYjHl4CeEvHec1hx+6qrfw3DcwUeMe
	/537kC7j2VE5Kh9tV8Bzdq11R1Jo3Vqq2LOi5GAR4OWYHwxopJuCI+htiiP+oXMS7i+9AJtBu6p
	sgWtVOnj4WbdAuRAs1TP7qb65JAItts8n2UhsC0c6uqntfUJv87qnl8GB+dyrZkHHTCUWnFptXg
	XndxPmXFxjSStp88dTjABMgRcOFDYQLT0/TV5o8QgHTAs7Ovc4dv7E4JapcgQE5tQkXIXchJJB4
	ixSEAQWSM+shgQ=
X-Received: by 2002:a05:6214:1d26:b0:880:4548:a059 with SMTP id 6a1803df08f44-894b0418081mr24338246d6.15.1769354835571;
        Sun, 25 Jan 2026 07:27:15 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894991b796dsm56027646d6.27.2026.01.25.07.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 07:27:15 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id A35DFF40074;
	Sun, 25 Jan 2026 10:27:14 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 25 Jan 2026 10:27:14 -0500
X-ME-Sender: <xms:UjZ2aXIdlafNbsFv7uIl2EzKsPGZfp6km7cozHhMyNYQqeeaIPUuCQ>
    <xme:UjZ2aQtVvQfu1VxdPU0JgSCnQ-TKQhCFIIVoIJk3tWLizyq1eMrXnh6BXhkFu-QRh
    VQcfi9N50gGnyco1qSM9S3XluF20IpBjNWhfKRzZX-2FyZ0CxpRI8c>
X-ME-Received: <xmr:UjZ2aZSfemoDwucozWA87diosF9LzxM7W5B3tZIZ1QKi0gQQKnZ_7FATtwEXmvKt3T9NrHG17dU765hFh0EixUoN1d7K_y73>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheehudehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
    htvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfhgfehgeekkeeigfdukefhgfeg
    leefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
    hoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieeg
    qddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigi
    hmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepmhhighhuvghlrdhojhgvuggrrdhsrghnughonhhishesghhmrghilhdrtg
    homhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeif
    ihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhm
    pdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghj
    ohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsih
    hnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:UjZ2aRQoi9Xx3X7HWxCIdQLfPpXWrcneAjQJHfvuMooZaX4WKXAs0Q>
    <xmx:UjZ2aVokrrIITzV3c6KfKNUV1u2A9Dz2Ms7652yMTxzTK-49_FKN_g>
    <xmx:UjZ2aRCiLOkGHoTbipZtFrq6qlCCIx8nj6S7J885MIBp9cGfJndajQ>
    <xmx:UjZ2aaueWniyVlrnT2CsC-93DGCUvECQjkwnofxnVNXZ-84IH0blcg>
    <xmx:UjZ2aQav_3RMslONRi1PCX9P822_GMm8ElqAQ8Scpz2b_3atIPgt7A44>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 Jan 2026 10:27:13 -0500 (EST)
Date: Sun, 25 Jan 2026 07:27:12 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rust: sync: atomic: Provide stub for `rusttest` 32-bit
 hosts
Message-ID: <aXY2UNZAcIdqCxYa@tardis.local>
References: <20260123233432.22703-1-ojeda@kernel.org>
 <CANiq72no9wwdXa0Ct0c0P+6+_4WhBZ3GChTFHth8EeuCFSzAOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72no9wwdXa0Ct0c0P+6+_4WhBZ3GChTFHth8EeuCFSzAOQ@mail.gmail.com>

On Sun, Jan 25, 2026 at 03:23:45PM +0100, Miguel Ojeda wrote:
> On Sat, Jan 24, 2026 at 12:35 AM Miguel Ojeda <ojeda@kernel.org> wrote:
> >
> > For arm32, on a x86_64 builder, running the `rusttest` target yields:
> >
> >     error[E0080]: evaluation of constant value failed
> >       --> rust/kernel/static_assert.rs:37:23
> >        |
> >     37 |         const _: () = ::core::assert!($condition $(,$arg)?);
> >        |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ the evaluated program panicked at 'assertion failed: size_of::<isize>() == size_of::<isize_atomic_repr>()', rust/kernel/sync/atomic/predefine.rs:68:1
> >        |
> >       ::: rust/kernel/sync/atomic/predefine.rs:68:1
> >        |
> >     68 | static_assert!(size_of::<isize>() == size_of::<isize_atomic_repr>());
> >        | -------------------------------------------------------------------- in this macro invocation
> >        |
> >        = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
> >
> > The reason is that `rusttest` runs on the host, so for e.g. a x86_64
> > builder `isize` is 64 bits but it is not a `CONFIG_64BIT` build.
> >
> > Fix it by providing a stub for `rusttest` as usual.
> >
> > Fixes: 84c6d36bcaf9 ("rust: sync: atomic: Add Atomic<{usize,isize}>")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Boqun et al.: in case it helps, I will send a fixes PR early this
> week, so if you happen to want me to pick this one up with the rest,

Thank you, that'll be great!

Acked-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> please let me know.
> 
> Cheers,
> Miguel
