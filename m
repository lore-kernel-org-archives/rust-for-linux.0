Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E684AB666
	for <rust-for-linux@vger.kernel.org>; Mon,  5 May 2025 07:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746430662; cv=none; b=D61fAV91nxKH4L4FID4UfVrJn2QbmEa4HP2wdH5Z7GErr9ER3yS3H6cxmbYlkQ9y5urxQgc4/YBfdJPOJL97IZl3u6OyyT0Fye30V1sfcg7ZxuGvYC5myYfxe/u2ZlGU2JEVApTTpcjLT9E0f9iW/9zOE3nj586utfudbteImtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746430662; c=relaxed/simple;
	bh=h1YW50sLoUMWSUmuaI9GruHDftw5IyamJf0qvphiN1w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uHkhrl3GTE4AcRlgl2yGwA41SN1e6R3qfFhOQUcfA8OL2ysR97mPPqkIvKvmrQ+Fl1lmLHU0pdb51mA+KqdZDURbiCWr7n8k/iwJyJXA+7h0CWta7vq51lTM9MjTXKpkytYWYlUj6rCqkCb1gLWdPRhBWPgO44VoqeL83Ch4bj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d7e4:b7bb:4b2:82d6])
	by xavier.telenet-ops.be with cmsmtp
	id lKdX2E00M1ymvt901KdXWs; Mon, 05 May 2025 09:37:32 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uBqOJ-00000000jmg-1kdV;
	Mon, 05 May 2025 09:37:31 +0200
Date: Mon, 5 May 2025 09:37:31 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
cc: Christian Schrefl <chrisi.schrefl@gmail.com>, 
    Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
    Jocelyn Falempe <jfalempe@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
    rust-for-linux <rust-for-linux@vger.kernel.org>, 
    Linux ARM <linux-arm-kernel@lists.infradead.org>, 
    dri-devel <dri-devel@lists.freedesktop.org>, 
    Linus Walleij <linus.walleij@linaro.org>
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
In-Reply-To: <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
Message-ID: <5bcf120e-72a4-fd2e-c70a-3cd34d04fc88@linux-m68k.org>
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com> <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com> <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

 	Hi Russell,

On Mon, 14 Apr 2025, Russell King (Oracle) wrote:
> On Mon, Apr 14, 2025 at 09:21:42PM +0200, Christian Schrefl wrote:
>> Hi Miguel,
>>
>> On 14.04.25 8:14 PM, Miguel Ojeda wrote:
>>> Hi Jocelyn, Christian,
>>>
>>> I started build-testing arm 32-bit within my other usual routine
>>> tests, and I hit:
>>>
>>>     ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>    >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
>>>    >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
>>> as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>>
>>> which comes from both these `u64` by `u64`:
>>>
>>>     let out = (self.carry / pow) as u16;
>>>     self.carry = self.carry % pow;
>>>
>>> Christian: I guess we can offer a set of `div64` functions using the C
>>> ones, at least for the time being, and eventually wire the actual
>>> operator with some support from upstream Rust. Or do you have
>>> something else in mind? (i.e. I think you have been discussing
>>> intrinsics lately)
>>
>> I think using the C implementations is fine. Not sure how much the
>> FFI is going to matter for performance, but it should be rare enough
>> that is shouldn't matter (and hopefully we will get cross lang LTO
>> or something similar at some point).
>>
>> We could also just implement the intrinsic(s) ourselves, but then
>> the u64 divisions would be implicit which is probably undesired.
>> We could also rename the intrinsics so they are only usable from
>> specific crates.
>>
>> I think we need the opinion of the some arm people here.
>>
>> CC Russell King and Linus Walleij.
>
> The kernel has had the general position that u64 by u64 division is
> silly and isn't supported. Several 32-bit architectures including

s/isn't supported/isn't supported implicitly/

> 32-bit ARM don't support it.

It is supported when called explicitly through div64_u64()
https://elixir.bootlin.com/linux/v6.14.5/source/include/linux/math64.h#L60
But you better think twice before using it, especially in
performance-critical code.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
