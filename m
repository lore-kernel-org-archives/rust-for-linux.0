Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F1D30DD1A;
	Tue, 17 Feb 2026 09:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320840; cv=none; b=GIh9q20moa9wuw2q6T0OwFDufYSZd9fxyHKp1CqnLpOvItyd3ZAMEUe8VTd0veDWQs3mKCsUBMGf6MnWQ3VhgmtB251lTgoiTTW/aZNHOAQxqZ45DOPzijHnHcWRIcNDnsOb7gKv9HGDIaC3LjbOeaRo/NCcxpTWH4kPiXrXXsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320840; c=relaxed/simple;
	bh=KGrix/meDH9+LBgevzF+TiWnP7BD6m8ETbTz5IRtB2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIH3jW3/QUiHLo4zcubEQM0SuyasLuT+PBDPKcnOL7PmBNDqmCnsd2qcxabzknaWow+Jr+7eKUs0cKXgfC70zy0rtguqQYVUKqQDu1lWCM1k0yr2SuDBSEi1PBcBKBPJR2tyas1aPDgigwwB2QcJZ2Q1hctFMplLE7+rxdewA9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dYTU2ydm; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dYTU2ydm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+bBTf3wXkTuk7e+nax/2etObEgTBzMf/7JIdQqw1kF4=; b=dYTU2ydm7yvPcT4/57deVTHDi8
	vDKzJDdcGCvoWWLz3P85baYyzhQgy/1crhJXUMyVlJi+FHf7C0LZJ0sFVObDQiAg/yzngNvlsbrrl
	43aAD5Ya+YZ/6sPV5YIjjrRud70qPji/qtl32uph/7htvV4WqfIlAarFNt3AkxuMZCzxr9vNq0NT+
	Y/d71em1yzb2hmlmJA3wsYz+ldrQ14lhem7WWmfpNhA0vXprRHfd+4HrT3/+EhtQ2lxUBadubkOvn
	raNmBUfi0dhHUsYbKyHtyFNbe1F2W88j9h2MG6tXTFXxORJ3fI/0IuqmaRwXqyzmoRifqLywH12Id
	bx8QGfUQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHSo-00000004E6o-1Tsu;
	Tue, 17 Feb 2026 09:33:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9ED57300CDE; Tue, 17 Feb 2026 10:33:44 +0100 (CET)
Date: Tue, 17 Feb 2026 10:33:44 +0100
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
Message-ID: <20260217093344.GO1395416@noisy.programming.kicks-ass.net>
References: <40xUh92AU5E9oFxQrdej-AXVg76jmaWGKXZMLoOHXe35Lw9x_eNEoLup9bB60LyGZ_0USPmoxr-9hE3ujA67cQ==@protonmail.internalid>
 <2026021343-germicide-baritone-efe8@gregkh>
 <877bsgu7fb.fsf@kernel.org>
 <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh>
 <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh>
 <aY9HD7nH5A-DtgmR@tardis.local>
 <20260217091723.GU1395266@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217091723.GU1395266@noisy.programming.kicks-ass.net>

On Tue, Feb 17, 2026 at 10:17:23AM +0100, Peter Zijlstra wrote:
> On Fri, Feb 13, 2026 at 07:45:19AM -0800, Boqun Feng wrote:
> 
> > > > Suppose the memory was 'AAAA' and while you're reading it, it is written
> > > > to be 'BBBB'. The resulting copy can be any combination of
> > > > '[AB][AB][AB][AB]'. Not one of them is better than the other.
> > > > 
> > 
> > The idea is if using Rust's own `core::ptr::copy()` or
> > `core::ptr::copy_nonoverlapping()`, you may get `CCCC`, because they are
> > not semantically guaranteed atomic per byte (i.e. tearing can happen at
> > bit level, because they are not designed for using in case of data
> > races, and there is no defined asm implementation of them, compilers can
> > do anything).
> 
> How the heck would they do out-of-thin-air? Any memcpy() implementation
> that can cause that is insane and broken.
> 
> Compilers are broken crap if they do this.

The only way I know for a compiler to cause out-of-thin-air is
speculative stores -- those MUST NOT happen. Just like hardware must not
do them.

We must all collectively say NO to a compiler that does these. Life is
too short to try and write concurrent programs with a compiler that does
this.
