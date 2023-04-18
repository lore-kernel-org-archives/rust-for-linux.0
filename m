Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760A7C77B75
	for <rust-for-linux@archiver.kernel.org>; Tue, 18 Apr 2023 15:07:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbjDRPG6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 18 Apr 2023 11:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbjDRPG5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 18 Apr 2023 11:06:57 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6EE68118E1
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Apr 2023 08:06:52 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E263D168F;
        Tue, 18 Apr 2023 08:07:35 -0700 (PDT)
Received: from capper-ampere.manchester.arm.com (capper-ampere.manchester.arm.com [10.32.100.23])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 015C53F5A1;
        Tue, 18 Apr 2023 08:06:50 -0700 (PDT)
From:   Jamie Cunliffe <Jamie.Cunliffe@arm.com>
To:     miguel.ojeda.sandonis@gmail.com
Cc:     Jamie.Cunliffe@arm.com, catalin.marinas@arm.com,
        linux-arm-kernel@lists.infradead.org, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, steve.capper@arm.com,
        will@kernel.org
Subject: Re: [PATCH 1/3] arm64: rust: Enable Rust support for AArch64
Date:   Tue, 18 Apr 2023 16:06:16 +0100
Message-Id: <20230418150616.2247298-1-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CANiq72=cJPCLmbyAJhY3FEwMS4tonPtJspMG7Kb_EAEZ2CFwhg@mail.gmail.com>
References: <CANiq72=cJPCLmbyAJhY3FEwMS4tonPtJspMG7Kb_EAEZ2CFwhg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Jan 31, 2023 at 5:19 PM Will Deacon <will@kernel.org> wrote:
> On Thu, Jan 26, 2023 at 06:56:01PM +0100, Miguel Ojeda wrote:
> > On Thu, Jan 26, 2023 at 5:35 PM Will Deacon <will at kernel.org> wrote:
> > >
> > > Why do we need to specify this stuff here? LLVM already knows about AArch64
> > > and can compute the data-layout string in computeDataLayout(). Can we have
> > > the tools figure this out for us instead, please?
> > 
> > I agree -- the reason we have this for the moment is to provide full
> > control of the target spec, in particular for cases where `rustc` may
> > not provide enough flags to customize exiting builtin target specs
> > and/or may emit warnings for unknown target features etc.
> > 
> > If it is already enough for arm64 to use e.g. the
> > `aarch64-unknown-none` target spec plus flags on top, then we should
> > go for that, because that is the end goal: these target spec files are
> > unstable in the Rust compiler (and not intended to become stable).
> 
> Please confirm that this is the case, but I really think we should be
> aiming for that rather than starting off my specifying this stuff manually.

The json that we generate looks to be almost equivalent (that's why patch 3
exists, to answer your question on that patch). The only difference is the
`aarch64-unknown-none` rustc target sets the LLVM target to also be
`aarch64-unknown-none`, whereas the current target.json uses the
`aarch64-linux-gnu` LLVM target as does Makefile.clang for C code. As you have
been talking about the unknown-none target throughout this thread, I just wanted
to double check that's your intention?

Happy to switch over to using the rustc definition though. I just did it this
way to keep it consistent with the other architectures and not add any more
complexity into the build. On a quick test it does seem to be OK, but I'll
prepare a patch and do some proper testing that it's actually fine to use the
rustc definition though.
