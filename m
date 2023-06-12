Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6654C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Mon, 12 Jun 2023 15:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237385AbjFLP1M (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 12 Jun 2023 11:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238492AbjFLP1I (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 12 Jun 2023 11:27:08 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A288910E9
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jun 2023 08:27:02 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 740431FB;
        Mon, 12 Jun 2023 08:27:47 -0700 (PDT)
Received: from capper-ampere.manchester.arm.com (capper-ampere.manchester.arm.com [10.32.100.23])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D71F3F5A1;
        Mon, 12 Jun 2023 08:27:00 -0700 (PDT)
From:   Jamie Cunliffe <Jamie.Cunliffe@arm.com>
To:     boqun.feng@gmail.com
Cc:     Jamie.Cunliffe@arm.com, catalin.marinas@arm.com,
        lina@asahilina.net, linux-arm-kernel@lists.infradead.org,
        ojeda@kernel.org, rust-for-linux@vger.kernel.org,
        steve.capper@arm.com, will@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: rust: Enable Rust support for AArch64
Date:   Mon, 12 Jun 2023 16:26:39 +0100
Message-Id: <20230612152639.1446766-1-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <ZINlqb3XHmz+dyLr@boqun-archlinux>
References: <ZINlqb3XHmz+dyLr@boqun-archlinux>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> I don't think you need "-fp-armv8" here, because "aarch64-unknown-none"
> target doesn't have the target-feature "fp-arm64":
> 
> 	rustc +1.68.2 --print cfg --target aarch64-unknown-none | grep target_feature
> 
> 	target_feature="neon"
> 
> , and having the "-fp-armv8" gave me a warning at compile time:
> 
> 	  RUSTC L rust/core.o warning: unknown feature specified for `-Ctarget-feature`: `fp-armv8`
> 	  |
> 	  = note: it is still passed through to the codegen backend
> 	  = help: consider filing a feature request

Rust removed the fp feature for arm64 and tied it with Neon. However
this initially had a bug that meant it couldn't be disabled. This has
now been fixed in https://github.com/rust-lang/rust/pull/107294 so
once we can update rustc we can fix that warning by removing the
`-fp-armv8`. Until we do that we still need the `-fp-armv8` otherwise
we will get some floating point usage. This can be seen by doing an
objdump of core.o if you build after removing the `-fp-armv8`.


You can also see that fp-armv8 is enabled in the aarch64-unknown-none target
here: https://raw.githubusercontent.com/rust-lang/rust/master/compiler/rustc_target/src/spec/aarch64_unknown_none.rs


Thanks,
Jamie.
