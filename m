Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314809;
	b=pi9takwyBScAydwxIeREkn/R3OmlMlcDcRuBn0TaWTH/YGdDjDoK7tZdDsUXM2APnqen
	 2Lc+re6p5Tz8RLvm80A+lzkzLXpyhqzPEMVNr+gacT14rijUkbfymvTaCf/HylV2XWE2h
	 9UlI4HJcyDo+M4MM7FNapNfpyTf6VfUP5IjlBwyCO/D6GP8VbsNaZyO3EwPSUxIr/ELnj
	 VRmjkDFTLacOcntB79vvqjxFhLvpXXvD50u41w/hBGZb59iLQSpli3XeyvQcUUUVatp89
	 CNDdF1OKRg7pQGHlPFPSXLhKqbo8LPpDt0talPnGqRuCQww5kORJSPJV2cg83//hZKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314809;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Iadron3w0mtp6FUOIlxkmVN3eT1tt34wJC4l9phyJAw=;
	b=SJdvwXfI+hNA7PgRER+14fgXq+vu2vYtSrRnSPC9mDeLAnUu/+OYjlFHGa3Oyzy3M6Ph
	 wexyeqBR0XFwfYKn00Un0GzXRMVJXdnMVhthWAVzOkBzk17B4J9UgR/FBmgmEuU7v70//
	 AbUjsKH2q4Kb8x6KbkDpiAT/ENip+6X2ROmgZD3I0aurt8a7PdCXU7J4M/1Yc4d2+R4os
	 oK0KtSJkA4bUAi9hoYU5BXqLilUehUoxqgFBc/MEjb87ncjgSNPQWU5O2hDrhUKN24ie1
	 bnbedU8mcnOmhHgfk6GcEBQZfAN1mHykJYLN600tVvmmSOujZR30C63QZahplWuiOxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GCDwX14v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C7B606A330;
	Tue, 10 Nov 2026 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GCDwX14v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8721F00900;
	Tue, 10 Nov 2026 12:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794314809;
	bh=Iadron3w0mtp6FUOIlxkmVN3eT1tt34wJC4l9phyJAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GCDwX14v21WbLajB2krTKYrET/K+N61tHnKhsWXud1ti9u60OCiTW5U1YiOLKl+79
	 cRfsMDlqLKMteU8ZF8SIcjuKSEXCrHFqpqXb+CzVAdfBfUt7tgmKmxsZg1J5rf6QjU
	 vhoO3l5RHIcd6zeTRltf01kH5JNxY3cs9lnTBmDlY9SFnlNbkkJQYYPz1GM/0b+yF3
	 DOFL52/UerZ+0bck/E59XBGVrT8iuMFDs+iPGfbM8Wd/wIpWHE1h48068QUX0UdXLa
	 XiKG51ZqsgY2iChGwRIxH3edF7xYm+yOINlp4helsaQqqv/DbAZHLrSiQOyBISslxu
	 6Mg8xCAWlc/PA==
Date: Tue, 10 Nov 2026 12:46:37 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/4] MAINTAINERS: remove my reviewerships, add CREDITS
 entry for THP
Message-ID: <avMR7WWJ2nis94vG@gremlin>
References: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
 <e1b0d6b4-f7ec-44df-a9f0-0e3a3722a973@kernel.org>
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
In-Reply-To: <e1b0d6b4-f7ec-44df-a9f0-0e3a3722a973@kernel.org>

On Tue, Nov 10, 2026 at 01:06:52PM +0100, David Hildenbrand (Arm) wrote:
> On 11/10/26 13:03, Lorenzo Stoakes (ARM) wrote:
> > Given the current throughput in the kernel resulting from AI-generated
> > series, I unfortunately lack the bandwidth to generally be able to offer
> > review except in those areas I maintain.
> >
> > I have separated the patches into areas maintained by David, Andrew, and
> > Alice + Danilo, so each can take the patches relevant to the subsystems,
> > for convenience.
> >
> > Apologies for doing this, but given the current trends I'd like to do
> > something to make my inbox a little more manageable :)
>
> Yeah, it's crazy.
>
> Thanks a lot man!

Thanks, I'll still obviously help you out wherever needed! (I will still of
course send that fix series I'm working on now :P)

>
> Andrew can just queue the whole series I guess.

Ah no need to split then :P still perhaps reasonably logical to break out by
maintainer anyway!

>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks!

--
Cheers, Lorenzo
