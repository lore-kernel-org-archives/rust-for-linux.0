Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314729;
	b=ezsigb4bzV/EpWPaM8L71ohSclkfDHEtDMI2tqzCvm0l55MM9l1+iZXZwiCP/qaHsmXt
	 tw//lpXljPay1YoeUd3uOeXmwXdZ/btk6yIW4qX+rofOPsxuI3LXZorhwVdMPa5qeiY0B
	 Xe9gTTMWJFwYyidDjaXqMORHLx1AUF8rkBncDhVsL+zQ5B3QfH1O60AaC9xkKyQFPSdbo
	 yyh+6bbI7GqU7n2+fx5Y0d/FNCOuTCeMrelNzp48e4Oxbtw4BYx2juYjQRu1d8tEyEXna
	 3Jh5LuKQua7jRNC/6k6kPSEZuSmSC40DQT+56Xlo7JkUxYXqJ1mL9HKQUdItgn12zFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314729;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SVZpaCs3v/sBrxut5K0oJJA2z/xOJJAdv8TBSqGnsnw=;
	b=q0MIlR9oPj9PWuuj/KnBRsZvGoNvCF2mcAUmhBCoPPLbWh95HR1o148d9U0iz2DlEMjz
	 l5um9YRsquAtJy/noWkUw549BFEeKZCLo9KS/McrNs3BMdexR6jHYejjQXY9BOwqiP+Vz
	 2BSEnwVnrEjg/Lpj+QPu6LHTT91G9nJjQWO6gKiGP3PuRkvlVU1jmQcLgvpzvI4zzs+Rj
	 LVgDGNWPrf5hVUHTI2CwkBBvFHR+su3wewWWbZLpBiZt5g6RSqeL59uYJo2u4oCVfc44G
	 WDvaRa/XcVFOjBiNQpPgr0Dh7FF0y8v2Nb8rwLz1brsw1XFu5onxN//kvt/eeTum4IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YZ/IDAw5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C25606A321;
	Tue, 10 Nov 2026 12:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZ/IDAw5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF781F0089F;
	Tue, 10 Nov 2026 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794314728;
	bh=SVZpaCs3v/sBrxut5K0oJJA2z/xOJJAdv8TBSqGnsnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YZ/IDAw5kTQN8T16yrZOI/9JLS/BYMIEnaAYwEogjl1aOlG7sfGF3dLhC6PsdYlS9
	 EG3SB48+EZum9ANIUh09V6sJhvGXcU7WeyMuFeNETFZfnqoJQOO7B3eEwrFHm3+2np
	 XW4DfA/F6nxXvZ3byZ+jDzotl5+NhypIyEtYV5E2+bZGt/Aycjxd4RrAh9BbzFyx8X
	 mlI1I/AyolCp0EpsRQpu3UYUc9qXoab6fTonzR6MmuidTva3g/uFoCg+xKSoyHkRhM
	 wAuPHP4fD1OTuOoScAVH4cg6/ET3IxoFXgQzhRcEKzI0eYSzZ/rMcDFShiZBmt4dng
	 WOTUOQrVSZtlA==
Date: Tue, 10 Nov 2026 12:45:16 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Uladzislau Rezki <urezki@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/4] MAINTAINERS: remove my reviewerships, add CREDITS
 entry for THP
Message-ID: <avMRk95T26rsq4JK@gremlin>
References: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
 <avMKVYORkTQfdVB9@thinkstation>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avMKVYORkTQfdVB9@thinkstation>

On Tue, Nov 10, 2026 at 12:14:18PM +0000, Kiryl Shutsemau wrote:
> On Tue, Nov 10, 2026 at 12:03:06PM +0000, Lorenzo Stoakes (ARM) wrote:
> > Given the current throughput in the kernel resulting from AI-generated
> > series, I unfortunately lack the bandwidth to generally be able to offer
> > review except in those areas I maintain.
>
> Oh. Sorry to hear this.

TBH I'm still likely to dive in here + there (just did in KSM :))

But want to do something about my inbox...

>
> Thank you for you job.
>
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Thanks!


--
Cheers, Lorenzo
