Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930D5C636D4
	for <rust-for-linux@archiver.kernel.org>; Mon, 13 Feb 2023 15:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbjBMPBv (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 13 Feb 2023 10:01:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbjBMPBe (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 13 Feb 2023 10:01:34 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17941CF64
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 07:01:14 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 094D73F519
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1676300467;
        bh=o5JzMwOKW+2dlPWOvDNfJRa9ASUKbSbD6R5eHASFS8s=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=YCIVXwVUfIuwUMrsjuKqsIHeISWiIsQS46M7FHlGYGUYa0YukXIh5we2ZvR5hjygf
         H4IUtUmw1e6vyOzXj2SZEdNcub77Lu9ujCmvJveCjoP4waJkqLgyu8vx0lz4ZG+zQH
         JZ1qP8o9x663ukCJafTNSkWP8NGqcL7pkPK49a8/r3+8jcsKS2zpnPi7LJ83uq41Mr
         YsHXaaT41diL3orBRUhYIBlgODTdHG9hnGKEAkQo5DkR9bdx1v4gbOihcT2wH7WVlR
         wfEK2Iw/x/M7VM5Ol17OFxihwkRPsxa5dfeEvlCl0+qZRJbNuuaUU+OJklfauJRF01
         uFIx78WkveoLg==
Received: by mail-ed1-f70.google.com with SMTP id w3-20020a056402268300b00487e0d9b53fso7755221edd.10
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 07:01:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5JzMwOKW+2dlPWOvDNfJRa9ASUKbSbD6R5eHASFS8s=;
        b=Z1J82fSWXRrfi7wo44tQfj6uMpaG7GHLpEQnreoe2T7rV76ceFfuiyde6Vb++s2/If
         ILkPELL1eEiXw0Uw92qja7Ji/ZZZh8gtOjbM2aNztjfFnwVBNFkdHRvWq+B9f1/8J2De
         5/wfQmW2pWsmTE9Rmh05hAKR25swxrWgBv7j5ytzGF/pGx9CeQXE2R6SgG7MCKGulweb
         ZQo1+hlCYPsB/68HM0Z5Z8e0F+63o8gdSDXdvbqaqX1l4Luzq6z1DoP4tCyFAd4GW5wk
         dwgKyKoZDLjw/LUoWWQhKwKYoWEz8iIusCarl6OHhQACqdCVKh6Iqip7LdQG3O71Lcfm
         KZtQ==
X-Gm-Message-State: AO0yUKVLnY414W3hj9DkpjQnoy5Z8+wjIPSl55rwZW7B/c+Vd8KTHP0v
        1w1bUTCft7o0i0Z54fFEqjy0SEy2nlxVhUgUD5uLVDkGK2pWstQrVX/dAe6y7L86QJkVowML6f4
        +BcFa6mep5ggcoR+XKGnU0N7V0LbXZNGtM9xE8GAMMZjz
X-Received: by 2002:a50:f611:0:b0:4ac:b3ff:866a with SMTP id c17-20020a50f611000000b004acb3ff866amr9387937edn.24.1676300466336;
        Mon, 13 Feb 2023 07:01:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+60e14qkSzS0RxhL6/FXZjLzPukCKBGT4oVZL9k7yilV1xGdz7c911teLM/7YlaPomF5m2uw==
X-Received: by 2002:a50:f611:0:b0:4ac:b3ff:866a with SMTP id c17-20020a50f611000000b004acb3ff866amr9387917edn.24.1676300466149;
        Mon, 13 Feb 2023 07:01:06 -0800 (PST)
Received: from localhost (host-87-7-128-191.retail.telecomitalia.it. [87.7.128.191])
        by smtp.gmail.com with ESMTPSA id b30-20020a50ccde000000b004acb890553fsm3728198edj.26.2023.02.13.07.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 07:01:05 -0800 (PST)
Date:   Mon, 13 Feb 2023 16:01:05 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Eric Curtin <ecurtin@redhat.com>, Daniel Xu <dxu@dxuuu.xyz>,
        Martin Reboredo <yakoyoku@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        bjorn3_gh@protonmail.com, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: fix regexp in scripts/is_rust_module.sh
Message-ID: <Y+pQsfNiLkspVIK2@righiandr-XPS-13-7390>
References: <20230210152622.92912-1-andrea.righi@canonical.com>
 <CANiq72=FZtNmYvbb-YPHmQ=bm8rH8VO3M9nemT4i03g9A2PD2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=FZtNmYvbb-YPHmQ=bm8rH8VO3M9nemT4i03g9A2PD2Q@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Feb 13, 2023 at 02:19:38PM +0100, Miguel Ojeda wrote:
> On Fri, Feb 10, 2023 at 4:26 PM Andrea Righi <andrea.righi@canonical.com> wrote:
> >
> > nm can use "R" or "r" to show read-only data sections, but
> > scripts/is_rust_module.sh can only recognize "r", so with some versions
> > of binutils it can fail to detect if a module is a Rust module or not.
> 
> Do you know which versions? If so, it would be nice to document it here.
> 
> > Moreover, with this patch applied I can also relax the constraint of
> > "RUST depends on !DEBUG_INFO_BTF" and build a kernel with Rust and BTF
> > enabled at the same time (of course BTF generation is still skipped for
> > Rust modules).
> 
> Even if that build succeeds, can you load the modules? i.e. the
> constraint was there due to
> https://github.com/Rust-for-Linux/linux/issues/735.

This patch simply fixes scripts/is_rust_module.sh to recognize Rust
modules from "regular" C modules with certain versions of binutils, so
that BTF generation is properly skipped for Rust modules.

In this way both C and Rust modules can be loaded correctly (at least in
my tests I'm able load both with CONFIG_DEBUG_INFO_BTF enabled).

I haven't dropped the "RUST depends on !DEBUG_INFO_BTF" yet, but I think
with this fix is applied we can relax this constraint.

-Andrea

> 
> Also Cc'ing Daniel, Eric and Martin since they are the ones working on this.
> 
> Cheers,
> Miguel
