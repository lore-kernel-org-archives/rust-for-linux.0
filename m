Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC202749D2
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 16:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762793710; cv=none; b=g1fhuOsipKR6G+S+GDkoIEoqkk7cAWdoQYYy1QQGiaMVnVOvvjBC2uL93hFCm50kxpAzNBWuERiXNc4eiwQa4DEEr/gqHp1sKNarh6hUdqYqMCvGNxros0LRgCGEyRguYcgD3xrA4uokzMuoaJPeEjDKNJg9CqwCaII8zNit3NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762793710; c=relaxed/simple;
	bh=HFYJrZsr9xzWVSQ9suPVEYZ7d08HBGt2uf7bi6UK+eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQFVRt8EfkTuXiFJjGIBN0tP1YBBQDu2x0dfTnbJCBtZ33gtnV2IeCsiMCRIMmEQyMxWaI3k0hURfKYg2RhiDpmip6eXh7tiZD1or83cDj7FFX4D8/U2clJ362/b9KEcGLPlt8nG9ssqDXBvDlA5WlGCVtVDSCFV9dB8Pa0s19w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCIaxQ6d; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCIaxQ6d"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ed66b5abf7so36501301cf.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 08:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762793707; x=1763398507; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wDMGy1RdpJVYsGQp+D4GMs0rkcL2FniZ5qFgLaJnf/k=;
        b=SCIaxQ6d3EVnM+4O6SIrPxaXhfzQYpzH8NXCEWXAvEeuD1Zd2n32bw453F0YNjCKO2
         C6PaF/nd+YHnyjjvkmLE3Y+4sU9v9GLGdIDmCJXobI5OIPnCLFvrkD60m9RK4xBDL0Kw
         9BIvsZy0yh2RiNTGof+Ic2Gql9e5/9V6E3+9xNkgZsC0rYeLgnm2xH2m+tZtMrp5MeoX
         uybltqLD4pGrpWIQWV1wxsFYPip1bxNLXV3q1UmBwGAQZt/O90c59Lpm+sLy4rK/Dciu
         RtYJFPzgpP35vt9qPoEDXkKZl+fLfe2nGCfH68s5ItzczXyPelc+Y0opJcKX5m+Pdrum
         WQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762793707; x=1763398507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDMGy1RdpJVYsGQp+D4GMs0rkcL2FniZ5qFgLaJnf/k=;
        b=oK9kTJ53zknHtSKp4yXJXbr1XhBIMON8UNaOhuQy0/s2jvH5zRLS+VHLEY6LU5yk2u
         xbWJSXtNo4CotpsqW607d4+kgk5a2Joa8sClfR3irexBjoOY6MY3uvft16fyNczmN1rB
         0p3Tuz9/DhES2NJuHUu4qtNbQ+lwD2Hr8+tkYE+9/6Qi0EH7BJBI8tGPYdm4F/GxX8R1
         AYvrVT3h01PupHbTOL//3DCh/xkpMl1BTIySe5e3Ce5Lt83lFcSTj4BLXzhGR0bjqxFe
         Kpq4AO3z/xf1QSXnB+FaZOWZXszGrL7dwwhziHwNmS6t2qrHjTPpnKeAnIjD416tKyWI
         Okuw==
X-Forwarded-Encrypted: i=1; AJvYcCVDpPdqaReU3zr0Nyvtt+xbke2YWYWtlSk20I7dPCijhDxbrI7Nn1+wM/losNdXS1f54UKR8J1aLBQ5ktfW8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwMymxFZnaTHHBDZ6FPCT+6NhuQ8QOrRvdtCohbS7/D5bE6wB7
	Gb3wTQ0l8GM1GzAGrvW6aJp3dnAddQeFJ6EgF9bHj5mR8k56YzWaVQCsJ9wdlg==
X-Gm-Gg: ASbGncuheU77jdg7Sw4X77hxdlzQShvLE9yp3JDT+5aUTomcTOXlft0NTQPRy/XFuCa
	glbZbVvUq8VR/SrwFFM1wteq5+N3OBiyxzIsRXjf25bsDJTw4yP4iIiKyVmKLfaHi2w4HQQY6pn
	nPZ+n/HcGqGXlvkn4++mLJaypFz5OrSYBsAwjwuWpFV4ZnQc0GKQfe2/JcCWXFQb3IAQjUSYyG9
	TvRJSTewvFOLwrnJyz0qBKRznEge6iK5CqsGK3ETlF8Fe7aQKSW5lOXtmXA2RaJAsB957fVPjuG
	U8iFf4gsiAUBwaYPNJME0iYzhIf64OxY/A1xWT/dBgsjsmBI925tghtsHM6RUXcN3yw9uPpShJr
	+uqLgBmVRW5ZELzmP0ZaHlbFWzIPXjv8QhNpFNDeOpBxJs4GjT5tWgD3Nan8NEiB2QM2Xm5FO8i
	9r16V5q711fQTexctGPIYfc+2XB/yrlF3OjlIiru5V9LCnYEQpPik5ANRw8NnAche0MbZZGzSAh
	1Ua
