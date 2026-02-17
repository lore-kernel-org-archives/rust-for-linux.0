Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E207436CDE9;
	Tue, 17 Feb 2026 15:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343447; cv=none; b=b6vdiMpOFDqd4tZcVeOT+E1snyicrvd+g3waA7ERh3JanW7EbjeBBhSkhBGONkp5X+u2cVBnvIL+EQLCFFPmjX0vKf/TF1vryxXjtsHit6zzV+ipC0np1xiyZjY9cHwUeZpfjW0M+vqQMrqc6ljrfWjfUwHzFb15hIKqw5zRpzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343447; c=relaxed/simple;
	bh=9V5spGlSEnEZtQq5Yz0ERGyJmwgoptxUYK0CHTM5M/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJAakp07b9SHwnSI4+7iV6Ph4jjx56dhJ1EcIX2/VyHn8NZT+5PIAR0T+80VeWv5IVJg190uab4HnG7nw9zNbSrG7J65+3ixy0xDmwmne/MFFL9CqiHGJeJg6tQTfkHAn9UJMKn8uh16ESjJbOOZmkbF/CpDzjtZ7UJTFHJyOTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ql2CJqSU; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ql2CJqSU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rQDqCdZpJsTt3Mav7l+A0YJOBunkeNsBUDQhyvkmVgE=; b=Ql2CJqSU5Yjr83Q8ykEBCYZQjd
	uabSdSC89l8T97xXW/UI4nH4U/1l0Z+uX3AhLNvg2MOoYSDqy/SLvqLyipthOi6sOOOLO+39LLDUJ
	frJeGRFJOr2Ht55ZEH67hiHtrfGK6BLTNvb90WQc7ELhtFiBK3YCuJZCRBaF0FkaqHKDUIWFkur4o
	jC+T9zGhFDx/1Bo9V9sqcbtnzzmIXxZIwWWvmzbsIKt8/NwfEkbbMsEBrI9eS4T0sql1Csp4ktAiu
	LUist8KrrZ5ScXX8Q/almp/7p5jiYP+qwvECOuyYVAyO4z1YkZKawH51TtZ4naiq2naQTcWiEJj3K
	R4hzrviA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNLQ-00000004cf9-1Iof;
	Tue, 17 Feb 2026 15:50:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D7283300CDE; Tue, 17 Feb 2026 16:50:35 +0100 (CET)
Date: Tue, 17 Feb 2026 16:50:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Message-ID: <20260217155035.GZ2995752@noisy.programming.kicks-ass.net>
References: <aZQ19FEeGgigdwz9@google.com>
 <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com>
 <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com>
 <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
 <aZRWOIPThLfIZ1Ph@google.com>
 <20260217120920.GZ1395266@noisy.programming.kicks-ass.net>
 <20260217130024.GP1395416@noisy.programming.kicks-ass.net>
 <DGHADGXGWS45.1A6EHNMKM4SRH@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGHADGXGWS45.1A6EHNMKM4SRH@kernel.org>

On Tue, Feb 17, 2026 at 02:54:30PM +0100, Danilo Krummrich wrote:
> On Tue Feb 17, 2026 at 2:00 PM CET, Peter Zijlstra wrote:
> > Anyway, I don't think something like the below is an unreasonable patch.
> >
> > It ensures all accesses to the ptr obtained from kmap_local_*() and
> > released by kunmap_local() stays inside those two.
> 
> I'd argue that not ensuring this is a feature, as I don't see why we would want
> to ensure this if !CONFIG_HIGHMEM.

Because of the principle of least surprise. For the HIGHMEM case 'ptr'
only lives between kmap and kunmap and any access must necessarily be
confined in between those. Having the code behave differently for
!HIGHMEM is surprising.

> I think this is not about not escaping a critical scope, but about ensuring to
> read exactly once.

It ends up being the same thing.
