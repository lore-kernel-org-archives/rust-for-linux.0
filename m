Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF17EB64DB
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Jun 2023 20:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbjFNUct (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 14 Jun 2023 16:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjFNUcU (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 14 Jun 2023 16:32:20 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1842133
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jun 2023 13:32:20 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-bce829aca1bso1240087276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jun 2023 13:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686774739; x=1689366739;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=czEjt+NjAyuH0cAt6yqFee89woVRFsyvQrYC+0eGV9Y=;
        b=7qQ2pRRFtJkkGsek6sI8eGIYh2kDVCgIhOHYHltdTmoejySFVhUOI2O+RzdgHUO8St
         DXjUfgph8ErCl0t8k2ZLDkvsaImXoSGboFkpiSNGgCRT6iPw62D0vVVVniU5U9wAzR9H
         zyOpluP2dekBZc94GvHRFyYnDGrmFyTP7mG300SoiX/TsgiH0M59+v3YCw5Na20/LrGs
         YB+9OWXe++0WDbleOpm82V21RhXRmbZYBapRl/mBeNCnlLmEuLlgtZXMp1LVw4jVcVUU
         TqjluAZsA6qWCAlDlayrX3ufyhk1147CBOckGTXvLTg2DrpKExSDZAoeK2t/uOufYl42
         gxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686774739; x=1689366739;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=czEjt+NjAyuH0cAt6yqFee89woVRFsyvQrYC+0eGV9Y=;
        b=A/MK1E+FcYfvw0bDjZ+Ba296QyhZAY9wgC9E5gepcu5GKC2KCeBSdeYO8Btqw7MLQ1
         B71gqiE98/fUjawFpHGiSGJxVmayDxnl/gv2GtxZyqyGoY3KBW8O/kza2kYYVLbQXnd6
         pl05bR+efI5Nw6bHMGmQs+YNDCBtfDyBZ1EFm5lbrCdRpj8l6dNkU6mQ1NQcemdk5Nxp
         cCE1Oq2GrvuW8BnP12Yy3bqmh1WIg+4MUECLyvLQOXqTlwzoTSbUguLPjH8FPtRlS305
         c6QYQJPBaMQVpmEgFtOa5hcb8LTwxc+h8j8mrsC5ZWo0bdH5C02b9FpUSXslgi2LVSzu
         FScg==
X-Gm-Message-State: AC+VfDyzX4Ds6cTpQt8Vk6JNNAU6dq3foWwozeSh0SOE/0Dkghey4OfI
        vy7MXNLq9hPDeSY4X5JIsn0ue62jzHOWgOQ=
X-Google-Smtp-Source: ACHHUZ7N8NjzbORsY8P9yrlGMhvoX5EEo5wu8Kwz9gBGRafQS4YZfEO18H1Pw0V9rig7JIuYUAUF5fTWR+r6qYs=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:d54:0:b0:ba8:2e79:c193 with SMTP id
 81-20020a250d54000000b00ba82e79c193mr472122ybn.12.1686774739295; Wed, 14 Jun
 2023 13:32:19 -0700 (PDT)
Date:   Wed, 14 Jun 2023 20:32:16 +0000
In-Reply-To: <20230614180837.630180-2-ojeda@kernel.org>
Mime-Version: 1.0
References: <20230614180837.630180-2-ojeda@kernel.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230614203216.2908753-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/6] rust: init: make doctests compilable/testable
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

