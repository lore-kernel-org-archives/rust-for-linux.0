Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE54E31329B;
	Sat, 31 Jan 2026 16:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769876815; cv=none; b=pms8vIHVlJbi5EHGa4wEYpkpGs7JEMUZPFwwDPyscnXXzt5pFx35RlsZ3XFNZ60O4Mm8bjCv0btHBoNZYhPyVorDG1jcnYg92mOl5mFESfqI0zunjq/mQ0r5TjljyB9rAjWzC3ArviuDIj/W3d08WbzLKV+gLmSG3B4CX3A9OT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769876815; c=relaxed/simple;
	bh=YqTZirFJnMSRv58R4i6aOMSFmcSP9mWjJAQAv7y98rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWK3biQzHcL+X288LlW4wA1CMlQAIt+rZJij+iBVu1f8+kN/FRUcFFDY0JpBHcN8zGuPMTqFiwfYHjk/UaRQowRTHapKozfsf1n38TUVeNRpF35UOQgCA2r53Fnb8iJKr9eCcIpPA0agjSXzuog9O9QKIThFdY7rslWLmYxVUPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6MTfjls; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6MTfjls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049A8C16AAE;
	Sat, 31 Jan 2026 16:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769876815;
	bh=YqTZirFJnMSRv58R4i6aOMSFmcSP9mWjJAQAv7y98rA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E6MTfjlsG6XOR0vpaWua0qzBC+XG3ymfughr877+W0DcUd5Rhab64h0auQ1uWZ63i
	 eaE4cZHLYe1TzdQXMZBnEMQbpW7M8YEl6JiphUmLwZ+M659YJNW2eYgdZCrLH+blkw
	 V3+aTrROw2yQ7csatoULmId4dg2jW2JgIVYAMVDodjY7t3znYvuDXPR55B0uRjJj5H
	 T/mhC+C6P+s6fdu1HtuXGU+7uBbV47VV6vF2jVblNT295Pe/HVirLdDabymyu1Fh1y
	 0Hq1+ImHiED82rf8+EF8le+eQc6u42kwDIg0sr+4it6Uoarva8S/A6XsFl3UIAwd6o
	 XoJ+2M+ZkI1cw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 06CBBF40069;
	Sat, 31 Jan 2026 11:26:54 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 31 Jan 2026 11:26:54 -0500
X-ME-Sender: <xms:TS1-aaTlBPXcUJ6iWMjKRhK9ecmta-OGcuKkp7zBhLCB-HsHfMxAUg>
    <xme:TS1-aaIzzCtdLFom8fpX5K1aFUqAxIz5wg5Zd-kCx3fIOI1Lv_c6aQBUkB5DCIzYO
    hKFX7OdcjjWI0sBITQHz10G50YP1Z8QgEp549p6k_bnPMnwYxt2yQ>
X-ME-Received: <xmr:TS1-ad8ndN6dw4RFw7Nb1GAKyzW6xE3M8QWaAUunoRgwX-90755ePUqfIV1Wq6yUZLqHo-FKTLzU-GRg2SgiPOg2La5oBr2u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujedvfeelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:TS1-aRJ4QlJTKxa26PSLhWKwiMe7-FjfkLZzopzYAC8COrs1g2HG6w>
    <xmx:TS1-acFQ8J5VjWgaSRkSRKZcsxu3ObAmhyqfXwvcDG53JWmmzHeKPg>
    <xmx:TS1-aVw7dpgowosj3Yl3SR4YAozyt8X38k7C3zOqxdYyNihCr-a_LQ>
    <xmx:TS1-aV5eXwVwsaII55uAs0FY6cMaDI2-EojvmHScZdoSWE6D3XC_6A>
    <xmx:Ti1-aadxndG8Lw6eqpZYomnBfeGCGb5nt_27Iddqu8kDiRg8yXsjnW8m>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Jan 2026 11:26:53 -0500 (EST)
