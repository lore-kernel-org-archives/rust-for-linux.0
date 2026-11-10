Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318967;
	b=rZXGeiocbWNvXalcLyLxu0gEiKzBK8Fo6grJcDqhnv+zFKSRIF9jOXJE4TB4NiumiZXe
	 jRzpx5igKhGzBP30sO1aGt0Q/7dwpKZ8y0EBxKJW9DXId7x7ja3gYQiRwxjOLkebEnkFK
	 7zwiralAJISZBkr8gfRL7iToBgv/hs+o8+pX2Dn7xGLAMPDgYYLslR5/LvqIDf0PRxo41
	 XfKDln5KK4LP94S24/x+mOrhR6O/h8XINcvoX1dT8Lql+oOLcUotSuuWevO3SYKcfKnO/
	 sF6iabDhSWPH4Bm4+EdkcNsYsug/Hfrcemoet9kvGUW3mijNwwGMVlRjf2sgYkJH/bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318967;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=CYVCeh2uxfSFPv0xirYoRVJZdsUpsEprYDSIaHZqDVA=;
	b=JqkzkULXCufxNhF7+64UzZNkkjTZb9HBHnl4DUJI/kapX2ZYILbdHVzIhDX9nmdXtccU
	 v4SnUdKKsk4Nm8JIqk+SLN03rN2RlgCdps3k0ONrqJUFwtiJxADY/npUd14Sg5+YMvk6i
	 Y28KO475bXHQ7lKYqgeabtSJBfpyzKBBlGgM9TqBeBkzS0RSDekm1dzoQO8VHs0zdC3DT
	 hO+Gs0LF5FYwJcPl3U9/f5O4mui0Z8neDbjafkk/6EJGTEDwRnV1EbuWx0BzgIKfrHDpo
	 RMzBv2uGwZHwPUfzhmnPDfzEupT02HfmlUt/Y9DYHrYP/NomsJZSetOj/1F4c13FZ0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RS/KgQmr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE51B606A31C;
	Tue, 10 Nov 2026 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RS/KgQmr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1071A1F008A2;
	Tue, 10 Nov 2026 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794318966;
	bh=CYVCeh2uxfSFPv0xirYoRVJZdsUpsEprYDSIaHZqDVA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=RS/KgQmrp7lZSEi/at8qJaBKjsWgevSSR/P1c2Md8EZ4Ws8jxuN7MBUCmivrhnkXi
	 Ydf7aVVhV144CSCsgoNm1GaUEvG+b3NLmswMuNMmnLeXLxmvFtK4awq4lyu9RwxdeR
	 YL8Mp6p/TAwvuWgaPyR/J2QiH9Vi7nLFE4FJrrqWE0CkEfJ8nQ7DdVYsHs9LCaHYbG
	 wTx8WLNKeLMnqdurRgbFtyLaN+YA/6kxi9pnFOLZkK66dC7xjuBsXcE5uo5im7BND4
	 bAsqIekTHgt2aYaMADFtiLaZhpHzghVH237B3qZzVI3mb73Wsa2Nu49S1Hcc0NpmOt
	 IxucmEX+5Wo9w==
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 14:55:57 +0100
Message-Id: <DMRKZHFKVKZ8.1ZCH8L9CDK07D@kernel.org>
Subject: Re: [PATCH 0/4] MAINTAINERS: remove my reviewerships, add CREDITS
 entry for THP
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Liam R. Howlett"
 <liam@infradead.org>, "Vlastimil Babka" <vbabka@kernel.org>, "Mike
 Rapoport" <rppt@kernel.org>, "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>, "Johannes Weiner" <hannes@cmpxchg.org>,
 "Qi Zheng" <qi.zheng@linux.dev>, "Shakeel Butt" <shakeel.butt@linux.dev>,
 "Uladzislau Rezki" <urezki@gmail.com>, "Zi Yan" <ziy@nvidia.com>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "Nico Pache" <nico.pache@linux.dev>,
 "Ryan Roberts" <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>,
 "Barry Song" <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>,
 "Usama Arif" <usama.arif@linux.dev>, "Kiryl Shutsemau" <kas@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <rust-for-linux@vger.kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
 <e1b0d6b4-f7ec-44df-a9f0-0e3a3722a973@kernel.org>
In-Reply-To: <e1b0d6b4-f7ec-44df-a9f0-0e3a3722a973@kernel.org>

On Tue Nov 10, 2026 at 1:06 PM CET, David Hildenbrand (Arm) wrote:
> On 11/10/26 13:03, Lorenzo Stoakes (ARM) wrote:
>> Given the current throughput in the kernel resulting from AI-generated
>> series, I unfortunately lack the bandwidth to generally be able to offer
>> review except in those areas I maintain.
>>=20
>> I have separated the patches into areas maintained by David, Andrew, and
>> Alice + Danilo, so each can take the patches relevant to the subsystems,
>> for convenience.
>>=20
>> Apologies for doing this, but given the current trends I'd like to do
>> something to make my inbox a little more manageable :)
>
> Yeah, it's crazy.
>
> Thanks a lot man!

Thanks Lorenzo!

> Andrew can just queue the whole series I guess.

Acked-by: Danilo Krummrich <dakr@kernel.org>
