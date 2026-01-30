Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FBF15E8B;
	Fri, 30 Jan 2026 21:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769809269; cv=none; b=TYrJw9LhnYEIsk7EWt8u4EM5mZjcLZ4RHsA677/YKrlmW9L89AQU2RQGd5ZWHPRPZlNWNKKe16PAZUBz90bc8s9CnFMZVblrR4rKFWJTzg8RsZ4YkeD1+PygADbIbNTFqnyYG3FJd4yz8+9KUhSlzaEijRezDiKQ0Fcglf+FIvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769809269; c=relaxed/simple;
	bh=nYAz8cOnAdH7OKPPWgG8rvbMO1Wr91nM6L7SjxMsYRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMmohyoep42n/qJWGi32EdN+mWS4yb6wxF6TKba7zy6q+C+PneQYMTX4wibd0fC7uHfloPW1Zqd4oqpGJ0/GnZLjZT2NNXc4CaeSCyV/XWlpb++WTMDZqnUuX156sAmV3opBMp9qUs14tTit5mfdZJVRUjE1I9jI5KAduQllwiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4KQbvu4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4KQbvu4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4E4C4CEF7;
	Fri, 30 Jan 2026 21:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769809268;
	bh=nYAz8cOnAdH7OKPPWgG8rvbMO1Wr91nM6L7SjxMsYRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B4KQbvu4vdFgHIUDXyt3iCPRcTH8tz4B9WSg8heLg4k7VW24Dj08kXxC9QPo8tE6C
	 l2dgfQLe3MbSGRPK4Ec8gBZYWPEW9tVa9t+TCB0K5LwNw5CCixbBWo1GJZuK23ciJ9
	 m8kRdL/Xbt7FBS+hJtw03laGB1CYuqEVvFqKL22OBjbi0bKahI+0fOTK2KU9LXx45v
	 wkwjWxpKkIfqQ+7gu7DxxzBKpfKC321WokPMKbrpJNMtJ3uHu/34jYJVNtVjoFmQjs
	 pqH+yG71ptSrxUEXqfPwD2hdy67s8LyjaNOyPCXwll9bI1YdUzaL/wloQLWxMg/z9k
	 8Js0VxNUyyL4A==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5A4E9F40077;
	Fri, 30 Jan 2026 16:41:07 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 30 Jan 2026 16:41:07 -0500
X-ME-Sender: <xms:cyV9aSxbljfv-mFkc0MCRmSgwoGMguq8AXp2beielNeThjktiOQDqQ>
    <xme:cyV9aYpus3y--F2FwWzPkZ2cmRI-rNEIqjj6hLYweVjagjvjlOdUtWE7XmMAQH4Wk
    QEDb3ZebEq-FDAJhZcQUPW_U--p8S0E8tKpgFAlqcz23mojkeDcvA>
X-ME-Received: <xmr:cyV9aaestI1JpNgyFi311oTnhLkr2Gwf1XpIxW0VV0j76zBDC7HIay6DHHom_T029-VBhaAsuQbgbfQYdrmoj1qdSo28VoBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujedtudehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprgdr
    hhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrh
    ihghhuohdrnhgvthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtgho
    mhdprhgtphhtthhopehlohhrvghniihordhsthhorghkvghssehorhgrtghlvgdrtghomh
    dprhgtphhtthhopehlihgrmhdrhhhofihlvghtthesohhrrggtlhgvrdgtohhmpdhrtghp
    thhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunhdrfh
    gvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohht
    ohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:cyV9aTqxZsAtdPlqFrhoo4AIijYuLjnrdr3cxKzRpVIvlU8i5EoAcg>
    <xmx:cyV9acmWlnA8XPJf-uaa1V5EZpR5npPWHyJSzjR6-UA7FsnK38TlXQ>
    <xmx:cyV9acQ8jb5MZ8CaJmiQU4g0vsuv9bhd9-ShrSn8ikWR9jpIjO446g>
    <xmx:cyV9aaZnTmR4rOJnUOmyUflM3Mkq1bv9lqEKxsAYlMguxFrafOGj9A>
    <xmx:cyV9aU8VG_6owHVdEOD9kpanSvSxb0pwLlsczlW0b0UNQYd0gkrisVIF>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jan 2026 16:41:06 -0500 (EST)
