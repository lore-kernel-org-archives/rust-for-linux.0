Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C236644DB6A;
	Tue, 20 Jan 2026 15:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922879; cv=none; b=S3WF2NGmRbmct2x0laUZ9skSTnzbI62QEj1cGgHFu0/mqqefkjrfJ7W9iRnRPTnN/70a9SN4Tpbok5mNakST79BVLI0BDLP6xbGM1BpOYEDc2CqXRSLkGfRTTl22HpnIfuQKrFDQB41sUYTVmLt6oJM827zD4dbD+L9fuWymjio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922879; c=relaxed/simple;
	bh=DAdfUhBZC+vDX30ufutripq2dqLFXhQ4wKrLozKOH2w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=d11YDR2qeOz2vDRwg+CXgHxkiyxnh3a7K34bHvmj/ryN6xVwggfBz9My9pkWFvUCorR0UpN4QeHG3Ix9wONw+hbVcoj3+qGI6zrdVx3ujuWxVjQvxA6xK6TvBOxMsnfuCMGN90Igxiam5zPatXK1GKyf/XO9Fc38MKbc03zljPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QetyZB5v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QetyZB5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C99C16AAE;
	Tue, 20 Jan 2026 15:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768922879;
	bh=DAdfUhBZC+vDX30ufutripq2dqLFXhQ4wKrLozKOH2w=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=QetyZB5vMx9T47u/2IfwTYkVC2MaWRmtoUJKcSmR9hyq8oWyL9Cs9ts/ZJc9NJmTi
	 w9pYjOAUh0dIuSDP9vs/Yb+fhKefcuuXfppednUfsRw/cWznxlTDIDyYroHBtGId4d
	 yQyWujtuIXOv9UPs3Dd0XIQiISxvYuC94bSrfsw2kXHscmCrof7o4H1FHVWXfQzEGc
	 wCBAhl9k4piELeY6X3hrkr5XQ3KqdXD1TX8I+cqo1DHEGbZ6IpVRHQAnFyfa1T28jC
	 rGeMhOE8VLq9VhM5+xAPVLw4vByP2xGEauxhCyTzpWV3F1AJ7qd1RbXNMXovVFtyYm
	 bYz8P0UP3sUAA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 16:27:53 +0100
Message-Id: <DFTITPLFU1HB.3VCKBVLW2VCPI@kernel.org>
Subject: Re: [PATCH 0/6] rust: add `bitfield!` and `register!` macros
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <CANiq72n9tSMFW1KHsLBLM-q47+4f7yM70CVFNVeg_3Q8i3RTvw@mail.gmail.com>
 <DFTGHU40Q7GS.2YXW1OUFRM2ML@kernel.org>
 <CANiq72=PWw6MW8NiHtFPmQ5C8xjzVJf2OOpVP2YQbsFqrB4XMA@mail.gmail.com>
 <DFTHCJYQHUHD.24MJ2SUFZDLTJ@kernel.org>
 <CANiq72m2tU-Zuv_MjLdjfK0qjE45YnuMmTTtrbzmrQ3=84ei=Q@mail.gmail.com>
In-Reply-To: <CANiq72m2tU-Zuv_MjLdjfK0qjE45YnuMmTTtrbzmrQ3=84ei=Q@mail.gmail.com>

On Tue Jan 20, 2026 at 3:57 PM CET, Miguel Ojeda wrote:
> I want to make things easy for everyone, and I know there is pressure
> to deliver etc., but yeah... I am supposed to also push back when
> things get stretched a bit too much... :)

I think it would be good if drivers other than nova-core would finally be a=
ble
to use the register!() macro, rather than having to go with raw I/O operati=
ons.

> Having said that, depending on what the "local bitfield!" entails,
> i.e. how much of a hack/workaround/extra work it is, it may be best to
> avoid it and go directly for `bitfield!`.

I think it's just about pasting the current bitfield work into register.rs,=
 such
that it can only be used from there. In a follow up we can work out how it
should turn out finally and have to patches: 1. introduce bitfield.rs and 2=
.
move register!() to use the code from bitfield.rs.

I also proposed that at the end of last cycle [1] because I think the two t=
hings
are mostly orthogonal and we don't need to stall register!() on the generic
bitfield work.

[1] https://lore.kernel.org/all/DDC49ZIRX79X.2Q4KW0UY7WUF3@kernel.org/

> But for that to happen, we would need Linus to really do the -rc8, and
> very fast agreements and reviews on it.

The register!() macro code is worked on by Alex for about 10 month in nova-=
core,
the first RFC for general I/O infrastructure is from March 2025 and the cur=
rent
series has been discussed on the list for about two cycles.

Given the above, that doesn't seem too unrealistic, let's see.

> It seems to me the easiest is that I give you a branch/tag for you
> (and others that want it) to merge with the `bitfield!` one next
> cycle. That would avoid the workaround too and Alexandre having to
> come up with another series etc.

You mean a tag with the bitfield!() code? Yeah, that would help if we don't=
 make
it this cycle.
