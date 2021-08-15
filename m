Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44DDC4338F
	for <rust-for-linux@archiver.kernel.org>; Sun, 15 Aug 2021 14:30:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81F2760C3F
	for <rust-for-linux@archiver.kernel.org>; Sun, 15 Aug 2021 14:30:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbhHOOb1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 15 Aug 2021 10:31:27 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:50727 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234448AbhHOOb0 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 15 Aug 2021 10:31:26 -0400
Received: by mail-wm1-f48.google.com with SMTP id u1so10017015wmm.0
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Aug 2021 07:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lPM1ojm9ppqlPGxxwFRzzoNIR+8p61HOKKm+Y35A20A=;
        b=PLxNqSbZgfbEYyqQXavFTmnDAv/G6s9pwlpjk9HeH8VruotGEsdfBQTSW/5trb5ZEx
         IiBJvubGjgjkH3Pmd/4bdfNVcp3dPfdPoGnPYrntYca8bT6DFmwIf4Tjbr2mUhW4Afm0
         4U3YNMinxrI6qfE5S3xBWk1aiNhMFxKVrPuGHgWGBTnPAa8BoXnwsNDMIFwjQxAhIEXs
         /7ziBmJgSnHW4aCF75Xz23cg75UJtH/ujTGGpv2UqaGxxuHZdCrH6BOh/XMU2/Mexw2s
         LAb2ZyWWrwgP6mT4umZV/mMRqLvv04tHrIHhiwKW2nBz/X2upUcpDsTcG1VG/Im8m0zL
         U0CA==
X-Gm-Message-State: AOAM530QAm6oar7DzGrUZtCBecXIEx5uEylAAIL1E7Pgzt+5NGA3IqkY
        n2Q6P8WRfhO9ekDk92J5ThE=
X-Google-Smtp-Source: ABdhPJxpICX4fltFb8CXCYK6+b7c75ccf1Znb+Y1lag0nzk0iEEkg0rPTiRiodJCx1nlZ/vO3YqbIw==
X-Received: by 2002:a05:600c:1ca7:: with SMTP id k39mr11311754wms.162.1629037855978;
        Sun, 15 Aug 2021 07:30:55 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id d4sm8699388wrc.34.2021.08.15.07.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:30:55 -0700 (PDT)
Date:   Sun, 15 Aug 2021 14:30:53 +0000
From:   Wei Liu <wei.liu@kernel.org>
To:     Gioh Kim <gurugio@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, Wei Liu <wei.liu@kernel.org>
Subject: Re: How to setup Rust code tagging in Linux kernel
Message-ID: <20210815143053.xumpoo22gb4cueho@liuwe-devbox-debian-v2>
References: <CANc8B5N6gYW3+zdG2qo9+ma4s5=xTxUVRk8s=A7-17KhnY+hzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANc8B5N6gYW3+zdG2qo9+ma4s5=xTxUVRk8s=A7-17KhnY+hzw@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Aug 15, 2021 at 11:01:39AM +0200, Gioh Kim wrote:
> Hi,
> 
> I've just built and booted the kernel of the Github "Rust for Linux" project.
> I've used emacs and gtags or Visual Studio Code to read kernel code.
> But they didn't work to read the Rust code in the kernel.
> I failed to find the solution with google and git log rust/.
> 
> Is there anything to make tagging for rust code in the kernel?
> Maybe it would be better to make tagging for both C and Rust code.

Check this out:

https://github.com/Rust-for-Linux/linux/blob/rust/Documentation/rust/quick-start.rst#rust-analyzer

Wei.

> 
> -- 
> 
> Best regards,
> Gioh Kim
