Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D197EB64D7
	for <rust-for-linux@archiver.kernel.org>; Fri, 23 Jun 2023 17:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbjFWRUK (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 23 Jun 2023 13:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232455AbjFWRUJ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 23 Jun 2023 13:20:09 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10EE1981
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jun 2023 10:20:07 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-bf179fcc200so1245323276.0
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jun 2023 10:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687540807; x=1690132807;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BiBfjxCccTZov20BHaxSn4dvBGrOpxH5Zg2fttHLmAo=;
        b=vUzaOM/RwOe0xTyvCYmg4F3fM36X8xQ+vBoknwuOrceehnrO+IAoECNY3QF0zL15Pm
         wjBaOjnRslplk2hdm41mQGiaKx/c78xfFrG2eWwxSkiYlVNgvPmTCC9h1V0o+vHxSkBV
         QkSFBASDYPTHBjvH7P1cc6AUJa7EvzBoRqlhmloDYh6ogDcpwW4yJaNpI0xVT0MONGAx
         Ms+lSmz9khKYdLg0O/jY0VJqNChW8WEskqxcqnUBVZZ9vilOt6Pt71UfFtVDTzq/JmeJ
         9jJL1Aepkk4ls9rRE1FB/oSeMG6u9a2wpNzQF4LJ0g9/5igrxuIiQK46Z4FwmOts+2yr
         9A+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687540807; x=1690132807;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiBfjxCccTZov20BHaxSn4dvBGrOpxH5Zg2fttHLmAo=;
        b=PVRhbhuutxrVMgmE4Id0dZht8qAksH1PAZ3eNWxK5Rf/XVjCCVtXA3dp4tMCms90pM
         m+sHqLuh9tWNTf+gnwDj6KAqkNRHMzRdmWuoa6+xUkx6nimSEKAr1D6t+9DQhd5eV+0E
         pDoEJQBU+jD/OeqzR/01RG+Baq0h+jpmjKEZr3K6LIo66GYf251hl9q6SeKd3xZhCFYb
         JGec9Teb8CWTNK6V89gYxlxqIdjsdA21aXJMwsows7lHfR8X5aaHyFgwVZeAmBbFq3II
         L8iAeqyPgpbPFLcT7mowfrGnIqU8t8L9qFRqeav21t/zcaWV6/LnQ5aAl6T9yEmxCgEL
         5IYg==
X-Gm-Message-State: AC+VfDzKhmi3IBfqjVoZrxp3WoFwRQf7vl9sDLnena43s80vaqdxuBO6
        qNbyc+wFTzevWeXwyLChFFl5nCBZ+oiimHFAos0=
X-Google-Smtp-Source: ACHHUZ6cx2qgz7NSb63VxtrtMtA+DX4GBzGLbc+XFKkQCOYrP1gWt/nU7fhRzAZr+PjlLvWSt+azGJTAyzUvIUmGB90=
X-Received: from mattgilbride.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2ac5])
 (user=mattgilbride job=sendgmr) by 2002:a25:e78a:0:b0:bc4:ef98:681c with SMTP
 id e132-20020a25e78a000000b00bc4ef98681cmr3959400ybh.13.1687540806990; Fri,
 23 Jun 2023 10:20:06 -0700 (PDT)
Date:   Fri, 23 Jun 2023 17:20:05 +0000
In-Reply-To: <20230224-rust-xarray-v3-1-04305b1173a5@asahilina.net>
Mime-Version: 1.0
References: <20230224-rust-xarray-v3-1-04305b1173a5@asahilina.net>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230623172005.2432028-1-mattgilbride@google.com>
Subject: Re: [PATCH v3] rust: xarray: Add an abstraction for XArray
From:   Matt Gilbride <mattgilbride@google.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Asahi Lina <lina@asahilina.net>,
        Alex Gaynor <alex.gaynor@gmail.com>, asahi@lists.linux.dev,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        linux-kernel@vger.kernel.org, neal@gompa.dev,
        Miguel Ojeda <ojeda@kernel.org>,
        rust-for-linux@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>, yakoyoku@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hello Matthew,

Could you please take a look at this patch? We also need `XArray` for ongoing work in Android's binder driver.

Thanks very much,

Matt
