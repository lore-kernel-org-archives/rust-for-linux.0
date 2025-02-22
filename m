Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C384A1D7E42
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 21:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740259347; cv=none; b=jsm/AUgWPamrd/nWKqWZTzw9jIc/IK0vS3Es37+hwvpi34z7lWe/WSSmbPMEW+qatWyCTzV/F0FH/VOQE4+kUvyixSMTYZ8IrVT3YAhDK2urfum3Nwmx+Ds15gflsmVy5jXXezrXRlA9ONxnJoE1mDaMcDT19uE5RWSrlFWLJfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740259347; c=relaxed/simple;
	bh=piwDR0h9AnWUaOdUQAC5NjUrw2TJ4agqSZdNz1RuSW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iu6DRqySfwa+6GI3UWZNrmSEfgQ2XMgU4g/41LqPI29VQTYwZtdepd1A6puNux5fGQfRu2w2shvZbBiRRavUp2GzioB31ZtGnbIiA60nCwu9qR4oqX86/88hjSXmZBQ11kKop3rSqDEmmuThuDizBGwnEnFx3Kx26wc8cYLkGzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jpr1kqxn; arc=none smtp.client-ip=95.215.58.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jpr1kqxn"
Date: Sat, 22 Feb 2025 16:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740259333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piwDR0h9AnWUaOdUQAC5NjUrw2TJ4agqSZdNz1RuSW4=;
	b=jpr1kqxnj+Gu3zwAaE+emFV/Ma8PZxBItbdayNq8SLF6G5pcYPV2LEGJgn+LNmXxxgPbhL
	VUFFDcNoQ51hWYjSId+2BMME91kS5mfzABMqIpAtjHgWPdDYDYAoeRNPuL5lQ5Y+SA0m/p
	j2GDcpLweXorkzjPNrskYmE2AQDplbk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <c3spwcoq7j4fx5yg4l7njeiofhkaasbknze3byh4dl45yeacvr@rb6u6j5kz7oe>
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo>
 <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <yuwkqfbunlymofpd4kpqmzpiwbxxxupyj57tl5hblf7vsvebhm@ljz6u26eg5ft>
 <6EFFB41B-9145-496E-8217-07AF404BE695@zytor.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6EFFB41B-9145-496E-8217-07AF404BE695@zytor.com>
X-Migadu-Flow: FLOW_OUT

On Sat, Feb 22, 2025 at 12:54:31PM -0800, H. Peter Anvin wrote:
> VLIW and OoO might seem orthogonal, but they aren't – because they are
> trying to solve the same problem, combining them either means the OoO
> engine can't do a very good job because of false dependencies (if you
> are scheduling molecules) or you have to break them instructions down
> into atoms, at which point it is just a (often quite inefficient) RISC
> encoding. In short, VLIW *might* make sense when you are statically
> scheduling a known pipeline, but it is basically a dead end for
> evolution – so unless you can JIT your code for each new chip
> generation...

JITing for each chip generation would be a part of any serious new VLIW
effort. It's plenty doable in the open source world and the gains are
too big to ignore.

> But OoO still is more powerful, because it can do *dynamic*
> scheduling. A cache miss doesn't necessarily mean that you have to
> stop the entire machine, for example.

Power hungry and prone to information leaks, though.
