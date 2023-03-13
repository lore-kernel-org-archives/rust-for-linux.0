Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641D3C6FD1F
	for <rust-for-linux@archiver.kernel.org>; Mon, 13 Mar 2023 01:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjCMBft (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 12 Mar 2023 21:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCMBfs (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 12 Mar 2023 21:35:48 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB61E2472A
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Mar 2023 18:35:43 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-541a05e4124so26480317b3.1
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Mar 2023 18:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678671343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQY9axLjHAeAKXuWF4/IhEXMYhGLO2zftPOMSzsNkik=;
        b=SK57ly/L/50DhFf5SyG+pyT7EJjxD7zYRDDXNBDWF1TfYK6MdYIHkOeZq5jd//JO+O
         jZhG7G4phtRt26nFE4mYW16lt3kzkc0t3TAiayupEoHCJvRwHaKjTfmDe23+h9jIqrax
         khf+Xj/6mITJJZEu7AyX9JfWm7+mmCBhHVEESpTxums0dzwkpIWpGwHiOFr6e8BrquRf
         AfZbx0BUvzsjDwZpcWSpHQjLXF446o5900ojeNfZwrTgdAsNSNlHoJJzaosln3F3QjrK
         2qpsGZOR8kq9WxGz5Ikuo3wqJBcDdGN5yY9+ma0+NVZFxOXOkda0nODLL/BMZbPF2Ppa
         pHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678671343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQY9axLjHAeAKXuWF4/IhEXMYhGLO2zftPOMSzsNkik=;
        b=Qpgib9ysbmWlBJ012GfzIRpt4nLfJe4fe8HY/35b70Zxm/ThWCfHCgCjiYnYh6XeT7
         p810tvFj+qTFtlY/9NbAVwvPU9fbae7Wa68PfDVIKHcdhTaBBjOOfkb8MbHYGAdAscdY
         zyins42hC8eEbPQaLtWW/dbs8Rofrh1xT0Wmh0Cr5yyLh0aqPrfmEO7zqGcgb8wauge3
         LIPCw//pXMrrEnSBRodVPWvuMq33OGLyhZAO/OcGqspkB6L5YGBmBRN5t9KOrBYk1Hg8
         Qt/OQvhn9cav2xGF/qfxKFXILzJLdJbdWbbz4BCvLESJCpsQfDROhYiWQWNMgyDw8/D6
         uwPw==
X-Gm-Message-State: AO0yUKWfMPHq6bIJf6sLz9x+qaMMeA3wkwCTrD2lKNe7YVXYpeJNPrpP
        oUS/UEnCI0sObn5XIu6gFPzUdXFQPzvcumwY36s=
X-Google-Smtp-Source: AK7set8aqRtOHmpPYLjUv+UyKHc4w0ZQj+o0mA8F3qOowpFHeP1Oit0A6F5ICt/EWJrNmcCxeWKMzCptqm7F4WAxb5c=
X-Received: by 2002:a81:af62:0:b0:541:8285:b1c with SMTP id
 x34-20020a81af62000000b0054182850b1cmr2766235ywj.10.1678671343138; Sun, 12
 Mar 2023 18:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <ZAyJnCKa65WKozEJ@righiandr-XPS-13-7390> <-sFVmNNf30qsKc4eJpPbRN0rKWrj8NTpzhADsBb71F_lqa7eZAa7tOUESLJL_f5TraFzq2nfikArgxXrXtLdvatMIccCT4VMxvgAMfH9PdM=@protonmail.com>
 <ZAzedS9sx5l6gmzB@righiandr-XPS-13-7390> <CR4G3AY4U6IJ.2ZRJBDCGH9Z0Q@vincent-arch>
In-Reply-To: <CR4G3AY4U6IJ.2ZRJBDCGH9Z0Q@vincent-arch>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 13 Mar 2023 02:35:32 +0100
Message-ID: <CANiq72nTNaDt67kVJ8ES5dvGYJanCXLo4a5gShYJJCY=0A=23A@mail.gmail.com>
Subject: Re: distribute linux-headers to build out-of-tree Rust modules
To:     Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Cc:     Andrea Righi <andrea.righi@canonical.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Mar 12, 2023 at 2:45=E2=80=AFPM Vincenzo Palazzo
<vincenzopalazzodev@gmail.com> wrote:
>
> Maybe we should increase the compiler version required by rust in the
> kernel?

There will be an upgrade soon. :)

Cheers,
Miguel
