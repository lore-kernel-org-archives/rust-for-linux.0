Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7216C7EE23
	for <rust-for-linux@archiver.kernel.org>; Tue,  9 May 2023 08:07:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234915AbjEIIH6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 9 May 2023 04:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234957AbjEIIHn (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 9 May 2023 04:07:43 -0400
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C085110A2C
        for <rust-for-linux@vger.kernel.org>; Tue,  9 May 2023 01:07:06 -0700 (PDT)
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-50d88a986afso4244051a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 May 2023 01:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683619623; x=1686211623;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sefTIBuyPY1tklzs4eZt4f6X1hRT1gQo6nNE62cYqXw=;
        b=RAsdyPEVtcl1EExzGMYbQfdm5z+ZKoRFQ1f/kG7J4e8rJnMYer1P31mOW1C96Hc1MD
         xvQ1lBUrbVZjQPdDgWke++lW0s51PC8Cje+CBTwz+0lijAmKDThmd6z1F5M5LgNQwRQp
         Sa96nUO740TqCB6OsdVxs8z1J0i+i4/zfaKVNOv+w1i5qijNgN01QENvxjYt/5fDbIRu
         V65nwI1dm9D1w+oEf4GK03fMHS4d0uBm/ycFTMrsQGHJPlTL7HEfGIagMAcW5w9N8GKU
         +KTOmfAjngAqdrJw2J4uVvc4CtePTpu3Twnl/SdATYXPzGlg72rS3FfUmIkXXqawvBj+
         dszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683619623; x=1686211623;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sefTIBuyPY1tklzs4eZt4f6X1hRT1gQo6nNE62cYqXw=;
        b=LPeIg7YLs0TU+8OPQTDaM8ST0mD0egq1fJ5DvSP+N1tlKUfHkY3bGkQucXr9vzPWl/
         XrD4191uP9yW1LKdE+HPQrW6ZmutOC0QnkerTKCEBlFkSsbtT3UOtmKUPBLy5v3sKLoc
         +/t01XcKSnZEfuQ3ko9lQF3j9x96pQQqZqbfAQw3CfEQPazRhgHqD5oMUHgKwe2+v8T/
         4SFncdCj71mkLz+cjEYnKRPc5evDSV5/hHQDPn65IZnaKfjC4JaVJLCsOdtP40nKVWxH
         QEN1xJAJSq83qiyNiMvapf6yUalUr2JnFSz67O7SWglHoXiMvbXzMLXHZyJC9f0areGk
         fD9Q==
X-Gm-Message-State: AC+VfDxMgN9t3Nga8Cu1b8snrVITpXggxM8ASN2dw/kqDFMsl0pSsl9P
        ZdmgTaMA835CnDCZqIsIw3eOTg6H5nVAkDg=
X-Google-Smtp-Source: ACHHUZ5kqoAPjPokTiyAE943lxaftoydddV0k1qApv9fmVkqFVgkZfSBpWevHNlo7ES/Qb9HwMzmv+czd7rl34M=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:cd1a:0:b0:50b:c88a:f7cd with SMTP id
 z26-20020a50cd1a000000b0050bc88af7cdmr4762794edi.4.1683619623130; Tue, 09 May
 2023 01:07:03 -0700 (PDT)
Date:   Tue,  9 May 2023 08:07:00 +0000
In-Reply-To: <20230508124701.443ba331.gary@garyguo.net>
Mime-Version: 1.0
References: <20230508124701.443ba331.gary@garyguo.net>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
Message-ID: <20230509080700.1608146-1-aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: error: add missing error codes
From:   Alice Ryhl <aliceryhl@google.com>
To:     gary@garyguo.net
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, linux-kernel@vger.kernel.org,
        ojeda@kernel.org, patches@lists.linux.dev,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, 8 May 2023 12:47:01 +0100
Gary Guo <gary@garyguo.net> wrote:
> On Thu,  4 May 2023 06:48:54 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> > This adds the error codes from `include/linux/errno.h` to the list of
> > Rust error constants. These errors were not included originally, because
> > they are not supposed to be visible from userspace. However, they are
> > still a perfectly valid error to use when writing a kernel driver. For
> > example, you might want to return ERESTARTSYS if you receive a signal
> > during a call to `schedule`.
> 
> `include/linux/errno.h` also includes all of `asm/errno.h`,
> which defines EDEADLK - EHWPOISON, which is not included in this patch.
> I feel like these error codes should be added first?

It seems like there are a lot of asm/errno.h files:

$ find . -name errno.h
./arch/powerpc/include/uapi/asm/errno.h
./arch/mips/include/asm/errno.h
./arch/mips/include/uapi/asm/errno.h
./arch/alpha/include/uapi/asm/errno.h
./arch/parisc/include/uapi/asm/errno.h
./arch/sparc/include/uapi/asm/errno.h
./arch/x86/include/generated/uapi/asm/errno.h
./tools/arch/powerpc/include/uapi/asm/errno.h
./tools/arch/mips/include/asm/errno.h
./tools/arch/mips/include/uapi/asm/errno.h
./tools/arch/alpha/include/uapi/asm/errno.h
./tools/arch/parisc/include/uapi/asm/errno.h
./tools/arch/sparc/include/uapi/asm/errno.h
./tools/arch/x86/include/uapi/asm/errno.h
./tools/include/nolibc/errno.h
./tools/include/uapi/asm/errno.h
./tools/include/uapi/asm-generic/errno.h
./include/uapi/asm-generic/errno.h
./include/uapi/linux/errno.h
./include/linux/errno.h

How should I proceed with this? You mention EDEADLK - EHWPOISON, but its
not clear to me which asm/errno.h file I should base this on.
