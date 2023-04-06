Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B85C7618D
	for <rust-for-linux@archiver.kernel.org>; Thu,  6 Apr 2023 21:11:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236543AbjDFVLy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 6 Apr 2023 17:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238280AbjDFVLx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 6 Apr 2023 17:11:53 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845127ECB
        for <rust-for-linux@vger.kernel.org>; Thu,  6 Apr 2023 14:11:48 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id p15so47516776ybl.9
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Apr 2023 14:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680815507; x=1683407507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRvtPQUV2zYorRzvvyk9uhdC19h2Vjgt+Tm3ZsdCYjA=;
        b=W0YIzTEoqAZ/3bYc0tW4jgPYd08YdI8gWg646NbnKp79ZBH/XY/oErXm9jgBxdiC8d
         U0fvEK8Nxi3Ez21mvI9AqDCPG5ToqbUQS2KdIfT46HbUknX6110tZKoVmSPuBLA0hfDS
         wtkDbSByssLdIt4FDnjPmrXxBMiDKr15HZ/y/VnAOm6n0kWroyZaViJlMgGkYOLxQtrZ
         Mg6pdmBAECBda1ytwim3y/3MIDlkuR/mABdUmpyxr6g50ZrWgKBsY7AWYy03oM/82W8e
         h2bSMjeuOaOT7E90bghq/X4fhKsr8TS+DCbzFbCyozdjEnhgIpsUP/3u4Se4mmqLCQPr
         0lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680815507; x=1683407507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRvtPQUV2zYorRzvvyk9uhdC19h2Vjgt+Tm3ZsdCYjA=;
        b=iH+Jz2TOTdRHcrbdG8HvKoN/sGXrdgxl70D7xM6tnzOcYjQDka9VSmdqTajcP7oS3Y
         Hpo/m+g6LFiEpb5xE34IcJs2a0VqYqZKHHQiqiDwIztuqhXlZdAqvXpgECkH5mTEKvBH
         XlitvV1Y7hKPwyjBOxgFI7a0XRw8uN0Toyz8+D0pTLz4evXzrZmGV2/1vLIuv00YjaXV
         WU4zTmQZIkluTw6Vs7bYxMpe4U8fCTEwSlqZd75QzF4RYsR9RdQSAnIJr7o3jnnlpqxe
         AVJHeIMTQGUInIiD8pu4i2xDZcEub5ONVwuxAzjNn2uNPi1spgxQxEiSHPcd4h6TarVL
         ZDQQ==
X-Gm-Message-State: AAQBX9dXHhWObdFmtybcEPAnxfudq7e2EsH1IFquC/9UpNECUuJrd/4R
        7qYdo10fQGVdUGfMOWFbfrlhPKdUp94X7otks7FsnJOqi+Y=
X-Google-Smtp-Source: AKy350YcXkPavjki9HRL+Z7tnU6nNO980ygqTGu4VbAMv+ZGBQchCmuLXurHaivbIhYFis9JDm090cwV2HdrkH3H7RE=
X-Received: by 2002:a25:c845:0:b0:b21:5fb4:c6e6 with SMTP id
 y66-20020a25c845000000b00b215fb4c6e6mr310684ybf.11.1680815507518; Thu, 06 Apr
 2023 14:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <I0YeaNjTtc4Nh47ZLJfAs6rgfAc_QZxhynNfz-GQKssVZ1S2UI_cTScCkp9-oX-hPYVcP3EfF7N0HMB9iAlm1FcvOJagnQoLeHtiW3bGCgM=@bamelis.dev>
In-Reply-To: <I0YeaNjTtc4Nh47ZLJfAs6rgfAc_QZxhynNfz-GQKssVZ1S2UI_cTScCkp9-oX-hPYVcP3EfF7N0HMB9iAlm1FcvOJagnQoLeHtiW3bGCgM=@bamelis.dev>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 6 Apr 2023 23:11:36 +0200
Message-ID: <CANiq72kO=ocCwcj30RYeRvc+np5ec21p4hQneOvZDZ28wKsJkw@mail.gmail.com>
Subject: Re: [PATCH] rust: sort uml documentation arch support table
To:     dev <thomas@bamelis.dev>
Cc:     "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Feb 26, 2023 at 5:28=E2=80=AFPM dev <thomas@bamelis.dev> wrote:
>
> The arch_support table was not sorted alphabetically.
> Sorts the table properly.

Applied to `rust-fixes`, thanks!

Cheers,
Miguel
