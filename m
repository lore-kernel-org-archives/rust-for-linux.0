Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336873;
	b=SqQ/Yn9S+k0RnZIQdX7rYTdBNNSrt5Sm5GlXF1oUX415GUUWLLJG3VaVW6qhokb4Kxyp
	 xJQpFkY9Ukq4bnt6YEXwmo3x0McMdGktY6Am/SvlTD9RK1A1ofIx+ngfo2NlCOtVXXb/S
	 /VZG/Zkio3rhyjQc3zJ/PnT22VEye3x45OOzwzKsyzdARgNN2GI6Q5jdKer12USp7OZrG
	 mPkjTC3yF6zuImPP8e+emR/2/w7MvmvYKf4KRGfgJUhAOV64cY1rTRTbeH9nj6ZhaPs6I
	 HSxSFu3aOxAsUftWueUMdHsKFOXiQDI3PCc7G3IfDe9AJwCSZmjTCwLQ8acWoJc2uwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336873;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=S8WybN0jXEvfuCjeNoU/0kdSxu89Svl0EaLSggB3TsY=;
	b=QyDhrAAZESxACI7qEm7uCXmPpx+LY89MxtkLWzHp8YbyixbOr6nzt/1ryNjPX5jmfPG0
	 NMdrFXLon+7aP+kenryyZjGMv+svlIt6KpaPlpZd5U0hhCiLiVZ2O+8Du4c3NJd4WDNNv
	 rMAFrh2B1kwD3X+Zt88JWwMp1DYqn+r+RHvd5JASRfwIEojPpoXnpRer7Gei5lnXTrrx3
	 ZH4LWNkv5zzzskmW0NiZlXopmw1jJJd7fZli6U8IMIS1fBEYUOim49YYKfZ7ITs/ovsFt
	 boXTyUKYSp5kAVu5T1XQZ/hX8/9ZHhls7aJk2a022tGsAt5IuAFwh2jT+cZ+nR1IKvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=sgOUj6jQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF78606A31C;
	Tue, 10 Nov 2026 18:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=sgOUj6jQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492831F008A2;
	Tue, 10 Nov 2026 18:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794336872;
	bh=S8WybN0jXEvfuCjeNoU/0kdSxu89Svl0EaLSggB3TsY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=sgOUj6jQ+prHKEVm07+3Sq1KThuQ51hD224Xh9LVBf0qlfg+StxnR4qb4izGEjFO2
	 oO2PUINbgjgpADfix5rc/mWDWUxEBhV6VH/sgVcRmwyi3Q3cTK5rbe3M0VXcElYqWi
	 zRvEScLVPmhHPWIOtzlB/E/ercg3AP6LaXazHuJg=
Date: Tue, 10 Nov 2026 10:54:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?ISO-8859-1?Q?=D6zkan?= <work@onurozkan.dev>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng
 <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Uladzislau
 Rezki <urezki@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan
 Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/4] MAINTAINERS: remove my reviewerships, add CREDITS
 entry for THP
Message-Id: <20261110105430.54c7a914e163250222151d69@linux-foundation.org>
In-Reply-To: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
References: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 12:03:06 +0000 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> Given the current throughput in the kernel resulting from AI-generated
> series, I unfortunately lack the bandwidth to generally be able to offer
> review except in those areas I maintain.

Sigh.  Is

	Nacked-by: Andrew Morton <akpm@linux-foundation.org>

allowed?

Thanks, hang in there.

