Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671D5EB64DC
	for <rust-for-linux@archiver.kernel.org>; Fri, 14 Jul 2023 10:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236033AbjGNKVA (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 14 Jul 2023 06:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235467AbjGNKVA (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 14 Jul 2023 06:21:00 -0400
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC421989
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 03:20:59 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-94a355c9028so96362066b.3
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 03:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689330058; x=1691922058;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ake/2lNPSYG4Kup6Znr90jxcuDjnCQa+kK9QxHmxIwE=;
        b=FdFgSbE9EX08KPCV3DFRa0KauNWmUSSKQuD9KCfK4mOB1MOb00hUTblNSomfgkxhXE
         lktUE68J2GJstAUj/3c+jsVLoFGKsyNmD+spCDoSEq9pliOoU/eTeGKuECVOQJrW96JW
         0DVOb7zMv+7uYhP2k11Kxl4mudnbg+7chPKt8ON/beLgn35QBKRpxoMgV1d5B1uNfFG3
         AgxMMV52IQLUcoM3lpUr88qrhOm889EDxsbpie2PXgMV/VEPfl+Rvtil+sLok6f8e1nb
         hqEwDY8sB3TJuxoDWtQB6lvtOAXTfuQNn+0jvX40UPp1Eoy/88cODPzkhRG3lBSO3Q1c
         ul/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689330058; x=1691922058;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ake/2lNPSYG4Kup6Znr90jxcuDjnCQa+kK9QxHmxIwE=;
        b=Hw3RxqfiV5TGs54dSBYN5JJ3MvH7USMA1fiI3WFUKasoCjCJaPYb15bXlywj39vHRs
         y8r5NWKRredLCTvFJ9gPJsHVzcYPwB8hnXgDaWEYc1wPr/ehiKuT3YNMhYrMc9cIpG8D
         2TocG3/kzeLHUKqQWhF/EAvXlMbC1KyuFDfy2mNRh08Mtq4sscB7gA08q4DvpP69CEU/
         nL/NBw0/O5C+0VrjOk0a60tVn44zWYKX91Ia0a8r8WLpe0EK66vMUmlchGdMMbQuPDC4
         nXBhIjGLaoppcuHCBqf4hfphMrJuqrbLHxfxZ6As0GCc8lFF5V7gRrJettcjQXm7snbB
         w1aw==
X-Gm-Message-State: ABy/qLaJUhVNNmdX8O6YP5jwbBW6avM0kXB/ivgVu8fOnCZ9xZukjgsc
        P+GPl59gGcezavu7173Z7xtMPR1NidTZBvs=
X-Google-Smtp-Source: APBJJlFUTjwiYHQXGcSMMNCtJzQc7XCp95jN1C2fnAoH9M2eakhZaTVLYzm8MTgye2tlwRUOsp8FX+gnfVMrb1M=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:906:8a62:b0:978:67a2:f503 with SMTP
 id hy2-20020a1709068a6200b0097867a2f503mr8783ejc.12.1689330057916; Fri, 14
 Jul 2023 03:20:57 -0700 (PDT)
Date:   Fri, 14 Jul 2023 10:15:01 +0000
In-Reply-To: <20230714-classless_lockdep-v1-1-229b9671ce31@asahilina.net>
Mime-Version: 1.0
References: <20230714-classless_lockdep-v1-1-229b9671ce31@asahilina.net>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230714101501.2194205-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC 01/11] rust: types: Add Opaque::zeroed()
From:   Alice Ryhl <aliceryhl@google.com>
To:     lina@asahilina.net
Cc:     alex.gaynor@gmail.com, alyssa@rosenzweig.io, asahi@lists.linux.dev,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, daniel@ffwll.ch, gary@garyguo.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, marcan@marcan.st, masahiroy@kernel.org,
        nathan@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
        ojeda@kernel.org, rust-for-linux@vger.kernel.org,
        sven@svenpeter.dev, trix@redhat.com, wedsonaf@gmail.com,
        Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Asahi Lina <lina@asahilina.net> writes:
> Opaque types are internally MaybeUninit, so it's safe to actually
> zero-initialize them as long as we don't claim they are initialized.
> This is useful for many FFI types that are expected to be zero-inited by
> the user.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>

LGTM. This is useful on its own.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

