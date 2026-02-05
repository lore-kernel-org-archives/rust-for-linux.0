Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395B73D669C;
	Thu,  5 Feb 2026 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299311; cv=none; b=OSMnm/9PqDPLj7u1IKjaGrwFfObQyXqckbTD6Y5iLDlcfUbp8kpSOPy1koKSiplYW9u4/sJZ3APdHT+UBIzHsEZvT0S1mtdVU8wriNE3V45kmUoYM8lH4AodtP3MC/NyMubZ2KSBYrltxJ6nCb5+eNgVdyPcfInr4Ty9kA0Gl6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299311; c=relaxed/simple;
	bh=3ZSTtKXXIeJF08IoZsz5zFefRH6QRSi20TNcF3Tg7yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fows78LTJLrruPwthVEQeiY60Ulf5Vjv+aD8TGfFQN8ThKEMU1Aa37AIL805lHoCUQvrUVO0SOefOWyz9KM1Te9buRnxApA1Fj9/HZi8ti2kGAM6jV4YMEX7rl7bffAeZ4icDFjbZyWbOPmXKfFMpz/wjdHcvhw4qtsuPn9D8Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gEiLhMSX; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gEiLhMSX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VABa3a2InRQyUMIOZndTLQhiPNjlqxKvfyjSp4/ZGlw=; b=gEiLhMSXMRY7nQ3vnaUSGJv4wL
	V9u4yjqEEeL2PExlWSGYF1hfMAjI0BRcFxzvEp1TJd4hz2cdLeD8WKLAn4q6QbSdhukXm+Pma1dYM
	RemIoIlFZc9hspms9lqh6Ca6tM4I2S5outJSysx8PRNF8iB5Pu0XXEPhr7mfC4lAZv81EGNNSrmAP
	uAhuBx9Ho4K1gZtwOpVTvNtm5zLj0u/Fk2mDluZPGgr1yZkuJaiDWu3JJ1eToV7GNv5LVpFNqyLX7
	qL0p92pSyrjgVfs8T2z9r7o8E0S9kw0D4xsWzSFdIxAfAIREvyJPZ8fHbnu3Mzp3NjTPxNODt5LoI
	k3tsSpkg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnziX-00000003guy-1S3U;
	Thu, 05 Feb 2026 13:48:21 +0000
Date: Thu, 5 Feb 2026 13:48:21 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix aux device registration for
 multi-GPU systems
Message-ID: <aYSfpf3xZNwZhzXs@casper.infradead.org>
References: <20260205041120.127106-1-jhubbard@nvidia.com>
 <DG72N8GDQ9E0.2FUX560O3I19X@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG72N8GDQ9E0.2FUX560O3I19X@garyguo.net>

On Thu, Feb 05, 2026 at 01:44:27PM +0000, Gary Guo wrote:
> > Fix this by using an atomic counter to generate unique IDs for each
> > GPU's aux device registration. The TODO item to eventually use XArray
> > for recycling aux device IDs is retained, but for now, this works very
> > nicely.
> >
> > This has the side effect of making debugfs[1] work on multi-GPU systems.
> 
> Hi John,
> 
> Looks like this is something that should be achieved via IDA?

Yes, if you have no need to go from ID to pointer, an IDA is better.
That said, as far as I understand what this code is doing, an atomic_t
solves the problem just fine and is cheaper.
