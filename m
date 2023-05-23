Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2824FC7EE23
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 May 2023 11:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236722AbjEWL7i (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 23 May 2023 07:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjEWL7h (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 23 May 2023 07:59:37 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54582118
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 04:59:33 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-96f850b32caso803820166b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 04:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1684843164; x=1687435164;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=QR1MUsbPkF8iaQNWtY/LtUVVkhUDmli1/tIye2VFdbE=;
        b=qvuLsz9FjN+Ow6wPHmpPN9sq2xFW9UaiuZI8/RpzQTI46zGMjP+7RZAHi5FzfnzJSS
         hMlsWys/2phDu/pqehttwGb9aySSa8jbSxaTcbAPy7Mp1e5GuDioXy939L7T+V94S2ZA
         WIqthatCBC4qzoA5rPWm2W5kSwpTqIzNnC4IxUnuv5tz5nNEmE4T+Xsbu7quBpCUWkUP
         BOmC1G57K4/Jon8MuFyGFjeubHVzPCgyXDykRd00TrdEUnDvWXY5Zyy6A33txfd8Zfye
         u206w72qGadaHLfEI64LE8stqTZ4PIiN+HpE1ShYEM2Wd2uGI0aTyxStrXta5mlf1Ckc
         1isA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684843164; x=1687435164;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QR1MUsbPkF8iaQNWtY/LtUVVkhUDmli1/tIye2VFdbE=;
        b=lfAllOrFlla/50lCs60czehEdgFgd6D4WmmKsJQK+Wi572v9fMQUmGoMUImxSz+S8b
         ICS1g3Qi8bU91B9386Zxo0E6VYzVGGGgvJc2ELTei6ULsz3PhPjpzj4+lbxbjnwB038c
         73rGgy5HY39sPxGHXjPEqW39hmCz3k7WmU00K80qtK1JWFpeGKfD07pszGcOoq+FcUcp
         G/tvaBW7tJYseUISRY4HuvDiDrIygsmSdDUDvct1/l0L+alVNkF7Q7/KCIbMlgZQOXhs
         Rf0VzjQBEHdAvanQlcjY5AGxolSW8sy5/BFaWkhowFKu0GuHoxVrDa/UqoMTTJcXYnri
         T1TQ==
X-Gm-Message-State: AC+VfDzwB4SFEqEk8BSUG/dKERQruq1fZmj2Kcat82BWsqv1XM3xHxak
        qhT8Hp+2iRIHAOHVMIt9HPLGo0EK9XDqsj32UAA=
X-Google-Smtp-Source: ACHHUZ6mkY0TKM+w8HpDdJk16/geAD+v7LsqjoH7WywHI/OOlQ7m+A1qRTyVyO7jMKHN8tgQAS7z7g==
X-Received: by 2002:a17:907:8a12:b0:93e:fa12:aa1a with SMTP id sc18-20020a1709078a1200b0093efa12aa1amr14084404ejc.1.1684843164632;
        Tue, 23 May 2023 04:59:24 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id cf11-20020a170906b2cb00b0094ee700d8e4sm4321311ejb.44.2023.05.23.04.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 04:59:24 -0700 (PDT)
References: <20230517200814.3157916-1-aliceryhl@google.com>
 <20230517200814.3157916-2-aliceryhl@google.com>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Alice Ryhl <aliceryhl@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev,
        Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: [PATCH v1 2/2] rust: sync: implement `AsRef<T>` for `Arc<T>`
Date:   Tue, 23 May 2023 13:59:00 +0200
In-reply-to: <20230517200814.3157916-2-aliceryhl@google.com>
Message-ID: <877cszfeck.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Alice Ryhl <aliceryhl@google.com> writes:

> This trait lets you use `Arc<T>` in code that is generic over smart
> pointer types.
>
> The `AsRef` trait should be implemented on all smart pointers. The
> standard library also implements it on the ordinary `Arc`.
>
> Co-developed-by: Wedson Almeida Filho <walmeida@microsoft.com>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

> ---
>  rust/kernel/sync/arc.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index 274febe3bb06..9ec911e4a0c7 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -264,6 +264,12 @@ impl<T: ?Sized> Deref for Arc<T> {
>      }
>  }
>  
> +impl<T: ?Sized> AsRef<T> for Arc<T> {
> +    fn as_ref(&self) -> &T {
> +        self.deref()
> +    }
> +}
> +
>  impl<T: ?Sized> Clone for Arc<T> {
>      fn clone(&self) -> Self {
>          // INVARIANT: C `refcount_inc` saturates the refcount, so it cannot overflow to zero.

