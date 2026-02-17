Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1E336E49E
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 17:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771350700; cv=none; b=qsBfe3+KSSCOzzsEj/cobtM6iBp8jAp19S87Z+qWbLheRyGR938MB+ONbZGtkRAv7PjUU0dYIutjzJEMl8twxRCP1W8Cf2el2/U9WVTlVrSQtic1oLzmbfuQdDna5w9VFUKU2QAR7iVQbgAftPQtNKjeQcSS9fGd4CFrwcT/ZB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771350700; c=relaxed/simple;
	bh=+qsGT0BtHCshLG7vFZATbsw1NgFxAVLhghQojwULgOw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WP863U9dnQolmebNmL+tBRH1cnpMaUmv2wqBel5lMuNYewsNQBrpXxiAqJemHhnou9v1qLCLNjBp+HCy8wLpbtd7jSP1CS6K2US46deKKVsqWvmzZNskNOe6LiI0RsGknedqGUZoXf9WlfWoS7rl8lrihK+z4l8dF/OMkPNe0bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/xbXyE6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/xbXyE6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F30CC4CEF7;
	Tue, 17 Feb 2026 17:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771350700;
	bh=+qsGT0BtHCshLG7vFZATbsw1NgFxAVLhghQojwULgOw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=W/xbXyE6xl5b6g0B85OkVAKLFLS7HoIPmkJToi5dx3so5Q2lAYY6ANgrYcsNLwxSz
	 6YhQydBG8z99i2DgfrrInqlAzq+yCHWhwzbsqfCi2CuEe7G/eKlEntqy1+0HxlGqU4
	 lz6+BMC1vDQzFgys2Bav2eFy+V2q2lOrMI5udIx0GFXJkT1VYcR2vsj53p7nTYp5Db
	 hF+iysCfgoNcQR0ENCCKY3cnS+rRRoPFLCMhbHYeoT+dWEB1wXNqTy7czRYdZv6rEz
	 8R4eOYVX3W+jXsZ3u9a/CT44qb3jMVEouJQMgEasScY4T3sDgRa3yMj6KrcdM/GTc5
	 iHp6MzRWUbJfQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Matthew Wilcox <willy@infradead.org>, Daniel Gomez <da.gomez@kernel.org>
Cc: linux-mm@kvack.org, lsf-pc@lists.linux-foundation.org, Alice Ryhl
 <aliceryhl@google.com>, Andrew
 Morton <akpm@linux-foundation.org>, Daniel Gomez <da.gomez@samsung.com>,
 gost.dev@samsung.com, Greg KH <gregkh@linuxfoundation.org>, Julia
 Lawall <julia.lawall@inria.fr>, Kairui Song <kasong@tencent.com>, Luis
 Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Evaluating Rust for XArray
In-Reply-To: <aZR-ItMBkiqyBdKd@casper.infradead.org>
References: <aZRncP-sKLLS2K1U@macos>
 <ix0mR76G9a_ieuQUUkkfHMJIviAsrFaO859172fuFx9Goj7QdIfz1jtnv3ptubGEC7uEFCvVfEoWxcisUnTi1g==@protonmail.internalid>
 <aZR-ItMBkiqyBdKd@casper.infradead.org>
Date: Tue, 17 Feb 2026 18:51:28 +0100
Message-ID: <87bjhncl7j.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Matthew Wilcox" <willy@infradead.org> writes:

> On Tue, Feb 17, 2026 at 03:28:45PM +0100, Daniel Gomez wrote:
>> We propose a topic to discuss the potential use of Rust in core Linux
>> kernel data structures.
>
> This is premature?  We can't move the pagecache or swap over to use Rust
> until we can compile Rust for m68k/parisc/alpha/... or we drop those
> architectures from the tree.

I disagree that this is premature. And I don't think Daniel is
suggesting we swap anything over at this time. Doing this work is not
the same as swapping anything over.

We don't have to wait 5-10 years for gcc to fully support Rust, before
we start playing with this. We can, and should, start evaluating if we
can deploy Rust in this area now. We might find that we are lacking
something from the Rust language to do what we want. We can work with
the Rust developers to make sure that the Rust language gets all the
bells and whistles that it needs, to support the use cases we have for
the Linux kernel. I think this would benefit everyone. Let's get in
early and help shape the language, rather than board in 10 years when
everything is settled and much more difficult to change.

On the other hand, we might also find that no, Rust does not work for
this. This would be a valuable outcome as well.

At any rate, this is not a call to end support for all architectures
that do not support Rust. Rather, this is a call to figure out if we
should work harder on getting Rust support for m68k et al.

Without doing this exploration, we cannot answer the questions.

Best regards,
Andreas Hindborg


