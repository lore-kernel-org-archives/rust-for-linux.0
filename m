Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2550F27FD45
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 14:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771339324; cv=none; b=Rda5Gt/jLpnbi+DN50k73Xr7iwJ/CIMa3UKXBcV5RtMPqGStTYC9seDyv67JSqY73VCKCv0qc04tRmDqYoNNSUD/nJx+TYiGu2mUI9HVs9XAJtbuSR8FRTZW0wqXGv8XReLaRl1c9fE5z3fasfG02U0JU/YG4/zsyIRA45Ppoos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771339324; c=relaxed/simple;
	bh=K0kAfiLnNX2UYQkYc+V5Y1VDTcpPfMgg9+XZC/X86mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvg39V4iYkYNzHKaFmGN7FZRNyBwCbThFpNbfGzFYYL8ePlhY6l4eM2f2e7qBeD8meMR3gdZTD59fYVdqXFvbnVhqvZiKINHd8McGQdLA6VtDGOA0VAskQYLAI1zz7zpOqEp6DuTWE9HdNfYXYaeg6bdWKowODbESiLz/TzaFZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CVYys1My; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CVYys1My"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rCDQgTS3bQg1kvut4evCQ0Ojg1EZ8B9mZPRbt8Rf7do=; b=CVYys1MyUHCgWmagz0VGTBbEE5
	zddeJIRSlwEh1X6yHWhtKOPLlp51C4b2eQ7aZajGalS7jUOwlkj67srK5it6YkiAcVhUAVJD+b9hh
	nZ/VlDf7/8MBxQ7SGloC80/cPWQFdlkZUw3VCcCOdSoafVU/jrngb4kldFIqi/zhWhX9m4au78AlA
	6RTyeStEX/RkN0Ed4nRr9a1P30kf5e9ibjnsZskn6yTfG6QH0cqI4Ugc4hCF+wUi0B0sioEwXyQkE
	mzy8p9pv3cURrDVapC/v9qJW2TYeOgVxYpmPC+TJLRm5h3cdnIfk2HjzFpG9GJlGFhSx58VXNUgq/
	rsaUQmbA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMGh-00000004YE6-0iOi;
	Tue, 17 Feb 2026 14:41:39 +0000
Date: Tue, 17 Feb 2026 14:41:38 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: linux-mm@kvack.org, lsf-pc@lists.linux-foundation.org,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Daniel Gomez <da.gomez@samsung.com>, gost.dev@samsung.com,
	Greg KH <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Kairui Song <kasong@tencent.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	Tamir Duberstein <tamird@gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Evaluating Rust for XArray
Message-ID: <aZR-ItMBkiqyBdKd@casper.infradead.org>
References: <aZRncP-sKLLS2K1U@macos>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZRncP-sKLLS2K1U@macos>

On Tue, Feb 17, 2026 at 03:28:45PM +0100, Daniel Gomez wrote:
> We propose a topic to discuss the potential use of Rust in core Linux
> kernel data structures.

This is premature?  We can't move the pagecache or swap over to use Rust
until we can compile Rust for m68k/parisc/alpha/... or we drop those
architectures from the tree.

