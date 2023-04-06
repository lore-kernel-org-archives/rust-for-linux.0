Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5754C77B6C
	for <rust-for-linux@archiver.kernel.org>; Thu,  6 Apr 2023 22:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjDFWvB (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 6 Apr 2023 18:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbjDFWvA (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 6 Apr 2023 18:51:00 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C76FD30FB
        for <rust-for-linux@vger.kernel.org>; Thu,  6 Apr 2023 15:50:59 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id p203so47650113ybb.13
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Apr 2023 15:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680821459; x=1683413459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gq46P/Y+qz1diEOOMpawrFUXNj4MXJV5H9DHWMFDRRQ=;
        b=KAPw8CYgHPTOptt5FzkfzH61tyKu8No1Z52r9a2yUVv44CSCqJpYbJZXf7lRYlTTt+
         DgPxBF9E11b5N/uKnMPhNNIm4jgMNCskwU+OFFau8hL2MB8kLanzrD25lmXliAMkZV6C
         SARApCHgAfqkkExwRJi/qRkcj9sgPBa1hHoYFgl81ZL+IF+P2IOPVXGPcnR6znx8jGPC
         SBdMSvsjKSuMfvHRDVV9S+9pKHr4bJqBsMDnT8HK3kqGb2fiztI0ns6eDM3FoVpNjWni
         QFC4le55+fWBvGlzJ9uOH7/3AI9ocncbXb8Plz2U3owfv73TqYMGEL72nVeEdoG5K7uX
         J1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680821459; x=1683413459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gq46P/Y+qz1diEOOMpawrFUXNj4MXJV5H9DHWMFDRRQ=;
        b=Kt7/A/+Mz17eyxCKaBnEnCJk//ofN07T/JBKN43ic4SBdc8DfpR+3AN2+nlPfEe18d
         CZSpverUySfcVTGxXmMJ+7hjHr0bfBo5qymxa7prQsHZEn+/0Cjxjr9EnFD8PTEBf71c
         n0E2LVGL+r/3r3llUNjbbrUjulaSTIIYinJDm72z+pYysYTb8qonMsRgexijfRW9jtuR
         NWrD3DlrUXQRJU6BxGfWJ9IUUA+b67Yr5GXtgsdHBKaAxuj/RImKVIt8f1p0hSxPNNjP
         zr+yFDxxnkIRVgYF7Swolgx1LGWckakIt99OF03g/Hg1/Joii0SmkF3RcWY9Nmyzdp6Z
         nehg==
X-Gm-Message-State: AAQBX9e5FA6PPZzw0OaZtkYWINUoK1c7rXh1BKbF2HRZNmqBSLnyJUZN
        59+rFq6/iz0OxKRW/GR+WKBqRW1qp+qJs14MnZM=
X-Google-Smtp-Source: AKy350ZlcxTDLP+fRUjug9lGnqZb3mDm4iRwnsqHJq2TtiXDNIYeXkWGno76LRx+/7ELMIIRvv7NthQFxUEVrpn019k=
X-Received: by 2002:a25:d9d0:0:b0:b31:34ab:5ca0 with SMTP id
 q199-20020a25d9d0000000b00b3134ab5ca0mr542899ybg.11.1680821458922; Thu, 06
 Apr 2023 15:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230302132107.210502-1-vincenzopalazzodev@gmail.com>
In-Reply-To: <20230302132107.210502-1-vincenzopalazzodev@gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 7 Apr 2023 00:50:48 +0200
Message-ID: <CANiq72=50CZDDzdKTFpCtvfPA-1FHOhE=qpyywuxeUr8mybytg@mail.gmail.com>
Subject: Re: [PATCH v1] rust: build: Fix grep warning
To:     Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Mar 2, 2023 at 2:21=E2=80=AFPM Vincenzo Palazzo
<vincenzopalazzodev@gmail.com> wrote:
>
> Fix grep warning during the build, with GNU grep 3.8
> with the following command

Applied to `rust-fixes`. Thanks!

Cheers,
Miguel
