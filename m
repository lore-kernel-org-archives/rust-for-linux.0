Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD63C77B73
	for <rust-for-linux@archiver.kernel.org>; Wed, 31 May 2023 09:08:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbjEaJIS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 31 May 2023 05:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234573AbjEaJIJ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 31 May 2023 05:08:09 -0400
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101A3E4B
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 02:08:02 -0700 (PDT)
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-96f5157aca5so576880966b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 02:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685524080; x=1688116080;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h4XB69pI7oS1KTwJ1Q82+CkziVn4Zul+krCxNc20lxY=;
        b=hF5rhGXPOOd8eZdQQ3DNkBzapxJtKf68EiAo1a9IPWpXaz7OSTkyCGpwOoBmhtq444
         Edz0OVUOK2gCHE/qi5uSIDR+CfACSpofs3x7IPacH+5ka1Re4i5bYKMFCatM9wFkNQCR
         Kynv+nF73kgFpbzeZIT0fCY5WE7tXNEeMjTCQ2/oMNfLncKxNwr3tD+Rozz0gncc5H81
         L5MJaSrp0rJcoKjbIO4eQ5ZASfjN/sj5umJekwonfsGtrcZ+B7OpWx53w20tpFUp2C9L
         aWsG1eCu1roXKzUnkjDzPDLMcmI4nnBA7iBxTXLQ/oHhQvaExejAwggwLNG5S0tLKbJT
         o0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685524080; x=1688116080;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h4XB69pI7oS1KTwJ1Q82+CkziVn4Zul+krCxNc20lxY=;
        b=V70VMgm45qIeKBZRViRhTk4Gkubllf2gNKPI1YkoC3wlhIA7Xpj/HKxCKEQ8izwiu3
         RqmCG2/HFLmRBVH0FAgJMhhvvv5NJVHbvEupub877a9G8Ti8POMYCFAKaNRgQuyjpWIL
         2wEeccgH64lDXQjmRCIiJZrPg7xUVxpw16yMeQyMVI1l1JxYeeiTMz3buE6nAgAGiIst
         FaKr0psvRRn/XOsvEADW+JwKIcupW70EFISaNA2ynMWnD92XuiFuRm+E6NCZQAgjVbGc
         Iil+i35L2F4nBOwnAgfJAdYgngrINGZ0izm1pyjh2RuuW6sd3Urcumn5U1ffeW5QJhDi
         u8Jg==
X-Gm-Message-State: AC+VfDwfXgVyX4Y9DSK/Y7o1G8FtsxGiw4heuu46Hb2pU78s5HdbC0Fe
        dP0tcJIvP1bSeBF+elSiRaOoIZeLmQ845yE=
X-Google-Smtp-Source: ACHHUZ4jHWsOMdaL8fTbPxhKkMfcS5HXhNuYYha/28gUrN+9T6dw86HDPz24GnWXSS15B+jt4XcRCMsHnSQQxsk=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:75c6:b0:96f:4226:56d with SMTP
 id jl6-20020a17090775c600b0096f4226056dmr1253514ejc.6.1685524080625; Wed, 31
 May 2023 02:08:00 -0700 (PDT)
Date:   Wed, 31 May 2023 09:07:58 +0000
In-Reply-To: <ZWC2OS5uiRNgHMBBzQqt4FZXnOBeHw5IK5D7CAqfNC-z6nfYVLS9jXgvP2cMFvIMtVG22OGlmRGR9RkUJ53lip-SPiEkTHEiBoxMoL-K_38=@proton.me>
Mime-Version: 1.0
References: <ZWC2OS5uiRNgHMBBzQqt4FZXnOBeHw5IK5D7CAqfNC-z6nfYVLS9jXgvP2cMFvIMtVG22OGlmRGR9RkUJ53lip-SPiEkTHEiBoxMoL-K_38=@proton.me>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230531090758.3668499-1-aliceryhl@google.com>
Subject: Re: [PATCH v1 6/7] rust: workqueue: add safe API to workqueue
From:   Alice Ryhl <aliceryhl@google.com>
To:     benno.lossin@proton.me
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
        jiangshanlai@gmail.com, linux-kernel@vger.kernel.org,
        ojeda@kernel.org, patches@lists.linux.dev,
        rust-for-linux@vger.kernel.org, tj@kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Benno Lossin <benno.lossin@proton.me> writes:
> On Wednesday, May 17th, 2023 at 22:31, Alice Ryhl <aliceryhl@google.com> wrote:
>> +macro_rules! define_work_adapter_newtype {
>> +    (
>> +        $(#[$outer:meta])*
>> +        $pub:vis struct $name:ident(
>> +            $(#[$innermeta:meta])*
>> +            $fpub:vis Arc<$inner:ty> $(,)?
>> +        );
>> +        $($rest:tt)*
>> +    ) => {
>> +        $(#[$outer])*
>> +        $pub struct $name($(#[$innermeta])* $fpub $crate::sync::Arc<$inner>);
> 
> I am a bit confused as to why these types *contain* a pointer. Shouldn't
> these be exactly the same `Work<$inner>`, except they allow multiple `run`
> functions? So IMO they should embed a `Work<$inner>` and the
> manually defined `run` function would take a `$inner`.

No, that's not how this particular patch was designed. With the design I
used, the way you tell `enqueue` which `work_struct` field you want to
use is by using a different pointer type for each `work_struct` field.
This macro defines those pointer types.

So, for example, if you have only one `work_struct` field, then you just
use `Arc<MyStruct>` as your pointer type, and the field has type
`Work<Arc<MyStruct>>`.

On the other hand, if you have two `work_struct` fields, then you
instead use the macro to define `MyPointerType1` and `MyPoinerType2`
that both wrap an `Arc<MyStruct>`, and the fields then have types
`Work<MyPointerType1>` and `Work<MyPointerType2>`.

Alice
