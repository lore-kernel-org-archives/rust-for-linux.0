Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13FAC433B4
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 08:33:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD5056117A
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 08:33:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240382AbhDPIdk (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Apr 2021 04:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239986AbhDPIdj (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Apr 2021 04:33:39 -0400
X-Greylist: delayed 307 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 16 Apr 2021 01:33:15 PDT
Received: from gimli.kloenk.dev (gimli.kloenk.dev [IPv6:2a0f:4ac0:0:1::cb2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B50DC061574
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 01:33:15 -0700 (PDT)
From:   Finn Behrens <me@kloenk.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kloenk.de; s=mail;
        t=1618561683; bh=YSO81F471/A6yr7yb64E+//PU+6h8+m2wua2aHHooMc=;
        h=From:Subject:Date:Cc:To;
        b=FqyW9ZPEv4dVSI4TovCH/lXJ1ljO7EgKnRrKoBOKE/0cQuYALo8z4YGtfYxhAnw5x
         SqAiF7CW8y7Sut0q4ehhEp9op0PCs2sb1uUrlD2pvbKbITXSaL+9IGaBZ5OBx1nD2J
         OZHTfh8rwNrZO2XQ//d0/qfUZajfP4hHKHgKgSY8=
Content-Type: multipart/signed;
        boundary="Apple-Mail=_E85CDACB-A7B5-4CC7-9E53-8B7F5E8C2B35";
        protocol="application/pgp-signature";
        micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Rust-for-Linux Hydra CI
Message-Id: <04861911-1275-449E-BE54-C6871B53F4A3@kloenk.de>
Date:   Fri, 16 Apr 2021 10:27:56 +0200
Cc:     linux@petabyte.dev, Joerg Thalheim <joerg@thalheim.io>
To:     rust-for-linux@vger.kernel.org
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


--Apple-Mail=_E85CDACB-A7B5-4CC7-9E53-8B7F5E8C2B35
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Howdy,

The nix-community gave me access to the nix-community hydra. Hydra is =
the CI tool written for nix builds, and so builds the rust-for-linux =
tree with nix. The hydra is checking the GitHub rust-for-linux/linux =
repo for new commits, and then builds these in a nix context (If we want =
to move to git.kernel.org, hydra can also check there for new commits).

The latest builds can be seen here: =
https://hydra.nix-community.org/jobset/rust-for-linux/rust and is also =
uploaded to the nix cache at https://app.cachix.org/cache/nix-community =
(local nix versions can use those caches to substitute builds, e.g. =
rustc-nightly)

We could also add vm tests via nixos, and documentation is not generated =
currently, but if we write nix derivations for that, hydra could also =
deliver those for download.



CU,
Finn

PS: I=E2=80=99m not sure If this will break if we rebase to a newer =
linux version, as nix needs a version to find some files.

--Apple-Mail=_E85CDACB-A7B5-4CC7-9E53-8B7F5E8C2B35
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQS0St/f+Gmmaj/f3YuGCae1GeXjQgUCYHlKjQAKCRCGCae1GeXj
Qv3/APkBq5rRalbo++vYvgbK6OmUx0HsJb0FHAq2dWP43KLAuQEA7Kr2wRLEQuM5
+xKfZwKxyPJQWw8s3l762JPEBT9DlgM=
=umGi
-----END PGP SIGNATURE-----

--Apple-Mail=_E85CDACB-A7B5-4CC7-9E53-8B7F5E8C2B35--
