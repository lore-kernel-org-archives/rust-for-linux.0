Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527591;
	b=KCjG8BWqM/XHv3sfxDQscPllqDK2UdCtCAKyospl68AeYv0UbWjW7r0Ub3jYdjJoKe7O
	 WzMEMoLXxrw/tuGowSwTcawP+2lATWo6f8DliDyIrsrctHg9FW409f0WBz2OamHV0KPpV
	 SeYXmuDun0Z4SYmllcfSC36+2+UvY2bPKeHsLXm2ZBdMh7ZOpmVyr5aRe6A4X4SCO9pt5
	 zUz8ex9/sGUFqbd5sd0tWgoQy63eo8/b6FrccqO2p+/09R4NzYbQTFsroP58wNBAN6W/d
	 bjSzUcJvX+7yBEIhEIB1gIYqxcx6+DCjXV/w0CRHUy8JbNn9imnUSG9mZGWGRcnRHvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527591;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FFPocmiYjY4uBN7YtxnCPmj3gxT6Y3NraGib0JuLZOA=;
	b=aGRZzFkSy/nAAFeNSWOCvUvnrEZzZ1kmuXnrKIFp6KCShsMPywDSUscPA0YE05OVirYc
	 KODvmtk6V9MywNIfvk7w3m5g2xR4TMYt0elz61Z5Fm1+hBAKjqZ6n7xUb6GWZs+aFx7zF
	 S6ijUe8GIIsNlXwRCukz152ZBCmApBr5IAMpXpCAefbd5vIlU/rIpcAZwGXo001Spfyof
	 5hs9gzjQZR4dQIOlk2LxvXNE5r1OELlgLbTWCBJvjqsxhMfu3BGTp2zstkNoTe9vv77yb
	 v94+lIaFEUXeobr/0GiigdXrheZEzcvl+OK6pgONjVfd2KzQUb3/hE/8gmWy531C1og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b="3u8FKVI/";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="by/oM2OY";
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429D5606A322
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 13:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 429D5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=3u8FKVI/;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=by/oM2OY
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 592BB1D0057C
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 08:39:49 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 24 Nov 2026 08:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1795527586; x=1795613986; bh=FFPocmiYjY
	4uBN7YtxnCPmj3gxT6Y3NraGib0JuLZOA=; b=3u8FKVI/enGiX4SpeOpEBmpEvX
	aBv8TvMxxzF4btN9FAYKThFHiu7X7N0FZR+cqUl8jyMkts9nZbxT+1e2+oKcJASc
	C8Zwd8cganVwj2OSt7VKiqWX5gKKUfKk87Hd9Lcwe2yqlyAsFKcCgqAqI98UIqL2
	2Spk3c0nkJhVTCcOkact54bH/2t16sdZCE/+P1BxhiIbxI+LmX4XVLl2AkJbvtBJ
	14cN0o8Idi8wgkCDgMD7o1na/dnGVZpXvUad7F4Itow13I0vmPjomIrE9clQIHMl
	dmIOXDWcIbfrhRGEyj3+K3ffDpS5K63GwT+E5dJx6Pect6KfjMf7qNXq42/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795527586; x=1795613986; bh=FFPocmiYjY4uBN7YtxnCPmj3gxT6Y3NraGi
	b0JuLZOA=; b=by/oM2OYQLK45eJq48XUNA1hX//hn3i5lbtoZY8KzPP9lcQxzgA
	e8W6F0880h/IxZNfg5BPLXhps1JS/5Ik8+GbsLQJMA8JFqU2fPTLuUzUfpMZEBy4
	1dlpnBLyTjK9g0AkM0WguaQiy9GGL8CMwVcT07NW0fc/Sqbme4Mh2ZO3f9Yt8Hd4
	MF+YmSZ9Jy67iJGfcuq/Dcs3Thv+vSnR8EjCnNbLsMIjkHd8je344Acu5IowkKxu
	Qgu7Qo63a5tnRjGS2VLfR+3nf7LlBL1+bmlJIsSt4Tqrf7VBiJr6xZ1ohCbjo1n0
	tHpQsVOQfjvjllYu5MQdVRmSL8169nN5fzQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795527586; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:vCdnd3xkY4BXNccBvbPIM20UL/z44hurEFeLBPL/Lfm4aX/
	G5xWec9WUy4LxOIvCxgsQ/LfvBWEJ/3Lq5f1UA2r6BPtcbRoy8p5e6EX8CYunZ2o
	fu3Q8zUwqDQuOVlIB985BMLk5mhgSXPb1TKwJic8phMx08juBnnFMvjDJBW3uFZb
	Yph+E3aCR7kHJIclnw/0e6ajkYCLp9uMT+3FquL/yoLtScsj1QkWjvi4/oqfzWFy
	r1Z/JBiRnIvl2mR2B/VjBFRY0PfhGkFboSH618LVWaMLbrwBqzRQPmtbYtqf950o
	SLpjjcK4xjSDw+4WBf8I0B+Cu0wCTUJSNoJKpxQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:+4ev4b6mxHnY25pdL20Nn41AxB3DfsjG2hFal/APdjM=:tuy7Q02L8EFGyAlb/RTajzDppwDejqGxKUsvjdBdGZs=;
