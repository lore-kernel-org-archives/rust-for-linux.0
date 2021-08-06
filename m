Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C8BC4338F
	for <rust-for-linux@archiver.kernel.org>; Fri,  6 Aug 2021 20:11:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B509D61154
	for <rust-for-linux@archiver.kernel.org>; Fri,  6 Aug 2021 20:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244825AbhHFUMB (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 6 Aug 2021 16:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244827AbhHFULl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 6 Aug 2021 16:11:41 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6296AC0617A2
        for <rust-for-linux@vger.kernel.org>; Fri,  6 Aug 2021 13:11:24 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id x15so13642586oic.9
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Aug 2021 13:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=A34SXnb8LLTemu3sVqZh+LNFKrUf/yuVO6Y3pvPEOKc=;
        b=gLYWpEs2YeT9zeZdPR/ZL3mV1nmhnK36JNWuh0yz/RaCFU8NMW2TEqSpleb68XCzyf
         QFbt0A0rgFoNM0MmAD2FAJhQbnQ94Ibi7VdWXbTLZF4Tx7a0YzKZrjruUk970CoiHQL/
         fGeQszHkLCdgLxLWOlNooiBFpkI2SJnqUYMn/ytGbe2rHXAtyE2Spwric0SrDFSpgWOL
         dM9j57dr6pAgIZcPLtHyln2mVcqGSUphYenZkosZVFFKL5MZY8sT+BxJS1cYmJTcu2VH
         F+Ojqu+b0wauHaEDs39cnCzd4etGmKK+jPyvoh/pq3cEw4T9/Fs4rGYgQN+IqVZJ8xMF
         392A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=A34SXnb8LLTemu3sVqZh+LNFKrUf/yuVO6Y3pvPEOKc=;
        b=eT0ufyH6fb17nfFgb42w8m8iJXwlVeVjkD+U/W2gIM1b31YtXRV16Kf1R3oT+UtRZj
         4i4RwVT3XFXtT5VLt+dmjyGju3kC6/l5iEUeNsPmzKpDEYuDbF0a3kp9abHm04QtDhtJ
         Ozu58fhHIOo/rim2vBZ2zOZKnWqCen5aMUPX578Ecb9EfBnRGL5MqXdDCmmx36lv1Wr6
         CepUEtfxErqVCqNxU440/JgCk5ib4GeVh/+yJxsH+uBVNr2cWkHojnK8wMuBFgjuf/4O
         Os4s93ck4dUQSu/zb6c/AorLa08WVARneQKXoeC69gu7BRxkcYxQ0CksUyk+5AwD6f3O
         J4uQ==
X-Gm-Message-State: AOAM5328C+phSBjhAUNXXy6rEhofyvKuR4GbGmSeGPYO2FcJXDPQyKNj
        r3Mw11N2VoHm3M2/cncv7EQuNNKuRGXqQ7o0
X-Google-Smtp-Source: ABdhPJyvj45sUQqYKsWM+L/yUFhFyBnzKwqjaDYEqXuDdh4SxTAWa3jjyXGZBVBCo8Mm0cKR2Zue0w==
X-Received: by 2002:a05:6808:bcd:: with SMTP id o13mr16697890oik.61.1628280683639;
        Fri, 06 Aug 2021 13:11:23 -0700 (PDT)
Received: from winterfell.papolivre.org (winterfell.papolivre.org. [2600:3c00::f03c:91ff:fe69:3960])
        by smtp.gmail.com with ESMTPSA id i10sm1476866ood.48.2021.08.06.13.11.23
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 13:11:23 -0700 (PDT)
Received: from localhost (unknown [IPv6:2804:14d:7283:9596::1001])
        by winterfell.papolivre.org (Postfix) with ESMTPSA id 4D7671C2F41
        for <rust-for-linux@vger.kernel.org>; Fri,  6 Aug 2021 17:11:22 -0300 (-03)
Date:   Fri, 6 Aug 2021 17:11:19 -0300
From:   Antonio Terceiro <antonio.terceiro@linaro.org>
To:     rust-for-linux@vger.kernel.org
Subject: error: unknown argument: '-fno-ipa-sra', err: true
Message-ID: <YQ2XZ9/kPkRTyEgi@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OBzYmqeAFQRCHgBW"
Content-Disposition: inline
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


--OBzYmqeAFQRCHgBW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, I'm trying a few Rust-enabled builds, and I got the following error
when building an arm kernel:

make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
error: unknown argument: '-fno-ipa-sra', err: true
thread 'main' panicked at 'Unable to generate bindings: ()', /root/.cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
make[2]: *** [/builds/linux/rust/Makefile:229: rust/bindings_generated.rs] Error 1
make[2]: *** Deleting file 'rust/bindings_generated.rs'
make[2]: Target '__build' not remade because of errors.
make[1]: *** [/builds/linux/Makefile:1330: prepare0] Error 2
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:222: __sub-make] Error 2
make: Target '__all' not remade because of errors.

There I'm using LLVM/libclang from Debian 11 (so LLVM 11). Is this
supposed to be fixed by a newer LLVM (assuming that flag got implemented
since then), or should I send a patch to rust/Makefile to filter that
specific flag out as well?

--OBzYmqeAFQRCHgBW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEst7mYDbECCn80PEM/A2xu81GC94FAmENl2QACgkQ/A2xu81G
C963CRAAnDABDImA8W5IRuKhACb9+/LoVmoOa0s6+GFF813o6c+YnyXynpXoV+sm
YnKtmoi6S8uYwXo2thqLoC4+rgG2EZ0GKAyRm5ZXp+BO4outdURCOzdDIyUPDRuJ
XgHUeCSkQX4znLOia/AZhhVH2Y6+aAoLGpQkoLzJ8SRxrK8Xzsb9CLcdPZN/zxwQ
tL2s3vgfW5bNr070uuGQsGK6nkTR6ZoE2/ijbHk1O41bilXQpPdj8SW6fwIzKyMJ
qx9NcaInftWme+xfp6odngiB2zcsWfnZ1KRlrr+hGViRW2P+/tjo1/hQ9bXcvq6Q
usGyP55I4WUYnkb0aXB9JkrXdPVzpFQn/iWlL+ENQbrdivYfN83nxS8pb5Ddu698
3mWVxYBnt0QIgpJoFIP26y1LrC0oDvOyveXM0uSWuICaXGtTukVMF8nSPOO9JTng
2aml42RejW8neGVlggK5/UtbMAqRXM3N/2pmFlF2QpowyotvJ5KzDVwjL4SIQc8M
nGp5pfvrgfvHtskmLqwgZBqbU6qLTb3+x3M643WoCY2e1Abf5YkonBjSMHlszGrN
5LteWRJc8J8leGk5Zdco6Hq15YMQQznQRmI41zMAI6R9wOagKaHd0jd9sOFR0bFv
fXJDEuqUCkvLyQ2xcz5PufvimxEba/ZDMKlm8H5n3hG6n5p2TwY=
=oc6E
-----END PGP SIGNATURE-----

--OBzYmqeAFQRCHgBW--
