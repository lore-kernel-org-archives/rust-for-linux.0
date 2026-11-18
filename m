Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.30.211.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013309;
	b=DxwCbYK+pJwd5mHAgUhsrtRKyWm1pbqpZhAYfXcgXHEQmUscRNS+FRCtlGZ1xcVEbeM3
	 nPD6epKRPbbLDfGuFbYNLRfOkJ4+lqpMGJzgr0eKtzZwjRnLt/z3l7wCRF3v0T1VmiGRD
	 35HVjyzFfuDaQM/5frs2UB6FtbiuRj2u5/BHimj37WsljEiFKYO9xdCUwdz6Zlx6JrLrc
	 Uzpr9/cMeDqh2tTk06TKV9sL31Y9GxtxnSUJRFeaVGGOevKK5HFKJOKQCjvsiyczy2RIS
	 V71XpcFv0HCtxWh/QsLrBe+JSCYlf+YGcYwXqaPE1zRKeyAEv4KjtEgg9upCFkbfsfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013309;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:X-HalOne-ID:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=htsl1/fGGN+PK8kCB+H1dqKretrCIe2LVjelGMma61U=;
	b=dXeU1v2pFRw7myTNdUztq2qa6EDkqhYlt5YOi1uIPySNjHWNWEveepgEcp2vtnYii6ER
	 0uVKk3n0P2WU2WYjNZYBonZZhRoDqDCsb6tfYw5uKR5TOEbFIh2fDJuAdkIgo8p+DU8F8
	 pUxfvmSUo3WfKd3ELyrDiwK+mSowT+HeZsswhjBUwU1gwIuG0ssJ+n+EQAP/Jqi5xdqK/
	 DSOvEzW0Oxs0N+pnhuR9oh2GhyZ5Jquawdou/1W0Fdt2FakFpW/c66aEhFL0gifs32y8a
	 ejoIALfjyPwsYCaSTn6YgoMovw5Datu6kr/SKrcaFK1vrHABvG6PKQW7TLbE8saKukA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=konsulko.se;
	spf=none smtp.mailfrom=konsulko.se;
	dkim=pass header.d=konsulko.se header.i=@konsulko.se header.a=rsa-sha256 header.s=rsa2 header.b=AtuvhMyf;
	dkim=pass header.d=konsulko.se header.i=@konsulko.se header.a=ed25519-sha256 header.s=ed2 header.b=vYcO7f3r;
	arc=none smtp.remote-ip=46.30.211.244
Received: from mailrelay-egress5.pub.mailoutpod3-cph3.one.com (mailrelay-egress5.pub.mailoutpod3-cph3.one.com [46.30.211.244])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8660E606A320
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 14:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8660E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=konsulko.se header.i=@konsulko.se header.a=rsa-sha256 header.s=rsa2 header.b=AtuvhMyf;
	dkim=pass header.d=konsulko.se header.i=@konsulko.se header.a=ed25519-sha256 header.s=ed2 header.b=vYcO7f3r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795013304; x=1795618104;
	d=konsulko.se; s=rsa2;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=htsl1/fGGN+PK8kCB+H1dqKretrCIe2LVjelGMma61U=;
	b=AtuvhMyfZOiYIH4uHrjJkgfksbx2zZbGG3biXW2Y6/sIkHDbZv3K2A7hLZyFr90xTLB0LXZNWedyp
	 PUK1yNjhrurTP6r5PrO4lZkSsQHPaTSiNSxYbnyT50Um6fmHBimbQEavR2KGd1t9POMfIIfacWpyyW
	 iBU+oaG32/vhEyRKi7GtFAk7oSr0Vx37pHiZjyaPCPoQcqvBQrtKddHGzgYKFSFQJYdwPICmVmycEF
	 G1Fb4yKCfIza3J85vKDZdsu6Qp8ZbVCCJMOZUgiYM80yls1nmBy6Xc3EPcQuvKSwU9N0wp0xq3Y2ke
	 62eiSKPWW/II0UgwH3Y8rHW86d6Dn5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795013304; x=1795618104;
	d=konsulko.se; s=ed2;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=htsl1/fGGN+PK8kCB+H1dqKretrCIe2LVjelGMma61U=;
	b=vYcO7f3rEhBhvaDX1PNXny5mpLRHqDQccdydc9sgSLYM7bvLQuqz+ULSIDLuY0RO8Tz6+Ai7jV2pb
	 n1HX7hECw==
X-HalOne-ID: 1a0a10c3-e35f-11f1-9ca0-17c427e4a17a
Received: from slottsdator.home (unknown [2a02:1406:27d:15:2438:a644:c11e:a5ef])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 1a0a10c3-e35f-11f1-9ca0-17c427e4a17a;
	Wed, 18 Nov 2026 14:48:23 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: Jan Engelhardt <ej@inai.de>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH 0/3] rust: block: add rbrd, a RAM backed block driver
Date: Wed, 18 Nov 2026 15:48:22 +0100
Message-Id: <20261118144822.3197130-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <176sn0r1-3s85-0nq0-p258-220pnspno416@vanv.qr>
References: <176sn0r1-3s85-0nq0-p258-220pnspno416@vanv.qr>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> >
> >  test                  brd    rbrd   change
> >  write, 8 threads     2004    1563    -22%
> >
> >We think this is a small price for page integrity
>
> A free 28% improvement, just by using a C driver, and a bit of 
> discipline in the program (not submitting the same page).
> Supercomputing will be all over brd if they need a ramdisk.

The posted result were for Rapberry PI/QEMU, The more cores/
computing power we get, the better rbrd actually looks, so
supercomputing should not be worried.

As an example, on a Ryzen 9, median kIOPS over 3 test runs look
this way:

test		bs	brd (24 vCPU)
				rbrd (24 vCPU)
					rbrd/brd (24 vCPU)
						brd (16 vCPU)
							rbrd (16 vCPU)
								rbrd/brd (16 vCPU)
read		4k	4661	5207	112%	4411	5251	119%
read		64k	241	265	110%	177	189	107%
write		4k	2034	2597	128%	1942	2606	134%
write		64k	111	134	122%	105	131	124%
randread	4k	3508	4690	134%	3398	4853	143%
randread	64k	229	245	107%	170	188	111%
randwrite	4k	1833	2598	142%	1773	2680	151%
randwrite	64k	108	134	125%	104	132	127%

Maybe this is what we should have posted in the cover letter in the
first place :

~Vitaly
