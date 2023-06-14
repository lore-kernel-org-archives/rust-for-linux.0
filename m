Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD55EB64DD
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Jun 2023 20:33:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234950AbjFNUcv (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 14 Jun 2023 16:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233041AbjFNUc3 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 14 Jun 2023 16:32:29 -0400
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61292133
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jun 2023 13:32:28 -0700 (PDT)
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-9775f04de56so102752166b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jun 2023 13:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686774747; x=1689366747;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=czEjt+NjAyuH0cAt6yqFee89woVRFsyvQrYC+0eGV9Y=;
        b=xTtVN4Z1Q88g5rTsccodRHtuT93zYjcUCBrJT95LZIYNDADStxnQxZyTD2EJ2BW+EQ
         gG9WCiqzycuFhB6BgXwWMlIppjT0CNI8UMkUsdxitpwlvLRaBXOIX+CaKxN3iL8IawY+
         4esEjsAM7hRAtYvRzMgVmR9vSolLSnj+kPwM1wlEcomxT4tuscwRvYZ30cqXIjRZ7AFw
         wpfkcDaqNEGH5bwnGlHbj6F5zl51FHU2M19UQIGZSAKRHHsbwNEwK/7ilANmFsnAOzJU
         vDutlW9DFkMHsGVZF254iPq8SURQag7SygVMF8UeUTIN8cRHVAUiAvVUpGHKMl83Fcch
         heGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686774747; x=1689366747;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=czEjt+NjAyuH0cAt6yqFee89woVRFsyvQrYC+0eGV9Y=;
        b=iBr4N3XvavX4gUrHwRawQze2cjMvf6qaPnKDPhi3aTSh1JsnA10e/Lsxi3Mq3d1gnm
         JAvXyOmGcOf1kYNNYWhnMkB4ABz9/hWIXt26TjZcY4cmsgG7MZkyRaR1PtUioZtWysj9
         RtPSRgFlGu05f8MiTndF9m4aJewRD/MVZ4aKw+QUpwG+zSctOoshZoWspVg69/6JdiXZ
         jex9R3yEUaoU5aBT8SRBqt7ogPkS8a2Db7It2W7X5qf4xsiZpQAnnI4yce2oPuWZBESs
         7Q6L65b3hK8SwOs7eZ3pG7ZRbEO9C5roYoK8SVJ/UBQf5iE+FhThQV5aNUMHNvbTTO3B
         sjHw==
X-Gm-Message-State: AC+VfDwHEtGH56flosI/BcE86PicT0WOdnEwa8g6gH8qclXf6aVu7Xxh
        hEkfruNIJkkZFI7OPc7+PYzzqKupYCHYges=
X-Google-Smtp-Source: ACHHUZ6QRTP5WMGlZF6ouKyzQXFEVXAvPfgRaI2C78nvnu3bQtIOBOvXIr1gBV+MPRyzc5u+ThXTy0T5ROzw65g=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:2bf0:b0:982:9e1c:ddc5 with SMTP
 id gv48-20020a1709072bf000b009829e1cddc5mr8045ejc.0.1686774747408; Wed, 14
 Jun 2023 13:32:27 -0700 (PDT)
Date:   Wed, 14 Jun 2023 20:32:25 +0000
In-Reply-To: <20230614180837.630180-5-ojeda@kernel.org>
Mime-Version: 1.0
References: <20230614180837.630180-5-ojeda@kernel.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230614203225.2909756-1-aliceryhl@google.com>
Subject: Re: [PATCH 4/6] rust: types: make doctests compilable/testable
From:   Alice Ryhl <aliceryhl@google.com>
To:     ojeda@kernel.org
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, brendan.higgins@linux.dev,
        davidgow@google.com, gary@garyguo.net, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        nmi@metaspace.dk, patches@lists.linux.dev, philip.li@intel.com,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Miguel Ojeda <ojeda@kernel.org> writes:
> Rust documentation tests are going to be build/run-tested
> with the KUnit integration added in a future patch, thus
> update them to make them compilable/testable so that we
> may start enforcing it.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

