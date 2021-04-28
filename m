Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33262C43460
	for <rust-for-linux@archiver.kernel.org>; Wed, 28 Apr 2021 20:25:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E28C961444
	for <rust-for-linux@archiver.kernel.org>; Wed, 28 Apr 2021 20:25:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbhD1U00 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 28 Apr 2021 16:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240463AbhD1U0Z (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 28 Apr 2021 16:26:25 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0CE3C06138D
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Apr 2021 13:25:38 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h36so47141257lfv.7
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Apr 2021 13:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=24dqn/+FEtUll0rSYOdRnvFq6DTtKXVWdo2aK61CiNw=;
        b=dRDRaAX9ayALovqfgdL291l0lKLnc5uDr0fCOZ4yRUgugmE5ggRX0Wv8tfjce1adSn
         IyhtE55ZvnES7iabYqiKOupAbZzDmu5pHHIDFouMFkZ4cwHG1LUrLKne5no1F6ew8n3w
         mZ5NxKOhAsoeJPOQcsoN1olaEIQ5JCs3rZkFWAEHjCYT017Ox8VuCnlp0yQEdE6j8cWt
         9AhI9K8VgO67u5s7bf/Y0+qdwr/o6i/+ICgsJU7AUFmo0okdlQmxEc6a6q3VQStI3gsI
         mNlPs61YWci3Bpd0MNUyeFYZLv14/jWleoekAnomnmMJ+d706RjUukVJzfLeBi+P6wHl
         42yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=24dqn/+FEtUll0rSYOdRnvFq6DTtKXVWdo2aK61CiNw=;
        b=BmiREbwJZWnpqHVSpuOB2pIW6UjF1RJIz5pycwVTHbkEf2ebmPZZdDCdWBYSPhTbJ7
         B2rJhCU3HFktuTOt6Z7PEuPi/7jImi+wpB+ceRXQX7HUie9wyFV8fEMm1uSaaeohut3v
         R9fdLOQOl64s0Z5gbDvIvL6G+P9xB9wChSVNahum2YrUSgLcyw30Krln7xpguaGDgemq
         KMTO4Ht9+jqf1Lw3yuWUdEZS5Svbs3+HJfQsKaXY80ecFyN58hZKRdtd5GS8ke+fUB1e
         PW16W2rIJizXOrEw1sKdmydS1gDc7lPgSArKinaMp6+fZJRBHrUB8vMhjHPRFPtSmieE
         Cfgw==
X-Gm-Message-State: AOAM531dcVM+Bh2JBG2DahYKsj6ontllH7a3HxV4PvSgooa7Pgt9WOkH
        OU3lsZML4Ys7ta9gcfs1TwtjT4p3OO8uGdBcqPVTZsTJDfp7aw==
X-Google-Smtp-Source: ABdhPJyLKfJiWtybsYLfzFW3x4KBfvZ1SNTdYHGgqEIxXyky1SVISrVnvlf8ahz8T3/oFlzGumQIh1DxPIl79sIZXaU=
X-Received: by 2002:a19:ac09:: with SMTP id g9mr22162307lfc.547.1619641536929;
 Wed, 28 Apr 2021 13:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
In-Reply-To: <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 28 Apr 2021 13:25:25 -0700
Message-ID: <CAKwvOdmxYoNu1uD9DnSB_hLvnHM5W5rJf_KLOLkwgxAVQjz3pQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     mceier+kernel@gmail.com
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Apr 28, 2021 at 11:34 AM Mariusz Ceier <mceier+kernel@gmail.com> wrote:
>
> Maybe it would also be worthwhile to make the requirement that the
> kernel must be buildable with free software (not just open source
> software) explicit ?

The kernel is already buildable by LLVM (and clang); in fact Android,
CrOS, and Google's production servers already do so.
https://clangbuiltlinux.github.io/
-- 
Thanks,
~Nick Desaulniers
