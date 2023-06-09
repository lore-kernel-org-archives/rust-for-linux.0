Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B856AC7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 10:15:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjFIKPU (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 06:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjFIKOk (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 06:14:40 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094EC3AB4
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 03:06:32 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-565e6beb7aaso14528097b3.2
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 03:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686305191; x=1688897191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Q4hcCHSCAmqbUPH5eMIufLERRHnqinkpN6oTtZtpzA=;
        b=fYCQKb1Dz6Eu324E28c7LjsS6zj6+UogChuyReVg2liAEj82l7VN/QZbsMKCOZtbZh
         3YG6STye/ncsLjUE6ae5NG4Og87Bg+eqYhuMPyrjH9CUkjcH+MQFuJpdoc6dW1R3VHQ6
         HzgLmvxppBCdmuCRgFIzpoFHeWypLRa+ZlY2eA2uGQBqLRdzvCJ58f0y61k0a27nhpPq
         YN6DmQWwmTrzm67NnqRz3OWsLGMkgpbzct24I3u5gdC9URp0ANrrsnK/tQk9fJyTJhF1
         RCggNQkGvtcQkYyl9/xBhoM767/zbrJNTxIAwGQal7m+2LE67WYlZc/QrhzaHi2nTw4v
         fNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686305191; x=1688897191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Q4hcCHSCAmqbUPH5eMIufLERRHnqinkpN6oTtZtpzA=;
        b=Y8wQYwgXGU5WD2cQCB0DkD99ROOPk74m7DwI8tWgrflnmTyW5iFDI7RFKFh3Nk8Egj
         GHzPWosBvgT+2NqF65LIMwu7w/V40sXYsiZxQnsJveeHCA139Yh3Te1EwKcN2+pnF8HB
         7mQtOHfFI2UtG9YGU4Yqxz/Pjzxuxa8MKh3mw1Y+jIihHSLHsj5LgHdKyrxdP9eofOWP
         nHLD27doUO0ffubgh4QEfMvs3E1gGombI0ybzBEHdvLphts0vsBlw3O34a+QyclHQVpf
         zTegtRfS3n19kSZ9DqjFL3E2CzQ+2hR77S8/HN4lbSHsb/hsUxjlN1Iw4aZxjcglnwhc
         NceQ==
X-Gm-Message-State: AC+VfDyjVo8YQXFIuEq+4EztJ9nIlG3DPlB9ZiBk5ANkdudW5lYwpTOd
        QNGXzanmptoIrhl/1QCelO4bSbgiK1he8ITziPJnUSXN
X-Google-Smtp-Source: ACHHUZ6IPNngJ8k+9qUalJMBROgp+t0DmGXViO9D5ShG/Eedg18NPUIXv0cVXRH12w4xiXOoHTq0lbxAOy7DTi0qp18=
X-Received: by 2002:a0d:dbc5:0:b0:568:4ef1:ba63 with SMTP id
 d188-20020a0ddbc5000000b005684ef1ba63mr808008ywe.14.1686305191019; Fri, 09
 Jun 2023 03:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-64-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-64-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 12:06:20 +0200
Message-ID: <CANiq72=pwjR11HODmWCQgdg5y-JZZUh=Ud=YUDVt_G8cn-y=Lg@mail.gmail.com>
Subject: Re: [PATCH 63/80] rust: alloc: add from_iter_fallible for Vec<T>
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 8:56=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> +    /// See https://doc.rust-lang.org/std/vec/struct.Vec.html#examples-3=
1
> +    #[stable(feature =3D "rust1", since =3D "1.0.0")]

For additions to the `alloc` crate, please use `kernel` as the feature
name. In addition, we write (or rather, copy, if possible, from the
infallible ones :) docs.

Cheers,
Miguel
