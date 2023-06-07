Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD21C77B7A
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Jun 2023 15:15:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240202AbjFGPPZ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 7 Jun 2023 11:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240756AbjFGPPZ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 7 Jun 2023 11:15:25 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8601A1734
        for <rust-for-linux@vger.kernel.org>; Wed,  7 Jun 2023 08:15:22 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-ba82ed6e450so10855315276.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jun 2023 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686150921; x=1688742921;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=06HbTUXXP7qSeCUQ65JCVHpgC5ctYDDwQ2ntWKZsrTg=;
        b=kJJuPstV/fd36hGGYqYYMfU6SQ6eMQvBPGcCDCMF+3B6XODR3LYU3yrIc7I+D/zsft
         6zsexaV1k8KZe/Dt90YYquozfp1J7tHh3/wNhp+qeyEDPl0mmZpblATGSxPZhOlApQ0J
         nWw+IiChAXdQZlbw05aYZfAf6p+CnxvcX4Rg0PcgCvj/JAKd03rBxFYqFII+6HhbMWUt
         MJQoZjGU5egLSdtfqOZo+gccpnGFlP1/zD4CHa/tfvvLV0hDeaTL4LDVHQqwwF73RlbW
         HwlA/fmcm34oLZjuYUMNBy5GYgzk2i92X9R2abUaebW1TU9zHIQUm01kaKNz/rrBFgAf
         icdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686150921; x=1688742921;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=06HbTUXXP7qSeCUQ65JCVHpgC5ctYDDwQ2ntWKZsrTg=;
        b=dxxQIyEnKJ672u+6eT89pfkIuxTBSG9i2nDM58mqqXN8AMEln18JI0+/JHtNOTh1Uz
         6Rlg4FinPUKUFGxEHzi1r2Ytfa4Nr7YZIM15WPhtbsP+3d+bUbvIfIRcqfkzuZ32ShZR
         XueROEXl2dXeuBIBIsxq29ajJ+vx86d0RLqDvG7as1yte5OSoCVjzdGiOS5cxsde+q1Z
         5lI48msE7JzJ5JJ0Ggy7dQkxsHrWHAsB1yseUP42N6Wf9P8dfTwW+Ehw/DIDpFsGCbQz
         EiRKWYip1ItP1EqZpwqwZQmHnd4DR1QpQKNXwpgaKSlr5eFucU9K1dk6FWVDuiJhbSF0
         pFJg==
X-Gm-Message-State: AC+VfDzw4aYT55buKza/CC0Ao2yLEMJ80TtXf+tCChJ5q8Yt0zM3psd7
        8W/YDfPrXaV9fM3VOeuqtNU2cf4neuXgXG4=
X-Google-Smtp-Source: ACHHUZ5hfgcmjYBr+gjEpgOSocio7Fae1zcX14/mchK1aXcyQDsxI556aUghMJFfiHNwTqEZrwd4bVwBBywPoxs=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:722:b0:ba8:8ec4:db50 with SMTP
 id l2-20020a056902072200b00ba88ec4db50mr2207946ybt.1.1686150921659; Wed, 07
 Jun 2023 08:15:21 -0700 (PDT)
Date:   Wed,  7 Jun 2023 15:15:18 +0000
In-Reply-To: <875y862lr7.fsf@metaspace.dk>
Mime-Version: 1.0
References: <875y862lr7.fsf@metaspace.dk>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230607151518.1191562-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 2/8] rust: add offset_of! macro
From:   Alice Ryhl <aliceryhl@google.com>
To:     nmi@metaspace.dk
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, gary@garyguo.net, jiangshanlai@gmail.com,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        patches@lists.linux.dev, rust-for-linux@vger.kernel.org,
        tj@kernel.org, walmeida@microsoft.com, wedsonaf@gmail.com,
        yakoyoku@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Andreas Hindborg (Samsung) <nmi@metaspace.dk> writes:
> Alice Ryhl <aliceryhl@google.com> writes:
>> +#[macro_export]
>> +macro_rules! offset_of {
>> +    ($type:path, $field:ident) => {{
> 
> Could we add a descriptive comment?
> 
>            // Prevent deref coersion to `$field` by requiring `$type`
>            // has a field named `$field`
> 
> BR Andreas

Sure. It will be in the next version of the patchset.

Alice