X-ME-Sender: <xms:oZMFa67Ho0y6HXBSX3CJ2MosLcdKnQNDtwBPM34ltRrNfKhN7U5ToQ>
    <xme:oZMFa0Ug99pQyk5vvOOlsG6_V6eA4JzUhQirf0oGqfG0DfKnz9a34KSQdOkyh2A04
    3NXgCkjakrjmFwKBjYjdS-9PaPX6dxzIM9Bb-dXpS0k81ApSqU9Sog>
X-ME-Received: <xmr:oZMFa-7-kKzbsnjcJzV12ts_etvG3AxNbq7EAl-5vHGUs9sEsQf6RYrUjjz0xtfL1NbXtQlJvBMokCmJWRQIwrUqQHwkdpANxww>
X-ME-Proxy-Cause: dmFkZTESlBZ1BuWOe+JmUTVOFojllnFIlNcYBew5u3AEO/m5xTCbKEeFkRQF7OGVf/tX8T
    h/i9V7vfl+JMtQsvzqaD6jIwjRZ10u9k+PQYJC6AFKCtkCtwZuvqe5uDKGokPJylK4JKE7
    5nr4nOwn2m+UvTgT3l/15tMjM9IY8d4FwGd8NCK3NTpUv4186uhiAY3yrCk4autrjnKz9a
    qvREk+HSNuOK+UuyioWs8kYmt0XK8u5JbsuhHng1mHLFw78Nh6lrSdYQdign+ZCgIl+E+Q
    Ix3UENuWSWr9uY5l0yTToy1m0Gt30AKG9WklczbCNa59q6Tq6x8agtI+ZUvictJGlQYirB
    YLtmw3d2wtCb8oRlublfJ7zK/GEHEdwqHPSaOfeA0neCJaSquWzKyeTFIb6r7FcAU6etuh
    hNv1qIakJip8Xje33U6cLveSeSTufTRPV7cLpWSMKpB1apaUuxHFVFIRQs6ge0YKAXjHo/
    xxYbhJOBhYORFfvX8d6IX2cYHbb2ziSRg8dl2f5955xyUUPgH8jQnLfk3lzz9PutsvXC9v
    FGTFKYurFsyi7tEySux1IQpsn6xypNA4ZXS0JozfRqenLXQsUqcpxdAVQOoHJ7u6asIlqV
    xbVFz9L1Q2613VDJgHo5+dN9WbOD6oWExzCW2dCM218Ra0EHhTOrRyyILhYA
X-ME-Proxy: <xmx:oZMFa1G2ZjzOevGieoPIWUTRsyuZloqzmaMkNKT1EVyiymEZ1gt8eg>
    <xmx:oZMFax_f60edb8Y9k9tqrQdbmhOWIDFcbtRAdsTgiuVpHoxmO4sYew>
    <xmx:oZMFa3XhQDLyVB9KS1UzXyhgsNEcnVJa5rg0vg6OZtJBLmYEaf3Itg>
    <xmx:oZMFazECzWRr2ZG51ct7gAEukGErUWyrRpkr0Iwpzn8SIbbiYoZOMg>
    <xmx:opMFayrjv0nTLBIJkDe51obopTxGaE3jeJFYxqhPnmyhlZfod7IFXooO>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 08:39:45 -0500 (EST)
Date: Tue, 24 Nov 2026 14:39:43 +0100
From: Janne Grunau <j@jannau.net>
To: peder.bergan@gmail.com
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: Re: [PATCH] rust: drm: enable standard fdinfo for Rust drivers
Message-ID: <20261124133943.GA372978@robin.jannau.net>
References: <20261119-fix-drm-rust-fdinfo-v1-1-c10f4134488d@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119-fix-drm-rust-fdinfo-v1-1-c10f4134488d@gmail.com>

On Thu, Nov 19, 2026 at 10:48:47AM +0100, Peder Bergan via B4 Relay wrote:
> From: Peder Bergan <peder.bergan@gmail.com>
> 
> DRM monitoring tools use drm-driver and drm-client-id in procfs fdinfo
> to identify DRM clients. The common Rust DRM file operations leave
> show_fdinfo unset, so these entries are missing for those clients.
> 
> Set show_fdinfo to drm_show_fdinfo. The DRM core helper emits the
> standard client information and calls the separate driver statistics
> hook if the driver provides one.

None of the drivers (upstream and out of tree) set
drm_driver.show_fdinfo though as they can't yet so only drm-driver and
drm-client-id will be printed.

I guess this is ok and if a driver wants or needs opt-out of
`show_fdinfo` it can be made optional then. Note that most C drivers
don't set this either only the main GPU drivers and a few npu drivers.

Tested on Apple silicon system with the Asahi downstream driver.

Tested-by: Janne Grunau <j@jannau.net>
Reviewed-by: Janne Grunau <j@jannau.net>

> Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")

I don't think the Fixes: tag is justified. This is an optional callback
and the majority of C drivers (in numbers) don't set it. Even if it sets
it won't provide much useful information for any existing Rust driver.

thanks,
Janne
