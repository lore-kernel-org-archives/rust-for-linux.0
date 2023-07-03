Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B1DEB64DD
	for <rust-for-linux@archiver.kernel.org>; Mon,  3 Jul 2023 11:50:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbjGCLuJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 3 Jul 2023 07:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbjGCLuI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 3 Jul 2023 07:50:08 -0400
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151B7E59
        for <rust-for-linux@vger.kernel.org>; Mon,  3 Jul 2023 04:50:07 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-98843cc8980so379727266b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Jul 2023 04:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688385005; x=1690977005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2SzNF2Xp9ZY8Wj02jDl62Q9tRowvgKYaFK1hebcuMF8=;
        b=pgdnlTh7+dQSQr4HXDzPTcsLOQlcjEHZQKHGP8SUHPN3/ATvqnlbPaxBaM0s7GaUvw
         RNvdRo93wXLXicgZGyBhr6ZaC7R7ulc3EeshDcjqG+ymW8vmixEwqNuGgEZgFwma+dXs
         PuAJ3SfbY6DIDtw7FWQQehgD5uzUfk/kymMLnXbNQaYbsaHYBje2TTwgvzNaVUl5hyAu
         mjU5Htde/TqTtks02Ohuj1rUzDg6n9J+Od7vyRrVjEeU723xdaTuLfKYG9rmCbv1HqKq
         Qwo0hAGqQyNLiF1/67JGjZjZUaJ7oZpn8LbSv7zzUM7/f5VgOaTJPHaDBhaZfaAScZtR
         Tp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688385005; x=1690977005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SzNF2Xp9ZY8Wj02jDl62Q9tRowvgKYaFK1hebcuMF8=;
        b=T8GPqLtaufWtNl3YtHkl+xKuD3GkGGltlD5KlwcgBkP1P70btwg6Il7PZbPAGPtslm
         auM3d0XSC6peItfptDrPJzCLQaNLh5QLjxwSVFraHifyNAH3zA2XDYisQBfIlCGEX4tu
         YbukigYNsPvj3omtU/SjzrWgVnK30QVEL4KsejkVs0+j2v0ZbvAEAJ7sZ6RP6aw8WnTX
         BkvWmurO55z+n1tEEnD6M4HCHPNP/4TPLk/deOb4GszFNtrU1/2DFIxmzDjJqN2XJQ6H
         pX8CxOg7p/CYsj+4Nhq/9HTgEJWwgx0Bc9yv++B5mAL1P5hErV1xvchUtXU8NmQ4p8P7
         Lm7A==
X-Gm-Message-State: ABy/qLZ4JUUQgXBRXENbelULeMtpl80LgMlg2wHaCEspWdyTvlj9CXVa
        fayHemJDNcRPYXoS+ZPHKYyunkN1kOiqTFM=
X-Google-Smtp-Source: APBJJlFgAj9K0YUTqhagRD6cI8VCPje3jm3GVaqxDZ8a4l8+2/DnyNUX8Fzj6a1eJXu/gYFu03qpStGBcxSRJ3I=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:906:4bcd:b0:992:4ba4:dc4a with SMTP
 id x13-20020a1709064bcd00b009924ba4dc4amr24697ejv.13.1688385005551; Mon, 03
 Jul 2023 04:50:05 -0700 (PDT)
Date:   Mon,  3 Jul 2023 11:50:00 +0000
In-Reply-To: <20230624092330.157338-2-benno.lossin@proton.me>
Mime-Version: 1.0
References: <20230624092330.157338-2-benno.lossin@proton.me>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230703115000.2006682-1-aliceryhl@google.com>
Subject: [PATCH 2/7] rust: add derive macro for `Zeroable`
From:   Alice Ryhl <aliceryhl@google.com>
To:     benno.lossin@proton.me
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
        lina@asahilina.net, linux-kernel@vger.kernel.org, nmi@metaspace.dk,
        ojeda@kernel.org, patches@lists.linux.dev,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Benno Lossin <benno.lossin@proton.me> writes:
> Add a derive proc-macro for the `Zeroable` trait. The macro supports
> structs where every field implements the `Zeroable` trait. This way
> `unsafe` implementations can be avoided.
> 
> The macro is split into two parts:
> - a proc-macro to parse generics into impl and ty generics,
> - a declarative macro that expands to the impl block.
> 
> Suggested-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

