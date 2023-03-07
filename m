Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE194C678D4
	for <rust-for-linux@archiver.kernel.org>; Tue,  7 Mar 2023 09:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbjCGJci (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 7 Mar 2023 04:32:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjCGJci (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 7 Mar 2023 04:32:38 -0500
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0432E2BEEB
        for <rust-for-linux@vger.kernel.org>; Tue,  7 Mar 2023 01:32:26 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: lina@asahilina.net)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 6C5D8419B4;
        Tue,  7 Mar 2023 09:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
        s=default; t=1678181544;
        bh=E+JBWGs90CdsgRhJ7Zj1p+d0LYrXwYt0/AWj3SgArpw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=s4P4pvjfv5JEOIgSvJj5mE8Xe3JVdCY0Artpw2XU+79GEnyk18IZfL53ZY68K0Z61
         Zx4I2KDkH35kQCKvhzj7eVyFlc/lFgWUH/R3rGgSIuED59J8/tTd8mvXAHM7rg4WTa
         dV+QU49mNizRUm88fMmWiShSR+Dml7fyx95Cf6lmzVVu5O5Ihvzt+bZ7dNIkw0L7x/
         rZDFO9tzNVvFxWzwOzQ7K01qHiu87OT9D45rj6gXgSR9w7DWL+yNZr3c2Ew82suH09
         O5X6Mk2epO867E+Cj5qBsV6EyYlzcoOS2UPvoJubV2HPtQQ3ADcjHO30aVPIyZjKHS
         4wBWOID8uCisA==
Message-ID: <e76cb3e8-3d29-1caa-588c-29686c536d37@asahilina.net>
Date:   Tue, 7 Mar 2023 18:32:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/3] Rust enablement for AArch64
Content-Language: en-US
To:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
From:   Asahi Lina <lina@asahilina.net>
In-Reply-To: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 26/01/2023 01.37, Jamie Cunliffe wrote:
> The first patch is from Miguel's tree to enable Rust support for
> AArch64. This has been tested with the Rust samples, and the generated
> code has also been manually inspected.
> 
> The second patch enables the PAC ret and BTI options in the Rust build
> flags to match the options that are used when building C.
> 
> The third patch disables the neon and fp target features to avoid fp &
> simd registers. The use of fp-armv8 will cause a warning from rustc
> about an unknown feature that is specified. The target feature is
> still passed through to LLVM, this behaviour is documented as part of
> the warning. This will be fixed in a future version of the rustc
> toolchain. This pull request should address it,
> https://github.com/rust-lang/rust/pull/107294
> 
> 
> Jamie Cunliffe (2):
>   arm64: rust: Enable PAC support for Rust.
>   arm64: rust: Disable neon and fp target features.
> 
> Miguel Ojeda (1):
>   arm64: rust: Enable Rust support for AArch64
> 
>  Documentation/rust/arch-support.rst |  1 +
>  arch/arm64/Kconfig                  |  1 +
>  arch/arm64/Makefile                 |  4 ++++
>  scripts/generate_rust_target.rs     | 13 ++++++++++++-
>  4 files changed, 18 insertions(+), 1 deletion(-)
> 

Just as a note, we ran into an issue with this patchset. There is a
missing `BINDGEN_TARGET_arm64` in rust/Makefile (around line 255).
Without that, bindgen fails.

 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86     := x86_64-linux-gnu
+BINDGEN_TARGET_arm64   := aarch64-linux-gnu
 BINDGEN_TARGET         := $(BINDGEN_TARGET_$(SRCARCH))

(No need to credit us for that ^^)

Thanks!
~~ Lina
