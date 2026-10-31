Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793419015;
	b=JVSQEYPMST9PzFPBHB6N9BMju0niMIhiXJOaVPF2MnjxHbtYvy2QpFneYvPf8Kx0J5yg
	 g/KYdZefNtMrmUQFHGnvFShtFjdBfhUJ2JqCaWmkuckb3+2nwseeU+0OWaBx48WhVP3sI
	 wou2WqU4UQYhRlmc3tOcbio2hVh7GBhClN12mVycVYm7+b9qZ3vKLduaxhKsQh+sGgp7+
	 uYnn7IkQ6xWwrkRjo4cCemOycvzSoXwssiIjWHet6mkZ0jTl2ehOQnWwxAyYDhCpTmw8F
	 RRhKHQGdd+QO99e5esrlz9BNqS3e5WelqJIVhRm4wF5E74lYNkdXJ/1KPqX5ePqPeHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793419015;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lUYSQL58Z1l7iwVXPu/HwltGbS4oDOiI85DONv17fbk=;
	b=i2AVruZ+9IDDGdF5QGSiInRA7U6JLYI5C6hie8Zkq8mZ0T1ZzbyI4i1LQacY6m2fde9U
	 KB+kT+HRCbQstrCwV2EnbDEle4FYZlKeUuzqIb45gw/RtUWtwQOBfBgVnpcCDBvFMNdEF
	 sbwG9uHhr6qflwppI8ANfWVN87NWCYQRRdU8ds2Ip8jKX0rZYt3nI0t6CkxT/o9WP0hgH
	 ThxbrX0g3PzAtyKgAb6sONibW7NQeLgx38bMKs1O+M/fk4piOJ7yGrW1yN0Jkcg+3fLIP
	 /1toVKQXQvY69U2K4STczfqhrzyjeuvfaWctdbk6aZLzTUiljWmrFTuCsL89jty/4HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VYUoQYDm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1977F606A31A
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 03:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VYUoQYDm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65341F00919;
	Sat, 31 Oct 2026 03:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793419014;
	bh=lUYSQL58Z1l7iwVXPu/HwltGbS4oDOiI85DONv17fbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VYUoQYDm/QWFSgjACawrTaMKppuOZmv2tywe1uW+wdybEVXqZTQDkvLPNerDg9dui
	 fu3kFlFoS9B4vnRRszrD+O8Yvg82Q+KxYtQ6OdYNTmHAfkyVEs4u88dg8hB0NFQQR/
	 Yitfoz8aq6/ZD5V+MC/pfqTqf3KQMjDUyo/aYyHPIvSIj+yjCgI8k7JwgwoYApjt88
	 brDu2YJVkngKbP7ZF3iEjzURpRhMicQ+QA8Dr/kk+4OFGgWkgXtiGBFqVQpjqm/gkx
	 eXKbBZ+Kclw3XoU3WX+Wnzy786TDcuQprGdBSGqeBeCeSUXAjCCvm1+NXjQLfMDWp0
	 OA4FYxbWQMP2Q==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1A471F40066;
	Fri, 30 Oct 2026 23:56:53 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 30 Oct 2026 23:56:53 -0400
X-ME-Sender: <xms:BWflas-7-DdXivVfX3HxNEAZ0WzCpyUT3I5doPmKKloT5Iq82xPl6Q>
    <xme:BWflah5IsAhGIP0W84VwrvJbRGW6MHfz8k55lzABiKRQd64xDCBUjb4UYVrz8UDUF
    E3I276t8Qz_jrOJ-HZIKvVe-KG03vw9GDpfDik2SLIXgxwqYPD_Mw>
