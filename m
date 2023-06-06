Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13950C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Tue,  6 Jun 2023 22:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239839AbjFFWXB (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 6 Jun 2023 18:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239638AbjFFWW6 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 6 Jun 2023 18:22:58 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971C010F1;
        Tue,  6 Jun 2023 15:22:57 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-ba8151a744fso7682070276.2;
        Tue, 06 Jun 2023 15:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686090177; x=1688682177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szkQq4yfYJ+bwjPXw6p2sZXA23EsVrsV0xUmhIPCi8k=;
        b=S2YQuwF1uZOjB0UDsXy5fXobjN5upNAH64fiNpFChZVGRdzqdkBhIusFHa2Q77Ec9W
         bByqVI7C3BJqxCAuLKwj+TNPoQaETlEXnvgVvE1efQtgTSOTqUjgs/6tZU5hK5mXCcca
         Mnu4puTGkG3b5eLZbI7mX/BMSzdSXSOUcQbqiAfLqtNeoU89ZvxxOBhSFwwF6a3jUfVJ
         4HWaIo3EgiE/2qjbLk79lJrHsEBqb2JHx4pS8TcUjHkX/CfHmopAyn8US+u8iEZTmYkg
         bortE4YiiLdE3hr3UP2q9tVdziBYhhH7VfsZxv77g1W4W2Sghh31mhEZDbfPslGdef0Y
         4HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686090177; x=1688682177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szkQq4yfYJ+bwjPXw6p2sZXA23EsVrsV0xUmhIPCi8k=;
        b=UCQeFQa251RRyqbTibRVzTiTm0EaDHzYLakjiurkADY8YYIB2Wnm7AgmhVvrZiFAb0
         1iI0mkWTBG1wm5Pk33O+77rgwbNcRh7IHK2AoMLE2hHCfKHI0y/O9Hz1RgEphoBcnxzr
         qZgToYTOWPZBFhJACF2erksVylaenkV61MLIoi6eftmh2krWrImof7aQa6faK6jyjog/
         TX8HPNuEe8f12dVfqN1Wr4DQFxfX5a8Mi1ekjcyOdhTy6BKq7zDZchMlr3wGc/MLr7fI
         +7z2XxowSv4+w5bj9HHChS4bIQopnSWIXD6szSEb1KVgpNEBGax89uDhwUUnS7gp4oGJ
         P5Cw==
X-Gm-Message-State: AC+VfDxsyDb6Gr2EHAiGVbt3ypOCaxIcbwd/rtQ80VLwltJm+RBEn8S1
        LqsDQB8HwLE0g5LdxbH6I2AoZMuVKWg49Xqfz6I=
X-Google-Smtp-Source: ACHHUZ5SivPFq3FeibULtWhCaGloOXRl/EK8sBbqT2tSRYU/16E8ROOobMK4yLEBJ7o+2h7CcvW3h6axthCRL3lP1/s=
X-Received: by 2002:a25:900e:0:b0:bac:69be:9494 with SMTP id
 s14-20020a25900e000000b00bac69be9494mr3919754ybl.36.1686090176774; Tue, 06
 Jun 2023 15:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <202306070408.EFxuDoRs-lkp@intel.com> <20230606215212.r7if2gsynajugf6j@treble>
In-Reply-To: <20230606215212.r7if2gsynajugf6j@treble>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 7 Jun 2023 00:22:45 +0200
Message-ID: <CANiq72nD3wvOxfUq9mxTiPDbf+VKmbU+eVepO7QY_G2LT-UOEg@mail.gmail.com>
Subject: Re: [tip:objtool/core 8/12] vmlinux.o: warning: objtool:
 rust_begin_unwind+0x5c: rust_helper_BUG() is missing a __noreturn annotation
To:     Josh Poimboeuf <jpoimboe@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        Miroslav Benes <mbenes@suse.cz>,
        kernel test robot <lkp@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Jun 6, 2023 at 11:52=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> So it seems to be an issue with bindgen, though that github issue has
> been resolved.  Any idea when this will show up in a toolchain?
>
> In the meantime we may have to get objtool to manually silence the
> warning, unless you have any better ideas.

We were going to update `bindgen`, so we can just do that -- one more
reason to do so! :)

If the update goes into the upcoming merge window, would that be fine
with you? Or do you need it for this current cycle?

Thanks!

Cheers,
Miguel
