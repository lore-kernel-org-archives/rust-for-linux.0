Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F1025F994
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 12:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771160189; cv=none; b=lzOU5+4kvRluspCKSu0OmhyjihNWo5PWvaWyPrVcbuzzdci5NrWaoyl6Li1saXNfZgJ8f+5utKeMXN9cbwh8qol9nPpn2Pe55hxQpYP4sWOcwWigwSC67iC+M7yzlzjZXlb3aWHFw8y4W/PVif2hNSvW/7JjfvVZcG18bH0Y8tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771160189; c=relaxed/simple;
	bh=z4ISTC1FYaouMEX9Z8Lsz7jGyb53J4krldYgHFmhfog=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dBjw2c+k+NyrX0DVoiNl6Xw7k3aKgdjcexF88OOiABOiwg7bBeITZ3NktwCYvhNRTnqJjyslwdpdIAqXeJmDCzFb+Yc0aEIymFb7Cpz51ZGmk3W5NaRf71hNx78P267udzqZ35aOGvHSRH7qWj2k+DZVP2KHLixXowhm3Nv2iGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBtnW1Rg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBtnW1Rg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC48C4CEF7;
	Sun, 15 Feb 2026 12:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771160189;
	bh=z4ISTC1FYaouMEX9Z8Lsz7jGyb53J4krldYgHFmhfog=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=PBtnW1RgBd3PcglMBshs45gLr9zxMuo69GHALSfjycvb5vFX+NLrQCJP4JPGGIqTr
	 AXtW/Gu8KR9yMIq9ndq2dHSauHtaNKjzlugy4jt2Oroz82srhN9M/1/nG/rl+t3tLG
	 41oS4bjx1NLqS9/iIXzAXUxw/2RL84cXRK2b0rZPg8cPaYt1zcluhHKhV9I5F92rwN
	 mETTmIhweNNp6XBwPkvZ03/D0yOrhcDXT1IHixj9aXjcjq/Gb7O4c03fsPWMxv97u4
	 US0tiuqBzQZO8iyjP/ZEpRaarxfl6hT+M6OUKWiLCdS27TqGajUVGQtdkgxLHtZd6W
	 +aTT33oCS8qCQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 13:56:25 +0100
Message-Id: <DGFJVWDJUOXK.27766P8H081G2@kernel.org>
Subject: Re: [PATCH 0/4] rust: add pointer projection infrastructure and
 convert DMA
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260214053344.1994776-1-gary@garyguo.net>
 <DGEM8AITP519.149B3IVELY7HA@kernel.org>
 <CANiq72kt-it2y8iAR6uA-EuJ8pVygwvOV70MSd5+vYwq1Tp9Bg@mail.gmail.com>
 <DGFHJP0MN0EN.254I1QVHR94VA@kernel.org>
 <CANiq72=+orB+-sTAJHiPQmz431+pCg2S5E9NFSbuh4NNhppfLg@mail.gmail.com>
In-Reply-To: <CANiq72=+orB+-sTAJHiPQmz431+pCg2S5E9NFSbuh4NNhppfLg@mail.gmail.com>

On Sun Feb 15, 2026 at 1:06 PM CET, Miguel Ojeda wrote:
> On Sun, Feb 15, 2026 at 12:06=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
>
> I just want to have a reasonable review time for the first patch since
> it is new code.

That's a bit vague as this may mean something else to different people and =
may
even depend on the actual patch and the people involed. I.e. we may have a
different understandng of what is reasonable in this case. :)

For instance, for the scope of this specific patch, given that it was sent =
by
Gary and already had a review pass from Benno I would not have any concerns=
 to
see it land within three weeks or so (assuming that it will also receive
positive feedback from Alice).

But of course it depends and as a maintainer I also constantly re-evaluate =
when
a patch is considered ready.

To me time is a less important measure; a more important measure for me is
whether the key stakeholders are in agreement that things go in the right
direction.

Having that said, it is perfectly fine not to rely on the judgement of anot=
her
maintainer is this case. It is of course your decision if and *when* you pr=
ovide
the ACK for this to go through another tree. :)

> That is why I asked whether there is UB "actually" happening today,
> because I wanted to understand how urgent we were talking about.

Ah, I thought you already know that there is no rush, as this topic was als=
o
raised by Gary in the last R4L call.

>> I do not see any reason for this to be backported, but it is reasonable =
to be
>> included in a -fixes PR.
>
> The backporting part was to mention that you were right that we treat
> soundness issues as bugs -- even to the point of backporting. I
> introduced that policy to try to raise the bar compared to C, since we
> want that "extra layer" of protection and to keep it up even in stable
> kernels.
>
> But it is all a balance, i.e. in the C side, it wouldn't be even
> considered a bug to begin with, unless there was an "actual issue",
> and thus unlikely to be justified for a fixes PR. So I want to make
> sure we don't overdo it on the Rust side.

Independent of the above, this is how I see it (and treat it so far) for bo=
th C
and Rust code:

If there is a potential bug (i.e. code that is broken, but no user experien=
ces
it so far) then I usually take the fix through a -fixes PR but don't flag i=
t for
backporting.

The reason I say usually is because it is a judgement call in the end, as i=
t
also highly depends on where we are in the cycle.

For instance, if it is early in the cycle and the fix is considered low ris=
k, I
rather take it (e.g. before another subsequent fix regresses due to the
potential bug). But if it is late in the cycle, even for a low risk fix, I
rather hold it back.

To me a soundness bug (that is not yet "abused") falls into this category a=
nd
receives the same handling.
