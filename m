Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E751C61DA4
	for <rust-for-linux@archiver.kernel.org>; Sat, 11 Feb 2023 14:35:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjBKOfk (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 11 Feb 2023 09:35:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBKOfj (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 11 Feb 2023 09:35:39 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 494352D64
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Feb 2023 06:35:37 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9B8E33F123
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Feb 2023 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1676126135;
        bh=Lme9XhkAr8Cxdn2CNlWscsuXuEcjxv9u2EwlF9Hplsg=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=QPDEjIQ44TX4KLhMofNC+G+QQYBfmaiH0fD/fZ53EupytdidY+iwUe3WsV012cwry
         WCPcrlg/qtWElsHl53jYC00fX3vj55S1YPWWE/3TilR9AtIwyNRQnSVpMGS8qJyHbH
         8ggAzGZenJ1c0pg94yC6914TXgdCxyiA9/K39iU1vdF8HB0Tbab+YdsoCLMGDxa/g0
         CBjUfMszMrf8XhfVj1SyJPQd7hOC2RAj6cg6Ck0nWL6YZBiGoALB+ohs2xS7oIctxS
         QlnjFXagE1VAYT6gFpU5wDa1ZuIXE1ggV/Oi0StHC5XF2Qrq0Y/P+rh0ckAPh6PVfy
         dVMFXXNfzTyWw==
Received: by mail-ej1-f70.google.com with SMTP id z2-20020a1709060be200b0088b579825f9so5093328ejg.18
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Feb 2023 06:35:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lme9XhkAr8Cxdn2CNlWscsuXuEcjxv9u2EwlF9Hplsg=;
        b=LzrWUItL406AavQZVyKj2UZN4KrZHFhQSXI7PIgBCK6c2uIgs9Tthun0octnvkJDdY
         hPFVKRGZXTGjObvbrxsfDIsnF+dwxq08vm7aQegfXSBjR9aC86veOgCyil9F4SDPYSqn
         +OpF22IC9BM3ZJ+8VXQJv0OmelyiS+eNhSvNodWp1sPhiX1+AiMurkrGy6b5S3JAL1q/
         alSQyS74n2CgfWjoNH6g7QxqxiBGfFQI1XAd9jJ+q1PVmUx/BAtfnRzeHiRmMp2juVOK
         0/8631c5ZUSypdxEoskNBACVAKy15u+tkh6eccUj9Ftk3xM3eqDafZBuT7k8uuUc0AlN
         FPDw==
X-Gm-Message-State: AO0yUKV5Gs3tckpbQjp9qU4o324mMDWVUtrHpcPnCGPaQPQhqZlr0zeY
        4sxuefyTgiP6lZxNQcPx6B+XzooAaxdaULskLecVCT/c1xukCQeGxl8lHwgQgOBrUtNDa8P2RG5
        1nLAjayiuDj76jFxIRoq1QHctCNzTLcH/raidVRA5pezh
X-Received: by 2002:a17:906:7159:b0:82d:e2a6:4b0d with SMTP id z25-20020a170906715900b0082de2a64b0dmr16075159ejj.18.1676126134491;
        Sat, 11 Feb 2023 06:35:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+P8SX8aILiTuCnS1F4GLtcNeBIYuJKTjIh4OzPTPRE/DHHp8jql26LVq3sV5VO5bMRzq9UCQ==
X-Received: by 2002:a17:906:7159:b0:82d:e2a6:4b0d with SMTP id z25-20020a170906715900b0082de2a64b0dmr16075147ejj.18.1676126134305;
        Sat, 11 Feb 2023 06:35:34 -0800 (PST)
Received: from localhost (host-87-7-128-191.retail.telecomitalia.it. [87.7.128.191])
        by smtp.gmail.com with ESMTPSA id 19-20020a170906059300b0088f8803661asm3898223ejn.8.2023.02.11.06.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:35:34 -0800 (PST)
Date:   Sat, 11 Feb 2023 15:35:33 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Kees Cook <kees@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        bjorn3_gh@protonmail.com, Kees Cook <keescook@chromium.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: allow to use INIT_STACK_ALL_ZERO
Message-ID: <Y+entVlMoV83vyzz@righiandr-XPS-13-7390>
References: <20230210215141.108958-1-andrea.righi@canonical.com>
 <8178319F-4188-4F8E-AD8D-DCC392E26DBF@kernel.org>
 <Y+daEOZgaiF3IMTX@righiandr-XPS-13-7390>
 <4E6FDE1C-47B6-46A6-AF31-28AEB2348344@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E6FDE1C-47B6-46A6-AF31-28AEB2348344@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Feb 11, 2023 at 05:44:33AM -0800, Kees Cook wrote:
> On February 11, 2023 1:04:16 AM PST, Andrea Righi <andrea.righi@canonical.com> wrote:
> >On Fri, Feb 10, 2023 at 02:43:56PM -0800, Kees Cook wrote:
> >> On February 10, 2023 1:51:41 PM PST, Andrea Righi <andrea.righi@canonical.com> wrote:
> >> >With CONFIG_INIT_STACK_ALL_ZERO enabled, bindgen passes
> >> >-ftrivial-auto-var-init=zero to clang, that triggers the following
> >> >error:
> >> >
> >> > error: '-ftrivial-auto-var-init=zero' hasn't been enabled; enable it at your own peril for benchmarking purpose only with '-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang'
> >> >
> >> >However, this additional option that is currently required by clang is
> >> >going to be removed in the future (as the name of the option suggests),
> >> >likely with clang-17.
> >> >
> >> >So, make sure bindgen is using this extra option if the major version of
> >> >the libclang used by bindgen is < 17.
> >> >
> >> >In this way we can enable CONFIG_INIT_STACK_ALL_ZERO with CONFIG_RUST
> >> >without triggering any build error.
> >> >
> >> >Link: https://github.com/llvm/llvm-project/issues/44842
> >> >Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
> >> >---
> >> >
> >> >Changes in v2:
> >> > - check the version of libclang used by bindgen to determine if we need
> >> >   to pass the additional clang option
> >> >
> >> > rust/Makefile | 13 +++++++++++++
> >> > 1 file changed, 13 insertions(+)
> >> >
> >> >diff --git a/rust/Makefile b/rust/Makefile
> >> >index ff70c4c916f8..c77d7ce96a85 100644
> >> >--- a/rust/Makefile
> >> >+++ b/rust/Makefile
> >> >@@ -269,6 +269,19 @@ BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
> >> > # some configurations, with new GCC versions, etc.
> >> > bindgen_extra_c_flags = -w --target=$(BINDGEN_TARGET)
> >> > 
> >> >+# Auto variable zero-initialization requires an additional special option with
> >> >+# clang that is going to be removed sometimes in the future (likely in
> >> >+# clang-17), so make sure to pass this option only if clang supports it
> >> >+# (libclang major version < 17).
> >> >+#
> >> >+# https://github.com/llvm/llvm-project/issues/44842
> >> >+ifdef CONFIG_INIT_STACK_ALL_ZERO
> >> >+libclang_maj_ver=$(shell $(BINDGEN) $(srctree)/scripts/rust_is_available_bindgen_libclang.h 2>&1 | sed -ne 's/.*clang version \([0-9]*\).*/\1/p')
> >> >+ifeq ($(shell expr $(libclang_maj_ver) \< 17), 1)
> >> >+bindgen_extra_c_flags += -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
> >> >+endif
> >> >+endif
> >> 
> >> This logic already exists in the top-level Makefile. How does -ftrivial-auto-var-init=zero make it into bindgen_c_flags normally? (I.e. why does the legacy -enable... option not?)
> >
> >If we're using gcc, the top-level Makefile doesn't set the clang
> >options, so in this case CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_ENABLER is
> >undefined.  But then bindgen always relies on libclang to parse C, even
> >if gcc is used globally, therefore it needs the extra clang flag.
> 
> Ah yes! Thank you, I keep forgetting about mixed compiler builds.
> 
> >
> >Ideally it'd be nice if bindgen would support a gcc backend, but until
> >then we need to do something special here, like this kind of duplicated
> >logic...
> 
> Right. Yeah, good fix. One nit: the -enable... flag is removed in Clang 16+:

oic, with clang-16 we get a deprecated warning (but it doesn't fail),
then starting with clang-17 the -enable.. flag is not available anymore.

Then I agree that a better check would be version < 16, instead of < 17.

Thanks,
-Andrea

> 
> https://github.com/llvm/llvm-project/blob/llvmorg-16.0.0-rc2/clang/docs/ReleaseNotes.rst#deprecated-compiler-flags
> 
> With that fixed:
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> 
> -- 
> Kees Cook
