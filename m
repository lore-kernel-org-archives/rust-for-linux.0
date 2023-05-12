Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C27C77B75
	for <rust-for-linux@archiver.kernel.org>; Fri, 12 May 2023 04:39:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239846AbjELEjv (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 12 May 2023 00:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239844AbjELEju (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 12 May 2023 00:39:50 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B8A10D0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 May 2023 21:39:48 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f423ac6e2dso41633155e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 May 2023 21:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truongsinh.pro; s=google; t=1683866387; x=1686458387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1UkYhTgC9k0CzXuoNjG7ZBj3Ly5Zqsj8W8mJGOqi/EU=;
        b=MO21xqlWEtVl+4hI6R93KBnKj6XHdVvjJgO1qmLewkYGFPWrIFLUFVucgciP5IONMa
         6FW9LYT4rJAU4LtApkGjSsuYk+m+rma56GLpyc9Ti6sYv48NcGVKo/0k54/HDcEwMJIw
         PTTW7VxrhZmjq0fs4Fcn+fPjBqYXg315/Wjg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683866387; x=1686458387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UkYhTgC9k0CzXuoNjG7ZBj3Ly5Zqsj8W8mJGOqi/EU=;
        b=C+FxYCAlPM63hRRAHdMNXNdvGMpKv9AkFeRFcB2UgnFY14T+7Br6zciF2iu0OHINrm
         voeM+57045lIBDSZIXmBNgUZOxsGmTGSfN7SmA48SbAymW18lk0ONQGqBde4pIXCN+uj
         YAw4uD7LOYCeCY0thV1dFBe7LFEuL3GniiJiOCbEtBSHeMgJiLu7bnBsLs8pIX+0FYbi
         u1e+A3e5VKnRMmYjTs6pZ/cvR1tcCkCo3+1I2vzRQMygqjdTNLIoCMSaEdMZ6N8I97T1
         mBnaeYhcSIU/IAzf7t8DzOCvPA3M0rdsFlkfY2NFNEti2VSBK+mm/HH1d1OOZH3kRwh6
         wusw==
X-Gm-Message-State: AC+VfDy2vwp5+QaZMe6f3aDEUoMSXa4O3MymjpsHKjxUXjZYLqjeMmMH
        QjyvfppBqXpbF59MA2NmNPPa/Sq3TkjGhRMSBcF5XA==
X-Google-Smtp-Source: ACHHUZ7V4YnD/9/FJQa8KJ/8phtw9H3Dhh3dWhHLr6sdLOXp7cDRutqrvDZWUKABRB341xBJCD6j5wVN37L8141lSKo=
X-Received: by 2002:adf:e948:0:b0:2fb:87f7:3812 with SMTP id
 m8-20020adfe948000000b002fb87f73812mr14627303wrn.1.1683866386898; Thu, 11 May
 2023 21:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <ZFqM8HOvlVn61VXs@moria.home.lan> <CANeycqq5xCUcjOeOfGAJCH1Tzd01-ALU3uqVJo-BvVX9HOK9wA@mail.gmail.com>
 <CAMy36z5VP_6atrxdOyXSO6G+R36vA8SuaWCDAui3Om3viogPkQ@mail.gmail.com>
 <CAMy36z6+RjgAfEYUxpOhS6vFmTter=cFa2CEorSnKR=qxkft=A@mail.gmail.com>
 <CANiq72nYq5vimbhvfyUj9ejOS487LCQBxkv+7Nt5yYJ2xW_U-A@mail.gmail.com>
 <CAMy36z7iofMAK4GkYaUjW27cSC4sg-QGooj93mTg8SOb0eXxfw@mail.gmail.com>
 <CANiq72kcVS=_07D-KDcb9cVByV886mf50ydqNsMvcrJ1myLOuA@mail.gmail.com>
 <CAMy36z710P4ZVW0z_Y=ZObLkpP3Jc837B0z4sTGoDUXCH+8MRw@mail.gmail.com>
 <ZF2zCUV45mYxSe4e@moria.home.lan> <CAMy36z6fiC4esHKjAiOaOp6=sAOCbiJXpJku+6_h26xGPs8kWA@mail.gmail.com>
 <ZF2+Ah5koJEdq4A1@moria.home.lan>
In-Reply-To: <ZF2+Ah5koJEdq4A1@moria.home.lan>
From:   TruongSinh Tran-Nguyen <i@truongsinh.pro>
Date:   Thu, 11 May 2023 21:39:34 -0700
Message-ID: <CAMy36z7-hBv1HVTQaNPZzHXNzB6q-2CS4XzUrWLcwTbn3M1A7A@mail.gmail.com>
Subject: Re: [PATCH] chore(util): minimal Rust build example
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        linux-bcachefs@vger.kernel.org, Andreas Hindborg <nmi@metaspace.dk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> What's your use case?

https://github.com/koverstreet/bcachefs-tools/blob/master/cmd_migrate.c
for example, includes several syscall and kernel uAPIs. Assuming in
the far future,
some/all of the APIs are written in Rust. It is then unnecessary for
user-space Rust code
to bindgen from a header files, which in turn are cbindgen-ed from Rust code,
and wrap them in `unsafe` block. It would be much more straight
forward just directly
use Rust API.

That being said, I'm interested in Rust uAPI in general, not
necessarily in the scope of
bcachefs only.
