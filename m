Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337763;
	b=DlmoqpIzVzOd2et/XrvU8ZFEREP5soDXCDbOJ5UtkZcZnCzkpkScn5wkzqgMiXVV4t+m
	 jrl2fUKeXybF5/J6GLCI36SnU2SONDX3L+hgmk5TtLqCFsg02ueVHbFsvzPpJq6h70PkC
	 UMjPOuv1OdQcUavWGG4PqtVEPXUb07vIeafIDWcLewzv/GGGcOIAZ1xDskG4dQMv1OEU5
	 +sQUluvvA/j3crMat6bLQI0cgCxQGETWp6d7/F1wnLMTZyduYQImoTib+/Z4z96wyBWx3
	 Qwv9WA+sITkmhqyozU+dpYMtSjY6IApHA8+5sfyCTHKr50jMEEd+G2qvb6n+uDO3Ydw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337763;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=W+WHa4Tx0FQeM/03RDwXEAIwHC3edRmTKXzFoRa1jD8=;
	b=B/4LlMXu81OqJ2lJAHJlfFTwDGhJk6RZpOYyq21YzmbIxDq2G2Ko/f4zTEA5fgdYJCgb
	 pd6a+sB2qNUbagzRXoh9j+YxSOSzvNl6W1Id4QGoSSiV5BICK2zerI76x2Wdxrw77BxzT
	 f2flGLPuT7DEM7XARLkpfVDwe+0CmPyAHPgc7CclT2ar/uwVSJR8EgIIuZkO+gHDvsN3L
	 jcS50eSJ8jhFmzME2oMXWUSqOfz7mQ06v/5DcthgkBXElPBgb0CkqyXAo2N9buQ8LwqaL
	 Mo5esIxMItSPh0f+rXGgVoSlDNU9ZJi9DPygz6bvdCvz0eWpTg3W8fFNqbnMIw8kq1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bglyxXwZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C45606A325
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 19:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bglyxXwZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E291F008A1
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 19:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794337763;
	bh=W+WHa4Tx0FQeM/03RDwXEAIwHC3edRmTKXzFoRa1jD8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bglyxXwZhyuRgmFOeALSHNg3i9G+F+dEGWc+WpFP+/s37zzIxn5NO9E9jL+3R63Bm
	 kC1t66ugxjCC+DGJdyggcyEpur2diPQ2cj/2niEY3bXp18Xyde4N4SgtjypFHg07RX
	 nNt9IB1Pyo5UXtnxiwwuo/pGQaooKaOqZl+S5l9vCcBYowdJ7i8choGB0ABE8fDRAO
	 IDslbNOGPosKnbAT3VDamaJEjrl/9QWADByJR3PXYNI1smQYdKt4aqNCQDtxHZdAjz
	 RdhLsM6qzgydo3C6wdZv5aCI5+0Dxakipha9SAanffrY51SlJjsoX6VnWKJFlLWFHE
	 bP6lWSDmVlV+w==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f3c895a0eso203991685a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 11:09:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH/yHRylSj/inGsE0Nl0UDjJxfG5rUjRqPWZBwqfGp7OGCG9WNFekI0bEGDmv4HdiTI+U5HcCS/1xEYoTnidQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/iXzttWxkkvNqJfFggIazoQu+iPmvLBbSbQEte1irsW+AqbHSv
	HdG05KsIs7XfQ7BKL/B36kyyXLarcxoYQunZ+6eWqpOPfn43BrwuI3THNanhBBFisBmNhMeuISc
	jL/ZaDPIPVxEbDzmkw2TxLHosY60NmP4=
X-Received: by 2002:a05:620a:2984:b0:93f:623a:adfe with SMTP id
 af79cd13be357-9479f326c45mr594443385a.58.1794337762570; Tue, 10 Nov 2026
 11:09:22 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
In-Reply-To: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Wed, 11 Nov 2026 03:09:11 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wPJ_QtogRWti7S_w2pLjp5OtiO_yMK3xPDUsbKb7vcpQ@mail.gmail.com>
X-Gm-Features: AclHuK-DC-lJkNatH4VO2rw16n-NSlpOLDxaxjxsORriFsDN1xlQXsk_TPJhSYE
Message-ID: <CAGsJ_4wPJ_QtogRWti7S_w2pLjp5OtiO_yMK3xPDUsbKb7vcpQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] MAINTAINERS: remove my reviewerships, add CREDITS
 entry for THP
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Uladzislau Rezki <urezki@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 8:03=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
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
>       MAINTAINERS: Remove myself from MM core reviewership
>       MAINTAINERS: Remove myself from MM misc, reclaim reviewership
>       MAINTAINERS: Remove myself from MM rust reviewerships
>       CREDITS: add entry for THP maintenance
>

Thanks so much for all your hard work across so many areas,
especially in THP/mTHP.

Acked-by: Barry Song <baohua@kernel.org>

>  CREDITS     | 6 ++++++
>  MAINTAINERS | 5 -----
>  2 files changed, 6 insertions(+), 5 deletions(-)
> ---
> base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
> change-id: 20261110-drop-reviewerships-264c745b11b5
>
> Cheers,
> --
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
>

Thanks,
Barry
