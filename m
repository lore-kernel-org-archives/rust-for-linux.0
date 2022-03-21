Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1BEC433EF
	for <rust-for-linux@archiver.kernel.org>; Mon, 21 Mar 2022 14:36:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235794AbiCUOiS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 21 Mar 2022 10:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233160AbiCUOiR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 21 Mar 2022 10:38:17 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9345AB99
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Mar 2022 07:36:52 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id l4-20020a17090a49c400b001c6840df4a3so10824342pjm.0
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Mar 2022 07:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YuZsKL/FquII4IXSFIJBR5PiBpgFPZbcQYsbX8hb5vc=;
        b=nmkR/hLDMX9r4fNOZWzWrNonNKL8q1J/iTVBOfERU7xGfnlxs071SBM49GwggPM0FA
         fPuvt9rnfXSmO1sBNMnB0wFmnxMI/4T4jZTAiKPtQzmjGTWt6Q9J4svEgZc/9bDNdQJN
         bHFltp84L6KEP7a3ML3cW9CIyl8hx+MdvYm/F34cvD2hhTiE3WOu/iOf3t8/6lYN38HG
         rR4IsOYyVL5Rd4N+aL/YY9ud+trS8MEnGpXUs7rKhFxB9F9np3UT/rzFD7m8KAdirrqp
         aKFnBMHLUVfDkld8Vzkud/7fKyN4LEn3/6mphKiaimxOnmXWPKyNosspjbgQ8g/tIZ6e
         QC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YuZsKL/FquII4IXSFIJBR5PiBpgFPZbcQYsbX8hb5vc=;
        b=tscSimGYofsP4kRRj5lQurrfJNE2yHkn7B7yRxNJHLJzthlZ9MS7ygvSsUU9dvbcry
         EBS0RenCxqVBONZvdi1Er7zsCbEOx9jQB1xpu1TpwPKq6BBOid5q4NZC2GVOShg3LAnb
         kv+rbUGh6GndknZOzqzVnCvex0q8MvyL7FWR1e6MCAektxpHvo2/3BXxTKr+Q7QXFbLY
         sMgzXRKqdSSEQINEZGV95i8Plw9RwcYabzQa96Ze5+WfpoHVx12qezKU+y9voyu7YdXI
         0jQWhK+QCladumHRNMQlaBW7fws54E5rw+sATA1Z6q/n3Xqx0ynJLtNdwdDTqTeiiF+i
         ipTQ==
X-Gm-Message-State: AOAM5339HIAMxMk7ioOO7aIyep8wcFJAOL+8dRSSQBjYWJwEEbSXr1t/
        bkdJUvnNQ24zmS3Kt97PKIYyicetWlax252z0v5jtDfivcI=
X-Google-Smtp-Source: ABdhPJznno0rSlvz59oYnkmzWkixtKBuMqz2cC+d0dO6rCE1F7ZBBUc/IHYrNDVElV8X1db5FJkJrAHrkKRT8G5e7Qw=
X-Received: by 2002:a17:902:9301:b0:153:2252:44ea with SMTP id
 bc1-20020a170902930100b00153225244eamr13077804plb.65.1647873411825; Mon, 21
 Mar 2022 07:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHkG_ewRo5uPOue3ZMAAPAc+eP7MNNU5iVym-JVG1jN7HD+XMg@mail.gmail.com>
In-Reply-To: <CAHkG_ewRo5uPOue3ZMAAPAc+eP7MNNU5iVym-JVG1jN7HD+XMg@mail.gmail.com>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Mon, 21 Mar 2022 10:36:40 -0400
Message-ID: <CAFRnB2W+8XqOj0aL5DP2cMNLO2uR0DpPk-qB-oC7r=zT5N5gGA@mail.gmail.com>
Subject: Re: Using 3rd party crates in an out-of-tree module
To:     =?UTF-8?B?TsOhbmRvciBLcsOhY3Nlcg==?= <bonifaido@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi N=C3=A1ndor,

That's correct that there's currently no support for pulling in 3rd
party modules automatically with cargo. This is because any work that
goes into the upstream kernel will need to be self-contained to the
maximum extent possible.

I don't know if anyone has given any thought to supporting 3rd party
crates for out-of-tree modules.

Alex

On Mon, Mar 21, 2022 at 10:12 AM N=C3=A1ndor Kr=C3=A1cser <bonifaido@gmail.=
com> wrote:
>
> Hi,
>
> I was looking at the out-of-tree example at
> https://github.com/Rust-for-Linux/rust-out-of-tree-module and found
> myself in a situation where I wanted to pull in a 3rd party module
> from crates.io which can run in kernel space as well. How can this be
> done?
>
> As far as I know there is no cargo support currently in the Makefiles,
> but maybe I'm missing something.
>
> Thank you!
>
> N=C3=A1ndor Istv=C3=A1n Kr=C3=A1cser
> bonifaido@gmail.com



--=20
All that is necessary for evil to succeed is for good people to do nothing.
