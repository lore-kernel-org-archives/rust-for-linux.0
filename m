Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D6F2C3255;
	Mon, 23 Mar 2026 19:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292608; cv=none; b=nLVF+reQVaqaIv/yXZHAA7LMZsQPBzwpJTNgzNcYkKiGJ3g0bEdn5ROcDmBrxQ9ix7v8zQvj1dKAgDNV+hwJDA/hp9/fKgwg+XyktzgbNtuQ8+YtjluO2IjLblUMR0YmQgBnPxCVXydxuC9tuEah6N0nbsGslSDyetXrM9p0Yb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292608; c=relaxed/simple;
	bh=sch4WhKj+YmnN6X9EtkZcytACvf5i+MKqKJ1g+DG6QE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=rugbeIZAqh5eCYJLvfjr1gNZpMPjMTVOa7tX/YDKHftTuMDH8cZPaH1wTT/WAwWqR6lu60CAjxbPo4ev3M8iLRLGMWWAVWr2sjtSXP4PrncaAyOy5OYKVhQY2idNB8TRcxwc4ZRkdKrUeWpX7IBdJm0ZQOyiFAlr4paKpnm8ZfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJNPmHo7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJNPmHo7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00264C4CEF7;
	Mon, 23 Mar 2026 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774292607;
	bh=sch4WhKj+YmnN6X9EtkZcytACvf5i+MKqKJ1g+DG6QE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=lJNPmHo741mcCXb6UWcM9u0M0ELs6OwMegxElbnM6z6C3+dbxKSFH2T4Lekac+M0k
	 mA8j5DxG7uZgrE5UUQNtUMMSKMa85t9CBNvuefXS56WDvxoRM18ij4lrSnUqqDNZ2q
	 4MkIPn7+U/y2qYIm1RkNGFWkWBiw/du1lI1YrXgi9LvYwmcbyI+hl/I0LrONHAIUIr
	 qnxaDiAQccu4QCPcXJzmmlb2c6X9jlCpt+20ylXhy8DWwT+1JIbNsorP2V6DHedqAf
	 2BEJ9MUP50WoMTPYiednbNnEGaTc4o+cvGiQubSrY6ZDnYuSDWOJfV/ZzW5S8qNKjz
	 Z7puy5ClaM1GQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 20:03:23 +0100
Message-Id: <DHAE8HD97E6I.2VLTL6O5QWJQJ@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update Rust I2C Subsystem entries
Cc: "Igor Korotin via B4 Relay"
 <devnull+igor.korotin.linux.gmail.com@kernel.org>,
 <igor.korotin.linux@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Wolfram
 Sang" <wsa+renesas@sang-engineering.com>
To: "Igor Korotin" <igor.korotin@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260323-update-rust-i2c-maintainers-v1-1-0744ce44f846@gmail.com> <DHAB0HOXQJIV.2ZRJ1VMNEIEA6@kernel.org> <90810e54-3324-4100-9f04-1d4d07b20ead@linux.dev>
In-Reply-To: <90810e54-3324-4100-9f04-1d4d07b20ead@linux.dev>

On Mon Mar 23, 2026 at 7:46 PM CET, Igor Korotin wrote:
> On 3/23/2026 4:31 PM, Danilo Krummrich wrote:
>> (Cc: Wolfram)
>>=20
>> On Mon Mar 23, 2026 at 5:06 PM CET, Igor Korotin via B4 Relay wrote:
>>> +T:	git https://github.com/ipv6forever/linux.git rust-i2c-next
>>=20
>> I assume you plan to send the corresponding PRs to Wolfram?
>
> Yes, I plan to send pull requests to Wolfram.

Great!

(I just had a brief look that the branch, and it doesn't look like somethin=
g you
want to send to Wolfram, i.e. it points to a commit that is in Miguel's
rust-next tree. But maybe you just didn't set it up accordingly yet.)

Independently, since I think this is the first time you manage a kernel tre=
e and
send PRs, feel free to reach out in case you have any questions. :)

I can't speak for other people, but I assume Miguel and Wolfram are happy t=
o
help out as well.

In case you didn't do yet, also consider to request your branch being merge=
d
into linux-next, so conflicts, regressions, etc. with other trees can be ca=
ught
as they appear.

- Danilo