X-ME-Received: <xmr:BWflamghOYs3hvQp1UD7CXpHQlR3mAS4iSIQuq-C8f1u8OJHQXnNBNzLafmqguGZ01frCCp8fS-WEbAPUSS61CefG2vIodxZ>
X-ME-Proxy-Cause: dmFkZTF3SpRX3NebFT+Y4n7NipcZ6SxNCL/51ViNUag5cpOd1HK8y0SFb3g6VgJlAlX5AG
    gLuBu+J6Q+d7IMed6ytcOUJNJPeZn/+Wa6brpWkr7vnbV6vDUOw7aV0TVrFQF/r+zSPwGj
    z7khfzrGmpk9Zv/MTbtPgQxkehdMS0PttnET+0QqLzA4+gT1ShBb0WU4+2gJ1RLnqZxwqG
    dLjuobZ9JKuSZpKsEtG/rwQc4W3UCZKFwtQHC7Jye/wp0Uk8evzMXyStiHvdmck+QHRLur
    hp24GssaJwXNOValb6WPZNgA6Rm0LMC1BO2feaMKa6YskRp1Gkzi912XPDHH68+Ovl9Zph
    6qFSNufha/SW9hm9wJp1X7wAYxLVsHnbwKnMg18wqrOMzRkEdN5AjrEDX3U+gmdMl/QmB8
    jA5Kl181JbDbQaEUIFTsGkypwtQ0r31A8LvwyLgkKUbclW4XEnOgfJR8OGroQXcJRUuh+O
    7sTRvSNNVeVRzoRTIi+XhJPZrsJh1+94YWSM9ZIKcgamxjS8qjKiEQviuxetjiEAPUjv8B
    KJjVWsI716ZlCa2VANwDlXkfxJiD4rQn7jdz6OKCH9yPIXZSvRjqWBlRjYJZKF+cjKhzNa
    m6BcnyZB+ZEN6AMSVCBz0XDSgZWuY48NuxALjwiFLi6SAotothMPXHAbv/Xw
X-ME-Proxy: <xmx:BWflaoqw_6xeOjt6bYA06k7afCxnavoiH7kB0oVs7MFRvJueKmykGQ>
    <xmx:BWflaiIMdDOaCJDiWgGvrkt0EHO4t5JufsicsptEk298LqU6kwMvHw>
    <xmx:BWflaltduZzYAw-_4e8HUA-JuyprfOS2Fbx0tIivYZhxcATpQGU0Xg>
    <xmx:BWflaiseqwz2gIt-_hiDKuR_GXgrqSkiPsp7AlZHEBDw-bS3GlhmjA>
    <xmx:BWflasVt6z1kjxBq4C4yDxVF7ZESXOMz0aLwR7Hopif2ZhaROnjWkca8>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 23:56:52 -0400 (EDT)
Date: Fri, 30 Oct 2026 20:56:51 -0700
From: Boqun Feng <boqun@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, acourbot@nvidia.com,
	aliceryhl@google.com, anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com, dakr@kernel.org,
	daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net,
	jstultz@google.com, lossin@kernel.org, lyude@redhat.com,
	mike@fireburn.co.uk, sboyd@kernel.org, tamird@kernel.org,
	tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1 0/2] rust: time: seconds based Instant
Message-ID: <auVnAysNI7H-1XoY@tardis.local>
References: <20261031003334.4161188-1-tomo@flapping.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031003334.4161188-1-tomo@flapping.org>

On Sat, Oct 31, 2026 at 09:33:32AM +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Mike's series added a free function `ktime_get_real_seconds()` [1].
> Andreas and Boqun preferred a seconds based `Instant` instead. This
> series does that.
> 
> 1/2 adds a unit type parameter to `Instant`, with no functional change.
> 2/2 adds the `Sec` unit and `ClockId::ktime_get_seconds()`.
> `Instant<C, Sec>` has only `now()` and `as_secs()`; there is no
> `Delta<Sec>`.
> 
> The `now()` doc comment in 1/2 changes the same line as [2]. Whichever
> is applied first, the other conflicts on that one line only.
> 
> Based on rust-next.
> 
> [1] https://lore.kernel.org/rust-for-linux/20260826162851.2497-10-mike@fireburn.co.uk/
> [2] https://lore.kernel.org/rust-for-linux/20261030044803.3863267-1-tomo@flapping.org/
> 

Acked-by: Boqun Feng <boqun@kernel.org>

Regards,
Boqun

> FUJITA Tomonori (2):
>   rust: time: make Instant generic over the time unit
>   rust: time: add Instant in seconds
> 
>  rust/helpers/time.c |  10 ++++
>  rust/kernel/time.rs | 123 +++++++++++++++++++++++++++++++++++++-------
>  2 files changed, 115 insertions(+), 18 deletions(-)
> 
> 
> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
> -- 
> 2.43.0
> 
