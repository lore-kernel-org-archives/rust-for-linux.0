Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2082DCF74;
	Wed, 18 Feb 2026 11:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771414085; cv=none; b=ug8LA1NI/nQyf2/L8e+8aLuR8HXddHNrOzN9/GcaVuHaPv1ZYu3uheGc91hR+Fn+TQhxNU0AjFvZlE1FkRh5zZZkTSrL08TEoZ/EmxB3uEHRQnzPARUUobouEblR5UeJ/KhzLFP0mrJ3ft5wbs7b1Cp8NKceWUQghEm3w5q7yaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771414085; c=relaxed/simple;
	bh=ev7EuyTYttJyKhDlInqjlasJAUZiOxAz0Y6jclX2puE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlglYs4ckDtQpQQkNI7huZynNjlDyKXmYxVEjsK6XV5EmQpRiSYKT869TlidDjUXwQAJn95XU7alXW4lkpJyMnuBirA3XNWmmGDVVKwIKncKkwn6mNo+4LGGMN48G3FfEKWSUCuvwXq+9/OfCa5R95k9y16cQkoe/OQVwLJ30yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=s1MysdmD; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="s1MysdmD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gsFxEV4P+LKXmedhnkVP2MzBuTaUdQtYYTNJtDkuMow=; b=s1MysdmDVjKqzTMoQ2H4afrHR1
	zXG+OjemQB6clLoA4PHhXIUSsqNjNh5RsVYaEd7MCjGPainW53GN3XF695S44EHPJUlAenGxzVdzX
	ke0DT3BZmDCfh9Xt+RBLbwUj6tXhVRenW8/HXfnds8+RfbxN0zmbN++W2pB7N34Lai4tqZMX3x0/y
	r59jwRIWiBwfie1k45UgbRMi0p9ixFCvg1bF8+SjP+yNl+Mh+KBehWuWeOYTvRjxLXS21YVPnjGYN
	Be0/4duHxUUweKGFQg6KV6AhYWNJ32BPxmOevw2rBqX36r0Yv41sUmNE6+mIE6hDfS8HwXU9fH7cb
	jlovR90w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsfih-00000005wph-3SbA;
	Wed, 18 Feb 2026 11:27:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6DCEF3004AB; Wed, 18 Feb 2026 12:20:30 +0100 (CET)
Date: Wed, 18 Feb 2026 12:20:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Will Deacon <will@kernel.org>, Gary Guo <gary@garyguo.net>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
Message-ID: <20260218112030.GE1282955@noisy.programming.kicks-ass.net>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <aY9i8rbvnxdOA9DV@tardis.local>
 <20260217085541.GS1395266@noisy.programming.kicks-ass.net>
 <102c86dd6fb1a907b7138a437dee00dc@garyguo.net>
 <aZRHJ22UtG1YeBMj@willie-the-truck>
 <aZShEW2b9-71r18I@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZShEW2b9-71r18I@tardis.local>

On Tue, Feb 17, 2026 at 09:10:42AM -0800, Boqun Feng wrote:

> To me, having a atomic_bytewise_memcpy() at least clear things out about
> what is actually needed (at the very minimal) to have a concurrent-safe
> memcpy(). Moving forward, since the concept has been already somehow
> proposed to C/C++, it's likely to be standardized (we can push it from
> the kernel end as well) so we don't need to implement a concurrent-safe
> memcpy() for all architectures on our own.
> 
> Hope this makes some sense ;-)

So all of this is about compilers being silly, not about there being a
problem with memcpy().

memcpy() as implemented by all architectures is *FINE*.

The proposal you refer to is:

  https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2022/p1478r7.html

(as shared by Will on IRC) and right from the start it goes sideways:

  "But fences only order atomic accesses,"

This is of course complete and utter bollocks. 

No actual hardware works that way, so for the C virtual machine to be
specified that way is complete insanity. This insanity then leads to all
sorts of problems, and then these imaginary problems need solutions and
we're up a creek that smells real bad.

Can we please just 'fix' things by stating that *all* loads and stores
are properly affected by the relevant barriers. Then things like:

  https://lkml.kernel.org/r/cbbea9ecb994df975109d97a7756d73e@garyguo.net

also instantly resolve themselves, because the compiler just isn't
allowed to be *that* stupid^Wclever.
