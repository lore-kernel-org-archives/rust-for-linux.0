Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A39C433F5
	for <rust-for-linux@archiver.kernel.org>; Mon, 14 Feb 2022 14:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344462AbiBNOQx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 14 Feb 2022 09:16:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355024AbiBNOQx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 14 Feb 2022 09:16:53 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70BA72623
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Feb 2022 06:16:45 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id e79so19899076iof.13
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Feb 2022 06:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/U4N75GZZTfYHGqU3O3JGf1yXJo9xU6/RxI0E7HhYhc=;
        b=IHRYhdWK2kTP2H7Pb3mOdxfj+3jSBxtw7kvlz4WFp9BBz0RhI6v8TdL3fFTQCafKvw
         xtgKxH53ni5GjSVDKArX8u7+RTmNv68WUJVNkWvZQ8pCVTQOw9M5nTaXhnXHrSBG1ucs
         /+eZlHQu+cTttErVdp0dzBXYfZxtBmeqqeW0f5Ush8OxrnFSLRD2Qbk/L9/j5WhyhTno
         MlvlviHkwCI/X1gE+zOShI9NxTqZKx/tcjmgM5VtH6V0RZPyLK1eCZjvsWr3R9NesOJP
         7gGbOIGyi2ea78kzLbStli3nGImuUaOazQRFSp4cOqAj0u/ZapisK1e3iEMLtwPuRb4L
         CcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/U4N75GZZTfYHGqU3O3JGf1yXJo9xU6/RxI0E7HhYhc=;
        b=21WJMuyADofcDTjvF+sNbDXuPYhfu4NK4PyQlSEqeUrQj5ytNHBg6amLBObC19Lij1
         iuPuSIHoATvxKb/JI47QmPuU5s5CrskFNkGCLO75nyw4XjMGiT26j/8DmeD4+raueEc1
         2SiVPay1Ti2kHGrKhszGiQXg8Kl7xkFH7iuDZCf48zn8rHe0Q2GyILtTR6nESziTDtIt
         fQQc2cNR2bcFUbCnU+sW3G8bmMx+8RTR1K81cyxKX8d7nzEmoPEluR5H4boTkl1VPCYT
         ijjSayawrOd95wytc5Dv71VI2gKXdimm9oCHIQt5xlYgq6nvuIRpqKvJP5YQ1hrmVVUQ
         rMtg==
X-Gm-Message-State: AOAM53392ZTvuvN9/V0Z/DytNStghdyzAmt7cL2zetA9yteOU7M3NeLd
        rWoUxBcFiaKNfQW0PIT7eNJZUpMPoAawL2XIaM4fVJdWS+w=
X-Google-Smtp-Source: ABdhPJz+omQ6gQBZ18Pnqgnv4v0w8DY8wfYGhoC2Gqit4XUPfCpVnWXQ5BvFxCbL797r+MvG5caHdOH80n+v7zn1YiA=
X-Received: by 2002:a05:6602:140c:: with SMTP id t12mr7323586iov.177.1644848204858;
 Mon, 14 Feb 2022 06:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20220212130410.6901-1-ojeda@kernel.org> <20220213093135.7hvlvbsawcu2bjzg@gpm.stappers.nl>
 <YgjVmGiEygx1QNqF@kroah.com> <20220213105256.wvkwsccjtjleel7h@gpm.stappers.nl>
In-Reply-To: <20220213105256.wvkwsccjtjleel7h@gpm.stappers.nl>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 14 Feb 2022 15:16:34 +0100
Message-ID: <CANiq72=YFvXdSJ16ZiYwk8TZgsStJpJOUKR0EVq8Zsoq6BNf_Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/20] Rust support, nn/nn
To:     Geert Stappers <stappers@stappers.nl>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Feb 14, 2022 at 2:57 PM Geert Stappers <stappers@stappers.nl> wrote:
>
> Ah, Subject: [PATCH v4 20/20] [RFC] drivers: android: Binder IPC in Rust
> Thanks.  So 20/20 does exist.  That it is
> NOT at https://lore.kernel.org/rust-for-linux/ remains odd.

Sorry about that, some patches bounced since they were too long
(number 6, 10, 15 and 20 in rust-for-linux and number 15 in linux-doc
and linux-kbuild).

Cheers,
Miguel
