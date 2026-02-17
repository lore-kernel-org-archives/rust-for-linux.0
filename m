Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5049A2DCF6C;
	Tue, 17 Feb 2026 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771319643; cv=none; b=O3ZtIMKoq2u8S4cw8c8RPyZ3gofkKYnhApz0mU/rH6JK1f2ZzEDcg33A+EbpxaYEpkTq4pru7DaloJM9CFbXA2VugZ/CRbf/zdWnGcNcKioUzkggu3p4dnHq6toowgOO/+GUYDFPfkoIHStBuJolCW81PQPIvZ4O1n3MBOGQqJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771319643; c=relaxed/simple;
	bh=Bpz6kpZK58PNbfjvjbENnuef7qg2CcJqKgDXTXChao0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uylLjQrbHbxnVDWTm68DLdlPHH6GuZ3w28M1fOnKX16r8kFnEPeqUimawHn0OIiWnc7in38eAvJlyPFZg0T2UFJuwhOqmT/FovMOebdjpbJIWwXOW1b92szgYvAlIE+zo2WgAXqdYBOeTj/FQaZ/r1ZyeyFHzO+1/JBUjZa42Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LgU9Uc32; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LgU9Uc32"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Bpz6kpZK58PNbfjvjbENnuef7qg2CcJqKgDXTXChao0=; b=LgU9Uc32rxTQHqrl3KbC3iSJor
	sqCBxXQrEp4zol+EzLpdwxpkbNbkYdRrKANeC/Ci5SyRsp+dvRyaNzKXPCvFt01RVHW7vNdU0+/f0
	/hveX775oGy5me42EuK/JAqlq24CrfY7TeHa6alsuXjaZFktRZf4E1nL2O5RB7u7cDWQlVawtgluB
	domniAqF+wDeSs3v82XxXSWZRQZBMFwVJbcDUE/30VyD6uxVhVMm9HSLYdm4vGom/S2XbiKYP67bX
	Bm4a3R8yBZWLhCCS8TfYo6jnOOjGPZImxp1tXiFvmmPuckMHw43/8Yhct1vTHTqgSojQnyznW18UP
	D2uGZqvg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsH9R-00000004Cqk-40qM;
	Tue, 17 Feb 2026 09:13:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A3CB2300CDE; Tue, 17 Feb 2026 10:13:48 +0100 (CET)
Date: Tue, 17 Feb 2026 10:13:48 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Message-ID: <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
References: <2026021343-germicide-baritone-efe8@gregkh>
 <877bsgu7fb.fsf@kernel.org>
 <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh>
 <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh>
 <aY9HD7nH5A-DtgmR@tardis.local>
 <2026021326-stark-coastline-c5bc@gregkh>
 <aY9PBfx3RRV7rXZ5@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY9PBfx3RRV7rXZ5@tardis.local>

On Fri, Feb 13, 2026 at 08:19:17AM -0800, Boqun Feng wrote:
> Well, in standard C, technically memcpy() has the same problem as Rust's
> `core::ptr::copy()` and `core::ptr::copy_nonoverlapping()`, i.e. they
> are vulnerable to data races. Our in-kernel memcpy() on the other hand
> doesn't have this problem. Why? Because it's volatile byte-wise atomic
> per the implementation.

Look at arch/x86/lib/memcpy_64.S, plenty of movq variants there. Not
byte-wise. Also, not a single atomic operation in sight.

