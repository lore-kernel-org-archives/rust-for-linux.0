Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E46FC25B08
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Aug 2022 20:13:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241772AbiHQUNk (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 Aug 2022 16:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241766AbiHQUNj (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 Aug 2022 16:13:39 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3B4120A5
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Aug 2022 13:13:36 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id h28so12938814pfq.11
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Aug 2022 13:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=ecAK1b0BGR4BXz6e6ttRl4yIb91x7Nb5bR2E/kWSLHw=;
        b=jXVV9RG6RKNfj/aJYfUw5290cjSO+bHeeC49GRUXd9iZsYbzUGSM73ZRlDDNkuJZKe
         M4B8e3fSbz5QPTo91nEi4iTwXcctrjQRgcdvksNueL7yMayrNdbkM3QwZ8MnQz5Lw5w7
         c0ORLsabFe3Gm+9qrBL3vWG3OG51cAMRGiFfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=ecAK1b0BGR4BXz6e6ttRl4yIb91x7Nb5bR2E/kWSLHw=;
        b=IeLfFUri+L3HrQC4ERPKzHkKmIgTR4ctQwZiPYr9WobGiMXA9sbd56auUcnpYBE721
         9rJh/SeFEsEJMpeIsg9h1A260Yz/VRa/7wHfTxtz1e6m06faUA9JwV4CUI6DYt0docHf
         KSG7kUG0/Ot/Nv33s5wfIKs0/zu+JvaxNrg0uGZmfW9tA6VqtKuSzwe1GRDaIVJQXZji
         3whpeqxp+CWEuBjuGDs+u52kgshrNCSYXzW34fwq8RCTdtcx4FDfXGpz7XGUqUkhcHoB
         RmZSVv9wVuWemoMS2qsrQGh/0r8v8zmC9VkHOxHl1HqJ9j6ydUVGPYqKCGXnvdTmaL3V
         Q80Q==
X-Gm-Message-State: ACgBeo3HR4u2h7+tt3i+nSjOSB0XeRQlzI1f+HjO1i82TA6olnrmxcRS
        I2FSHkqGuvhDKNA56uWUbhFpVrlSOKBkNg==
X-Google-Smtp-Source: AA6agR5R6i7GTzzHrmLNyQaH3JQ2CAz656dADZPSQA9APProw72NMYDNMlfcDbQNYdKhk7GwcgQ/hg==
X-Received: by 2002:a63:8442:0:b0:429:85db:b351 with SMTP id k63-20020a638442000000b0042985dbb351mr10410526pgd.430.1660767215661;
        Wed, 17 Aug 2022 13:13:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k29-20020aa79d1d000000b0052bf6789f02sm11235013pfp.178.2022.08.17.13.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:13:34 -0700 (PDT)
Date:   Wed, 17 Aug 2022 13:13:34 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, patches@lists.linux.dev,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH v9 18/27] scripts: add `generate_rust_analyzer.py`
Message-ID: <202208171313.093606A6B8@keescook>
References: <20220805154231.31257-1-ojeda@kernel.org>
 <20220805154231.31257-19-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805154231.31257-19-ojeda@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Aug 05, 2022 at 05:42:03PM +0200, Miguel Ojeda wrote:
> The `generate_rust_analyzer.py` script generates the configuration
> file (`rust-project.json`) for rust-analyzer.
> 
> rust-analyzer is a modular compiler frontend for the Rust language.
> It provides an LSP server which can be used in editors such as
> VS Code, Emacs or Vim.
> 
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
