Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312871;
	b=FB1TVO5ogXWH50YlK/3aO0wiLxwOoqeSTi1AetTwtZv/wBV7tfgOawd+5pZ8WoBy8QLX
	 GPA4waotA8nf6bJcdn30HMsgYrp2QcRc/eHY3QdRpwZIQomJIRrTpXHtSAd4Z64sv2GB3
	 ij60dX8gmfMlRIRw3I/XSsuFBk29cP4k+Y4zz2UlIN24pI8Vb5EkNgz5sHnK64XIQaJDi
	 8Mj3i11LadME0E2zXYuih5EyJXPveoYjgmgmC53T9egTFnX4bI+hO7ELzbhDbO664K8Qu
	 db4G4xK9jXntmZKESewNWO3EOum33mJ0aiah9ikUQPhtgt+S0jeakrAZc0dIi5jHe9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312871;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=iP7ihblxE57Xx8rjE7fq3FQri1E1LvdLUGQwTbaBM2w=;
	b=jlUz2UbDgmPpiZ0BBxXA1t+mRSiD7OPaAsvZ6DLaxJj7//i4ySu8UKAknGRcXGNxWe1g
	 vtliPFa2vj/D8VfRsvYsb0l/pELvoDgqZkcsWtN5FuAm9egNa8tT4/jFbuE1luWYbDsVC
	 RRqTy9G+49WUe4DBEA0ZX5R+1Qk/Ekizd60VFj3pl08h54DYpOXyif2sDF1l2LHGK/CMr
	 frRCjt/A2XRRdkgOJMg5CcG0zTgkcTHVOsIDCPqgfTb6d6Qjq07/JOKhjXy4GIx7RXCVv
	 58OnBs41x9xFgtIcSDUZTQgXeAnKYtTxN8sPAKdyFblaoMm3ZOu1dfPVRxyTik2NJfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKVck9DA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B17606A31C;
	Tue, 10 Nov 2026 12:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKVck9DA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A202C1F008A1;
	Tue, 10 Nov 2026 12:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312871;
	bh=iP7ihblxE57Xx8rjE7fq3FQri1E1LvdLUGQwTbaBM2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GKVck9DAyjJRwF6HuQpkK7AbBrIq+eQ3cPUnGzG1Gq6VuJ8UdC/rCB6CSKkKcIn5Q
	 aRteYVwg0E/vjLAXAgSdndPFJbm2kW7UBAXPX2wxyItnKElyEsLD/JgTWO8DtW5Dh3
	 h3jcYUcQVTzLucvFJrStVxZQYgRn0K2azySx1VuMNH8H+8ewWXtkM6vCbuFPilzsPN
	 NSvLuLl8hwNDOj7EqwhE6MCfb1dosSfzqmEaasFJc7Whkck+lVyJ4XXZBZBJcTx8Qd
	 XGZ0iAu3gUthpEeOCBdSh9mvjej8lNkfPGb0llFg+KFxSchaArzxL3km1wwecp/SCl
	 SZ6Yu7OkzoWBA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 7494D198003A;
	Tue, 10 Nov 2026 07:14:21 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 10 Nov 2026 07:14:27 -0500
X-ME-Sender: <xms:nArzanSpIIwG51tsHxoNjg4cx6XZb8fKe9mFQiaStEaiiWGXacBybg>
    <xme:nArzakaVN84v7aVb-PegN2kbNzRsB3CRvMureoDByD8I5xamajVLlGpz647xE3fm3
    51B8K8DIgvq8gUblQ1_wtJPjuOKxEnDGaUv3u-nc8ErEhpB3-Hwsxog>
X-ME-Received: <xmr:nArzanTpMal-hQi5JzOJnpszvHZD8_1RlukXgFm8HSGeIx7gjB6EKJdzoew>
X-ME-Proxy-Cause: dmFkZTGpbVzkrelYKxT3HOk2p4weC4oCcSZPW/rpHgt9mwOOujexV3ntOnbLy9kT90zWH2
    X4R/Pc7He9zKvvIIHknrJ6jmRqd+GEiC5OJ1/9zKSazJXODPTmBjL5gTrOW05ZhonWrI0U
    H7BGU8fq4gRtYPJHKGaPFUfd+hhqfZs0WJnuKaF+0z1+xy9ewLL2avPysZ0hBftBGgc1ji
    WNjIvzjtJS6O1t8aThrFrTYaX6K2a/nHsjYlaSHjs0ddkvqo5ZzGQQwxlvpOQpp6n9RdMq
    LUyGL1B9cM4bURzCmIX/QZAKp+9nxEgKsjUMOYTJUoyJO1N1eTM0iZVOZQxVws8ePh1gf5
    u3NT1w0HRepOqC6jxxdIbkR0OIlfn08JNCqChvaiOat1qs/Hvs4BeuDHJ+03E4GxBLn7AO
    9iaWFSdMmsDwlTfkeYfju8yOlYi22QNnwJ+V7OmWCOi9D2Qgdp7rMn0ILlObukPllx8sp6
    sgtZnaDrpNVkntf/YPmW6nW2IwRTwVszcOKhtCnGhQn68O5yLhgSQvPSdVi/TWcO5aJME1
    AEY2vAPdhKIz5yKKlYXlb4TNn/LlK8U8Y7KG9HvGrQdaItlAJAEARWVtXQQmQULCTORKOG
    tQUdCQhsBV3Keoy0kZLDn2YA5jCy79U1wRJL8S9SH4wnTl0B20/HB6fTGrIw
X-ME-Proxy: <xmx:nArzak63XRT07vEmPmWdj3UQk19LRBHMl5JrY5kevBf3xCYTpbZ34g>
    <xmx:nArzaiT_kk--095o0kgnoe_C38SrCC57yVH7d8pyGoRFenBerbO_5w>
    <xmx:nArzamTn6p9WWzTEKKy5ym9NJMOSo0Usfg-Cs0u9knPk_yDjYCeNgg>
    <xmx:nArzaoNTDpTG50M4xFTa42zG1GDWh9eEqtpP7nfOAgtsLCIUoCitng>
    <xmx:nQrzav1UKN_6PhSRRpxLt3yvag5XAx38k6QE3cFnxbcCpC6V8RwR5kkj>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 07:14:20 -0500 (EST)
Date: Tue, 10 Nov 2026 12:14:18 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
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
Message-ID: <avMKVYORkTQfdVB9@thinkstation>
References: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
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
In-Reply-To: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>

On Tue, Nov 10, 2026 at 12:03:06PM +0000, Lorenzo Stoakes (ARM) wrote:
> Given the current throughput in the kernel resulting from AI-generated
> series, I unfortunately lack the bandwidth to generally be able to offer
> review except in those areas I maintain.

Oh. Sorry to hear this.

Thank you for you job.

Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
