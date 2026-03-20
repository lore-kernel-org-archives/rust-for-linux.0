Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB4342C98;
	Fri, 20 Mar 2026 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774012528; cv=none; b=X1Qi2eeCGP0rWiAqhaOVFKurfRGl75cYZWKlnjJROeeQIqXhqTe0rH+U9uzKOEKgA1Q447O89yyyujXt8RXFfEsXcaWiGFe38fGkb+VoNXpRI8JrL3Y8LoKlK9v8WEr+sC1deWHZkZUkdHATcqBSe9KPBkvxffHd48tyjBUtXaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774012528; c=relaxed/simple;
	bh=EyBhL425h8kXCy67fQ8cCBrpBNIceAf+n7C/DCgDKZk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=a1NKRN20vPxlyyf7YdbNn7xuZA4lUSwKqUwtfcpoNWKUNdA/9hxIBesJFuwbDPOkWZt+diAvQXA1GGo0M8Bn/XE3PwPLRZsrRwh7vZfp/EGNRzuO4AdgcgvIpEJjLreDnpGt0IAwPvVhhwEDUhMbedSKVjrOLuIHSmBvrfyOcbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=EoVOhFCh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YEJCNv1p; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="EoVOhFCh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YEJCNv1p"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 113BE1400088;
	Fri, 20 Mar 2026 09:15:24 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-12.internal (MEProxy); Fri, 20 Mar 2026 09:15:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774012524;
	 x=1774098924; bh=GuN6bMe82spbdwCLAPKV8ioMJVP1/3b1dRWuYCJXZy0=; b=
	EoVOhFChes4n6s5E5MCyIJ2zNFys4mFD1iSyhi+RQwbgj1byM+LRHIOPaTG/NMy3
	n/q9aCODKLpWvw/caBvAT2Za8WH3eoLrIAtpRiyTtZ4+jYyFxt1mdQGKLiCi9jD5
	mcKh/BqjXk2uB5ggU9qkYzuvm6Qr/m413Al+UkyYU7hXszRUEZ8P+CEnFaU48ZAG
	EKm4NfC7lYme/czZIdLNJSbJEQD49RcXmMwaP21pdo5+YKTdSb3ExyS6R3PFD0QB
	QFhcDe5VB2sJUWrI2RYBOipBhXVMNBHpH88PUfdf58xYVNtuaZAkEGuluCQlc6MQ
	2enlxzT0c75tua7CjNMegw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774012524; x=
	1774098924; bh=GuN6bMe82spbdwCLAPKV8ioMJVP1/3b1dRWuYCJXZy0=; b=Y
	EJCNv1pnY6s+7HVoJfTwifWtHDuCOMqukoc/ja6ELudt50/KIf6YHwh0T99R0TuU
	rg4/K0lZCtWwIln0vumtrXAIDrMVXPcMMR8HN6zpmB5RNjx079WWCFMaHMAqfzkE
	4olz9x1mSlWkDVXyHo/BBNYjflsfYIfmmyJC6ObT4cdbtvUkywgOAtYHEDFb3cej
	hzrTr2PSNG5aLbELZcP/v1/rwLdvez3XslYy1gMvOkmSOmlSUtRvk6jUyTOqzMtq
	JIoaLhiKyI90Roz0k+PGwKWQkt2JkqGHodvDIPJVi12bq4VulF6n5sUkex96eH0f
	799CIfGjzU/nltEChkddw==
