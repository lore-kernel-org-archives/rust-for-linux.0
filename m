Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D57C636D3
	for <rust-for-linux@archiver.kernel.org>; Tue, 31 Jan 2023 16:20:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbjAaQUE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 31 Jan 2023 11:20:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233520AbjAaQTu (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 31 Jan 2023 11:19:50 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B357C577ED
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Jan 2023 08:19:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 21785CE1F34
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Jan 2023 16:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B7EC433EF;
        Tue, 31 Jan 2023 16:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675181951;
        bh=5Ro9I1IdyUJ8Up/SzCY9kO7TLB9c+8pxMOs81oWI4TQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pYTzmZ32/IGB5vXXrmCqiDqakKbPs6Zqb8O+srgi0faTbWM1ZO1W0Oi00P6Chtmxl
         Y///LeZMU5ilSui3tsSBYB+zFaGj4ySpCE8/pXC1yNJk92ZhmygMagi9akRuL6SU/h
         Rp0hoD1guzpluqISlbyCJJcyAmG5iBWLYFC0rxum6rs0nSIT+W4kNgbe+2iKdQrQfj
         NmUM+VGnoMTILc/BrHcTEr5x5JxEvvNLO5aaoIyrwW9GQowFJAxX5+XaZkywM6Vscx
         BGvpipZA80Vu5zGGSQyuADtkMNDIGnxEDX3qrPV1hnRS/WYmTYTZbCfMvTyUuwD+bD
         Cy6Z+W2/vp76g==
Date:   Tue, 31 Jan 2023 16:19:06 +0000
From:   Will Deacon <will@kernel.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>, steve.capper@arm.com
Subject: Re: [PATCH 1/3] arm64: rust: Enable Rust support for AArch64
Message-ID: <20230131161905.GC2646@willie-the-truck>
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
 <20230125163739.3798252-2-Jamie.Cunliffe@arm.com>
 <20230126163552.GD29438@willie-the-truck>
 <CANiq72mpzRjT1ZHCHcGrOJ_71eQPR_-WgP=5YfDWDBNR6JNP4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mpzRjT1ZHCHcGrOJ_71eQPR_-WgP=5YfDWDBNR6JNP4w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Jan 26, 2023 at 06:56:01PM +0100, Miguel Ojeda wrote:
> On Thu, Jan 26, 2023 at 5:35 PM Will Deacon <will@kernel.org> wrote:
> >
> > Why do we need to specify this stuff here? LLVM already knows about AArch64
> > and can compute the data-layout string in computeDataLayout(). Can we have
> > the tools figure this out for us instead, please?
> 
> I agree -- the reason we have this for the moment is to provide full
> control of the target spec, in particular for cases where `rustc` may
> not provide enough flags to customize exiting builtin target specs
> and/or may emit warnings for unknown target features etc.
> 
> If it is already enough for arm64 to use e.g. the
> `aarch64-unknown-none` target spec plus flags on top, then we should
> go for that, because that is the end goal: these target spec files are
> unstable in the Rust compiler (and not intended to become stable).

Please confirm that this is the case, but I really think we should be
aiming for that rather than starting off my specifying this stuff manually.

> For context, upstream Rust so far has been willing to merge support
> for flags and target features that we needed, which is great.

One thing I ran into while playing around is that 128-bit types aren't
supported with ffi unless '-A improper-ctypes' is passed. Given that we
use '__uint128_t' to represent the fpsimd state, I think this is probably
something which will crop up as an issue.

Will
