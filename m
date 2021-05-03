Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00EAC43462
	for <rust-for-linux@archiver.kernel.org>; Mon,  3 May 2021 14:39:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A03D861283
	for <rust-for-linux@archiver.kernel.org>; Mon,  3 May 2021 14:39:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhECOke (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 3 May 2021 10:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhECOke (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 3 May 2021 10:40:34 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5CCC06174A
        for <rust-for-linux@vger.kernel.org>; Mon,  3 May 2021 07:39:40 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id b131so7812937ybg.5
        for <rust-for-linux@vger.kernel.org>; Mon, 03 May 2021 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dRa3QW+DeoEKLiKvmUDwItOO/ex4FM9ifQzMGkT+Kfw=;
        b=uUD6/GtT3QD1slcCH3VHOdyDW0LJi4H5Nzv1gG6CuMP8aTS/Zb+XlMefZA0oGUysFO
         UTlYfPqWqzprWIU/9lCZ4HZNksbidoj1C9AJmCq5D3Gs2vv9O0EFZhdb3AN7cnrwqOky
         CxXHnSPJm/bwCeD0uLTYCSc4XN/VoDJK42y+ECTYlqT32icAhs6FLALDK54DnM02C9rZ
         zY2Tk3hi/+/fEH26ydDx90PagoxtYIWlmQjpRv3ga850mdMbYC2mvCD/A4iCjgW+WsHq
         Zyc7Qk7vw9UZLDv8IKWgYfqNYo9hyFQ/Z0qwvXOd/JQh+rPPiWfz0N+UhK0UkWyjXuQC
         11LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dRa3QW+DeoEKLiKvmUDwItOO/ex4FM9ifQzMGkT+Kfw=;
        b=Vq+z1fxjX1cTTh9chq8pRXWoZ1qJ9U+6evqy10GWAVVPPrQ+PCOS0GGiP+vlX9agPv
         c4wG2sAWGeJ+q7N7VY7AD9e8oPaLHXhsMFo96H9XtyTofJGCv9a0cqwhZAadaqnHV5qR
         J6OkWd1z9ylG9nNI161RfIegRy00CFafXsnKSNzW8H200UGI6a/GJLSomDiNphjw3u67
         +CEqM0KEUa1IDjj9s1V2cdnyNTDt7hUjC9y5QhTz2ZETOhmq8wbLzz/pxVe1rkw3xynT
         Qf+FgnZjMeK1YBxc0V2clJFXSRYTpZEAjef6fALwfjW54/sv07CNjTZX8qb+vMhNauWk
         FyAA==
X-Gm-Message-State: AOAM533DXm82qX+SiEKqCAhVsQ2X768Z9xjr8w1PQnELpTWhHybaODhM
        rtIoQ+5M7m0l9P0Rd32lTC48J66tYuUvq+Td/Vw=
X-Google-Smtp-Source: ABdhPJyHpi3biFtEf3gdCoUz1b/rSGXo+VFRWFyGJDIwF/KJjVc6GEDhj93niValxyOc1fKmvbFoJb/qprtIko5pHB4=
X-Received: by 2002:a25:a448:: with SMTP id f66mr6526282ybi.135.1620052779922;
 Mon, 03 May 2021 07:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <CACAkLupnnniu-EJ6YmSt9Uo6_L+xBKio0yCs01A4ub7D+pLbKg@mail.gmail.com>
In-Reply-To: <CACAkLupnnniu-EJ6YmSt9Uo6_L+xBKio0yCs01A4ub7D+pLbKg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 3 May 2021 16:39:29 +0200
Message-ID: <CANiq72=XThSaQYoreBVfoLe7nN+tC3k5UnJ5pxrVW-Ym9OqMDA@mail.gmail.com>
Subject: Re: Bindgen error while building the kernel with rust
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Sumera,

On Mon, May 3, 2021 at 8:16 AM Sumera Priyadarsini
<sylphrenadin@gmail.com> wrote:
>
> The complete error logs are here.

Can you please try with bindgen 0.56.0?

    cargo install --locked --version 0.56.0

Make sure to regenerate the bindings:

    rm rust/bindings_generated.rs

Cheers,
Miguel
