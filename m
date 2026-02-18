Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BDC307492;
	Wed, 18 Feb 2026 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771416768; cv=none; b=pgE43VdEoqxrgGc7HUsg4qGFok7m2x8Bg+lD/5XMo9CEOga837Va2wDMxpAJQINc7uaJAw/hemnsp5MzVCL46BbCQHpacIs8KFRmHukBMEobd5hmC36JlKx5rW2X9yf5xTXX7EeeX/ILVhM/BtyNgtcMxZUlCoFJmIS5V6gciqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771416768; c=relaxed/simple;
	bh=w1N4yn+VtA39n37uVNLHlFOM3HAHk7/Fx3e8G4QKdz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfNCGL88mFH+LEWWp5I0n0DtMbNGwjvV/oRav6zTGwWgpLLc9Iq8GSxQeKJD6NlJlVwaTHTLnvjo+rHrL0zL1G7qWzpjAxBdoPbKfTurTNPZYyyCWMPQCd69b5F7pIn8fcyir4ho/yo96r8oWNsVBIGrtSbsrm99FiS3aJqIxpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RS4Uplmx; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RS4Uplmx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6RURdNKTgo/45/sjZa4WZm4lS4SVP6Z6PKdxDGv+PE4=; b=RS4UplmxNHGAVzg44UJZa+YOVg
	GINpcpHTRg4GtiLFt5XFju5NzaM0+BwrF1gWoUPqQ8CJJT/z0ilkeAlkaOXxgZq7rlxUJwGUywLtc
	V9ZyfP3gMCmAmJoQA2r21WsUuYdMgXHRnrvX5HUarrLqW+VDOPehYfUPNe4IeL5w8noUQd7txmkLx
	PzgNI9ZzuDqs4i2QIP3kQo57RKIWxnFptBJyxxKQ3H7h4Nb2EEL/h+uOLTpWDzCCtNxWbeq+8A9dL
	vt1QGYJlo8/sDaOIg6w2uVLP+ZfiQmHnELM/KGhPrA++35Zqz/GmlwPMVQlfGQ+nFJ/MeoL7Upwqv
	69qsTmHA==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsgQ1-0000000HOYr-1t9l;
	Wed, 18 Feb 2026 12:12:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E2DF73004AB; Wed, 18 Feb 2026 13:12:35 +0100 (CET)
Date: Wed, 18 Feb 2026 13:12:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
Message-ID: <20260218121235.GF1282955@noisy.programming.kicks-ass.net>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <aZRY9HthKwVJrAf1@google.com>
 <67aea464d25c8cafb3113eea62c8221b@garyguo.net>
 <20260218102045.GD1282955@noisy.programming.kicks-ass.net>
 <9029143b048c9385768d883d93da6531@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9029143b048c9385768d883d93da6531@garyguo.net>

On Wed, Feb 18, 2026 at 11:36:20AM +0000, Gary Guo wrote:
> On 2026-02-18 10:20, Peter Zijlstra wrote:
> > On Tue, Feb 17, 2026 at 11:10:15PM +0000, Gary Guo wrote:
> > 
> >> If we have this in stable, I think it's sufficient for LKMM. However
> >> for Rust/C11 MM says that volatile ops are not atomic and use them for
> >> concurrency is UB.
> >> 
> >> I recall in last Rust all hands the vibe at discussion is that it's
> >> desirable to define volatile as being byte-wise atomic, so if that
> >> actually happens, this would indeed be what we want (but I think
> >> semantics w.r.t. mixed-size atomics need to be figured out first).
> > 
> > I would strongly suggest for volatile to be single-copy 'atomic' for any
> > naturally aligned word sized access. This is what we have with
> > GCC/Clang.
> > 
> > If you pick anything else, you're explicitly creation interoperability
> > issues.
> 
> AFAIK LLVM IR only "guarantees" this for primitives, so if you have a struct
> that happens to be word-aligned and word-sized, it can still tear, which is
> why the the "byte-wise atomicity" semantics is what's being proposed.

Urgh, what does GCC do? And are we sure this doesn't actually break
anything? I'm fairly sure we rely on at least 'small' struct volatile
reads (eg struct fd) to 'work'.

> I recall it was being discussed that, for the MMIO use case, it is desirable
> to have this defined in such way that one single instruction is generated for
> an aligned access of small-enough integer primitive.
> 
> This is exactly the same situation in C too. If you have a volatile struct load
> then Clang actually generates a volatile memcpy for you, and it can tear.

It could just be LLVM is broken and needs fixing in this case.
