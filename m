Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B074C6FD1C
	for <rust-for-linux@archiver.kernel.org>; Sat, 11 Mar 2023 14:01:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjCKOBK (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 11 Mar 2023 09:01:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjCKOBI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 11 Mar 2023 09:01:08 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE14BCBBB
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Mar 2023 06:01:05 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1D63B3F11D
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Mar 2023 14:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1678543263;
        bh=0Du4MUdpFWmUO+Ch2VT29REc6UPxR2BI4xE9PibtUU8=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=CzvQeOrhqZ9vEFJGQnHxlFSepFLG6R4lxzp5yQFqT983Ot5JfbGpJyf8H0mrD4Ydx
         9WNe7uvq1IVRAcPyFSVSg1IWRhQhIew4MttEG8qD/K5kQBy9lyg8syu3o3WVgEqOlz
         wPh2s7IB+ZyWScXXuQBs3/ati8MTXmnjzW3fnZYTDHY1usn2mRVrXSci/MzlaQyW8X
         RcBN7UOAAnnxLEK18iJptGQvuQ/qcod5MxgsuKDSemUEc9IHmuYXrH6LblDmwV9xLz
         a+8wbleMf9ipXfNhjlxL1y4dSWcxcFMuA+8JztzwqCxwyh56urkQSSL1Nah0N9Q7ul
         YU8knjvp9NXCA==
Received: by mail-ed1-f71.google.com with SMTP id en6-20020a056402528600b004fa01232e6aso2806247edb.16
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Mar 2023 06:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678543262;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Du4MUdpFWmUO+Ch2VT29REc6UPxR2BI4xE9PibtUU8=;
        b=xqJkGfblguJ55CWgrSP7hhXjRXN99yqjGxO2UmviJM1k32TCNvEU8NRa9VqWNEaw2n
         yQyhWnl8bb455Cws5El6EA72VAcoX9Ul7iT0tXpF4onlbZ4IsI1//yBM5ovCrTon8fBC
         uO/7OiXq29/HpqQmK3Mr+rQhAf3kxKKrGFsnSEK9g0Y+o2Rug+3qo2tBQSyQ8uqvxAjq
         2/piDGbi+mRo5r7+I6bye7qThLk+wxEuhe1/EdE+8kRdX9O4OzInYICZaoRl+As51Gmo
         qK7kw6W02AefboWaXDBIYpX4fRqLe++E311m7HmSmveVjuybFpd1k17AucykFWR4AVBT
         PB8g==
X-Gm-Message-State: AO0yUKVfjvYphVLfO+MIKIX5NzznBr1QKg5mZ0vJzuaDv/AI/OD11nVO
        BcjPJvvJGjU1bmG+ANCRa4MT1VxiEqQo0qqGqn4aTyRL+Ngjy8TkSB56jR218eMwPbkB//daMOl
        6RgaoX2KkGox/+OwYLkgSAnLYD+Ecc0tIOa/sClXHv0zUyLj8DESJ
X-Received: by 2002:a17:906:ceca:b0:8c0:386e:6693 with SMTP id si10-20020a170906ceca00b008c0386e6693mr26802374ejb.63.1678543262182;
        Sat, 11 Mar 2023 06:01:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8taICLYeSKFlGpkBSUw2MKUcxvdC+phQPQS2RQTWBB6k3LON/5vCFLXWv7vdHQddy+FwCMOA==
X-Received: by 2002:a17:906:ceca:b0:8c0:386e:6693 with SMTP id si10-20020a170906ceca00b008c0386e6693mr26802348ejb.63.1678543261878;
        Sat, 11 Mar 2023 06:01:01 -0800 (PST)
Received: from localhost (host-79-53-23-214.retail.telecomitalia.it. [79.53.23.214])
        by smtp.gmail.com with ESMTPSA id ox12-20020a170907100c00b00922e3221c88sm320243ejb.117.2023.03.11.06.01.01
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 06:01:01 -0800 (PST)
Date:   Sat, 11 Mar 2023 15:01:00 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     rust-for-linux@vger.kernel.org
Subject: distribute linux-headers to build out-of-tree Rust modules
Message-ID: <ZAyJnCKa65WKozEJ@righiandr-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hello,

I'm trying to distribute a linux-headers package (deb) that would allow
to build out-of-tree Rust modules.

Everything looks fine, except for the following error:

error[E0461]: couldn't find crate `core` with expected target triple target-10951614936105594995
  |
  = note: the following crate versions were found:
          crate `core`, target triple target-3759196539525232825: /usr/src/linux-headers-6.2.0-16-generic/rust/libcore.rmeta

All I need to do is to "refresh" the headers by running a
"make modules_prepare" after installing my linux-headers package on my
system and then everything works perfectly.

Is this because my system, where I try to build the out-of-tree module,
has different toolchain versions (e.g., binutils) than the build host?

Any pointer/documentation to better understand how the target triple
version is determined?

Thanks,
-Andrea
