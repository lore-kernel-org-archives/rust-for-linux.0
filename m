Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362759;
	b=gLmIbEbBBH+/Wtf9kNaaCDVS+mX/EBvJmIlERb3ZpuY88cL/uztAGvF1yEIUWh+Oskwo
	 0IPKjja829h5zxE8YfAiQu4Nv7qIJ80UQHO1Mme2XvEKcQkXRyF8c27H5aNM8m8OCEWFf
	 H+OwWiWQjsY20Dc9tI/6yadfyyQUFZbJ1YZ2wFAnLJYmvh0JfGtj1+3jiNphjB+bhHm7d
	 c6LsBzXYMt7SbYmkYtB2uHRlpSBXbyagjYPoJYhCgmizUfs6wHe7GNMP63LPqrDMTuFM8
	 VRheUZKfYKUxUSnU2k8Nuaf02THO2mEyfaVD04otqHJJx9neaGS+x90JuMAtxNX7Z1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362759;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Lmv/70XmZ5QtKUV5v1eVzqkSiZ/xwdge4U+mRBx/gEw=;
	b=gvwlEJ7JA/hSuqIa2MkWOzKxUBTkeShKjx19UXv/P7J76xaxfXQSahGT8vioUDuaTf4F
	 pnAoXHJHEJXjLUvKC6xBHoBv975AT6eCUh8I+9/1u4pPl6ZNnoqCTn3j0XTgBytF9S8XJ
	 FVCTNMd1Kuf21tbaY3D7MZG/YY4vwiU/e6rQNhYeGY+DU7JuZOV5jbiFx+bWKW/npawan
	 oTFyMFqWjrXr52XUDY3+1WErNvjnfOy7A06OLFldW/DsLPxgjwvl3O+KM8u/wd9dfUHOe
	 p8472D/hfhasIVKrNyyZPEaxaUmTUuyBJKXvcDPeXYXK+D5FMOT86wy1W/wTSPDb8qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=LHeyEr6e;
	arc=none smtp.remote-ip=115.124.30.131
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25BB606A320;
	Wed, 11 Nov 2026 02:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C25BB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=LHeyEr6e
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794362749; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Lmv/70XmZ5QtKUV5v1eVzqkSiZ/xwdge4U+mRBx/gEw=;
	b=LHeyEr6eErX/jtn6fQ8cO+PBrYRq4kmQGb62yBIk+U6s/vWR/6q0JRntSgqGsTgQ5AWwa/wFaWW/UB4ryb31oURi6A7kVDnVBN/UNuOJ0XRvtsIqd+7tQtseSi3IPtzPRz96x5h32/fzURKC7KxtrRVn0/ED/EqtVb2anCNdfao=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=36;SR=0;TI=SMTPD_---0XEXG5Nt_1794362745;
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEXG5Nt_1794362745 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Nov 2026 10:05:47 +0800
Message-ID: <d5067ae5-ebc7-466e-abe4-ae205b8dda43@linux.alibaba.com>
Date: Wed, 11 Nov 2026 10:05:44 +0800
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
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Uladzislau Rezki <urezki@gmail.com>,
 Zi Yan <ziy@nvidia.com>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org
References: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/26 8:03 PM, Lorenzo Stoakes (ARM) wrote:
> Given the current throughput in the kernel resulting from AI-generated
> series, I unfortunately lack the bandwidth to generally be able to offer
> review except in those areas I maintain.
> 
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
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
> Lorenzo Stoakes (ARM) (4):
>        MAINTAINERS: Remove myself from MM core reviewership
>        MAINTAINERS: Remove myself from MM misc, reclaim reviewership
>        MAINTAINERS: Remove myself from MM rust reviewerships
>        CREDITS: add entry for THP maintenance

Thank you for your excellent work.

Acked-by: Baolin Wang <baolin.wang@linux.alibaba.com>