Date: Fri, 30 Jan 2026 13:41:05 -0800
From: Boqun Feng <boqun@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: page: add volatile memory copy methods
Message-ID: <aX0lcVngRcRwqgd5@tardis.local>
References: <877bszrz37.fsf@t14s.mail-host-address-is-not-set>
 <a8nHDdzac5l20akcxjjf9w7huObjn4eIHjUI-A17aKEwWl1N-4vvLBiVdqTQbBHwypMIA6gNkzm8YFXmMl44ew==@protonmail.internalid>
 <DG1ZJ1350EMS.1S1360PA496QG@garyguo.net>
 <874io3rwl3.fsf@t14s.mail-host-address-is-not-set>
 <iFJVkpTMbd-NR24OHYTJj8lr4dw7MwCQ9rJWiuRZFgK3JRDhIIAcpf5Z24viL5qHhkrPzpnKfvX7JS6X_VO2vg==@protonmail.internalid>
 <DG20LKAHMXMZ.262Y7NAC1A1Z9@garyguo.net>
 <871pj7ruok.fsf@t14s.mail-host-address-is-not-set>
 <-9VZ2SJWMomnT82Xqo2u9cSlvCYkjqUqNxfwWMTxKmah9afzYQsZfNeCs24bgYBJVw2kTN2K3YSLYGr6naR_YA==@protonmail.internalid>
 <DG21IW5HZV2F.PXTH9P2IO8O7@garyguo.net>
 <87sebnqdhg.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sebnqdhg.fsf@t14s.mail-host-address-is-not-set>

On Fri, Jan 30, 2026 at 05:20:11PM +0100, Andreas Hindborg wrote:
[...]
> >> In the last discussions we had on this, the conclusion was to use
> >> `volatile_copy_memory` whenever that is available, or write a volatile
> >> copy function in assembly.
> >>
> >> Using memcpy_{from,to}io is the latter solution. These functions are
> >> simply volatile memcpy implemented in assembly.
> >>
> >> There is nothing special about MMIO. These functions are name as they
> >> are because they are useful for MMIO.
> >
> > No. MMIO are really special. A few architectures require them to be accessed
> > completely differently compared to normal memory. We also have things like
> > INDIRECT_IOMEM. memory_{from,to}io are special as they use MMIO accessor such as
> > readb to perform access on the __iomem pointer. They should not be mixed with
> > normal memory. They must be treated as if they're from a completely separate
> > address space.
> >
> > Normal memory vs DMA vs MMIO are all distinct, and this is demonstrated by the
> > different types of barriers needed to order things correctly for each type of
> > memory region.
> >
> > Userspace-mapped memory (that is also mapped in the kernel space, not __user) is
> > the least special one out of these. They could practically share all atomic infra
> > available for the kernel, hence the suggestion of using byte-wise atomic memcpy.
> 
> I see. I did not consider this.
> 
> At any rate, I still don't understand why I need an atomic copy function, or why I
> need a byte-wise copy function. A volatile copy function should be fine, no?
> 

but memcpy_{from,to}io() are not just volatile copy functions, they have
additional side effects for MMIO ;-)

> And what is the exact problem in using memcpy_{from,to}io. Looking at
> it, I would end up writing something similar if I wrote a copy function
> myself.
> 
> If it is the wrong function to use, can you point at a fitting funciton?
> 

I *think* for your use cases, a `user_page.read_volatile()` should
suffice if the only potential concurrent writer is in the userspace
(outside the Rust AM). The reason/rule I'm using is: a volatile
operation may race with an access that compiler can know about (i.e.
from Rust and C code), but it will not race with an external access.

However, byte-wise atomic memcpy will be more defined without paying any
extra penalty.

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
