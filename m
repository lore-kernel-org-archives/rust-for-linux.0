Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321979;
	b=gz+N8sZzTNx4Jbj1Ex9WBJREURHpaZpes5yEQb5uObKXAiqfYmDjy1P2JOcTvHNLM+mF
	 baykchHq9iPMAO8U9rK0Qx7t0c6Am0Zw+j7cz7WMqIdCW0eOYMaD01RgslksH04OgKsSG
	 WX38odJADzm8h7zbRqBQiOxE33BOOp4N/nTWeFOxWWD+lKlwdKM9pAgX3E5yKcpZ8TVHe
	 rz8BspWchAFyPddETxOdNHb92cTBvkn8nRou11yKRXqCINX+R11EO8bCEskZbwuEp+zVP
	 SxkcvSLhhV8zH7Q8o9PNETJCkVFSHdWjS1r23ftqaDDPD7aJ7CCgnKuxmVGORtOkqGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321979;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nLoC9w7FLeAk73lIU0r6bo/hbegniO3/ExA19wRJYXw=;
	b=UV7dNfAVVGqwtxkA/IqQQ9WKImcSuDVmtmKiVD93+01B1IPNIghrLViAmkVtinLeyL7B
	 YkAVzjBxgC9VYG24CmOS4Sx2+Wuwqw3sw2KCL3sqKDRgdBr+MRCNxetuqLn5Ddd0Gx1K7
	 8d4fbmuXTHq8NuP7Ka7ZVCEIBKLJLkJOyOsf55cmygCuJLCunlNjYt9NGSEB3evEATrGf
	 sZWnVzwwsQXt76JwJONMiDTFf5xNNwskAzFHClG8vCGKRYoqt2Ze61K36vrJIBvPl624S
	 zACxfCwAF3D6F1+D5XF5FDu1TwpkTrewMCSRt47ET4ifJH6l8a00L3oMtNxgrT4J8cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FofAtvAV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DAC606A31C;
	Tue, 10 Nov 2026 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FofAtvAV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D261F0089F;
	Tue, 10 Nov 2026 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794321978;
	bh=nLoC9w7FLeAk73lIU0r6bo/hbegniO3/ExA19wRJYXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FofAtvAV5FGZiUoSFkbbk5sTWq3SO46vWboyy9Ecd0e30yY+52pYN04uH66KHdd6W
	 InsApuHZ8nQrpvWXWlaVNXdSODQShpHfPET2fZdrf/1ul6GcldloP1Erntm96tPRO9
	 eT4jfv0fXjW2HGZf+QWOsNcgRIPOudnwYeOK34UuTVOI4T9uWTIMzp2/QXv8rY+Sdm
	 2gTfOnJA1FNJblOfKeO6Ts38SHM4lRUXdgfvM9cOGb8YO92ReOBXSJjBBdmKRhYeYG
	 b2rgzv3eHmdLYvj/KdBazB3n+W8Qo9+QrGl8i0oatdxJ2xolGyjCJxWLlbnRirE5fB
	 0C8xKqOrJ1Kdw==
Date: Tue, 10 Nov 2026 14:46:07 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: Gary Guo <gary@garyguo.net>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Suren Baghdasaryan <surenb@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Uladzislau Rezki <urezki@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>
Subject: Re: [PATCH 0/4] MAINTAINERS: remove my reviewerships, add CREDITS
 entry for THP
Message-ID: <avMtGWbWyTE1dZTS@gremlin>
References: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
 <323e1f32-4127-4121-a1d1-3a7e43ca5ce6@linux.dev>
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
In-Reply-To: <323e1f32-4127-4121-a1d1-3a7e43ca5ce6@linux.dev>

On Tue, Nov 10, 2026 at 10:15:27PM +0800, Lance Yang wrote:
>
>
> On 2026/11/10 20:03, Lorenzo Stoakes (ARM) wrote:
> > Given the current throughput in the kernel resulting from AI-generated
> > series, I unfortunately lack the bandwidth to generally be able to offer
> > review except in those areas I maintain.
>
> yep, with the AI flood these days, inbox zero just isn't happening :(

Yup, this is purely an administrative thing really for me. Some hopes of
taming things.

I'll likely get involved reviewing other stuff _anyway_ when needed. Just
need to reduce the firehose a _bit_.

I am also now very busy with KVM which demands my attention in any case, so
is practical to pare things down a bit!

>
> > I have separated the patches into areas maintained by David, Andrew, and
> > Alice + Danilo, so each can take the patches relevant to the subsystems,
> > for convenience.
> >
> > Apologies for doing this, but given the current trends I'd like to do
> > something to make my inbox a little more manageable :)
> >
> > Also add a CREDITS entry for THP, as, since Zi's rightful and well-earned
> > appointment as co-maintainer there, I have no fear of needing to step in
> > there, and so would like to record my time in that role.
>
> Thanks, for real, you've done a ton for THP, and it shows :D

Thanks again you are too kind! :)

>
> Acked-by: Lance Yang <lance.yang@linux.dev>

--
Cheers, Lorenzo
