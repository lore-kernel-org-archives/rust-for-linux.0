Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320153;
	b=Wi3jcpslXwy9bYnIcOfEvZVcVNG8i7LN9129vxYTPF0qXc4SKf2wFBxctCgv6r0aTz0F
	 DOIw4S0U02ueu8PcWqjVESsmNaSIL2ZpguqPH1xGWp8xkBDsVas66NituMYgBz5Ij5dSo
	 h9YJ/0SoP2Ilg5w+l1cBTwyHywPedLp1WnkYFbNwMD9Y5rXA4hX0Aa+E6Dggi7NpdbMtA
	 8ERnio2BU5xmlI0I3UvOyl4EsQ9WPmwYfXQSGkK8t7J9Bzmgl8S5ThxteEjgH8J6MbWtX
	 t2IpeIJ8Tw3xFeAsuyf7v/Dap7IsvdQ2GiSfRN/zH/dZ2eYpmEcYM9D0mi6F5+qdt9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320153;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ds7kNgZUPfXWm6W3cqj/9lr9L7V5tdvs1wli0L1Uyho=;
	b=Yj0buRf/m1XOIqGbWAFnk0bKOosbf6WDDRjNe3sL89OmzfCCmBuKmtnwbrU+mN1iCO/n
	 C3Z/wjvDp0Uwp5TSR/glyVc+Aqzdj6+PnSgBYes6bxYzPFQpe8MYyo+mOjp9RICFsE9rg
	 jG3oJe8N/Ll/J0AQbTLfw/am2l8bE6nnlN6xwl8EG+opvg+ike3btaoun4RBOBoj9HZTH
	 YCtJtdbAdFNOVDDpZvo8JR9w+8BLJb09+761wqCpdGxrFGfTB/jpZzhCA8AKUxPuCZawQ
	 HEA8dBYACnnmQBO8P8KScIKyo3C5a883PIbBI/XrMtTiSz36NoH0rqm3ITMNQ101efQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.103
Received: from mta1.migadu.com (out-103.mta1.migadu.com [95.215.58.103])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D72606A338
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 14:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86D72606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nbIdV6Ekrwky+WTmgp4OyxXE9Kai2xeE0z34n5bAiq4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794320149; v=1; x=1794924949;
 b=oA7y27wcHOORrMchFx1gImknWxCyRBj4zZOzjxhpduQBTjb9Y8dCA3MSvBMq4+0s57v/3jnZ
 qIp76t1EzxXvxr3G7ov2JoE3oEnfVmLgeA3gPJLODOh2jMo5S4QOGMm2qDjFr53Logq2MWvLRKG
 ALCbDYbHOLwbfqWXONSMqu9g=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3f650de13b867266;
	Tue, 10 Nov 2026 14:15:49 +0000
X-Mizu-Trace-ID: 3f650de13b867266
X-Migadu-Flow: FLOW_OUT
Message-ID: <323e1f32-4127-4121-a1d1-3a7e43ca5ce6@linux.dev>
Date: Tue, 10 Nov 2026 22:15:27 +0800
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] MAINTAINERS: remove my reviewerships, add CREDITS
 entry for THP
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Suren Baghdasaryan <surenb@google.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Uladzislau Rezki <urezki@gmail.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org, Daniel Almeida
 <daniel.almeida@collabora.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Benno Lossin <lossin@kernel.org>
References: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/11/10 20:03, Lorenzo Stoakes (ARM) wrote:
> Given the current throughput in the kernel resulting from AI-generated
> series, I unfortunately lack the bandwidth to generally be able to offer
> review except in those areas I maintain.

yep, with the AI flood these days, inbox zero just isn't happening :(

> I have separated the patches into areas maintained by David, Andrew, and
> Alice + Danilo, so each can take the patches relevant to the subsystems,
> for convenience.
> 
> Apologies for doing this, but given the current trends I'd like to do
> something to make my inbox a little more manageable :)
> 
> Also add a CREDITS entry for THP, as, since Zi's rightful and well-earned
> appointment as co-maintainer there, I have no fear of needing to step in
> there, and so would like to record my time in that role.

Thanks, for real, you've done a ton for THP, and it shows :D

Acked-by: Lance Yang <lance.yang@linux.dev>
