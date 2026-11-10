Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338335;
	b=l3uCLvtH+VBWIP7VZBJ1p/wEusLTtyl6nAU4OhP1PT5a7KbLdWejRm/dJH2jbwMN4ZqL
	 Kx0lFfKpaNriQhCf8fCsIHLY56vd0HS1j/o+1iZ7o4InxfotlYCKm/i/lCGCoRwIMBRpA
	 fApxtWi/7+CHw123xu3S/Wg2QuCvfUE6yXGSFsxe0vG82BAqIhP4pUestxKy/6TkzdbFQ
	 n8OMBB8aPmmTPlxRw/Lg3ONq1tpS+SN3BjgWQ4yh6pdTOtFxoIcj1r88Zsnfw5CdBHuJ7
	 WFJ+YgV2dZU2zPU56CnfC3naUxtis4hSkT3lsb6AlE5UOo5ZtjccWkqvL7znTIwzxVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338335;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EJk3YmOxg0lJBokWvd1lYbv0iZ6w5uZScCFE1jaF0zg=;
	b=W8xpbF9NAoWPxy8AzTfZHOWDzhoLAxm3B5Co+pwTkhMfJJrU9xDdjMUGxg3AMp+D7/UZ
	 J/BI6sXPVio3+4MK9lgxfsntS12tZSf5v687vp3TYIKu4o7bSDUfoYhc+QPkR6jinRu3+
	 IMuOlwU9ZtUS7cKk2jDECFRyW5vmQ4w0mmmq3R3B10fOJBkwc4kXdoXu+EKRiP4Tb/gIF
	 NsgwBJVlcle/qJ+Cp6ibEpNLHVaKpgJ/Q/KM76e2qh0vV9UqheQo8fBdPcz9XowY3H7yi
	 FWZvTFIBHm6pD03QfV0IUJkeM/miojPwoMz6R8RJPrbOVJbh0+Wcw3qXuHDfSkHJIfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jlA4Tqbo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B13D606A31C;
	Tue, 10 Nov 2026 19:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jlA4Tqbo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF34B1F0089F;
	Tue, 10 Nov 2026 19:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794338334;
	bh=EJk3YmOxg0lJBokWvd1lYbv0iZ6w5uZScCFE1jaF0zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jlA4TqboaRmQqFcwJxLUB0Xjiny3+yZ2Gw4htr3kCUa9BKK3RwtSjicIXi71bQzIL
	 pln6NHDgcYKn/fycKT1oNaV5BQnj0eGWSPyMP2h91MRWkV89byoERa5AhdUYefPjPW
	 1esKXgmfPWasQH1b5ahQF4d2XJeK24eAYBB4RCRPZI/g6u36mSRDazWI7ifq4tzl6R
	 SkVel42DVjWCaeSjnlACzY4zmk+uQiOheNZOttg4oe4Q4YXi3lznEMgBHTDtiyVwC7
	 9eHWYNPI0sfgU3c7fJcI9Z06vh5LIoXNlsO8Di/42cf72IOyoKWMtEILX3u/0v8tBW
	 iPUMzMt0rswKA==
Date: Tue, 10 Nov 2026 19:18:44 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
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
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/4] MAINTAINERS: remove my reviewerships, add CREDITS
 entry for THP
Message-ID: <avNsYKFvA5u46us3@gremlin>
References: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
 <20261110105430.54c7a914e163250222151d69@linux-foundation.org>
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
In-Reply-To: <20261110105430.54c7a914e163250222151d69@linux-foundation.org>

On Tue, Nov 10, 2026 at 10:54:30AM -0800, Andrew Morton wrote:
> On Tue, 10 Nov 2026 12:03:06 +0000 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
>
> > Given the current throughput in the kernel resulting from AI-generated
> > series, I unfortunately lack the bandwidth to generally be able to offer
> > review except in those areas I maintain.
>
> Sigh.  Is
>
> 	Nacked-by: Andrew Morton <akpm@linux-foundation.org>
>
> allowed?

I appreciate it :) but sadly not!

>
> Thanks, hang in there.

Thanks :)

This is mostly about cutting down the noise in my inbox. And likely the premise
is false and I'll end up reviewing all sorts still, but I would like to be less
subject to being self-nerdsniped into reviewing things unrelated to my
maintainerships :)

Of course the AI wave has been horrible, and is getting significantly worse.

At first it was once in a while that I'd see slop.

Then it was at least once a week.

Then every few days.

Nowadays it's pretty much half of what I see, if not more.

There still plenty of great people in mm though, regardless :)

--
Cheers, Lorenzo
