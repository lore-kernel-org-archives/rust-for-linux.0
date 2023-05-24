Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB21FC77B7A
	for <rust-for-linux@archiver.kernel.org>; Wed, 24 May 2023 11:19:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbjEXLTT (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 24 May 2023 07:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjEXLTS (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 24 May 2023 07:19:18 -0400
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32301C5
        for <rust-for-linux@vger.kernel.org>; Wed, 24 May 2023 04:19:17 -0700 (PDT)
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-96f9aa23593so75079666b.1
        for <rust-for-linux@vger.kernel.org>; Wed, 24 May 2023 04:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684927155; x=1687519155;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aSqeOEBaEovgqBOkQYpmiRbcLkCrvNP3WDOQXeuFBws=;
        b=YoTFNVu3BuXhD7O32uXMB2r5DmhBVaFcVMJtr/toOkSxoubHnULS6xAfeW2LnVMAlA
         AYEz2fGtxM3pIYSUnBK97NJj/BDHWhtjg5xXo1E0oD7tUbhsEX3CXPVlILQkcaRPv0ZD
         yjgEMiuiRLnKN6CsU3p9hbhjzB/iYU4uM2KkitkPUbglYVCC8SJ0awVM+Jd6nWLQuc/G
         ndgHixe0rgEmKz+2d++PnHjmKN8G+3JZbxp5NfqtrsOioY71sLNZHgs1D1AtBEUVenMn
         e3E2RvzhRBeZ9qYmqs3ZsfOY5VINcozwl6tDQaiEl1bE2crSn7TsrUNBfRLuLVdhuSpT
         1BoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684927155; x=1687519155;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aSqeOEBaEovgqBOkQYpmiRbcLkCrvNP3WDOQXeuFBws=;
        b=QXTSeXwM4AbQlEOfwR8NmZ9YYNI34QnyMO5sh7F2dvFGmNRtjwqtNUdEUjBvL/Ttgs
         ACYro15sSpV5rFvjSFWv0sCbqMZVvvS3P2XLkssOVQMPUwWexRVQ6XSQ4ANDGyxgRB2W
         pcN1CaHlSMQYTfXRpYxaLfyq6HP86xouQR1alrzbVBmv+IbXA9QXFML+u95zuN4xhgHe
         ksmHA6eboHdMHAB2QuLzkNlItPJenVAufSUIdBp5MlxvpT/DYl5i/FtGeTbK/MUWwQwb
         9/JaDq+hzmA0PFpR4OG1HNJ8njgneaqwKVJMH95ZmRaam62Axta5odOIJOImsO4FqQF3
         zMlA==
X-Gm-Message-State: AC+VfDyWb29/RXaBUbE55VBxcDSEG57VHsTemgLZl4zxq+LmBtAHlsXw
        p/Pg4CDZxIUC22N/h96bahZNQCWIsNSYXF0=
X-Google-Smtp-Source: ACHHUZ6hBDSsE8W54k3/04J7zLascPTlRf9I3nXEziDRNwk18BCOFdKa7mvtqXoJNKmy27weSOFwZUV7ytfiAEg=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:906:5a67:b0:96f:5864:eb6c with SMTP
 id my39-20020a1709065a6700b0096f5864eb6cmr6435514ejc.6.1684927155703; Wed, 24
 May 2023 04:19:15 -0700 (PDT)
Date:   Wed, 24 May 2023 11:19:13 +0000
In-Reply-To: <20230523164333.2c4b0d85.gary@garyguo.net>
Mime-Version: 1.0
References: <20230523164333.2c4b0d85.gary@garyguo.net>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
Message-ID: <20230524111913.2492665-1-aliceryhl@google.com>
Subject: Re: [PATCH v1 3/7] rust: sync: add `Arc::{from_raw, into_raw}`
From:   Alice Ryhl <aliceryhl@google.com>
To:     gary@garyguo.net
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, jiangshanlai@gmail.com,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        patches@lists.linux.dev, rust-for-linux@vger.kernel.org,
        tj@kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Gary Guo <gary@garyguo.net> writes:
> On Wed, 17 May 2023 20:31:15 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>> +    /// Recreates an [`Arc`] instance previously deconstructed via [`Arc::into_raw`].
>> +    ///
>> +    /// This code relies on the `repr(C)` layout of structs as described in
>> +    /// <https://doc.rust-lang.org/reference/type-layout.html#reprc-structs>.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// `ptr` must have been returned by a previous call to [`Arc::into_raw`]. Additionally, it
>> +    /// can only be called once for each previous call to [`Arc::into_raw`].
>> +    pub unsafe fn from_raw(ptr: *const T) -> Self {
>> +        // SAFETY: The safety requirement ensures that the pointer is valid.
>> +        let val_align = core::mem::align_of_val(unsafe { &*ptr });
>> +        let refcount_size = core::mem::size_of::<Opaque<bindings::refcount_t>>();
>> +
>> +        // Use the `repr(C)` algorithm to compute the offset of `data` in `ArcInner`.
>> +        //
>> +        // Pseudo-code for the `#[repr(C)]` algorithm can be found here:
>> +        // <https://doc.rust-lang.org/reference/type-layout.html#reprc-structs>
>> +        let mut val_offset = refcount_size;
>> +        let val_misalign = val_offset % val_align;
>> +        if val_misalign > 0 {
>> +            val_offset += val_align - val_misalign;
>> +        }
> 
> Given the layout of the whole ArcInner can be calculated as
> 
> 	Layout::new::<bindings::refcount_t>().extend(Layout::for_value(&*ptr)).unwrap_unchecked().0.pad_to_align()
> 
> The offset of `data` could be more intuitively calculated by
> 
> 	Layout::new::<bindings::refcount_t>().extend(Layout::for_value(&*ptr)).unwrap_unchecked().1
> 
> or
> 
> 	Layout::new::<bindings::refcount_t>().align_to(val_align).unwrap_unchecked().pad_to_align().size()

I'm not a big fan of the `pad_to_align` version (which is also what
the rust branch uses), but I like the version you posted with
`extend`, and I agree that it is clear and intuitive. I will use that
in the next version of the patchset. Thanks for the suggestion.

Alice
