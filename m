Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B37C7EE2E
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 09:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjFJJGZ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 05:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjFJJGY (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 05:06:24 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FA035B6
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 02:06:20 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5149e65c244so3634313a12.3
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 02:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1686387978; x=1688979978;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=mN+zyGT4RiO5hJyab42n0AEdEzcvQs0N5fR0vaVW0/I=;
        b=484BjsGC+jMbPGROJxuKpNAswfn/m+tCmVNjm0XcKsMISHvv794fZjDpEowPU+VOa4
         HCZq9OQrdkzCh7ML0jrLjfhORbwjfSbgujFtlIr5F0tRJyqRVXqqC0SHxemHm05wYfM2
         rWE3w5PkyJE8P+gleQIq9G0ebc71KENF9FzYfYvI95EQiet2WeElcAd2GHlxW+7hi/Od
         gFcQ+gjNBayTb+XvGfiyJtdRbkX6AT5XxelJ0ykbrI9KsZe+RYF4vnbggH0nHaWEPA2f
         9auW7IBy0xUgqtX7zAGoHS0rIII6RbjcSGbqyp5Tz1D+ZRVyCUYu5xGdC48I5RtzBjMr
         67og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686387978; x=1688979978;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mN+zyGT4RiO5hJyab42n0AEdEzcvQs0N5fR0vaVW0/I=;
        b=PMoXV8P9l+CuZH0FY6GTG2TXSNPdxq7FthosEd5FsVgx7rfUqglgbbq3sk39bCtMRj
         pOMmEEb3YtRcPYRCwlROhoUeIVeuDDpzg0+pxYriaqMaXm9FLKL5zQzLsKb+TUivRfDY
         93IqeZL0TUJTAU+L6OGsbesKNwjBFHS4u6d7oUEANPtzW/3lKU0a4HRAqumvRBax242h
         8jli8n6atwOVLrSLBExJGXJl81forJb9bfz8bide8I6mLZ2LXX5rIhnbYJ/9IarRmKUj
         8P1FTrol7IgA7ubXscm1Q0OeWIu8wKmosWfn+SjX/II0oHsnJkEwi6jlhNEpg16CN59x
         5pXA==
X-Gm-Message-State: AC+VfDzptzQAxvxxmrgRkdYsSdZfdMa75QJ08ROh8dglC4XVQFKPQmpm
        jXOAxx6dplZ3K/VkTy+XX1c+/CshkUp1/wff6hAO3A==
X-Google-Smtp-Source: ACHHUZ7tm3geL7hES/5r4POU4kDwGoAghk7U7Rpi2ZC3B3WHwnLwvtaVqdnIc2vQ9bN4R+B8TQz+pA==
X-Received: by 2002:a17:907:9412:b0:973:d1ce:dbe8 with SMTP id dk18-20020a170907941200b00973d1cedbe8mr3766852ejc.46.1686387978374;
        Sat, 10 Jun 2023 02:06:18 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id mc21-20020a170906eb5500b0096efd44dbffsm2338466ejb.105.2023.06.10.02.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 02:06:17 -0700 (PDT)
References: <20230609063118.24852-1-amiculas@cisco.com>
 <20230609063118.24852-32-amiculas@cisco.com>
 <ZIPDCGM9HbPhR2yW@moria.home.lan>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     Ariel Miculas <amiculas@cisco.com>, rust-for-linux@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 31/80] rust: serde: add SPDX License Identifiers
Date:   Sat, 10 Jun 2023 11:04:24 +0200
In-reply-to: <ZIPDCGM9HbPhR2yW@moria.home.lan>
Message-ID: <87v8fvit4m.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Kent Overstreet <kent.overstreet@linux.dev> writes:

> On Fri, Jun 09, 2023 at 09:30:29AM +0300, Ariel Miculas wrote:
>> From: Miguel Ojeda <ojeda@kernel.org>
>> 
>> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>> ---
>>  rust/serde/de/format.rs         | 2 ++
>>  rust/serde/de/ignored_any.rs    | 2 ++
>>  rust/serde/de/impls.rs          | 2 ++
>>  rust/serde/de/mod.rs            | 2 ++
>>  rust/serde/de/seed.rs           | 2 ++
>>  rust/serde/de/utf8.rs           | 2 ++
>>  rust/serde/de/value.rs          | 2 ++
>>  rust/serde/integer128.rs        | 2 ++
>>  rust/serde/lib.rs               | 2 ++
>>  rust/serde/macros.rs            | 2 ++
>>  rust/serde/private/de.rs        | 2 ++
>>  rust/serde/private/doc.rs       | 2 ++
>>  rust/serde/private/mod.rs       | 2 ++
>>  rust/serde/private/ser.rs       | 2 ++
>>  rust/serde/private/size_hint.rs | 2 ++
>>  rust/serde/ser/fmt.rs           | 2 ++
>>  rust/serde/ser/impls.rs         | 2 ++
>>  rust/serde/ser/impossible.rs    | 2 ++
>>  rust/serde/ser/mod.rs           | 2 ++
>>  rust/serde/std_error.rs         | 2 ++
>>  20 files changed, 40 insertions(+)
>
> Separately from that - are we sure we want to be pulling Serde into the
> kernel?
>
> Don't get me wrong, Serde is amazing - it's highly ergonomic, and makes
> a lot of compatibility issues just completely go away. It's
> impresssively well done.
>
> But it's a full json parser (are you using it in json mode here? it

I think the json capability lives in serde_json, so this is actually not
a full json parser.

BR Andreas

> supports multiple formats), and object size is going to be a
> consideration. In particular, the way it works is by generating (via
> procedural macros) encode/decode functions for every type you use
> #[derive] an encoder/decoder for, so depending on how that was
> implemented that's going to add up.
>
> I would need to see text size numbers - the bloaty tool might be
> useful here: https://github.com/google/bloaty
>
> I'd give serious consideration to Cap'n proto instead, it's not as
> ergonomic as Serde (the get/set interface is not ideal, ask me for more
> details on how this could be fixed) but it's lower overhead than Serde.
>
> https://github.com/capnproto/capnproto-rust

