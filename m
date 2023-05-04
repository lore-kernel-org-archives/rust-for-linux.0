Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E50C77B73
	for <rust-for-linux@archiver.kernel.org>; Thu,  4 May 2023 20:56:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjEDU4q (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 4 May 2023 16:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbjEDU4l (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 4 May 2023 16:56:41 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C151FF9
        for <rust-for-linux@vger.kernel.org>; Thu,  4 May 2023 13:56:20 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-517ca8972c5so130961a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 May 2023 13:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1683233723; x=1685825723;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/gHEhMKT9GBaN9OxubZFLqV6RzaUkfxxEP2gzqQjTJo=;
        b=xmbz80sVRqhlJ1ie0lgFthhHlViw2dyCZoBeTedExuHEFouFm+OsPQzNxoj5AVTJiI
         dzSylmUHi9dTskEwQUwmpdaYt1K+4o+kuVp32zsiY3YowTfaKTCZNim1tdb283hvfOp8
         09CkD9b0vRjpj+cVBiDojXm7pXzkoGl6hGAY7tOceMxonHZ3ZVymbBj6LUC/qCh4vX/a
         bApfeEyYmZYipPd2VjGphcKwxaNSfD+6Y+HEo081uk5RJ2vnpWRz7teUgrGMxdwpvEZg
         AE7NCOjBi23HH+pNKDHQqFE0msKnZxAfcFtvkzeleOQkofcqAhDpsjz8rDgp3GpUTFez
         9Ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683233723; x=1685825723;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gHEhMKT9GBaN9OxubZFLqV6RzaUkfxxEP2gzqQjTJo=;
        b=ZC4ZkgUuiTMYMtthGhUsXDJm/MuuS0kTzjviZS7KYebmejEWlkaEy7dhLkitDdH1/L
         ElrJ2zyXKqyY4eiHSX0El2/escVYkw9+zNtoFwYrpEFvRbnBvgyaXgSlKTHLXdmgaFNz
         P51jUJujlWmHS251XJ7kab2/jnkeo6fS7ZS84miOD1hwG5L7dG0J81QspBjAkaItuEwR
         7H0dKd1z8Tfod55IuyjS/monGlXUQOcuLdsE8HN/HPQtnvtU4nhzyb+cedVJjXvpRE5v
         BL79iMYa3DzD32hfFe1yU0jVzlinyFlZQPVWbwL+PaMPxE073aaBCW+R28Cv46En7WHC
         wAgA==
X-Gm-Message-State: AC+VfDylW5OQH9w0a8EQ2pE886RDgKR4AVBt+euYnFC60/5dw/9ThSE6
        roNgZj+/IUOEBL1DKfFDLrB5mXy6zp//HmZpNH8=
X-Google-Smtp-Source: ACHHUZ7cSRKGSnvkFB0S4zZLqTu1C+ROgHFBUfU+QKoNjODu/ChiksCC/9eWmF7IDIxRWC1tOOWE+g==
X-Received: by 2002:a05:6602:493:b0:763:86b1:6111 with SMTP id y19-20020a056602049300b0076386b16111mr8372024iov.2.1683231778063;
        Thu, 04 May 2023 13:22:58 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id c4-20020a5d9a84000000b00763601c4bfesm9164423iom.55.2023.05.04.13.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 13:22:57 -0700 (PDT)
Message-ID: <80ed2c0e-54db-777a-175b-1aa3ff776724@kernel.dk>
Date:   Thu, 4 May 2023 14:22:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 00/11] Rust null block driver
Content-Language: en-US
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Keith Busch <kbusch@kernel.org>,
        Bart Van Assche <bvanassche@acm.org>,
        Andreas Hindborg <nmi@metaspace.dk>,
        Christoph Hellwig <hch@lst.de>,
        Damien Le Moal <Damien.LeMoal@wdc.com>,
        Hannes Reinecke <hare@suse.de>,
        lsf-pc@lists.linux-foundation.org, rust-for-linux@vger.kernel.org,
        linux-block@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        open list <linux-kernel@vger.kernel.org>, gost.dev@samsung.com,
        Daniel Vetter <daniel@ffwll.ch>
References: <20230503090708.2524310-1-nmi@metaspace.dk>
 <da7b815d-3da8-38e5-9b25-b9cfb6878293@acm.org> <87jzxot0jk.fsf@metaspace.dk>
 <b9a1c1b2-3baa-2cad-31ae-8b14e4ee5709@acm.org>
 <ZFP+8apHunCCMmOZ@kbusch-mbp.dhcp.thefacebook.com>
 <e7bc2155-613b-8904-9942-2e9615b0dc63@kernel.dk>
 <CANiq72nAMH1SfGmPTEjGHfevbb9tMLN4W7gJ3nBpJcvkCEsZ4g@mail.gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CANiq72nAMH1SfGmPTEjGHfevbb9tMLN4W7gJ3nBpJcvkCEsZ4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 5/4/23 2:11?PM, Miguel Ojeda wrote:
> On Thu, May 4, 2023 at 9:02?PM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> But back to the real question... This is obviously extra burden on
>> maintainers, and that needs to be sorted out first. Block drivers in
> 
> Regarding maintenance, something we have suggested in similar cases to
> other subsystems is that the author gets involved as a maintainer of,
> at least, the Rust abstractions/driver (possibly with a different
> `MAINTAINERS` entry).

Right, but that doesn't really solve the problem when the rust bindings
get in the way of changes that you are currently making. Or if you break
them inadvertently. I do see benefits to that approach, but it's no
panacea.

> Of course, that is still work for the existing maintainer(s), i.e.
> you, since coordination takes time. However, it can also be a nice way
> to learn Rust on the side, meanwhile things are getting upstreamed and
> discussed (I think Daniel, in Cc, is taking that approach).

This seems to assume that time is plentiful and we can just add more to
our plate, which isn't always true. While I'd love to do more rust and
get more familiar with it, the time still has to be there for that. I'm
actually typing this on a laptop with a rust gpu driver :-)

And this isn't just on me, there are other regular contributors and
reviewers that would need to be onboard with this.

> And it may also be a way for you to get an extra
> maintainer/reviewer/... later on for the C parts, too, even if Rust
> does not succeed.

That is certainly a win!

>> general are not super security sensitive, as it's mostly privileged code
>> and there's not a whole lot of user visibile API. And the stuff we do
>> have is reasonably basic. So what's the long term win of having rust
>> bindings? This is a legitimate question. I can see a lot of other more
>> user exposed subsystems being of higher interest here.
> 
> From the experience of other kernel maintainers/developers that are
> making the move, the advantages seem to be well worth it, even
> disregarding the security aspect, i.e. on the language side alone.

Each case is different though, different people and different schedules
and priorities. So while the above is promising, it's also just
annecdotal and doesn't necessarily apply to our case.

-- 
Jens Axboe

