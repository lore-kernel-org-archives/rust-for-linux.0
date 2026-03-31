Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBE13A9610;
	Tue, 31 Mar 2026 11:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954850; cv=none; b=W/ZbgWqm1JvdsS7eRobiLbioFlW9+4COXytJhn68ZjYs2yel/LAZj/0oufQSDHhvKFg+RIX4TA2e+XEMJtVkUv5zchk7unVdId08oFoLa1wXiXz08Uuvrgi1iG2t1tXHvyQc4zJBCQfuaLRzfUcX0jQkSQQnwG9iZHvF6STzHHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954850; c=relaxed/simple;
	bh=/WY7sRYSr9XmJ8Rz8pqYUChhYx8WY25hBYZ/xm+aq5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvRhcLB1GgYyZ49FvWyFkn40O9c429IQf1ZKQiLlee6XBVrG//jptGpFYKey/CskK77h3cvUedJo6UTchHyTxu1ark7qKfDn7r9eOdP8xYlJ63xxGKjr0Ee43XPCnY7viZYuZb/6MQmI0PXX5v+lxufDLIdf/yybKXDIB9tBWng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=pUa/wDWu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=stot4Z/5; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="pUa/wDWu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="stot4Z/5"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 24BE91400263;
	Tue, 31 Mar 2026 07:00:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 31 Mar 2026 07:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1774954848; x=1775041248; bh=2G2BmQ7dTY
	BfyXWaxJwp03kVRg/58F4oBucCQeJp6z8=; b=pUa/wDWuqyR6lvWd33u+wwjgrB
	+5lHmdb3zHWtBU/KiHZIqlDaljsMdTovW70xbVDqsvVgd3ZGNWLtmK2kk/btAQRw
	95wpP9j95Mncg3IrGLcMxZRZNSQ5pG9vo+xZT+vmjLTLiTPxzEYSeWg7kjPmhOlG
	2aBfB0PQO2BxQmd8NkEq9OW9Lmy7JKpR2+ufNrBBgvxlmr/mr/eigOAiY7kttPwV
	A00EPSOUMuPLgSgBWhvT1XBwUxVtBpID62SzCpGQbOKygiP81w0tJz9R20U6vejp
	UIT69H5Yoj1q6NWmDBti5VTOgcFMg9wpZgKrnSIEJ+vIQsvzkpDNiF+HwpJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1774954848; x=1775041248; bh=2G2BmQ7dTYBfyXWaxJwp03kVRg/58F4oBuc
	CQeJp6z8=; b=stot4Z/5wiM5gUJoqArSlcZBtLUf4oW0e3IgYN0S0m3oQh9FSta
	bAQiQQCwUJoSENKXkhGfhtAzJ2K+JXgbaBrrCwH8PNTJrborTfExJYeGlLxrqQ3j
	+9QN48lI7msuxcl4F1C4hveiZzAMJ8+4KX7fFCs7J2C8tR/99oDYl8nVg/JvtcPY
	wlNwQWo5tU1hYv7U0ap+TNnOrVS886qMaOoL1C3lVeBe/wllBtqWEN/bxSzafo+u
	fi0bHN4CvEFGPKiDLnAUazoYM45YSWBlmLd0gsKn14Oq80zaZALP2z7KBnmfGQXS
	cqglQuiB1zV3SgpL9c5obXq7KVg2ytiwtPA==
X-ME-Sender: <xms:X6nLaRMEOr4BtTovUxUo6o-nS951uN81Y2W4TJiw3uaA9E4ExsVtIQ>
    <xme:X6nLaUvXU5uqPwdYaQUzhJoWiEFnFSPPu7FkWq1UfMNrf3i3pfNCos2YIumaJfH2z
    R_qX2DuCTZQMLvEhnHAJuv4qUFO-H2ocCse12e5EPOGUbKK>
