Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE56EB64DA
	for <rust-for-linux@archiver.kernel.org>; Fri, 14 Jul 2023 09:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235235AbjGNJoL (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 14 Jul 2023 05:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235139AbjGNJoL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 14 Jul 2023 05:44:11 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D0D12D
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 02:44:10 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5771e0959f7so14322497b3.3
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689327849; x=1691919849;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FQulSBzim5w5xsl3zfUAjtDmEmIk8kUKUMOuRvJ6ZCs=;
        b=DQpb4IPB+IEOr1+4EUQM2FmUBJw5xH7JV8ghu2wughEM1EpQiUxBQZ5zjqURzdywtg
         tTQXaa6b3GEFmZFpbMJYgihDJYXbins0NvNDWbPyFwdUePob9m927o2lx2j5Ob/BPSjv
         nMhdBDga2+kWHumNaj3xqYgTl03NBH5mjktuZ1BEs/tzloL8RpHiHHvIeUy1SM2Vg7id
         idOuWKpM9chwHBoRaScpj896NxhPaVjKVYqn/QBLqdqba0Gepx1461g1W/WXcNiXslMI
         llxiWcfZ8KGZXYjvApsptsIedYoxGdrh6HHfWmq+4cO7S6OLBmSHb4aH6QLdQXYrBAnb
         By3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689327849; x=1691919849;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQulSBzim5w5xsl3zfUAjtDmEmIk8kUKUMOuRvJ6ZCs=;
        b=dko3RHyrRzyyiibqc8mc3YHT6mwYLZ3JWhQeESw7xokcxQI1vSxsT8eZ94putV6gQT
         YWfouBX+rBgYk7gJqLIiJz0Ug6gXxAaJEzIgfxxDnodPNdqFMHBSI056Qc7QxStvuqEx
         mIQSUOIiIx/x3UKA03dsnarcOGqSQ0tkYgf4XHLwEeMvOzbo7RJSPF8cFE3cTYbqiA6j
         QKcwcn5IUhBloRfQ3JMhmqFnc3my6Tb3o2xu5pi1uxJJpe2o44jpoK3fkLwG28iAhf6k
         QmnJmQim/WZJOQ7ifKf8dQ7yNUnIey0hFK4fLzLQ8UvmsP4qn9TsGJoI1HiqrQzI/3sn
         /zQw==
X-Gm-Message-State: ABy/qLZPkEysVXSQppWl0Ts08Cc+sFtageycQ0dFDwEr6dazG4qt9NiD
        NsMdwvh/IA1JaxIxdpsu2x0FD34uS9v1hCY=
X-Google-Smtp-Source: APBJJlFkOynd+DZBQ11JhDvwFzakuB2FgEeg8+O6Um/oHo+JsjuP3TedLZMe2EG99Wz7Gm+tf4lfq7SZ9BPMf/c=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:b3c4:0:b0:576:de5f:95e1 with SMTP id
 r187-20020a81b3c4000000b00576de5f95e1mr27471ywh.1.1689327849767; Fri, 14 Jul
 2023 02:44:09 -0700 (PDT)
Date:   Fri, 14 Jul 2023 09:44:07 +0000
In-Reply-To: <20230714-zeroed-v1-1-494d6820d61b@asahilina.net>
Mime-Version: 1.0
References: <20230714-zeroed-v1-1-494d6820d61b@asahilina.net>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230714094407.2188895-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: init: Implement Zeroable::zeroed()
From:   Alice Ryhl <aliceryhl@google.com>
To:     lina@asahilina.net
Cc:     alex.gaynor@gmail.com, benno.lossin@proton.me,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Asahi Lina <lina@asahilina.net> writes:
> +pub unsafe trait Zeroable: core::marker::Sized {
> +    /// Create a new zeroed T.
> +    ///
> +    /// Directly returns a zeroed T, analogous to Default::default().
> +    fn zeroed() -> Self {
> +        unsafe { core::mem::zeroed() }
> +    }
> +}

I don't think this trait needs to require `Sized`. How about the
following alternate implementation?

pub unsafe trait Zeroable {
    /// Create a new zeroed T.
    ///
    /// Directly returns a zeroed T, analogous to Default::default().
    fn zeroed() -> Self
    where
        Self: core::marker::Sized,
    {
        unsafe { core::mem::zeroed() }
    }
}

Then types like [T] can also implement Zeroable when T does.

If you make the above change, then you may add my
  Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