Date: Sat, 31 Jan 2026 08:26:52 -0800
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
Message-ID: <aX4tTMrMx1G7hXHf@tardis.local>
References: <iFJVkpTMbd-NR24OHYTJj8lr4dw7MwCQ9rJWiuRZFgK3JRDhIIAcpf5Z24viL5qHhkrPzpnKfvX7JS6X_VO2vg==@protonmail.internalid>
 <DG20LKAHMXMZ.262Y7NAC1A1Z9@garyguo.net>
 <871pj7ruok.fsf@t14s.mail-host-address-is-not-set>
 <-9VZ2SJWMomnT82Xqo2u9cSlvCYkjqUqNxfwWMTxKmah9afzYQsZfNeCs24bgYBJVw2kTN2K3YSLYGr6naR_YA==@protonmail.internalid>
 <DG21IW5HZV2F.PXTH9P2IO8O7@garyguo.net>
 <87sebnqdhg.fsf@t14s.mail-host-address-is-not-set>
 <aX0lcVngRcRwqgd5@tardis.local>
 <SEV7bR_nyQNtvtgoO8X80HMkMTPLW_6roBSxJ-MpKHHNmkZQyVxSS9k1iFV7-bgAlHSLM566L8EqtRBnht65uA==@protonmail.internalid>
 <aX2tyn9nBUEKM-SN@tardis.local>
 <87ms1trjn9.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ms1trjn9.fsf@t14s.mail-host-address-is-not-set>

On Sat, Jan 31, 2026 at 02:34:02PM +0100, Andreas Hindborg wrote:
[..]
> >
> > For DMA memory, it can be almost treated as external normal memory,
> > however, different archictures/systems/platforms may have different
> > requirement regarding cache coherent between CPU and devices, specially
> > mapping or special instructions may be needed.
> 
> Cache flushing and barriers, got it.
> 

For completeness, I think for some architectures/platforms, cache
coherence between CPU and devices can be achieved by hardware, in that
case, DMA memory access can be just a normal memory access.

> >
> > For __user memory, because kernel is only given a userspace address, and
> > userspace can lie or unmap the address while kernel accessing it,
> > copy_{from,to}_user() is needed to handle page faults.
> 
> Just to clarify, for my use case, the page is already mapped to kernel
> space, and it is guaranteed to be mapped for the duration of the call
> where I do the copy. Also, it _may_ be a user page, but it might not
> always be the case.
> 

Ok, if it's not a page mapped to userspace, would there be any other
access from kernel while copying the page? If there is other kernel
thread or interrupt could write to source page, the write needs to be
atomic in some level (byte-wise for example), so does the read part of
the copy.

> >
> > Your use case (copying between userspace-mapped memory and kernel
> > memory) is, as Gary said, the least special here. So using
> > memcpy_{from,to}io() would be overkill and probably misleading.
> 
> Ok, I understand.
> 
> > I
> > suggest we use `{read,write}_volatile()` (unless I'm missing something
> > subtle of course), however `{read,write}_volatile()` only works on Sized
> > types,
> 
> We can copy as u8? Or would it be more efficient to copy as a larger size?
> 

Copying as a larger size is more efficient: less instructions for the
same amount of data to copy.

> You suggested atomic in the other email, did you abandon that idea?
> 

No, if we have byte-wise atomic copy, I'd still use that, but that is
not something already implemented in Rust. (my reply had a "if we want
to avoid implementing something by ourselves" at last)

> > so we may have to use `bindings::memcpy()` or
> > core::intrinsics::volatile_copy_memory() [1]
> 
> I was looking at this one, but it is unstable behind `core_intrinsics`.
> I was uncertain about pulling in additional unstable features. This is

That's also why I said "(or suggest Rust to stabilize something).

> why I was looking for something in the C kernel to use.
> 
> I think `bindings::memcpy` is not guaranteed to be implemented as inline
> assembly, so it may not have volatile semantics?
> 

Well, it's used in C as if it's volatile, for example, it's used in the
similar case in bio_copy_data_iter() (hopefully you can confirm that's
indeed a similar case). And I'm suggesting we use it forever, just use
it while waiting for volatile_copy_memory() or something.

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
> 
