Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8516EB64D7
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Jun 2023 18:31:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjFPSbu (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Jun 2023 14:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjFPSbt (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Jun 2023 14:31:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DBD1FD5
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jun 2023 11:31:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C869D61C2E
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jun 2023 18:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0272FC433C0;
        Fri, 16 Jun 2023 18:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686940308;
        bh=npccMbFDUkD3Zx7BJ92pVUQqMFnp0n6o4An5GXsnjoc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kcy6Oy4XTDfp17Wng718wKvbUVNgDXbl6LqF6Rqk1mhjf7GSlITumpp6ul5eUdxAD
         sxPj/ODUBCbaJW+2Je8eHe3EqyRDibEL6p7RuVHv6u1p28egVycOuiR/1/YvV/kHAU
         yaTCmjQOZB1JVl5P4dMSjG2HKfEuYc/461iOkJ88fB8N9WPZW//Cei+tSVeZrAqo3u
         mONzpkQssORiqIdMhfkspV81cYR5nvEgj0xE/5r4bQCLNU4qM2KVo4ye62n9IBHlII
         YsPGZRhYtaw8dhEyHymTAo66oFcGNuyrdYb53Uhwx+y03JW29j8zYyktE845wrZDgs
         O0kZz7U5Afo8Q==
Date:   Fri, 16 Jun 2023 11:31:47 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        FUJITA Tomonori <fujita.tomonori@gmail.com>,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Message-ID: <20230616113147.45fd9773@kernel.org>
In-Reply-To: <67756b12-e533-4f76-bd3c-360536f2636b@lunn.ch>
References: <20230613045326.3938283-1-fujita.tomonori@gmail.com>
        <20230614230128.199724bd@kernel.org>
        <CANiq72nLV-BiXerGhhs+c6yeKk478vO_mKxMa=Za83=HbqQk-w@mail.gmail.com>
        <20230615191931.4e4751ac@kernel.org>
        <67756b12-e533-4f76-bd3c-360536f2636b@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, 16 Jun 2023 15:04:59 +0200 Andrew Lunn wrote:
> > Actually Andrew is interested, and PHY drivers seem relatively simple..
> > /me runs away =20
>=20
> :-)
>=20
> I think because they are so simple, there is not much to gain by
> implementing them in rust.

I see many benefits :) Its a smallish and self-contained piece so it's
achievable. Yet it interacts (to the extent the complexity of the PHY
calls for it) with core netdev structures. Some PHYs even do
timestamping which brings in interactions with skbs etc.

Major benefit number 2 is that Rust is currently missing any real life
bus bindings (AFAIU) and PHYs and the bus they live on are maintained
by the same person =F0=9F=98=81=EF=B8=8F
