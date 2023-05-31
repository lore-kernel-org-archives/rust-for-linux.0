Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1730C77B73
	for <rust-for-linux@archiver.kernel.org>; Wed, 31 May 2023 14:12:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237561AbjEaOM1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 31 May 2023 10:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237591AbjEaOMN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 31 May 2023 10:12:13 -0400
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7331725
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 07:09:13 -0700 (PDT)
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5153b118ea0so252099a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 07:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685542071; x=1688134071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C+3Et5cju5cYIbnO1iHgVsG4nORzzNf7kwjzGpF1D98=;
        b=fSR/a0RIq2Cy5mzkIieekB3gKX1I5GrCdYGfRHVjcL4N9W/KM5z1Sp1MnfrCjE2oKe
         N8FYnt1/jahwGDrdC+4F5EYePBRPewx4QoM0eLfI49srEYomVFEN8jnsu6wO5KuweTt8
         ri3KhOk+zDaY8WvQu9kgGdtxkqUfIUJkbg2caGBB8i3WihtvvXL46IcyT8m9oBzoxdB0
         VTj3sn6a0swNGVDJmpI6k7Cu89VMVv2/ET/shIr8PVepO489GnU3l1Nw5ghTOB8vTyoH
         cWt49Ecc8rUUiEigBPNA7dm4fguCpl/C+VVjFmL+R9ZKC/wcrtyem2wiRfTZNBw5J7pq
         yZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685542071; x=1688134071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+3Et5cju5cYIbnO1iHgVsG4nORzzNf7kwjzGpF1D98=;
        b=O1J4pAq4BoMawXtzAkgsGm/MfOWQHJrrKYGDhfyMn0jqnp3Yk8ST3rQybj+tEn8hGg
         f8ivtzwUugmjAfHCdosVEuWiZ0mKnGDwUNYT5Hvk+V8KLBDVKGxhE4CldFhBU1KC5ayq
         Un4iYaKst22mdQ2M0Iosp3LjCcndINJtc2xhXuuq7GQaDz5jOK4lA9CPXc7duAb3j4/K
         sgKAGyhvt4RIxRtN788Yb/g2uQp+4RZ+z6jXokBPz10NZJYCRVDx/wsljwQp0AnrVsxU
         /1zfZ07OZSHlgr8G/7euz/KL8qD5PNBozeXqH8wMA4ubWPIT7d5lZ0tq8avKYGWigblo
         UEiA==
X-Gm-Message-State: AC+VfDzmlEVodvoJXuC2K40dhAS+TQIRRaBmL5PsGYKHHY5Y02puNAHT
        k15+DTDVkpK9G3Z95wkaWUejawMcO3ndPLs=
X-Google-Smtp-Source: ACHHUZ4Uxtcd4Nb36kVy/ZZ9fTZ91issBPdsIRNi9Y3SHHpw4PLW1p5R6MOHEcA2pFIlzoxssI15H8ZkQTiW5bA=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:cdc1:0:b0:504:fcf5:63ee with SMTP id
 h1-20020a50cdc1000000b00504fcf563eemr1835699edj.0.1685542071584; Wed, 31 May
 2023 07:07:51 -0700 (PDT)
Date:   Wed, 31 May 2023 14:07:49 +0000
In-Reply-To: <87bki29jsc.fsf@metaspace.dk>
Mime-Version: 1.0
References: <87bki29jsc.fsf@metaspace.dk>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230531140749.3708572-1-aliceryhl@google.com>
Subject: Re: [PATCH v1 6/7] rust: workqueue: add safe API to workqueue
From:   Alice Ryhl <aliceryhl@google.com>
To:     nmi@metaspace.dk
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, gary@garyguo.net, jiangshanlai@gmail.com,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        patches@lists.linux.dev, rust-for-linux@vger.kernel.org,
        tj@kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Andreas Hindborg <nmi@metaspace.dk> writes:
> Alice Ryhl <aliceryhl@google.com> writes:
>> +unsafe impl<T> WorkItem for Arc<T>
>> +where
>> +    T: ArcWorkItem + HasWork<Self> + ?Sized,
>> +{
>> +    type EnqueueOutput = Result<(), Self>;
>> +
>> +    unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
>> +    where
>> +        F: FnOnce(*mut bindings::work_struct) -> bool,
>> +    {
>> +        let ptr = Arc::into_raw(self);
>> +
>> +        // Using `get_work_offset` here for object-safety.
>> +        //
>> +        // SAFETY: The pointer is valid since we just got it from `into_raw`.
>> +        let off = unsafe { (&*ptr).get_work_offset() };
>> +
>> +        // SAFETY: The `HasWork` impl promises that this offset gives us a field of type
>> +        // `Work<Self>` in the same allocation.
>> +        let work_ptr = unsafe { (ptr as *const u8).add(off) as *const Work<Self> };
> 
> We have this functionality in the default impl of
> `HasWork<T>::raw_get_work() where Self: Sized`. I am uncertain about the
> `Sized` bound. If it is sound to do the offset calculation here where
> `T: ?Sized`, it should also be sound in the default implementation of
> `HasWork<T>`. Should we not be able to change the bound on
> `HasWork<T>::raw_get_work()` to `Self: ?Sized` and call into that from
> here?
> 
>         let work_ptr = unsafe { <T as HasWork<Self>>::raw_get_work(ptr as _) };
> 
> Same for Box.
> 
> BR Andreas

I looked into this, and it seems like we can remove `Self: Sized` bound
from `raw_get_work`, so I am able to simplify this code somewhat.
However, it cannot be removed from `container_of`.

Thanks,
Alice
