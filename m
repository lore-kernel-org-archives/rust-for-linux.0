Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E24C433ED
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 14:38:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 733FB61441
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 14:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbhD2OjM (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Apr 2021 10:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbhD2OjL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Apr 2021 10:39:11 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E96C06138B
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 07:38:23 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id i21-20020a05600c3555b029012eae2af5d4so11501606wmq.4
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JYS1LWtXvy/1Lxg8SwWJVFymAWI0U2Mm/YCk5iwsCkM=;
        b=CzP6EUzuNdPDrpVC/WB5+8wWJqpfdG48QpDjRjjazsMnmD2L5Hmqod5/tlzsWmuvjA
         ybREt9UWD0qppMdxfzA4GBp3PNcSpLh1AzsZ5TfcXlVmFQPG/G7bOF57z5SCJdgPenUG
         hkwK9mfoyoXLtKu77GoWun2If2TYSZpf57SK5beP01CNv/3zz0qIi3Z9JnkThk1e5VEG
         F7cLtv94a9umhbmJMO9u1zPmIhrbQ58x6wwaq+UIYjGXiToxOFkyCRg8daskLXw2GpRR
         Tri6dhpEjQXWWO4+/iwFiw10Ppy0resmEDHoO8cDCbPwYcjvbb9Q9gvwRkgy8ccz5DGt
         fK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JYS1LWtXvy/1Lxg8SwWJVFymAWI0U2Mm/YCk5iwsCkM=;
        b=q+M1XNQ18ixxr7OLS2anPWo8GrG8s3vq+ArkSOQW1WVAF3kVDYVxSP2Bt9l3CQFrHB
         N56Bn1J//9vgE3ZBJEMLjq4iWATJQD51yZ+vp0dnC3Th5OPh+Ix+Us8N8ljQu8e3t+bE
         ObUlbWuqz58jHYqTb8/TW2sAUOfecwbQUXKmsOHSu1Tzw56JslkhpEMQqyI/4xDD1+7W
         f1TI9kJEZ/dfJAUF0IfkU+3ngSwLm6YJ59zYH9vTVtp8o5VAwuF5mqlm/xK5IF4Ir26C
         +pzNJ2nsGAaGqbSueiSLVA0kaKl79gP0GT241Q2O4923SsqoNhllLehzFfpkrcm8KA7G
         gvVA==
X-Gm-Message-State: AOAM532J16eU95lcG1/o1MrVg9qlBP8UCFg0efnxC6X1zvpGh1ySjtkP
        z5YA3nUYlrCGOgwgFGT2SI7sfiATcrv2hBfeJyM=
X-Google-Smtp-Source: ABdhPJw2aV2fsLWjUuS7nN+K5Z3dDJnbETZuTU3iJuWRqDdl/JO0dXEyhiZX9GCyA0VhXw5adWVweZFODBB8YH/En98=
X-Received: by 2002:a05:600c:4f14:: with SMTP id l20mr358357wmq.150.1619707102570;
 Thu, 29 Apr 2021 07:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <YIrDgupEqcmsUfGX@localhost.localdomain>
In-Reply-To: <YIrDgupEqcmsUfGX@localhost.localdomain>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Thu, 29 Apr 2021 10:38:11 -0400
Message-ID: <CAGngYiURvNri1t9pYiTDxKw0igCHH=ENZMLuKAj_dFPWf6rb9g@mail.gmail.com>
Subject: Re: Loading an out-of-tree module
To:     Carlos <carloscarral13@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Apr 29, 2021 at 10:34 AM Carlos <carloscarral13@gmail.com> wrote:
>
> Is the 'loading out-of-tree module taints kernel' messsage something you
> can disable at .config? Or is it something particular to eudyptula-boot?

commit 2449b8ba0745327c5fa49a8d9acffe03b2eded69
Author: Ben Hutchings <ben@decadent.org.uk>
Date:   Mon Oct 24 15:12:28 2011 +0200

    module,bug: Add TAINT_OOT_MODULE flag for modules not built in-tree

    Use of the GPL or a compatible licence doesn't necessarily make the code
    any good.  We already consider staging modules to be suspect, and this
    should also be true for out-of-tree modules which may receive very
    little review.

    Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
    Reviewed-by: Dave Jones <davej@redhat.com>
    Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
    Signed-off-by: Rusty Russell <rusty@rustcorp.com.au> (patched
oops-tracing.txt)
