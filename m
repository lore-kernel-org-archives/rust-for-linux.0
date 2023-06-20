Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00852EB64D7
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Jun 2023 19:31:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjFTTbz (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 20 Jun 2023 15:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjFTTby (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 20 Jun 2023 15:31:54 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCABCD
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jun 2023 12:31:53 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9786fc23505so620008466b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jun 2023 12:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1687289511; x=1689881511;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RX3Z8paJOYxAa7WXw3jdtQzgBqer/iLoEtcVAeuC3YM=;
        b=Jl/MDnobbTeTKDYQ/+lJLlcthc3VY5MU8/9iNseOXvOSlP8TaSJkfOs9RFWvsEpPmV
         PIB8XKe8wc4GIJq9tCDH4ARtY8MGvwUuDx16rH/pFGHFTOwIpTuFGYAd5yF3fi0gJtKi
         +V0DC7dyMEoL5X+If4EMEJgPPQdxLzPqNzyDxCbt1pMmNqA9doYRiOctH/aEsnyDbiXo
         OlbA8EVTiTARKoos1g5JlrobTzdNEsqj6bFVf084Bv5b/1DErLHTnXWRwevZXRHbJFjx
         Wk9GbM9JvQJ6cot2Xfdd79nkHW7uvyO/nWejiRZ901Cv6L7lDWqnJBPm5cNx+HPak7zR
         Fd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687289511; x=1689881511;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RX3Z8paJOYxAa7WXw3jdtQzgBqer/iLoEtcVAeuC3YM=;
        b=iYKO45D4/D9LFUt86W9ZIhgfWhRHc3WSLKox7j5wv6R2IYPUr8zF12zOxJ0Jom8PKP
         OHXboNToPcPGInsaD8I/Dz9pqDOKYREi2pWDxj1+fZRX3Vv0lZCuIaxV8AnFKWE8IT4E
         khu0xGMQKaKo51g1S5FOEfxSd2Yd90QpowNqAqCHYcAK4oAUY94j0SAKxLZ07wjiwaLB
         0GVaVger0+ZLan4357DnF7BWZoTFX+WL5kpHV/rgCpvJ72gM+tnXUwX4pQeJJJuX10ez
         APA5IV6/ZaE+0MzDzzv0rg+xJ+pgSFYVqthEyEdgvth/V1p0OzajAgbHXPOB0mYZMEHh
         4spQ==
X-Gm-Message-State: AC+VfDwHc9naTBCmU+PukbNvLpLKIYq7BVpAiU/ZdTP4SlYBin674t0H
        Ehar4OUkS8MgqhaZcOu20O0gog==
X-Google-Smtp-Source: ACHHUZ5L+0MF7EzDzCXAsW/Xf2b/HOMK0I74qvEnK5wcOfb194+q25Vk1k4g734zImPPtNZzTN4VxA==
X-Received: by 2002:a17:907:6096:b0:988:9ec1:a8c8 with SMTP id ht22-20020a170907609600b009889ec1a8c8mr7544224ejc.54.1687289511363;
        Tue, 20 Jun 2023 12:31:51 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id o16-20020a1709064f9000b009890ab4efa9sm1874653eju.32.2023.06.20.12.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 12:31:50 -0700 (PDT)
References: <20230614230128.199724bd@kernel.org>
 <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
 <20230615190252.4e010230@kernel.org>
 <20230616.220220.1985070935510060172.ubuntu@gmail.com>
 <f28d6403-d042-4ffb-9872-044388d0f9d9@lunn.ch>
 <CANiq72mMi=7P9OxSH0+ORYDEyxG3+n5uOv_ooxMJ72YRBRZ+PQ@mail.gmail.com>
 <a4bc8847-c668-4cff-9892-663516cf8127@lunn.ch>
 <48a98d0c-bfd1-68a9-5d1f-65c942b7c0ef@crisal.io>
 <CANiq72=x9kEniX78vA7fLu+6wiwDKEr=BYy+aCMZ5S+eSRFf+A@mail.gmail.com>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Emilio Cobos =?utf-8?Q?=C3=81lvarez?= <emilio@crisal.io>,
        Andrew Lunn <andrew@lunn.ch>,
        FUJITA Tomonori <fujita.tomonori@gmail.com>, kuba@kernel.org,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Date:   Tue, 20 Jun 2023 21:12:49 +0200
In-reply-to: <CANiq72=x9kEniX78vA7fLu+6wiwDKEr=BYy+aCMZ5S+eSRFf+A@mail.gmail.com>
Message-ID: <877cryx74x.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Hi All,

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Mon, Jun 19, 2023 at 1:27=E2=80=AFPM Emilio Cobos =C3=81lvarez <emilio=
@crisal.io> wrote:
>>
>> Hi Andrew, Miguel,
>>
>> On 6/16/23 16:43, Andrew Lunn wrote:
>> > I said in another email, i don't want to suggest premature
>> > optimisation, before profiling is done. But in C, these functions are
>> > inline for a reason. We don't want the cost of a subroutine call. We
>> > want the compiler to be able to inline the code, and the optimiser to
>> > be able to see it and generate the best code it can.
>> >
>> > Can the rust compile inline the binding including the FFI call?
>>
>> This is possible, with cross-language LTO, see:
>>
>>    https://blog.llvm.org/2019/09/closing-gap-cross-language-lto-between.=
html
>>
>> There are some requirements that need to happen for that to work
>> (mainly, I believe, that the LLVM version used by rustc and clang agree).
>>
>> But in general it is possible. We use it extensively on Firefox. Of
>> course the requirements of Firefox and the kernel might be different.
>>
>> I think we rely heavily on PGO instrumentation to make the linker inline
>> ffi functions, but there might be other ways of forcing the linker to
>> inline particular calls that bindgen could generate or what not.
>
> Thanks Emilio! It is nice to hear cross-language LTO is working well
> for Firefox.
>
> Andreas took a look at cross-language LTO some weeks ago, if I
> remember correctly (Cc'd).
>
> I am not sure about the latest status on kernel PGO, though.

I hacked it to work a while back for the NVMe and null_blk drivers. You
need to build the C and Rust parts of the kernel with compatible
clang/rustc compilers (same major version I believe), and then pass the
right compiler flags to get rustc and clang to emit llvm bitcode instead
of ELF files with machine code. As far as I recall, some infrastructure
is present in kbuild, but I had to add some bits to make it build.

Also, I had some issues with LLVM not doing the inline properly and I
had to use `llvm-link` on the bitcode of my module to link in the
bitcode of the C code I wanted to inline. Without that step, inlining
did not happen.

I was able to build and execute in qemu like this, but I was not able to
boot on bare metal. I think the LTO breaks something in C land. I did
not investigate that further.

Eventually I paused the work because I did not observe conclusive
speedups in my benchmarks. I plan to resume the work at some point and
do more rigorous benchmarking to see if I can observe a statistically
significant speedup. Not sure when that will happen though.

Best regards,
Andreas

