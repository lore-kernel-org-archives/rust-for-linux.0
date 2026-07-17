Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F9C3F8ECA;
	Fri, 17 Jul 2026 12:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784293095; cv=none; b=PdYTkYhrrWvAjhD9LO7bIIG/HRXJKTfX0y/dhvmqbz85191esjM3OrbNKz1sjpu3igwqEE7Yx507t02XIQvgoY3tYwCPfEk8Uf2412EZFJrNEDkJe9GOSjuSqLSM9PhUa8A82choTBvAuiVl6h6WWMwiV6INHzqv7q7u6BlQLl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784293095; c=relaxed/simple;
	bh=1QSX4gWdH8EnaTb9gfF5fzpPeWC35cOqhmjJw8sOf+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqJljBZ6Un/nfAAfH2+vKe/egK4DYEzQKTKxMkeXPjxai86Jx4wgDoSITfhJlIBVgxPAztopBFHTnoitD6951g3wlNuYSAXwzdFGd4K7Cqvq7etSuN8tF02Us3jLPQGIvOMaWmzTb6bjR8xWMd4JsSlrxwE4gEVcdL1Vjs5GubI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrIRTuWZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrIRTuWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130BB1F000E9;
	Fri, 17 Jul 2026 12:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784293093;
	bh=UVRdlHriBtYjcfo6LnWkRccXn6olRGUBta8HxoDI5Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nrIRTuWZ7VN2TZr+oCKnv07U0IFxrZ4y2PgdyZJvY9Gyi2vpk/eN6UTdcXJEX1BKC
	 ujfAsI4tyfwqY2jE1ClkpiOjUm2YWB2ikt4sRgAvDY8YohZMQmrOvFQ+GDdvZb2dyH
	 u0eQAmFrtr0q+iUwV9mWnYpOELXYO0h44CoqM5SoP5CWMKM6o0JraZlh18ke1MF590
	 /TfB3OqZ16PM9nn1knBE2GtVhsBKaj0ve7hRAKfDQDvrXBh5P+dzd7zCPTvr2X3UYA
	 h1PgHhMlxPPuaNZvvwjtP+TGV7EbjCcWole7aWGUFjsnQZxVsfEAEiqv13C99JVlXp
	 XTYLF+khlddzw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 26D5BF40090;
	Fri, 17 Jul 2026 08:58:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 17 Jul 2026 08:58:12 -0400
X-ME-Sender: <xms:5CZaaoL_l-vFJwZT5jCID8GgpvLPT1AykzxfsmaSe_q_Bf728LsAXQ>
    <xme:5CZaanbO1EunLcIWYRuL_QEX9vhQC1L8RKXPGhWRZF6rvtFEOyPzmdmnIRh2C0T4k
    OGb5u356xfjQxFP4Ev6KTbjDcAizWc37P3_1KhV8yMs5UuvZec3Kg>
X-ME-Received: <xmr:5CZaarjgQD4Ia8k_f_b8LHiivOZw5U9lvXQEcUCaHWL6njyM1U4oezNR2SSnQqdmzZMnore0GOwNVNlNT2ybh-PICAkQxGKK>
X-ME-Proxy-Cause: dmFkZTGvy7AgOXuXQon6+qPz9IIxFKBLO68Pvz18cMDHyLFjAWOA54thGimmuSxXIkuimb
    mzV0dHnnYqVcoGjE6KTFIvwXKmx9FPqvQjv/H7eAH/f1RCN4f5c2Xy3gaz1YjAvlc9UgSA
    Vw+K/kJgw2c9FdyY4GxwyNBbzk7Cu1LP7wBkuIl1oJiT3psP45QgGJJHms2Os39Td0LsWJ
    KrV4RLizFMKgszMtUj/MeAkFoXnsqw9JzfZ5PpfZ5w1ALBzHZHJQiYwwYB+R28d9AnbG+A
    aCnjFqYGTvDaAjJ2eMgd5yUzyAXJI8tIY9oO7aTQ8QmChQwOH3axQBz8CaL7aLtXnhIAfe
    iALBZ/ZUmcOAFo4FndenKIbq3nf30VBmeUX6c4ukUYYeMOJJGBVjX/j5HFjVJwxoNeI4Cs
    kLYp5w1qP9HuLP2m/Us5utd4CBjiEhshJ7GIeiFs91QwwEL31jZx//21MjnEvZ+hXuHLDV
    TJRZP7BkVvh4+vaFENe+y6kdEam9lgIDiFlQ0S4KhqJsa++OCj/W8EhIiq7flzXEgTgf06
    +NeBMfNExPTkmFR+fUrJu0fnTKirRBCqpYpW9D+9fS3agWzWZmIsoNns4NlAa00sD1bqeL
    hZpt7lHQpobesMFKtu4OtvxB544R1anaQ/Hg0/My2SAbrzXMyfULzenwPuyA
X-ME-Proxy: <xmx:5CZaas7V9gGDHWeNkdvmWOstjL8IFM3e1fa7L_cGd6zuc2WfxNsqOg>
    <xmx:5CZaajplZIs4T-_GdoS1yh6qHlvTfCaKl2MZqkeKMarWfzyP2ETxYg>
    <xmx:5CZaapiELAZk2asYCqWrB2OX49hRxsitTvvZx6NkoLn8vcPAK_SVig>
    <xmx:5CZaarvrSLV7NwVl7NrgZxQMnhCJDbnQvGntvDZENX8v5ccEcfbCqQ>
    <xmx:5CZaaq1KrYGXvwIT1x3NMhryBFr8nMkKByxWMWHSqYGRoukE6iMoBYaG>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 08:58:11 -0400 (EDT)
Date: Fri, 17 Jul 2026 05:58:10 -0700
From: Boqun Feng <boqun@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos Llamas <cmllamas@google.com>, Gary Guo <gary@garyguo.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/5] rust: sync: move lockdep types to
 rust/kernel/sync/lockdep.rs
Message-ID: <alom4tH__1DwOxiQ@tardis.local>
References: <20260716-pr-ratelimited-v2-0-31c27a4543d2@google.com>
 <20260716-pr-ratelimited-v2-1-31c27a4543d2@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-pr-ratelimited-v2-1-31c27a4543d2@google.com>

On Thu, Jul 16, 2026 at 12:34:25PM +0000, Alice Ryhl wrote:
> The lockdep types are currently stored directly in rust/kernel/sync.rs,
> but there are starting to be too many of them to keep them in that file.
> Thus, move them to a submodule.
> 
> For commonly used lockdep logic it's useful to keep re-exports in
> kernel::sync, and this also avoids the need to update any users.
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Reviewed-by: Carlos Llamas <cmllamas@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/sync.rs         | 135 +-----------------------------------------
>  rust/kernel/sync/lockdep.rs | 139 ++++++++++++++++++++++++++++++++++++++++++++

Alice brought it up offlist (thanks!): we should add this file under
LOCKING PRIMITIVES entry. This can be done in a separate patch if that
works easier.

Regards,
Boqun

>  2 files changed, 141 insertions(+), 133 deletions(-)
> 
[...]
