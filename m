Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE74C636D4
	for <rust-for-linux@archiver.kernel.org>; Mon, 13 Feb 2023 15:48:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjBMPsS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 13 Feb 2023 10:48:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjBMPsL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 13 Feb 2023 10:48:11 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5FB1A96F
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 07:48:09 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 87BC43F329
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 15:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1676303287;
        bh=LS3uJV4RoNcYDITLeaGCVTEoPkqiwpzZCjKSsb4C24g=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=mTYibtx1827SSbvZTc+oGSNxmcC3oUFx4JX0C+kp45JpC7FYH6N3sJyPVZm4cQz25
         VFqgOe+/ZglxNNIKlRzcJpnVceMfsqdmN/bD+Bd5VL38z/XdhLJlGQbgsE2tJAEz2w
         zMUewnuP0qB+FodqG0qVeEQboYeSPD2r7hrG0BSpnEMZxGMMGy/5gfR2xlCAA1hEJq
         N85LT+nE2pEMh8PeyPiRr3Oarr0KsJbHVI508SEaiA5PtW7n1qiB/FGPP5LKP1hmPv
         wIqADnqAwvkj6LR97zgkUfDTfsuVLhe9QDz6pdUuc2qwTpR+TiQ/K35SO8AiEb/ME2
         F52g+d+HqWxhw==
Received: by mail-ej1-f72.google.com with SMTP id qn8-20020a170907210800b0088eda544bd6so7933315ejb.11
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 07:48:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LS3uJV4RoNcYDITLeaGCVTEoPkqiwpzZCjKSsb4C24g=;
        b=fRTP4Lt25yfVX2Sg9tG6kG04DEAJ7gsRoTGPl1C+Y2hg2EooIHJPwUqPin2fyGqD7u
         fND0p817ra1WkHwrRUZEg5Src6ttLTPaUmKNvyM5nuFsITYZ9YPoJQdfuufqjjehVM71
         AEVXLjZ/W2Xq89A0cJwmL4bE6eTD1rot38BJi/VQIx0+W8bHLmiPbIDZ9HcIale1f9iI
         gouOxaf6vMXbY3mGwZkPrW6P2A971PY9mQg51TpgenOEOiyDfXOO/9oNgtB/wCzS1N/z
         QNm1tfV6KZqwcsGZCzmgPAy06kuZVHa41M7p++OsQ0gbhlTQ6+0fnK9g8VCqOrGVisAt
         SuTQ==
X-Gm-Message-State: AO0yUKXTWXqD/4lGyRQNyRbrJ3SK/D851gevTkjgvPaK15dGRXIRUqY8
        Iyef8wufOGwXdmjVH0t7DwC04Z0jH7XtmBn9FfH5xhUautAZwffnpdy0q617OXvdIyUS9C3kryA
        gFiy/P8nTDjIS73eDRR12cxkjhOjSrv2wrWo70M3yNrTa
X-Received: by 2002:a17:907:6d1b:b0:8b1:fc:d737 with SMTP id sa27-20020a1709076d1b00b008b100fcd737mr8167208ejc.19.1676303286402;
        Mon, 13 Feb 2023 07:48:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/8BhyNgYyInCWuLKLaLzmUGYSgc92oXYQypaK3rCWpKmw3G4blSiKEz6pJhZv18iTKl9fY/Q==
X-Received: by 2002:a17:907:6d1b:b0:8b1:fc:d737 with SMTP id sa27-20020a1709076d1b00b008b100fcd737mr8167180ejc.19.1676303286144;
        Mon, 13 Feb 2023 07:48:06 -0800 (PST)
Received: from localhost (host-87-7-128-191.retail.telecomitalia.it. [87.7.128.191])
        by smtp.gmail.com with ESMTPSA id kq15-20020a170906abcf00b0086ffe8a00fdsm6928135ejb.84.2023.02.13.07.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 07:48:05 -0800 (PST)
Date:   Mon, 13 Feb 2023 16:48:05 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc:     miguel.ojeda.sandonis@gmail.com, alex.gaynor@gmail.com,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dxu@dxuuu.xyz,
        ecurtin@redhat.com, gary@garyguo.net, linux-kernel@vger.kernel.org,
        ojeda@kernel.org, rust-for-linux@vger.kernel.org,
        wedsonaf@gmail.com
Subject: Re: [PATCH] rust: fix regexp in scripts/is_rust_module.sh
Message-ID: <Y+pbtZUaRM+gkOUC@righiandr-XPS-13-7390>
References: <'CANiq72=FZtNmYvbb-YPHmQ=bm8rH8VO3M9nemT4i03g9A2PD2Q@mail.gmail.com'>
 <20230213151339.661225-1-yakoyoku@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213151339.661225-1-yakoyoku@gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Feb 13, 2023 at 12:13:39PM -0300, Martin Rodriguez Reboredo wrote:
> On Mon, Feb 13, 2023 at 1:19 PM Miguel Ojeda <ojeda@kernel.org> wrote:
> > On Fri, Feb 10, 2023 at 4:26 PM Andrea Righi <andrea.righi@canonical.com> wrote:
> > >
> > > nm can use "R" or "r" to show read-only data sections, but
> > > scripts/is_rust_module.sh can only recognize "r", so with some versions
> > > of binutils it can fail to detect if a module is a Rust module or not.
> >
> > Do you know which versions? If so, it would be nice to document it here.
> >
> > > Moreover, with this patch applied I can also relax the constraint of
> > > "RUST depends on !DEBUG_INFO_BTF" and build a kernel with Rust and BTF
> > > enabled at the same time (of course BTF generation is still skipped for
> > > Rust modules).
> >
> > Even if that build succeeds, can you load the modules? i.e. the
> > constraint was there due to
> > https://github.com/Rust-for-Linux/linux/issues/735.
> 
> Issue was that the kernel couldn't even load C modules, Rust CUs must be
> skipped in vmlinux for it to work, and because of that the constraint
> !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE [1] cannot be relaxed until
> version 1.24+ of Pahole is the minimum requirement by the kernel. I'm OK
> with this change but keep in mind that it won't remedy that condition.
> 
> Link: https://lore.kernel.org/bpf/20230111152050.559334-1-yakoyoku@gmail.com/ [1]

Oh yes, I'm using pahole 1.24, that's probably why it's all working for
me. So we can't just drop !DEBUG_INFO_BTF, but we can definitely relax
the constraint to "!DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE".

-Andrea