X-Google-Smtp-Source: AGHT+IF8cKsMqnVoMlvIJ5yS0nvzhu4ffxHBu12nBTGTsRTuWgeEgK4sadQuHeySX8B1fD/BJ+iIcw==
X-Received: by 2002:ac8:5783:0:b0:4ec:ee54:b141 with SMTP id d75a77b69052e-4edcab4dafamr636931cf.26.1762793707519;
        Mon, 10 Nov 2025 08:55:07 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88238b8520bsm54985356d6.50.2025.11.10.08.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:55:07 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 77ABCF4006A;
	Mon, 10 Nov 2025 11:55:06 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 10 Nov 2025 11:55:06 -0500
X-ME-Sender: <xms:6hgSaYa7hVmxCsvRZxy7iPQILq38Tt0Wd5QTWNXlPZW1mOb6bidvEg>
    <xme:6hgSaXx1RCBfeDA4LFjUZ9E4qJiMqpySh84cTBher_E74dQZocSt1HKPMoMf5UeoZ
    xdCGtxku7rP4wRp0sGEqZcnIz9T9QLh7A9x8RdXkDqy0H1ziU7ihQ>
X-ME-Received: <xmr:6hgSaQ2rsUeYqcJMJSvz4R8BUooAHNPxRi78dFhu7HWc1A19TE3itUS8RXtVubhx_n7bi4LnvD5cy7uri1cgK4qEsel7ka-F>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduleekkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
    htvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfhgfehgeekkeeigfdukefhgfeg
    leefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
    hoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieeg
    qddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigi
    hmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepmhhighhuvghlrdhojhgvuggrrdhsrghnughonhhishesghhmrghilhdrtg
    homhdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhm
    pdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoh
    eprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggr
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonh
    hmrghilhdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhoshhsihhnse
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:6hgSaQkZ2mLX_wt1vCuA4U9JLO9wd-iBHUIJIa6zF4KP9mF1ZAAJOg>
    <xmx:6hgSaX-QpRZArZbwJQGgLuxnk2p3usGxZ7NQ0kpRfielgkeVBPuukA>
    <xmx:6hgSaeKt_YSgZn0XZ0NeMLwGgcDzmFzPzzAsUcumWeNeRbxyHTCOdQ>
    <xmx:6hgSaciT_iTf60CJVs5R4X4pk9KBFvOOlOT3927jvCu3CbeSyapv7w>
    <xmx:6hgSaa-9eqI6Atd4E0UaVNq0e6XXJAy8T3iFN9DgwYRArym-w9jXdjpc>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Nov 2025 11:55:05 -0500 (EST)
Date: Mon, 10 Nov 2025 08:55:04 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com,
	a.hindborg@kernel.org, ojeda@kernel.org, bjorn3_gh@protonmail.com,
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly
 once
Message-ID: <aRIY6Pc--rlrJuCN@tardis.local>
References: <20251106.091026.1308953895982406095.fujita.tomonori@gmail.com>
 <aQy0zxs53EAnntwR@tardis.local>
 <aQ21xajAygTbi582@google.com>
 <20251110.182150.1392834304602894143.fujita.tomonori@gmail.com>
 <aRIPgOPvi4uhGQcM@tardis.local>
 <CANiq72=REF4mdB=g45c=eB7G6ocGa5Qf4PhqD4zbwrbCP6N=XA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=REF4mdB=g45c=eB7G6ocGa5Qf4PhqD4zbwrbCP6N=XA@mail.gmail.com>

On Mon, Nov 10, 2025 at 05:37:17PM +0100, Miguel Ojeda wrote:
> On Mon, Nov 10, 2025 at 5:15 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> >         // ORDERING: Relaxed is fine because we don't expect
> >         // synchronization here.
> >         let old = self.init.xchg(1, Relaxed);
> 
> Meta-comment: I like these `// ORDERING: ...` comments -- I will add
> them to the other ones we are getting implemented in Clippy (`//
> PANIC: ...`, `// CAST: ...`), i.e. we can request them when calling
> certain methods.
> 

That's very good.

We do have a soft(?) rule about commenting the usage of memory barriers
in kernel. So enforcing "ORDERING" comments seems good to me.

Regards,
Boqun

> Well, unless you think it is a bad idea for some reason -- I guess in
> some cases they may be obvious, but just like `unsafe`, even "obvious"
> ones may not be as obvious as one may initially think... :)
> 
> Cheers,
> Miguel
