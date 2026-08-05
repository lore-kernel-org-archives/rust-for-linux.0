Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7604D395240;
	Wed,  5 Aug 2026 10:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926960; cv=none; b=d1HCueXf8N0Mhzbk9lsDZgRRh54oBPJj88ZIiMGpau07qccz+kEokjoYW9KXIHaxD5xJgX9I8kPMEB8zvnSJAdO8sU28faQ25sKdH3vOHRgVys55PNpnDf1m1mEseVQqeHH6vUHsSzycuRcww6d7OwCgnH26JgnVOjjl345MPnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926960; c=relaxed/simple;
	bh=aoD/8/1rOkU6dw5q8BatbQAD+dzeArBlFEInxDyYqfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cj9CVhw3/PXhcsoby9jKGUmSoXE9RbWtdC2AQWvLtf1ulBhfnMbL/y+JrxNlVzg+dhbM8bifCJ1wWhtCGNGXB7yuPukPuYUDeobb5zCOgGmDyg6T0LpRj4iuYHCW50fNnHAjsD/VLiQXY1akJABnjvMTz70pZO4tazcJ0yh3w94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vNa/D+Cd; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vNa/D+Cd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UbrOXul+0gfZDUnSzuW045Fm9Rg7ZjjUqlD/EelI48c=; b=vNa/D+CdvoaCuTqElHssEIbqzj
	xbW+Xz+ulkj3ZVqRL0uizaEMF2cOfJVoMI87EH3uSy5lY6kc+li4irraEUEAqjQKAs1I2HyVSOK5B
	ognfe93l/ptoc2a4Qr5Q8yfrISYy+A7y0wN9VTapeHcbl+d7Knx45crj5quYkWT8d24EKP2Bl9y1e
	CLKzZiqk443Ir9GhchYsKKlUkVoTVkS7amVu2hPFD/YiumHF9X8hMZw9F9gvShYnNemvp2Jk+BR28
	V435Jc32E7TKyOeC9oiXHV1Wpxb5kkiZNzbaFCEDfHqN2PgtBhDVcUNIBirgs8EzKIGOG2I9GMxDX
	i8g/Fgjw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrY92-00000001dOV-0Bw3;
	Wed, 05 Aug 2026 09:42:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8D38F300E7E; Wed, 05 Aug 2026 11:42:19 +0200 (CEST)
Date: Wed, 5 Aug 2026 11:42:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Boqun Feng <boqun@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH v4 12/17] s390/preempt: Enable
 HAS_SEPARATE_PREEMPT_RESCHED_BITS
Message-ID: <20260805094219.GM687043@noisy.programming.kicks-ass.net>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-13-boqun@kernel.org>
 <367a9709-eb79-4579-9405-fb8d89576413@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <367a9709-eb79-4579-9405-fb8d89576413@linux.ibm.com>

On Wed, Aug 05, 2026 at 01:57:04AM +0530, Shrikanth Hegde wrote:
> +maddy, christophe,
> 
> On 8/4/26 9:44 PM, Boqun Feng wrote:
> > From: Heiko Carstens <hca@linux.ibm.com>
> > 
> > Convert s390's preempt_count to 64 bit, and change the preempt
> > primitives accordingly.
> > 
> 
> > +	union {
> > +		struct {
> > +			__u32	need_resched;	/* 0x03a8 */
> > +			__u32	count;		/* 0x03ac */
> > +		} preempt;
> > +		__u64	preempt_count;		/* 0x03a8 */
> > +	};
> 
> 
> This is interesting. So arm64, s390 will have similar implementation
> w.r.t to preempt_count.
> 
> I guess PoC that i was trying for ppc64 is worth pursuing even more,
> since ppc64 is one missing major arch which still uses old method
> of querying tif_need_resched.
> With similar change ppc64 can set HAS_SEPARATE_PREEMPT_RESCHED_BITS too.

Yes. PPC should be able to the same thing ARM64 does.
