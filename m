Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E79D1FF1C7;
	Fri, 20 Mar 2026 09:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998831; cv=none; b=Im8zIOEIEoRYNu+QZ9EKeP8KZlR90QSMhCB1K+ctWkTur6RceL3rdD+lWxI5zjESKmdnBDsvTDfQGN7GeE8QXl1U3MABIPC9sqXV83gRnh1tDSRB4pp0G9IN3u1Hr8OqQurbuz+IhovlEveXQWY5C+LweQyyJJ9nzyYdz33Qo2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998831; c=relaxed/simple;
	bh=pPWZDhX+HtdQx3beMQojW008fXJaY1Ts8A4WsG/pNRo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dMIVZjlMbG71nKE66f7Kj1ro2FbzvjpXjx86vUUM96jZy7DfPlOeJB97M+TqPF3eJSXWeWz7j4hrReEFcjfxgWbY1kFXfrXJmjoJKCcODtn1l3eYKvRM2GFkyYaIfheT+OcBF28Dkeep0jq1PQX0reZklx0N6G+eAewrjPrYb4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=gA+Y+8Qi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vo2ar5fD; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="gA+Y+8Qi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vo2ar5fD"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 44350140018D;
	Fri, 20 Mar 2026 05:27:09 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-12.internal (MEProxy); Fri, 20 Mar 2026 05:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1773998829;
	 x=1774085229; bh=2qZYXRp93YhiAN3mli/CTXQQYMNSnkZwKPhBCTqz0s0=; b=
	gA+Y+8Qiocxfz6xEZLsqddjwMbKCbcqovBdg6PM7uIMgqA18dNanN3Z7TtNLWVwY
	Jh4+/faqZsM+czx/JB7sIfBlPzJKq2SO5WhTYk2aCJzLHdLI7ot1zFuyu8A82+LP
	9EM7FZ/JruWj+DhQf4Pat7HbKgX6qosp/xcgDzGb43i66l7Ob3YuKo+EYV4pX+7e
	iKFrMgONspFfF+3RnCwDpOABr++ZPiOc8sDH3ZT6yzMCa6AFrWB1Xvvp1AU8cC5c
	/oufHl+xg5noOoa9bPgz2BsKi/ZD1IiC8gIdqs2+1o9sG9jNGxo5H7zOAc22lXq4
	m72Lx2s8L5S9gz2qTZiD/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773998829; x=
	1774085229; bh=2qZYXRp93YhiAN3mli/CTXQQYMNSnkZwKPhBCTqz0s0=; b=v
	o2ar5fD/oVGLGJx1ZlpLHeZoJHoRnCHDr6TnVLoYyArM3CRRU28s+zGkLVzvfsUJ
	ga8zT6psKMsJvC/QnJMKY25AbOi5XGMMz4/Wv6zEZ4Qk6y2QOsdYcLhnwMbSB2wV
	bfcI2FQSW69um+SY622JHTx2UpIg9vSDa2frqdOTWo6zTSnxGR5KZ/PRMTcYCtBZ
	MgU7VrzUyvMYB2A5zemIDZcoO9Hx58wGsWBhdPxQgMHO7y47ZpM9qONzpF9xur4n
	Sg6g7wLxoh/DxsfEfdKPBw0s8UyGhr6AehTGX9wjY+hXhzskmd15XmB6v7GxFgXI
	cIOY79gaAKJum3akB8UnQ==
X-ME-Sender: <xms:7BK9acCXZEQsYPkRJqfmWGJ3yJ42gdp0IL6h4eziNkGqGYje5m8gQQ>
    <xme:7BK9aZXwub-UxQsLRaoxeWp0VtsJAJrAPeZMe-vlpLEED0FBYGBW02BudwduVKqrz
    f6Gm0ibC6WLX_i922BFzo-WtKRHVqWCqBJC1BfL6fIhpyLpAUjQK5IX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdelheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfffgrvhhi
    ugcutfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqne
    cuggftrfgrthhtvghrnheptefhteefhfefteffffffteevueejleeiheetgeehffeileev
    fefhkeegkeefgeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopedv
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrd
    gthhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegr
    ihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrdhgrgihnhhorh
    esghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdr
    tghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtph
    htthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprgdrhhhi
    nhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:7BK9aUtgP5hunPKQA3WNM2hwZLNXe6p-nyiAZzj6_o_OZjOklzOqbQ>
    <xmx:7BK9aU9HZfkD2vtZQvw-l98PMVbIeS0kgLZ21htlKa8T6WVOdli3kA>
    <xmx:7BK9aYT9FTNeFm0HVXvKWfWJXD3uvXG23SiEYCmulfW8f675Q6G-_g>
    <xmx:7BK9aaAlzH3CaspQBeXNr_WX0vXNbnL3yTddfr41welvkco2VevKkA>
    <xmx:7RK9ab2r2u5lgS2V9jG479CD30XCJTK88UNP_9OkdWLwuhCko4D0nn68>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id ACBC215C0091; Fri, 20 Mar 2026 05:27:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AtQVIY85vbR-
Date: Fri, 20 Mar 2026 10:26:48 +0100
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
Message-Id: <6163dea3-fa75-4403-929e-8ba9ba22eab5@app.fastmail.com>
In-Reply-To: 
 <CAH5fLggFsjciKKxv7_k6tXqL=_8JrgAVWq-+xVH1PkGOew44KA@mail.gmail.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-17-jhubbard@nvidia.com>
 <125cb5fd-55fe-4c54-bdda-0478f5a8aabd@app.fastmail.com>
 <CAH5fLgieAZz4YAp4-Y1240mVt2V_Pu3TJ8YZyMkP1ZG_neafwA@mail.gmail.com>
 <d766522d-ef82-4300-919c-fed89f2f04fb@app.fastmail.com>
 <CAH5fLggFsjciKKxv7_k6tXqL=_8JrgAVWq-+xVH1PkGOew44KA@mail.gmail.com>
Subject: Re: [PATCH v7 16/31] rust: ptr: add const_align_up()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi!

On Fri, Mar 20, 2026, at 10:03 AM, Alice Ryhl wrote:
> The Alignment type can only hold values that are a power of two.

That solves my concern!

Kinda off-topic: why doesn't `Alignment` store a u8 that represents the exponent, rather than the power? The left-shift when needing the power should be effectively free, shouldn't it? It would avoid all the unsafety in the impl.

>> >> FYI, `core` provides `usize::checked_next_multiple_of()` ((const-)stable since 1.73). So an alternative would be:
>> >>
>> >> pub const fn const_align_up(value: usize, align: Alignment) -> Option<usize> {
>> >>     value.checked_next_multiple_of(align.as_usize())
>> >> }
>> >
>> > That would return value+align when value is already aligned, which is wrong.
>>
>> You sure? (emphasis mine:)
>>
>> "Calculates the smallest value greater than or **EQUAL TO** self that is a multiple of rhs."
>>
>> assert_eq!(16_u64.next_multiple_of(8), 16);
>
> Okay, well, weird naming then.

Do you need this helper then at all? I assume it is added because `Alignable` cannot be used in const. But it hard-codes `usize` as type, yet does not reflect that in the name. It comes down to which one is more readable, I guess:

    const_align_up(value, align)
vs
    value.checked_next_multiple_of(align.as_usize())

Meh, I don't mind too much. Just wanted to point out that the standard library provides this exactly.

David
