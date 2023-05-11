Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30952C7EE22
	for <rust-for-linux@archiver.kernel.org>; Thu, 11 May 2023 23:10:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjEKXKp (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 11 May 2023 19:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239214AbjEKXKo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 11 May 2023 19:10:44 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FB43C1B
        for <rust-for-linux@vger.kernel.org>; Thu, 11 May 2023 16:10:43 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30771c68a9eso8448983f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 May 2023 16:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truongsinh.pro; s=google; t=1683846642; x=1686438642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WPG4a6X4h+5DWEWYShnnXPeem/HjObGPA6H/eKogG2M=;
        b=BIOoBIEI149cdBcnCxZTmKR+LlC63ppi6ow1399WRIFRxnPRn8mTMw4vxL+q6QUrXw
         2I/lWsHwD5xjD0BrDzgBkT37w2Qow3W8V0DqSnu6qTpsuSQff9uygcfoQHQbXSUDnJRL
         b/4EILJYk0IMSHU9AyXuWzOqfENk9ldxsThM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683846642; x=1686438642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPG4a6X4h+5DWEWYShnnXPeem/HjObGPA6H/eKogG2M=;
        b=FgeVXYTs7/WC457ZT2oB62NTienUrkwzT/pegmsEA8deHMPnKDV8GJFkiG2l8mzdPo
         RW0F0DJbBRoVrXdV/8Odd1s8Mm4TUB9si6g1kwDSYSNZI5bzRPEEiwiaJPvG6hoocngi
         ANHETJPzZLUJYf8l9YbMtM870UWdRIhoXIQcKr6aAZZLpT02pjyr1HjkMw947fSrqa5F
         4wsXu0+XwLb0BApDjkVv1j1eXS1OziXXqcBO3oy1Lj6la6H08XKF64pGAZxWOIE7fyEv
         cU0DNQXdH0Zubg0d+IpSVpcB6z/5q87QLRc5KtYea6IrA+St+ZizKITS4+w53HjdVupZ
         qWxQ==
X-Gm-Message-State: AC+VfDyQ7arokC4SlzJDtHLF8Cja5OVfhj/56HJvLO6zPz2QSsPUnz1C
        g6Lj11nn5ELudUbIzaEppwpp6lujzuP7Q0A3P5odxw==
X-Google-Smtp-Source: ACHHUZ41RLvA9B+2b9D4/cmHDvx+72agJVX1IMB8cSApYesY6e6Vcll5jR06Zk1QTGpH+VFSa0FwWwC286l1X3VTG1Q=
X-Received: by 2002:a5d:46c7:0:b0:307:a530:573e with SMTP id
 g7-20020a5d46c7000000b00307a530573emr7308710wrs.71.1683846641779; Thu, 11 May
 2023 16:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230503065354.19071-1-i@truongsinh.pro> <ZFqHFTMqetbQKtah@moria.home.lan>
 <CAMy36z75N9obj0WM+OFhhnzXAPxqhg8PVY7_x8X6JbQABFnMQw@mail.gmail.com>
 <ZFqM8HOvlVn61VXs@moria.home.lan> <CANeycqq5xCUcjOeOfGAJCH1Tzd01-ALU3uqVJo-BvVX9HOK9wA@mail.gmail.com>
 <CAMy36z5VP_6atrxdOyXSO6G+R36vA8SuaWCDAui3Om3viogPkQ@mail.gmail.com>
 <CAMy36z6+RjgAfEYUxpOhS6vFmTter=cFa2CEorSnKR=qxkft=A@mail.gmail.com>
 <U4SpqY6MGcSaFOCHP-pTC2oqyrv7dh2BAlR9xubt3iymLknSafueqtUuhj0UzZUw8YGGNjrbti9_G4cUTatBMlbkOuErR5Uxw2pXpvZnZ_g=@protonmail.com>
 <CAMy36z7_UVZT03svBPVQpQyYdhWqFFmVokY7K+iy7MkDtbvAww@mail.gmail.com> <2rQHLC94NzAwtKaPbGMnzol4xE6cJ5i4FUx_MoK417SYnui2nVsx3ijtx8okVD14AY3SkwF5CEsJuckE1ydZXyXCZBOTECT3osPjb3xAAaQ=@protonmail.com>
In-Reply-To: <2rQHLC94NzAwtKaPbGMnzol4xE6cJ5i4FUx_MoK417SYnui2nVsx3ijtx8okVD14AY3SkwF5CEsJuckE1ydZXyXCZBOTECT3osPjb3xAAaQ=@protonmail.com>
From:   TruongSinh Tran-Nguyen <i@truongsinh.pro>
Date:   Thu, 11 May 2023 16:10:30 -0700
Message-ID: <CAMy36z46EQYOGj8h0kHkEd8KYKnqZbUePe8JAk+a-0GJRQeK5w@mail.gmail.com>
Subject: Re: [PATCH] chore(util): minimal Rust build example
To:     =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc:     rust-for-linux@vger.kernel.org,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        linux-bcachefs@vger.kernel.org, Andreas Hindborg <nmi@metaspace.dk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> I think you will have to vendor the bitfield crate into a separate file
> and add an SPDX-License-Identifier header with the license of the crate

I just send and patch to rust-for-linux@vger.kernel.org to include
bitfield macro into kernel crate.

Kind regards,
Sinh

TruongSinh Tran-Nguyen, PMI-ACP, PSM III, PSPO III

Tech Visionary, Craftsman, Coach and Investor

+1-6127-TR-SINH (+1-6127-87-7464) | @truongsinhtn

Find me on LinkedIn | Twitter | Github | StackOverflow

IBAN: LT76 3250 0264 6898 1177 | BIC: REVOLT21

Currently Reading
