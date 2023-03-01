Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A7AC6FA9D
	for <rust-for-linux@archiver.kernel.org>; Wed,  1 Mar 2023 17:16:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjCARQj (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 1 Mar 2023 12:16:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjCARQi (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 1 Mar 2023 12:16:38 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B7147401;
        Wed,  1 Mar 2023 09:16:33 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id bw19so13977447wrb.13;
        Wed, 01 Mar 2023 09:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677690992;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NETed6QsszCCfbxUNnOzWzkjjDv/q/IkI5fEDoX4wI=;
        b=j5PAiYPlH764lcPR/m7bd58SFHRINpPSYn+8pyDy66s3KWxkMDtOrMr6HS1ftAgCsB
         KCFgPs0iZGQA0fRKL66/ZxeLPISCuAQgWgbXCseJcE+WFUVNicam9ctuQjs78sgzOI/R
         WULWUUUgLlLsiDwJ9gZQ/7xnXqNzQjS7gbUDFIu9vH0wYBSDutnBH1yxxehHwccGngjp
         dGDPw7SXtPa1TpT0Q0wZwhuH/uYHrpfLE/23eHf3gIK7pM2abGWzWjNuTnE6T9V2rLSY
         5mTlOLEayhKOeQKgzyZt0no97Y5Dk+C0BTGX6hzXfrFvy6YynpKW8UwM7/PZ7y8JWjyB
         0tOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677690992;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4NETed6QsszCCfbxUNnOzWzkjjDv/q/IkI5fEDoX4wI=;
        b=efo8i3YH7HRlm2PU65FUu8lGuZiyspJJQPXcfvdOlq0tj/JFR/xoDs1q0clG8tjwIR
         oj+fJq/9Fw5c1MKVpbtaSnZtwOzoM1N5q1Wrua/J5xJOvNnzFuwByDUOTiw2R0v4iHza
         nlLFHPnM3KuyOSq3YF1UAV1mv9dKGgLyh3eMTqyh4YhLK7dgOaN8K9m8AhV09n4UvF9F
         XJmsKIDvWjN/FgRxr7Hm1nyy9fiRP/PoiX3VfeMxI42FzGEMeHypRPvfe+wZr5FVDWde
         PvWj/2wPdipVUBCVPfeFh0Iy/ZNB8BYU1E+T1yNnKoUJpp8Ov7g6DvrzE8rnSYe3aBx4
         KdMw==
X-Gm-Message-State: AO0yUKXxvtqvZTtfmAgibhR+hXBL+4Wq0eM7JtO2R/A2xJOEsOpHKspr
        vV8tHOxAFG5Sx6vy9QSZ4rQ=
X-Google-Smtp-Source: AK7set8n6Dv3tseaeJcVVe8S4m2p2/U1dnhpG40bkNzStOXjHpD7+sncmZigwAsWCYG7wao5G6x2DQ==
X-Received: by 2002:a05:6000:38d:b0:2c5:5ee9:6b27 with SMTP id u13-20020a056000038d00b002c55ee96b27mr4969422wrf.13.1677690991742;
        Wed, 01 Mar 2023 09:16:31 -0800 (PST)
Received: from localhost ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
        by smtp.gmail.com with ESMTPSA id q10-20020adfea0a000000b002c567b58e9asm13303970wrm.56.2023.03.01.09.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 09:16:30 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 01 Mar 2023 18:16:29 +0100
Message-Id: <CQV7TKRQDUHG.2RWP6Z9ERRF9B@vincent-arch>
Cc:     <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <asahi@lists.linux.dev>
Subject: Re: [PATCH 1/3] rust: macros: Make expect_punct() return the Punct
 directly
From:   "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To:     "Asahi Lina" <lina@asahilina.net>,
        "Miguel Ojeda" <ojeda@kernel.org>,
        "Alex Gaynor" <alex.gaynor@gmail.com>,
        "Wedson Almeida Filho" <wedsonaf@gmail.com>,
        "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
        =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
References: <20230224-rust-macros-v1-0-b39fae46e102@asahilina.net>
 <20230224-rust-macros-v1-1-b39fae46e102@asahilina.net>
In-Reply-To: <20230224-rust-macros-v1-1-b39fae46e102@asahilina.net>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> This makes it mirror the way expect_ident() works, and means we can more
> easily push the result back into the token stream.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
