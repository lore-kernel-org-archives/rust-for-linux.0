Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78481C6FD1D
	for <rust-for-linux@archiver.kernel.org>; Fri,  7 Apr 2023 06:02:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbjDGGCe (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 7 Apr 2023 02:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjDGGCd (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 7 Apr 2023 02:02:33 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C096C40CE
        for <rust-for-linux@vger.kernel.org>; Thu,  6 Apr 2023 23:02:31 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1B4873F243
        for <rust-for-linux@vger.kernel.org>; Fri,  7 Apr 2023 06:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1680847349;
        bh=zft3hVuwccqOkIe+/jXqzbhmeCB7evQzBPJj2Wk1H3M=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=gS16hkVG5dO458cwTtzME3atj2rvaCDCP1FCz+Jafc/0+rbq126vr/JiQ2AsPBdcA
         a5JIWFR1Vhd5SD1x2irJkBswY+UQL29cbwmH8SE4ZKSCx8X6H1/KVg1+ITYe5Es6B2
         I4oggT3cK5Kyv3Yq8q9yGDrIpr9qrqTF750+/dXMvVR981tuH2V59y7f8ay0BQmbUv
         MCat5yicqLNGDsyH911X5vCGxh60mFK7rPV8/FEsbW5WPzb01iRYgiGxOO57Hm7o1P
         HYKKxo91b+GIISfCU/VK8emxPmgEiyO/Sq1DY5DffB3N6goZ3rG7sd5OzhsPLh14Rs
         7nas1rLhfruYA==
Received: by mail-ej1-f69.google.com with SMTP id e25-20020a170906749900b0094131bc45b3so1150659ejl.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Apr 2023 23:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680847348; x=1683439348;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zft3hVuwccqOkIe+/jXqzbhmeCB7evQzBPJj2Wk1H3M=;
        b=S6JNXAnArxxi9bIYqiX5TLTVU4UzsUBiECYgJTa2/iFwu96YlPPRyBGbGp84XxVTuz
         Fb9fL3toVvKOR5Fmf2SY9kC15IIUsJLvkUDLRwMxLdYzLiJcv+KFd24z/Q+zIb+zgcd7
         A4JEt8zlzmhfieDirZq0XRkq9fxxitmGR8RUPKprxJggdVKMPt+gWP294dpcmES2ypn4
         W6dVds3k3LURLrTMPWzUNtQGLOtKTE4CCQhqqh4scJ7Z23hDbYyPb910MBnuSwi6e+sN
         QU92Wt2CzlFVtif1fO74QBYxnnPbS+/AugVMVCkilZ5kL/nlOYbpNaGEoq6R+0YKnE48
         3eyQ==
X-Gm-Message-State: AAQBX9eilpis7sgamkr2pRVa7Qro9et1WSdbP6N/8OutCREjqHhVD4Gg
        teAKDMijwNNVkXuGKnslwv89nGOb3PZdP1kcSY5AiTmtUuGTWjrS2Gru+aqDTP9Vd/oaPo4hlqP
        8r7auB9Dd7ZYF6Xl1i+QCi+BH1Ug6Q/vMhp2N7jnhKQ5r
X-Received: by 2002:a17:906:5fc4:b0:931:6f5b:d284 with SMTP id k4-20020a1709065fc400b009316f5bd284mr1250727ejv.57.1680847347843;
        Thu, 06 Apr 2023 23:02:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350biOzYn0MLoPwUbPrGmvYajrj8BaF1U15y7bLZbkGzboiLnXtS/QsXw/tQKAqwtS4E9vpJ9KQ==
X-Received: by 2002:a17:906:5fc4:b0:931:6f5b:d284 with SMTP id k4-20020a1709065fc400b009316f5bd284mr1250697ejv.57.1680847347521;
        Thu, 06 Apr 2023 23:02:27 -0700 (PDT)
Received: from localhost (host-79-33-132-140.retail.telecomitalia.it. [79.33.132.140])
        by smtp.gmail.com with ESMTPSA id mb14-20020a170906eb0e00b00947a749fc3esm1677028ejb.33.2023.04.06.23.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 23:02:27 -0700 (PDT)
Date:   Fri, 7 Apr 2023 08:02:26 +0200
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        bjorn3_gh@protonmail.com, Kees Cook <keescook@chromium.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: allow to use INIT_STACK_ALL_ZERO
Message-ID: <ZC+x8pqUVzWQ35fv@righiandr-XPS-13-7390>
References: <20230210215141.108958-1-andrea.righi@canonical.com>
 <8178319F-4188-4F8E-AD8D-DCC392E26DBF@kernel.org>
 <Y+daEOZgaiF3IMTX@righiandr-XPS-13-7390>
 <4E6FDE1C-47B6-46A6-AF31-28AEB2348344@kernel.org>
 <Y+entVlMoV83vyzz@righiandr-XPS-13-7390>
 <CANiq72nQ4-md=KxtUcz3jHDXhLUdw1JxgbSKp7QsN0QKS3pV1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nQ4-md=KxtUcz3jHDXhLUdw1JxgbSKp7QsN0QKS3pV1A@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Apr 07, 2023 at 12:52:18AM +0200, Miguel Ojeda wrote:
> On Sat, Feb 11, 2023 at 3:35 PM Andrea Righi <andrea.righi@canonical.com> wrote:
> >
> > oic, with clang-16 we get a deprecated warning (but it doesn't fail),
> > then starting with clang-17 the -enable.. flag is not available anymore.
> 
> Wait, Kees' link says it is deprecated in Clang 16, and the removal
> will happen in 18.
> 
> > Then I agree that a better check would be version < 16, instead of < 17.
> 
> Applied to `rust-fixes` with that changed. Please take a look if it is
> what you expected (both content and commit message):
> https://github.com/Rust-for-Linux/linux/commit/1921ea54ab0d91d7a660c5bb980fce1efc9223f9

The check (< 16) looks correct and the comment also looks correct to me,
this option will be removed in clang 18, as mentioned here:
https://github.com/llvm/llvm-project/blob/llvmorg-16.0.0-rc2/clang/docs/ReleaseNotes.rst#deprecated-compiler-flags

(Maybe we could add also this link as a reference)

Thanks!
-Andrea
