Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8373DC432BE
	for <rust-for-linux@archiver.kernel.org>; Wed,  1 Sep 2021 23:07:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6236E61058
	for <rust-for-linux@archiver.kernel.org>; Wed,  1 Sep 2021 23:07:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242772AbhIAXIR (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 1 Sep 2021 19:08:17 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:37735 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230127AbhIAXIQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 1 Sep 2021 19:08:16 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 938FD2B00BCF
        for <rust-for-linux@vger.kernel.org>; Wed,  1 Sep 2021 19:07:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 01 Sep 2021 19:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=
        date:from:to:subject:message-id:mime-version:content-type; s=
        fm1; bh=QT8l3EgeQ2aGmUNCbuIfImIiehw0K1dexojpNVwzMQ4=; b=tiCBce4L
        HYr4ConIW5pveqGdzhjVv9uDDGt+yr3kUa1sO4SboPBjEc953xyhoGk2UrlPuthW
        LXPME1ar9s+IAuB3MAWa9wjtMGHi189z+7kalRTQLwZEDxcamHpjaGvlxsEwjYuz
        I6LeHv9GfuFmjW6dvsRvVhWyaAkeQRWyBNjOcTH07bWuRqTjtmZh61iqp6yBSs+w
        Q7EzKci3u2KOCx2Iarrj11DEIW9qPOGCmK5nm51vAkVsdV2BdquDlh8oigtgZMLq
        TiEOH81lfQBSjHWIcPGV0jSxWAN4SodIWbKGL6q/aEeGbm33BSaDl1TFAFVwQDu3
        bur872cXby8TuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=QT8l3EgeQ2aGmUNCbuIfImIiehw0K
        1dexojpNVwzMQ4=; b=ZIsX3F0tk8hgPynr23XDF3/Wzf/NL1w07NV1pzhBkCheU
        bp22lN90QDIaYhv7ZnCm88SnAbAHk6kQIKHYpuo2DB/9HJufNjeovbcp61PWwp80
        z4OR2lx7X+ndvAtuSXGG1CLFdSsqlJfqkMwjLCLnT679OdZZHnSbpdaYjR5AT1eG
        Nx3mBzbsC/1fUxmYGhrSn6UhjXuTz2h6dz3tx0IMn8+PmIWeKynJ2vCO2Zn1hS9t
        03AvMJczrlm53jH39x1EsFrAEHUR7aFj0e0uus0o55IX5x4yVtVM0S2yu1Lkufhv
        ue8FBqYTNmvG5ZVMRqL58flJM4SrTcar8/OFYc0ng==
X-ME-Sender: <xms:pQcwYYBMyANOm47lUfELDvdh34G1r-21nMsTSw9pKOE-wS1SCsFVPQ>
    <xme:pQcwYaiu-V77O-bQoMTWeq7r5mwyDJiasRcJgJunSh0jpFiQdveqGto3eg7LKri0I
    Jgiiew2IAj15F2ORA>
X-ME-Received: <xmr:pQcwYbmlem3KrvDlU030cZXW6XKNbOE5hqqPjjAZCmR2Gu2HP8LqRrDSAQqw61cb6KyT_ecu3O3ilJ_7dNK9Cb96l7Bo2FuH6BWJQ7QzIAB3qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvgedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenogfvvgigthfqnh
    hlhidqqdgigeduledqvdekudculdeftddtmdenucfjughrpeffhffvuffkgggtugesthdt
    redttddtvdenucfhrhhomhepffgrnhhivghlucgiuhcuoegugihusegugihuuhhurdighi
    iiqeenucggtffrrghtthgvrhhnpeelgfdtjeelgfevgeeiffelhefgieehvdekudefieeu
    uefgkedvgfejheefheehueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:pQcwYewxjEdMXuvJjajbjW6plnVIwsitW12ura9O5CLIUkokdkFnTA>
    <xmx:pQcwYdQNX1VQUXk3SCyWwQrU44OOQGq_yp2M2nZf6bQrt4YMQnT1IA>
    <xmx:pQcwYZb3O9huXDpB2P2HxrZC1H0UrJfboTqT7WPEbYVo7WlkQ8Ms1Q>
    <xmx:pQcwYYMOtleTInykvGSduhZOP8I0KK-BzJy2vroXgd9Y12cnNdoWdg2mC5Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <rust-for-linux@vger.kernel.org>; Wed, 1 Sep 2021 19:07:16 -0400 (EDT)
Date:   Wed, 1 Sep 2021 16:07:15 -0700
From:   Daniel Xu <dxu@dxuuu.xyz>
To:     rust-for-linux@vger.kernel.org
Subject: How are rustc -Z flags enabled during build?
Message-ID: <20210901230715.civmnrpmt3c2u72v@kashmir.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

Context: While hacking on some rust modules, I ran into a bug where
kbuild was trying to generate BTF (from DWARF) for rust kernel modules.
I'm guessing one cannot generate valid BTF from rust debuginfo b/c at
module load time the btf parser complains and errors out the module
load. I know how to fix this and am planning on sending a fix.

In trying to fix the BTF issue, I'm trying to get more familiar w/
kbuild. Specifically, I've run `make V=1 LLVM=1 -j32` to try and figure
out exactly where the .o's are being created. I see the following
command:

    RUST_MODFILE=samples/rust/rust_minimal rustc
    --emit=dep-info,obj,metadata --edition=2018 -Cpanic=abort
    -Cembed-bitcode=n -Clto=n -Crpath=n -Cforce-unwind-tables=n
    -Ccodegen-units=1 -Zbinary_dep_depinfo=y
    -Zsymbol-mangling-version=v0 -Dunsafe_op_in_unsafe_fn
    -Drust_2018_idioms -Wmissing_docs -Cdebug-assertions=y
    -Coverflow-checks=y -Copt-level=2 -Cdebuginfo=2 --cfg MODULE
    @./include/generated/rustc_cfg
    --target=/home/dxu/dev/linux/arch/x86/rust/target.json
    -Zallow-features=allocator_api,bench_black_box,concat_idents,global_asm,try_reserve
    --extern alloc --extern kernel --crate-type rlib --out-dir /tmp/rust
    -L ./rust/ --crate-name rust_minimal samples/rust/rust_minimal.rs

When I try to run it outside of kbuild, I get:

    error: the option `Z` is only accepted on the nightly compiler

How does kbuild use the -Z features on a stable rustc?


Thanks,
Daniel
