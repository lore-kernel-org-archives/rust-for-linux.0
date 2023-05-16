Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE383C77B7F
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 May 2023 11:14:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbjEPLOU (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 16 May 2023 07:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232907AbjEPLOA (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 16 May 2023 07:14:00 -0400
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB085591
        for <rust-for-linux@vger.kernel.org>; Tue, 16 May 2023 04:13:13 -0700 (PDT)
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3063a78f8a4so5041339f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 16 May 2023 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684235525; x=1686827525;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sEUQpMHb6dJRirsjs02VRZsGdmT007slrG/7m3ecq4A=;
        b=jTh2sQy0h/wnTK3qlXXk0iLSLxxkkq3JJYemyleO0akNJycR3xdqBSpFNtuP78sZPH
         q1z/GaeVqh9f2wSvYHQqSuSK7Bnt7Fu3exPaDiHHDDRttWsjp+vLnZlEPiweSaqgYXGs
         w8cnMdF+arz1/vqXlDr6fqPt/uNxzKSj4h15+wWoA70j/0yrHfTLjW5ETXWnsjsuk/Gx
         dkH36a5oiSpgOQuj1kffDVVXxBdYnIH+/IrQ//0LrMqG6OGLj3rCv13LncGf0/iaSpk6
         tgSXGNexxLB2X+dNoIuTwdn2UNfplnB30pKsU61QfAH4pzhHPPxixiGt4jrRPoGXosGM
         L5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684235525; x=1686827525;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sEUQpMHb6dJRirsjs02VRZsGdmT007slrG/7m3ecq4A=;
        b=dLFM3/bDI1L5qi8iEX0kMXJzPD2r7+UQs3QXKZqavjaDG23L63xrFCIdXYYEmDzPSh
         7IQ0OCYs+hggaXF143YTiHz0Mw0zZkAGlPqhMn5FhUmZxq9m76VcipCAyR+fwV5U+N6C
         UcWo+5TfslzhrOzNYfI1x+PBgHL13hX/Wfr4C0Z1KfaoMpnW6kMDygCyuLUc5YXiAAr5
         WvP6H5z7PN7ze43nzKZc8zuALm5RUGU9YjFSvzgAQoJzggC5VKam2zK/1ZWRv+1CdPpK
         t0UgwRXuppQ8814o/SvRA1TtYjdhkLvXOH0xgD4lpkiRQMx5AZy0xwjvvwNE2oRFJDEK
         i1Uw==
X-Gm-Message-State: AC+VfDx9fWQia2Ekg1QEVavNFFV0kO4/OzaCQ2p2JlBF44d58MeAkgqB
        Eypa6OTxFOzywcmWGmQqkE43bqEa+s97Erg=
X-Google-Smtp-Source: ACHHUZ7bk6OwKBPWjNuvpRxLseI+VezMQERmUNQzW8hSrKxmZjJnVMCvYNXDCOS7pg3d6PBqqkO+3Thap10VUM8=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a5d:4ac4:0:b0:307:cea0:ee9a with SMTP id
 y4-20020a5d4ac4000000b00307cea0ee9amr2239352wrs.7.1684235525305; Tue, 16 May
 2023 04:12:05 -0700 (PDT)
Date:   Tue, 16 May 2023 11:12:02 +0000
In-Reply-To: <871qjhe9xh.fsf@metaspace.dk>
Mime-Version: 1.0
References: <871qjhe9xh.fsf@metaspace.dk>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230516111202.2455529-1-aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: str: add conversion from `CStr` to `CString`
From:   Alice Ryhl <aliceryhl@google.com>
To:     nmi@metaspace.dk
Cc:     alex.gaynor@gmail.com, alice@ryhl.io, benno.lossin@proton.me,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        patches@lists.linux.dev, rust-for-linux@vger.kernel.org,
        wedsonaf@gmail.com, yakoyoku@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Andreas Hindborg <nmi@metaspace.dk> writes:
> Alice Ryhl <alice@ryhl.io> writes:
>> On 5/8/23 13:41, Gary Guo wrote:
>>> On Wed,  3 May 2023 14:10:16 +0000
>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>> These methods can be used to copy the data in a temporary c string into
>>>> a separate allocation, so that it can be accessed later even if the
>>>> original is deallocated.
>>>>
>>>> The API in this change mirrors the standard library API for the `&str`
>>>> and `String` types. The `ToOwned` trait is not implemented because it
>>>> assumes that allocations are infallible.
>>> How about add a `TryToOwned` trait to the kernel crate and implement
>>> that trait for `CStr` instead?
>>
>> Eh, I don't think it's worth it. It doesn't give anything new to the CStr api,
>> and I think it's rather unlikely that someone will actually need to be generic
>> over such a trait any time soon.
> 
> It is just as valid as having `From<&str>` and `ToOwned<&str>`. While it
> does not add anything in terms of function, it carries intention. I
> think we should consider adding it at some point.
> 
> BR Andreas

Sure, I think its quite reasonable to add new traits, I just don't think
it should be part of this patch. Adding new traits makes it a
significantly bigger change IMO, and my changes have an actual user down
the road.

Alice
