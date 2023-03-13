Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A9FC61DA4
	for <rust-for-linux@archiver.kernel.org>; Mon, 13 Mar 2023 21:53:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjCMVxo (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 13 Mar 2023 17:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjCMVxl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 13 Mar 2023 17:53:41 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD039574D1
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Mar 2023 14:53:38 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 881FA3F83E
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Mar 2023 21:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1678744416;
        bh=ImIPjsOrm96OhIKCZlul0rVIWTT/EgOhorWva5nGUwA=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=MHdGNpW9QIjsky584CgiljjpJSRhV6vAIAZb+D1ZCVNV2GuGI5qtZlGqESZWCD0Ch
         xSQLN9yj3J4ppk6cIpJocxJCSk1j5yqtvq1Kkds9inbplsWSJaaWOKHrp9yq0yQAb1
         9n5LBnLlG9CgcntCHYEhdurcfmHEgD3KEQBrcLty+jtbp/D8rHe1rqN2k/f7lC/Msb
         TLAgOXJbjIQ+Ziyf44RJN49GvCFKiVkO/zbEow+dxwT19wro+wd8kmnN5pUV/kZMhv
         suFGCRhBdYpaW4sOSYa47rr0Zqn8UTbZPRpqy0PMIy0B4R9EctRQFoOjAyCWY3QfDi
         aETUqLeuddccg==
Received: by mail-ed1-f70.google.com with SMTP id q13-20020a5085cd000000b004af50de0bcfso19067257edh.15
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Mar 2023 14:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678744416;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImIPjsOrm96OhIKCZlul0rVIWTT/EgOhorWva5nGUwA=;
        b=rEOqBTO7XaRmOBqdKZpsFRw8TB69k8kNChgNMtoO2D95t68zyzeRtdDosHcDXeWSPb
         uZ3o0KOUFqw1APF7Cd2iIQYovQtqf4yqiYhNBC9tNWpQlqqylMXdgoJsr1AObQAgWUTb
         WjNqH5p3nKiyRtisbugBdLVITOizrMsVC0ylFPSHpIOj/mrVjxyVVhj9rykChsm7MVu8
         Dljv+rEGeauXJiX4bQS5Jd5J0vzYq/obHmNA1QGDOomTSUqTftgOlfk25hF6uM2lvNpD
         FWsAcPpUX7vucDUH3hR5SgOgD0WZnMIUyA1Wv15BOI1qgMTW5nbXq/Pq8+bM2pCd5QCJ
         SuIw==
X-Gm-Message-State: AO0yUKUh1gOzFvUd5jO+PQPABq81tfa93RPKBX5tRy/lLa3Qwhmf8Yg1
        zyBYMmD2owImCa4ecUNTrbjFY6VBFulsK5BBgsSy38c53BFXmu15+vcDx/bSUHRTL18Ueemg/bf
        6KBkmlXQd2BEI6Vg6ZkRQg2KsNzALMf0TtE7AhAUXB74H
X-Received: by 2002:a17:907:c28b:b0:861:4671:a834 with SMTP id tk11-20020a170907c28b00b008614671a834mr32842878ejc.71.1678744415824;
        Mon, 13 Mar 2023 14:53:35 -0700 (PDT)
X-Google-Smtp-Source: AK7set9QnwU+JDKxJqp5MiemT1KkMkul3FxIPfpoDNFIpwny1g50DjA6FuEnlTlK61hIsJX9PSIZrA==
X-Received: by 2002:a17:907:c28b:b0:861:4671:a834 with SMTP id tk11-20020a170907c28b00b008614671a834mr32842841ejc.71.1678744415479;
        Mon, 13 Mar 2023 14:53:35 -0700 (PDT)
Received: from localhost (host-79-53-23-214.retail.telecomitalia.it. [79.53.23.214])
        by smtp.gmail.com with ESMTPSA id le20-20020a170906ae1400b00921c608b737sm266569ejb.126.2023.03.13.14.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:53:35 -0700 (PDT)
Date:   Mon, 13 Mar 2023 22:53:34 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc:     Gary Guo <gary@garyguo.net>, Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        rust-for-linux@vger.kernel.org,
        Guo Zhengkui <guozhengkui@vivo.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
Message-ID: <ZA+bXi0o27XPx3nz@righiandr-XPS-13-7390>
References: <20230111161155.1349375-1-gary@garyguo.net>
 <ZA+IUIOAgrWH2oZ0@righiandr-XPS-13-7390>
 <20230313214853.GY19419@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230313214853.GY19419@kitsune.suse.cz>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Mar 13, 2023 at 10:48:53PM +0100, Michal Suchánek wrote:
> Hello,
> 
> On Mon, Mar 13, 2023 at 09:32:16PM +0100, Andrea Righi wrote:
> > On Wed, Jan 11, 2023 at 04:11:51PM +0000, Gary Guo wrote:
> > > Currently modversion uses a fixed size array of size (64 - sizeof(long))
> > > to store symbol names, thus placing a hard limit on length of symbols.
> > > Rust symbols (which encodes crate and module names) can be quite a bit
> > > longer. The length limit in kallsyms is increased to 512 for this reason.
> > > 
> > > It's a waste of space to simply expand the fixed array size to 512 in
> > > modversion info entries. I therefore make it variably sized, with offset
> > > to the next entry indicated by the initial "next" field.
> > > 
> > > In addition to supporting longer-than-56/60 byte symbols, this patch also
> > > reduce the size for short symbols by getting rid of excessive 0 paddings.
> > > There are still some zero paddings to ensure "next" and "crc" fields are
> > > properly aligned.
> > > 
> > > This patch does have a tiny drawback that it makes ".mod.c" files generated
> > > a bit less easy to read, as code like
> > > 
> > > 	"\x08\x00\x00\x00\x78\x56\x34\x12"
> > > 	"symbol\0\0"
> > > 
> > > is generated as opposed to
> > > 
> > > 	{ 0x12345678, "symbol" },
> > > 
> > > because the structure is now variable-length. But hopefully nobody reads
> > > the generated file :)
> > > 
> > > Link: b8a94bfb3395 ("kallsyms: increase maximum kernel symbol length to 512")
> > > Link: https://github.com/Rust-for-Linux/linux/pull/379
> > > 
> > > Signed-off-by: Gary Guo <gary@garyguo.net>
> > 
> > Is there any newer version of this patch?
> > 
> > I'm doing some tests with it, but I'm getting boot failures on ppc64
> > with this applied (at boot kernel is spitting out lots of oops'es and
> > unfortunately it's really hard to copy paste or just read them from the
> > console).
> 
> Are you using the ELF ABI v1 or v2?
> 
> v1 may have some additional issues when it comes to these symbol tables.
> 
> Thanks
> 
> Michal

I have CONFIG_PPC64_ELF_ABI_V2=y in my .config, so I guess I'm using v2.

BTW, the issue seems to be in dedotify_versions(), as a silly test I
tried to comment out this function completely to be a no-op and now my
system boots fine (but I guess I'm probably breaking something else).

Thanks,
-Andrea
