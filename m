Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AB9C7EE2A
	for <rust-for-linux@archiver.kernel.org>; Wed,  3 May 2023 11:00:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjECLAD (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 3 May 2023 07:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjECLAC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 3 May 2023 07:00:02 -0400
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B96149F7
        for <rust-for-linux@vger.kernel.org>; Wed,  3 May 2023 04:00:00 -0700 (PDT)
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-94f59fc787fso477025366b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 03 May 2023 04:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683111599; x=1685703599;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2flrzqrP+i7aYqtQguBZoK/d1T9EPNvaJivqwFd9T0=;
        b=SynCK35TIyLV9RAsgu/wZep3yuWP9RqrRGi3a+dU+S6i2JQ9j/9wWWdYlxcfT7OJeA
         MPadvq86aNWnLmQA896/Sg7QmD/KotZIzs0LX3cCFPvGECrWJ3PxqgDEvWGt0Hcbmlre
         dol4G2AGK0nA/coq8WrfJSuibkYOzatiq8eykuNQORPPa7jF3WXmvVROhqTH4VW+qXPC
         KN1ckIrDHidr2Y1hYCsKdlX663h1T66qO3bxoAeXK3ZYNsRQxc9o/qpdWhE0Ae5LkEK/
         m2yWQbwewGKgvYNvzFkKrB1Ce/e90/jxnFjutFdvSqq+w9ZSckrnGGHEzshEsnbN+PVo
         psEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683111599; x=1685703599;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2flrzqrP+i7aYqtQguBZoK/d1T9EPNvaJivqwFd9T0=;
        b=UCOEPGwI56WsxxsqBryC8NOQO0a87Vwns61DmyTYMShUfd1q0O7bDgR/SpZoE19gi6
         91y9lIRPDTm3j/Rf9gUkL4+XUu7FF9Jo8YqFel7w5uM4FnXIfJ9Ea9GRZvXoVOMGxWgB
         WMtDDz2FMcL0jrGF8Rbh3IrN3Avz6iDYAcmKRk+zcUph5TU/MEk65CobWu8M1eQqpbVM
         gb6oH45Xt0Gmi0DXXeIteF3ye/flQa1ES/gOP8PIkqKFzFVvEqeqVGNiHJaHxtNhGZUA
         HUBN6N/SiQgyKnw4qBeHfHezV10gTGeupa6q7aB7v4rUjgyl4fizrdwWp5HfAvPqRePS
         phqg==
X-Gm-Message-State: AC+VfDz7Wpv9LKteKChSPGQOJZEVjQskb3WbhC4dCWuKz4D1xnfIuhMo
        W1JL3IRV1EJP5xX2jRHP797ivq1CePcNoGc=
X-Google-Smtp-Source: ACHHUZ6SacIL6tXwsdztLRNtTxrAY3AjLbfHWLlQjTdPFAlO71jHQIXs1LFwEkD76LO+wTYrNLxnd//3yA1+5A4=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:b13:b0:94e:f130:93f0 with SMTP
 id h19-20020a1709070b1300b0094ef13093f0mr1194892ejl.1.1683111598801; Wed, 03
 May 2023 03:59:58 -0700 (PDT)
Date:   Wed,  3 May 2023 10:59:35 +0000
In-Reply-To: <20230426224748.34056-1-materoy@proton.me>
Mime-Version: 1.0
References: <20230426224748.34056-1-materoy@proton.me>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230503105935.518315-1-aliceryhl@google.com>
Subject: Re: [PATCH v1] rust: error: add ERESTARTSYS error code
From:   Alice Ryhl <aliceryhl@google.com>
To:     materoy@proton.me
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, gary@garyguo.net,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com,
        yakoyoku@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 27.04.23 00:57, Roy Matero <materoy@proton.me> wrote:
> Fix sorting of rust/bindings/binding_helper.h's includes,
> to maintain consistency and rust idoms
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1002
> 
> Signed-off-by: Roy Matero <materoy@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
