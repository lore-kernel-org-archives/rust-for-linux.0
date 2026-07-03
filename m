Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963531FFC48;
	Fri,  3 Jul 2026 14:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783087312; cv=none; b=iUYNREe+mb2ZfCYuAFPHAzkLUU2LzlTighPC1sLepixNBp08jLnBbLqargvelV1Xf8sO5z+JLrN2bAXL7ccncbejej7hmny61S/Fik82UIXHqWH67x/dwwzx2YKEFW6Wiq1cpYtDza6VFsNzSh+Iv2kQYr4FpVMTGlvrLzYc+Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783087312; c=relaxed/simple;
	bh=aRDbDVXZsmCVc1HZyIsziB5lHaYBR3okjV93JvUhLgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0M8rk6j6I91FDQbEOTzBZFNVWImTQeaKIAwgCW3el/U1pbw6kjMJo++x2PhfsOR0TU/UkMBSG2TB+CDJWmoLd6QqSlv+mUBnNaQKIFqknslgNHsGX7YlyhX6bMkQp+IwmBATyY6+LiXjU71uuWz2YpGA2CBT/6+JXLiFldXGKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ix/0GgIo; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ix/0GgIo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mbLIq/cub2JOZLGFhErmpHzOh8mBwwtl74nnTHR52oQ=; b=ix/0GgIozkqHbKxB4HMrrZw0/7
	WxKZDGl1fSfGVF1Fe88LHfA4b0yzGm8wlMsgheiBX7bRA81kOetIpvs8dobu9TZnPL5YYrVCVV7yE
	lklFYcqXO9pVRL1/zUUIi0wrpBlxKSn+Qn0QDjUka+jEltIYRfsHyu2uUYg+TevRigYIcqfenORRf
	cpoB8W2QY9CrURolI87Zbgrf0RmGjZgHp9vvKVJez+SmFzpu7D24PRasG2N2Fhlvx9YqpToVx4SXU
	EBchdUvf4Fug04sPrgM2j43iOS99FToW/NxJ8NcA5MWRrTcnxGsepKlI+JDdqvjCTdQX6CVVrglc1
	VdXHKq6A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfeSb-00000004tQP-1ypj;
	Fri, 03 Jul 2026 14:01:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 52BF3300220; Fri, 03 Jul 2026 16:01:40 +0200 (CEST)
Date: Fri, 3 Jul 2026 16:01:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Gary Guo <gary@garyguo.net>
Cc: Boqun Feng <boqun@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] rust: sync: create lock class using
 `#[track_caller]`
Message-ID: <20260703140140.GE651302@noisy.programming.kicks-ass.net>
References: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>

On Fri, Jul 03, 2026 at 02:47:25PM +0100, Gary Guo wrote:
> Currently we're adding more and more macros so that lock classes can be
> created. The only purpose served by these macros are to create names and
> static lock classes so they can be tracked by lockdep.
> 
> I've come up with an approach that uses `Location::caller` and Rust's
> `#[track_caller]` feature for this purpose instead. `Location::caller()`
> will return a `&'static Location<'static>` that lives in `.rodata`. As
> only addresses matter for static objects, the address of the `Location`
> themselves could be used for lock classes. The `Location` is of 2 * usize +
> 8 bytes, so they could host 2 lock class keys, so `DelayedWork` which needs
> two lock classes can also use this mechanism.
> 
> The `Location::caller` could also be used to provide the name; currently,
> `optional_name` just uses `file_name:line_number` as the name, and this
> information is available in `Location`. However, `Location` encodes them
> using file name as a C string plus two `u32`'s for line and column number,
> so it cannot provide a single name. I came up with an alternative method,
> which is to use a special string, which lockdep can recognize and delegate
> back to Rust to print it.

Perhaps add some sample output so us simple folk that still think rust
looks like line noise can have an idea of what it'll look like. Because
I just cannot make much sense of the above.