X-ME-Sender: <xms:a0i9aQGF3GqL30yiDjkPFQk7iUgUkGGwhROXjdKWPUPUn_X2xNCpYw>
    <xme:a0i9aUJb3vWjxLxL-TBI2P3kKvbsUd3UXtu_maN7OX7P_DNsrAk2xPaYmaQNuZgc8
    rJjMEzacRSkPXsca_VDUyytJ_Tp8izxjM0F6Ggv7FJ38Y__K94ZTLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdelleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfffgrvhhi
    ugcutfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqne
    cuggftrfgrthhtvghrnhepgfeftddvgefgtdejvdefvddutefgvdeiuefgudffkeelhfek
    veegieehtddvueegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopedv
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrd
    gthhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegr
    ihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrdhgrgihnhhorh
    esghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdr
    tghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtph
    htthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprgdrhhhi
    nhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:a0i9aQ5d1uy9LJyyW6YrkMROZSQGSwe4pvg-tr_Cups0CcXfTiMQkg>
    <xmx:a0i9aTg6kXEP7bmzLLbke-eC4FOa0N4vwnwpgSnkFNTBj5tndvR37g>
    <xmx:a0i9aTj_hXdkDQ9tR93HSEIOahX-GFUn59VwouEYcEZDq4xy8cCzHw>
    <xmx:a0i9abmhC-VhL0ETUDz3pTvf4sMLXAn2v0E9Ubk6VtKxTlA-XAB82A>
    <xmx:bEi9aRUaEnLQ_QKwh8raD41ZrNsvGJULieRst8FuAp_LT4_iXHrWUxbP>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6633815C008F; Fri, 20 Mar 2026 09:15:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AtQVIY85vbR-
Date: Fri, 20 Mar 2026 14:14:52 +0100
From: "David Rheinsberg" <david@readahead.eu>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>,
 "Shashank Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Message-Id: <a24da031-2aed-4e08-8b32-b255292c137f@app.fastmail.com>
In-Reply-To: 
 <CAH5fLgh-2uQbd+EvV2RT3prp4LqzLsDb1DFkYgj2kWZX58izfw@mail.gmail.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-17-jhubbard@nvidia.com>
 <125cb5fd-55fe-4c54-bdda-0478f5a8aabd@app.fastmail.com>
 <CAH5fLgieAZz4YAp4-Y1240mVt2V_Pu3TJ8YZyMkP1ZG_neafwA@mail.gmail.com>
 <d766522d-ef82-4300-919c-fed89f2f04fb@app.fastmail.com>
 <CAH5fLggFsjciKKxv7_k6tXqL=_8JrgAVWq-+xVH1PkGOew44KA@mail.gmail.com>
 <6163dea3-fa75-4403-929e-8ba9ba22eab5@app.fastmail.com>
 <CAH5fLgh1WMaUpLGTGpWiVjrnTtgFt=hhoutQqxV5DOtrGVsfkA@mail.gmail.com>
 <c7e8c581-5072-4184-ba75-783233bd52fc@app.fastmail.com>
 <CAH5fLgh-2uQbd+EvV2RT3prp4LqzLsDb1DFkYgj2kWZX58izfw@mail.gmail.com>
Subject: Re: [PATCH v7 16/31] rust: ptr: add const_align_up()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alice!

On Fri, Mar 20, 2026, at 12:12 PM, Alice Ryhl wrote:
> On Fri, Mar 20, 2026 at 11:27=E2=80=AFAM David Rheinsberg <david@reada=
head.eu> wrote:
>> align_up1:
>>         lea     rax, [rsi - 1]
>>         and     rax, rdi
>>         sub     rsi, rax
>>         lea     rdx, [rsi + rdi]
>>         cmp     rdx, rdi
>>         setae   cl
>>         test    rax, rax
>>         sete    al
>>         cmove   rdx, rdi
>>         or      al, cl
>>         movzx   eax, al
>>         ret
>>
>> align_up2:
>>         lea     rdx, [rdi + rsi]
>>         dec     rdx
>>         xor     eax, eax
>>         cmp     rdx, rdi
>>         setae   al
>>         neg     rsi
>>         and     rdx, rsi
>>         ret
>
> The conditional move instruction still seems worse as it breaks data
> dependencies in the cpu pipeline, right?

Oh yeah, it is definitely worse, but I think on an acceptable level. I w=
ould argue the cmove is a non-issue, because it is a reg<->reg move, but=
... meh, not sure I wanna dig deeper.

David