X-ME-Received: <xmr:X6nLaZI8CSfkWwkXRzFgJh4Ji-ajyxrILCUT1cmLryhRC6xrckDAhQQssC7Xc1wCzy3Q2TvTHFrm6VulQxQq47i0B753YO8NAxMdJgciv24>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    ffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffjuceo
    ghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeekvdduleehkeefff
    fgudfhvdejgeetvdeftdfghfffteetiedulefhtedvhefghfenucffohhmrghinhepghhi
    thhhuhgsrdgtohhmpdhmshhgihgurdhlihhnkhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghr
    tghpthhtohepfedtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlohhsshhinh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtth
    hopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhies
    ghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonh
    hmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhn
    rdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:X6nLaVmMkKM47KsV9Wjrn67vgIbxh54pCz5x3PGHTlmd92eHR2HRKQ>
    <xmx:X6nLaYn6ge0MV89mQ208Z0MfhfkuT1rikGEUV6n2uaVaGsPAwet4zw>
    <xmx:X6nLaQoyzgJM0o-vbrL-M6yRb7IayHJu5jraqbfecdDsfsuQsTSTgA>
    <xmx:X6nLadkEzUFLB4WQXUab09xo1Uy0JXcU9C6OeZ6vy121KauJCl7Yxg>
    <xmx:YKnLaQOqFsa3wxA-UFp1aOx_h6e-BP53Bl_IkWmimFXiGTl1Z2RVJOWw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 07:00:46 -0400 (EDT)
Date: Tue, 31 Mar 2026 13:00:44 +0200
From: Greg KH <greg@kroah.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tim Chirananthavat <theemathas@gmail.com>, stable@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.12.y 3/3] rust: pin-init: replace shadowed return token
 by `unsafe`-to-create token
Message-ID: <2026033132-cackle-magnetize-8f8f@gregkh>
References: <20260325125816.945578-2-lossin@kernel.org>
 <20260325125816.945578-4-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325125816.945578-4-lossin@kernel.org>

On Wed, Mar 25, 2026 at 01:58:16PM +0100, Benno Lossin wrote:
> [ Upstream commit fdbaa9d2b78e0da9e1aeb303bbdc3adfe6d8e749 ]
> 
> We use a unit struct `__InitOk` in the closure generated by the
> initializer macros as the return value. We shadow it by creating a
> struct with the same name again inside of the closure, preventing early
> returns of `Ok` in the initializer (before all fields have been
> initialized).
> 
> In the face of Type Alias Impl Trait (TAIT) and the next trait solver,
> this solution no longer works [1]. The shadowed struct can be named
> through type inference. In addition, there is an RFC proposing to add
> the feature of path inference to Rust, which would similarly allow [2].
> 
> Thus remove the shadowed token and replace it with an `unsafe` to create
> token.
> 
> The reason we initially used the shadowing solution was because an
> alternative solution used a builder pattern. Gary writes [3]:
> 
>     In the early builder-pattern based InitOk, having a single InitOk
>     type for token is unsound because one can launder an InitOk token
>     used for one place to another initializer. I used a branded lifetime
>     solution, and then you figured out that using a shadowed type would
>     work better because nobody could construct it at all.
> 
> The laundering issue does not apply to the approach we ended up with
> today.
> 
> With this change, the example by Tim Chirananthavat in [1] no longer
> compiles and results in this error:
> 
>     error: cannot construct `pin_init::__internal::InitOk` with struct literal syntax due to private fields
>       --> src/main.rs:26:17
>        |
>     26 |                 InferredType {}
>        |                 ^^^^^^^^^^^^
>        |
>        = note: private field `0` that was not provided
>     help: you might have meant to use the `new` associated function
>        |
>     26 -                 InferredType {}
>     26 +                 InferredType::new()
>        |
> 
> Applying the suggestion of using the `::new()` function, results in
> another expected error:
> 
>     error[E0133]: call to unsafe function `pin_init::__internal::InitOk::new` is unsafe and requires unsafe block
>       --> src/main.rs:26:17
>        |
>     26 |                 InferredType::new()
>        |                 ^^^^^^^^^^^^^^^^^^^ call to unsafe function
>        |
>        = note: consult the function's documentation for information on how to avoid undefined behavior
> 
> Reported-by: Tim Chirananthavat <theemathas@gmail.com>
> Link: https://github.com/rust-lang/rust/issues/153535 [1]
> Link: https://github.com/rust-lang/rfcs/pull/3444#issuecomment-4016145373 [2]
> Link: https://github.com/rust-lang/rust/issues/153535#issuecomment-4017620804 [3]
> Fixes: fc6c6baa1f40 ("rust: init: add initialization macros")
> Cc: stable@vger.kernel.org
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Link: https://patch.msgid.link/20260311105056.1425041-1-lossin@kernel.org
> [ Added period as mentioned. - Miguel ]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> [ Moved to declarative macro, because 6.19.y and earlier do not have
>   `syn`. - Benno ]
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Dropped from my queues due to the 6.19.y issue.
