Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF884283C9D
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 23:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777246717; cv=none; b=f2wnxYx7vH/2SOF0drbymcjriRcAzWqBLhDN/W1SeLnoHig4NTtK48aoKi8h2Un9TgEee/Z+lc3uBvAj/0SJ+wQR1yma0AXpeNiqtdPKNHIedf9NEL3uVe0BDp7NVL7fwNlbbb0JtBzf/rGbsxFdxvfanwzVxvY2vxlDMxiH+ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777246717; c=relaxed/simple;
	bh=tQQX89p6sFU8ycptfmMFhkAEqpetaV2wEeF3lhGe4iI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZCiCUf0Hy6Ac4ofLuaJYoCBXByEQLTaN603negAOl1Q+U+06T+ckLgnQEY9wpEGSkRtDJureLSWPe3pvY4zqQRnttAuDaKlkhHh9QM1c481T4xrlAEqxU0HKLk8buPAZdyh1TPSs0NQiiyeUA44rhzi+IkEfA7apwO+WTB7H1Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqGuUbNj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqGuUbNj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8DCC2BCAF;
	Sun, 26 Apr 2026 23:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777246717;
	bh=tQQX89p6sFU8ycptfmMFhkAEqpetaV2wEeF3lhGe4iI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=rqGuUbNjmXcGXFyJ6KfsuaY6nZ/ugthV1pTtqzGvzFb5IUbwE8S859nV+goADSkbH
	 XDMqgGuBwjVWJG5Tgh5y2LRJJaD3Re5eE43K+M6t/rchCmEs/gnYv7aBdD+07n6SdS
	 89pru2pM2q9Imr0LKScrYU8lVnIhsehxWSKpOqULeZ3HrrP1M36Ky2ZJ7ATCwSTYG5
	 oA3HPsYkz8wBEJOvOBvniXTVqMUEgzc6W2AT1OlFBixiEx5YqEP2Q8aa0YkHkVbsjG
	 9IP6D9PQnE7Zb8LUnLHtzzLOKuvCOw8Wm26xDl/TAHs03v1u5gW7s+2pWC0lx402/q
	 cPk6Kg3PGPigA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 01:38:34 +0200
Message-Id: <DI3HDPG6L4CC.CHUY8XUFNFHG@kernel.org>
Subject: Re: Maybe make Sashiko emails opt-in please?
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <lyude@redhat.com>
To: "Roman Gushchin" <roman.gushchin@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <971a606f-3319-46c5-ad84-a250f8044d53@nvidia.com>
 <7ia4tst18grc.fsf@castle.c.googlers.com>
In-Reply-To: <7ia4tst18grc.fsf@castle.c.googlers.com>

On Fri Apr 24, 2026 at 12:16 AM CEST, Roman Gushchin wrote:
> I generally rely on maintainers for the decision how to use Sashiko or no=
t use
> at all.

I think in practice, this doesn't work out. Regardless of how maintainers d=
ecide
for their subsystems, once another subsystem mailing list is involved thing=
s are
overwritten in one or the other way. This is especially true for mailing li=
sts
such as the rust-for-linux one, which span across various subsystems.

My main concern with the current approach is that I'm worried that contribu=
tors
of the subsystems / components / drivers I maintain may immediately act on
feedback without discussing the validity of the feedback or the solution fo=
r the
problem with other people on the list first, when it is received as a priva=
te
message.

(Analogously, I would not like if for publically posted patches reviewers w=
ould
provide private feedback to the contributor.)

That said, I don't know what a solution would look like to actually make th=
is a
maintainer decision; most likely it simply isn't possible and it has to be =
a
collective decision.

For me personally it would be fine if we could add a clear disclaimer upfro=
nt
that mentions that contributors should share when and how they plan to act =
on
the received feedback with all other recipients of the patch (series) befor=
e
acting on it (unless it is obviously trivial).

As for the opt-out, unless sashiko feedback is sent in a way that all recip=
ients
of a patch can discuss it as necessary, any sashiko mails to me go straight=
 into
the bin anyways, as I look things up on the website as necessary.

That said, I really like the tool and I think it provides very valuable fee=
dback
-- thanks for working on this!

- Danilo
