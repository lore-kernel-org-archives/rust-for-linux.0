Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38B8EB64DA
	for <rust-for-linux@archiver.kernel.org>; Fri, 14 Jul 2023 09:49:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235367AbjGNJtX (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 14 Jul 2023 05:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235941AbjGNJtF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 14 Jul 2023 05:49:05 -0400
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70B330DE
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 02:48:54 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-97542592eb9so104356666b.2
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 02:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689328133; x=1691920133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LgB9Mhn/4by5bCjJpUEX/UcsNdb0bdjrrqXERtCyeLI=;
        b=C3GVqpZj6i0V8gkeGoO6N72GIt8HeLW1V5EMHZbZAE7/3bqd+2NE3EZ8b624qO0BD3
         jTO0ejZIZ84R7+1oKeHt05CyuT8Yx571+hljrlG5bjx1A1tD1ebv55QLpfBRWvTwo4AF
         GzCHxriMdWWJVLRQKR+UjdxcFE3HjYbbFlnfTPROo/NYJ+hrJAVz/+FBBQYzZd4j2l7+
         NJDISCiRb0ci+5wZj6nIp6DrgMm7Wj6aX5gOS4SEwwMGtbmLUrQbwlhBZT/VSrNLaG1X
         qJ5wEbRmzJVJbeja9uKq4s2N1dI/cKc9HshqAOGM81iO2tuSTFwCkfsqx/D/Rb7xc8X2
         Bqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689328133; x=1691920133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgB9Mhn/4by5bCjJpUEX/UcsNdb0bdjrrqXERtCyeLI=;
        b=hCPYKI0AxLid4huZ8g9q/fYhsVwh+Cy5bu05pXgUUEoNcYIZV33xOGSLZbpYvlqhVv
         MX0CYw010Dd+BmC9/YtkfWDldbrvGYKy7JAqkGcCwnYz5iThxAmij3U/thdoJt5Ojji6
         SI2KR8rbgZHtV7HSLdqEkBcxTG8GyZtLl4ALVu28ea4+vqMclEeL4+3mob3Z+YogxHoC
         g5itQYP9w+6mLXRi9p9+qxwSC8SRH9n+3OZ+pHMraRNv/7P7HC8x4/cXfwVRCjTPp/sO
         E7y0r7Om+1Uf8YyMRcubQQvtgaOwjxWKg6u0Y2j0Fc5bjMP4CS3MdxVYcHacNZJxgZIe
         15KA==
X-Gm-Message-State: ABy/qLayReah2L8l/nQFANO47fwRt5BeDIx/38bS4ZIadKdr/rm0OPy7
        sBUD0t6vENsbY8sujB2jNq6XINOZMP+q2j4=
X-Google-Smtp-Source: APBJJlFX3YPOyr7+HJnYzpBJU6w92y6qG7Iwif9vTDearcfvz9cn3ZRfZBU1/7bS7OzWLsIsm/mXxa4S1pwPyb0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:2c78:b0:98e:10f5:db52 with SMTP
 id ib24-20020a1709072c7800b0098e10f5db52mr9590ejc.7.1689328133162; Fri, 14
 Jul 2023 02:48:53 -0700 (PDT)
Date:   Fri, 14 Jul 2023 09:48:44 +0000
In-Reply-To: <20230714-cstring-debug-v1-1-4e7c3018dd4f@asahilina.net>
Mime-Version: 1.0
References: <20230714-cstring-debug-v1-1-4e7c3018dd4f@asahilina.net>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230714094844.2189906-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: kernel: str: Implement Debug for CString
From:   Alice Ryhl <aliceryhl@google.com>
To:     lina@asahilina.net
Cc:     alex.gaynor@gmail.com, asahi@lists.linux.dev,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, gary@garyguo.net,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com,
        Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Asahi Lina <lina@asahilina.net> writes:
> Trivial implementation.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>

The commit message is a bit short, but the change itself looks fine.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

