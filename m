Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A223EBF02;
	Wed, 18 Feb 2026 20:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771445752; cv=none; b=dVeMcFXTnb8FHeNcx/0R6lSu88is5xTrK8KlEzWred0FtiVG16GDIdwDk1rtZI8+xnoZXmTCA0nZCRwPOFkgSqIVdht9jwtrVJQn6NmhtjFgrDp9jDoLzEd48VNMD4AT1t2LpfGmZjnt2xuqswQgF8gynox9GhMexQ4qqlrhN28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771445752; c=relaxed/simple;
	bh=mk0UF3cCYORlCR+XsKqR07GIc/DtHSjdHFV1IZBbHpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vu2wIb5oQKBxOrkR7pNtd/RMpEG/Dtp2IFYGRlpiZb8tO0RVS/uUcSuGHF1XP6/VrE6y7+kY5eM0OPkdDeKXkUu58MH07qK+mG3Dz8gNu1/D8k5+IgXItXmdxrB+VL3Tma1RU0/hS96mLrFp6PE5O0p4HrWJHqyAunMlr+PQnek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AV/DqXne; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AV/DqXne"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2162DC19425;
	Wed, 18 Feb 2026 20:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771445751;
	bh=mk0UF3cCYORlCR+XsKqR07GIc/DtHSjdHFV1IZBbHpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AV/DqXneIvZJ3MeL76TOOt5zFdzi5agCvkxM1iUQBpZqYNotiGYApmr52/Lx/pV7+
	 vYuhdkBk06hG7zTSc0kC3BtEzNuasAJ51sEieyBzLFgYzZ4ND7bGhHbONKMEd2qF4Q
	 dXOwIQvkXfrp8H5f5GNs/9FUNkm0sr8+hXYHGDWJvGzSCymY7g3PaH6i2Y9UIOJt7D
	 PPw/xcOkdrsLcLiO2yW2siin/i7KOjHwTegTiHdeHyeT9jhnFnQMj99EUacdEwPG1s
	 8agQhlpAc8y/QW1k9M5bmo9H+XhTZ+AIBCMPs993BVXXf6gevexzm2m0PgzAcOXp/s
	 4/Wx0U6LQ41GQ==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3C784F40068;
	Wed, 18 Feb 2026 15:15:50 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 18 Feb 2026 15:15:50 -0500
X-ME-Sender: <xms:9h2WaZME2Rdy-brGxFIZxMYMcdgW3mXElQXGIpmkUY3fq8RGSxBBng>
    <xme:9h2WadWbITUAVJnc9CxtfFfeZfju2eoppA8u2x8K5nBaVvmNBVO6I5WKDgtml42gb
    FmAqldS5IHcqWMjMKkdtKDicUHTsn2rgPjolfL9CgeUWrVAlNt0>
X-ME-Received: <xmr:9h2WaRh3Y8sVs-X8nbWmdObWifg8-80EzJ8zxx7bfoFTJMMRJdL1osbG6VvOBaE20_zLjVIIVv1IwK_9TS-9ZEuBFjrkGlkJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdefheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprgdr
    hhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvg
    hnghesghhmrghilhdrtghomhdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhi
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhrvgguvghrihgtsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopeht
    ghhlgieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnnhgrqdhmrghrihgrsehlih
    hnuhhtrhhonhhigidruggvpdhrtghpthhtohepjhhsthhulhhtiiesghhoohhglhgvrdgt
    ohhmpdhrtghpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:9h2Wad_7b5R0npLEBiK9F37B6JtKMnhxj4Ydt1i8GZeWfF7s9D7vjQ>
    <xmx:9h2WaYShMnmxMHUZsktnQvb8vo8EApDYBn-2HJTj86tdMuVMkiMspQ>
    <xmx:9h2Wacu6Poq0MWoDVAd6YjbOaIGTaZBl3Db9RyXPnkaDHFx4JXJZWw>
    <xmx:9h2Waa48myf3x1No6LGi2_x4Qml5CBpjf6EaKGeXUyr5EAMwzGD5jg>
    <xmx:9h2WaTJiu04ugge8C3wbg_OgkrNwROojNd9hSFSaepM_BnnS5ohApvUh>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Feb 2026 15:15:49 -0500 (EST)
Date: Wed, 18 Feb 2026 12:15:48 -0800
From: Boqun Feng <boqun@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: hrtimer: document handle based design rationale
Message-ID: <aZYd9Gb0s4pRv0X6@tardis.local>
References: <20260215-hrtimer-docs-v1-1-bff6a6c0d923@kernel.org>
 <w9M3-nQUCPZaiu1NQjuNk7nUcX8wlTLnfQULL71We74g3tq8548tFeXI0Cfgxe6wEhIHtK5xHaLZbke1PzJTKA==@protonmail.internalid>
 <aZTV6QPLDlF8_2B2@tardis.local>
 <87ms15c0hx.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ms15c0hx.fsf@kernel.org>

On Wed, Feb 18, 2026 at 08:31:06PM +0100, Andreas Hindborg wrote:
> "Boqun Feng" <boqun@kernel.org> writes:
> 
> > On Sun, Feb 15, 2026 at 09:36:04PM +0100, Andreas Hindborg wrote:
> >> Add implementation notes explaining why the hrtimer abstraction uses a
> >> handle based approach.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> > Thanks for adding this!
> >
> > Reviewed-by: Boqun Feng <boqun@kernel.org>
> >
> > However I feel these are not just implementation details. They are the
> > design decision we made because of the limitation you mentioned. Maybe
> > make them "//!" doc comment and just put them as a separate section that
> > describes the necessity of handles? Thoughts?
> 
> I don't think these details are important for the reader of the API? If
> you just want to use a timer, this is not something you want to read
> through.
> 

Fair enough ;-)

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
> 
