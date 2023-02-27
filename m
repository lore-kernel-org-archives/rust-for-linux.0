Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93730C64ED8
	for <rust-for-linux@archiver.kernel.org>; Mon, 27 Feb 2023 13:27:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjB0N1M (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 27 Feb 2023 08:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjB0N1L (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 27 Feb 2023 08:27:11 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A530196B1
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Feb 2023 05:27:08 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id s26so25635468edw.11
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Feb 2023 05:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=dJHsyePsJ0IlFQj6Pckv4AAM6go6Zr87xa6U4baD+nY=;
        b=ZTrP0zLV5ChL3MaT5FYI7oRx6ffD/UpKTPVhcdGRnds3z8oC/bPEPYDSj1Im6JeSzD
         91yBwW/+8Of76hbKN7wYFy1WeXPKtL/VfyKZfzbb+uYSTY8gTNa5SnZvyC42W815SZcr
         HGqwcTRmTxWAlS89GqvzcmJoTgMRFv/Q0GUh+QF0xUpTLQFzEquBNELCctmkta2YsVhu
         EKNrzuO0IfQJYjBeIluw6LwcRuMm5E5RUOZaXY5GuQ4A9cBa1d8BcXGPfRdZWophEa9p
         0FDUWXxFdj65NZ4CCHNIB0sGTlO5alCNvwidb2RrESaQ7A5Mw1Sd5ZRK/qwsklGtLOOA
         piTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJHsyePsJ0IlFQj6Pckv4AAM6go6Zr87xa6U4baD+nY=;
        b=Oaz3AqFkS3OUQCse0rs7BtxACk97D7S02n+6aTt2aJZszm6c77h5tORVDKqmGfrYt+
         7K5affaT06vEuH2JUDF5QdmevjMi8cwyVNCeeMjsJUrXCCR7+/JZF0DdD7QcTv2AAY3a
         WBcBytk0Wh+Lr16Cj0iMyrQy75XmBKOlXWYo7jK+Pk8Vn3L4G56TjTlrteW+ZTqbSgEu
         GgRF63XfdaHCeSTB5fp9Il2f0B9tClhujVZ9nuiuQiSFBFNoT9Ryhn1AFIeI9kXdD18o
         ZdhbfanKspm1zMTU8BimRzaLU7Nv9tUrQyE+hamX0R0TQVPXVgIaYq4pXyjTr1gH5Fw8
         wF4g==
X-Gm-Message-State: AO0yUKUfdDc8sKZoH/o2fUSJJU0P60TgugjkxqPk/6pSicQ30RpFYydU
        HK/nc2AleQY4k1WT5wsZokLJTw==
X-Google-Smtp-Source: AK7set9x5+NXrg0tuo8N9uBs22352iEOi22KS9wUDCnwIejgR5iMBbZgAX5tfWOnGM5EhMxFr+uWSQ==
X-Received: by 2002:a17:907:a801:b0:8af:4120:63a8 with SMTP id vo1-20020a170907a80100b008af412063a8mr36187922ejc.68.1677504427018;
        Mon, 27 Feb 2023 05:27:07 -0800 (PST)
Received: from localhost ([194.62.217.2])
        by smtp.gmail.com with ESMTPSA id z13-20020a170906814d00b008edc39530fbsm3203250ejw.219.2023.02.27.05.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 05:27:06 -0800 (PST)
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-3-f8f9a9a87303@asahilina.net>
User-agent: mu4e 1.9.18; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Asahi Lina <lina@asahilina.net>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Fox Chen <foxhlchen@gmail.com>, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH 3/5] rust: error: Add to_result() helper
Date:   Mon, 27 Feb 2023 14:26:02 +0100
In-reply-to: <20230224-rust-error-v1-3-f8f9a9a87303@asahilina.net>
Message-ID: <87lekj9r2u.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Asahi Lina <lina@asahilina.net> writes:

> From: Wedson Almeida Filho <wedsonaf@gmail.com>
>
> Add a to_result() helper to convert kernel C return values to a Rust
> Result, mapping >=0 values to Ok(()) and negative values to Err(...),
> with Error::from_kernel_errno() ensuring that the errno is within range.
>
> Lina: Imported from rust-for-linux/rust, originally developed by Wedson
> as part of the AMBA device driver support.
>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

>  rust/kernel/error.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 3b439fdb405c..1e8371f28746 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -167,3 +167,13 @@ impl From<core::convert::Infallible> for Error {
>  /// it should still be modeled as returning a `Result` rather than
>  /// just an [`Error`].
>  pub type Result<T = ()> = core::result::Result<T, Error>;
> +
> +/// Converts an integer as returned by a C kernel function to an error if it's negative, and
> +/// `Ok(())` otherwise.
> +pub fn to_result(err: core::ffi::c_int) -> Result {
> +    if err < 0 {
> +        Err(Error::from_kernel_errno(err))
> +    } else {
> +        Ok(())
> +    }
> +}

