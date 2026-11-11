Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360560;
	b=DKas63CUizaZDXC+KY3CE0rrGhv1pUS3Dbej07LQJQGb0vgLPPKXhR1deuJrKHoCASPh
	 kKbItUWrmO6Q/r9LJRq6lN/Yc2chVveqcnI8fPOryvONaQETer+o1w5T3LJxldfHyl8tX
	 oSS/cPgOSnQgnLaJxwiBG/6MlBLveLIJx89dnOZGPGiWBKyz+ozHJDUK7hoU7lvXOeIE9
	 fPnoVKr1phL6cL5fauS6evOKnXnOQssagC0gqZXKsmcxn9cZ+hMbdUnf+KrdNMub8bdC3
	 xb1pzEtEGerX/VGnrlvl0oUY1xubTo8zu9MCqBBRRhjhjiignqR0qnEPpT0YF/uFpaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360560;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kJDtYQ5RM/nMy9qPHT1eQaGhKo9m/wZ8gDKiqQSYfNo=;
	b=RIfCqAdZFiOX6uADNnkMytyO/LxJU2zOOqce+TcrMWM3MvgqacPT4P5TgLBiKV+YwivK
	 pgPi71OkDU0pdFO1MKMe++NqhGIq76VJOSeIR4TO6gWeQEOTqO7XPCquR190XLhkvvaTH
	 BDJDy6EN9eZwDK/4KCeCujfJRPT+Yq11+IK88fvuHafNCpWhL8qtTzRCkz/3/J80pau+E
	 Enf8gWHBEXOKvCLKFyTA6vHWu0IVexJzV/av0npIrV/8UTuzWjspru6nf7/3IRXHJmnVw
	 SWjmRv1V/bKe2ldvgJBs75L8sETL7mtpLkNGNzYWrFaHr3/G7FpBTTofaqvwPN82uLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nsBkOnS+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3249D606A31C;
	Wed, 11 Nov 2026 01:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nsBkOnS+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826431F0089F;
	Wed, 11 Nov 2026 01:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794360559;
	bh=kJDtYQ5RM/nMy9qPHT1eQaGhKo9m/wZ8gDKiqQSYfNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nsBkOnS+I3Q6gFW6yrtdxkTfq4jtBsCUe3//dHOR2dLA/3s5qKJDc5TyIDrbtwpCI
	 P0353Bwo4LZmGGMeb93HFXxbwlOSfnSRkY4wovT9NIDjmQzZyHYjFIA/paJVXajDMR
	 ihjFuLV9AYj18OZ+Uhg6OhyNipSwyZh2norzxpbWhNDvczeRfSI64Z2n5I1MJI3D6C
	 tuisH1NXT/GQFju70EAlv0tUcuhHPM1LeZVEjNlrgxxwttrzrn961pHV8w3TSqOxpy
	 22BYiyDRqdJcKA5Xq78h0EuN2yrZQmZ3ZEgvUbuM1Y+8G2S27MpLlUTNXNoM1FrM7R
	 Q1NtTqgVIC/uw==
From: SJ Park <sj@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Uladzislau Rezki <urezki@gmail.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/4] MAINTAINERS: remove my reviewerships, add CREDITS entry for THP
Date: Tue, 10 Nov 2026 17:29:10 -0800
Message-ID: <20261111012911.162135-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
References: 
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 10 Nov 2026 12:03:06 +0000 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

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

Thank you for your huge contributions, Lorenzo.

> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

For the series,

Acked-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
