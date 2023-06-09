Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0C6C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 09:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241041AbjFIJ2L (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 05:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241189AbjFIJ16 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 05:27:58 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8CF5FE4
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 02:21:59 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-3f9b4a656deso14072631cf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 02:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686302517; x=1688894517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7dy/7UOZEnjbV804XS2gwrBymSYak5DV4xMX2e5tt4=;
        b=P7tILOzSxaeHaDdxPMPLiq2+RCX4VpKboxCCbz4i1RkIweHD/bD0NCT6cZNDYgLVZq
         s0bJFYhOVLfMYC4crHP+zrK8uOjCyKgy8mcYP10OEcCIYbhAjnM9W+g35FnIHMDyuFPa
         mNbdUVsM3JjfQdxjXy7QAQ4h8+E+o+KLOFWtA2o/BjadFLM4lsxeoHWRqIdSKx+NUYeM
         aRJnHOgG3mmtq+emRc0vzaszOrnoFBoXor4gnnMd0SDxNapS0Nqlkr9m3eTvwKhpOlp9
         AkpAcYGHegQfLRsqTrPZrLhgpBZINV2PH9VI4I1jYoREAMTca/CAQtyvhx37wZyXBqVY
         1F5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686302517; x=1688894517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7dy/7UOZEnjbV804XS2gwrBymSYak5DV4xMX2e5tt4=;
        b=j5wu3Xf0+CEVk5mvSIpLsUZjU37guwc9VWtqGc252dbINq8Acf/gEwi8V5+PSqfyCt
         mUQ406OqOEQQzVGC7VzPO/Lmjoqx4icxtOB4Wb8M8B/fqpPtcRSia++p1g9RnVwaITfn
         WAjqN5XceJyX6DO8gWBz6EXAqY4KOZ6FaO6d7aBQVzQwi3e6TO+i8AznvzwIMbzw8Mxo
         37OMFUMmAZXldl9SEXVOZdMYQFMUL2C18tulL1jPMTJGngEbxJmqmkVkkH9PD5epH9u/
         amtQqxQfuqI8SdOpXnvmR8++Gn2nVFOxOdzBtLrtbG+8TecbAruThfffKe4XeC5yQYwe
         6rog==
X-Gm-Message-State: AC+VfDwScnfF2BJGzcAZjG1dEgi7K9kWkKBniYQZutmRuyMmmfowcWCN
        l13S+2HZFd3tXvzLGkqEznyYd2tUNrvsez1/obH9LC8N
X-Google-Smtp-Source: ACHHUZ7bKpULAnsRZDpO4SRKy9s6akTonGNqnFR13X24AVE5EQMBeOviRQPrE36X/2vcBHATdOyhuL9vKWSEB3YJckY=
X-Received: by 2002:a05:622a:4d3:b0:3f9:d671:ef09 with SMTP id
 q19-20020a05622a04d300b003f9d671ef09mr1060844qtx.9.1686302516762; Fri, 09 Jun
 2023 02:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-19-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-19-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 11:21:45 +0200
Message-ID: <CANiq72kM7TmWZ4kkaUB6_kdn4Qz0YemvYMzN97WRouWEF2NPjw@mail.gmail.com>
Subject: Re: [PATCH 18/80] rust: kernel: format the rust code
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 8:58=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>

This should be done by the commits that change the respective code.

Cheers,
Miguel
