Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD95C07E96
	for <rust-for-linux@archiver.kernel.org>; Thu,  8 Jul 2021 06:25:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D90F661C69
	for <rust-for-linux@archiver.kernel.org>; Thu,  8 Jul 2021 06:25:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhGHG2F (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 8 Jul 2021 02:28:05 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:35007 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229742AbhGHG2E (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 8 Jul 2021 02:28:04 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 16C0C5C010E;
        Thu,  8 Jul 2021 02:25:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 08 Jul 2021 02:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=T5zO8PjLQXZtTZB/KQPPH8T8RQR
        Hreh0sRGol8W7gk0=; b=dfRApkJtM2Rxi1uwF05/Kgv90x54A3oP2w3QKiUYKbU
        /lkXzZap/lAIpsztcTVGPsesJY1wCpGraON+e/K/U0CCcyQYy5CDOuAT7tyEbKIZ
        Jq0StGnAG/YFgDN7hBBWqlQ/aya0tEcj7sqD1zf8x3yQy3wnt3Q1atHyo+8vz8cn
        21lUozz2nFs5c42WEACgNmH+lXT7WLx2zMK7pBf9oQfAPAozmWPOl3vH+Pcrvfit
        FShM7SKNghUM9429B+vSOBIuaFGdU/2EwRpR2pqB6nBhFtbmS/LzID9sX4cB7PlU
        l5GreHJoVfpOPXRPVu6Nwp80Zoer+YYw/isDZA7cNsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=T5zO8P
        jLQXZtTZB/KQPPH8T8RQRHreh0sRGol8W7gk0=; b=f2Zsr8pkmbHByPwTWPmiXR
        XwVPEjE5zBD8npYPBb4kkWTqmWTWMTqD9Gmfi6LmJwz9+CgDudrXeg3dy8RBgQWr
        re2kVKUy0Gb/nFZO53gzrLdRnD/BpVMQrWDFLi1la0kTMRhaOiXc4C3NNmTjEc4r
        RFBAfqgbQeZMYJ3xVB2ACKiHgNoiNSPgnK0hPjjVOT4rIQ2mPysdYkiLcIdW0awd
        kv6BmvFSyYXDMP6Zj0tdMpK7tJjw0Ml4DvVxjt4t/udsmSnFo53NKdcEputPXQps
        w+ALKa7WcYeSkAM+rm+tYi1zbk2ajvQAiScxCavxQ+zp5dTwJN+R4hkd4txURSgg
        ==
X-ME-Sender: <xms:UprmYO3EgpjCHTZpEWHRl2fnKjic6wbsGEF3XhnMjZ1xe5BNny6Nzg>
    <xme:UprmYBHjDMV3WA0oh-W5QSSMMdffxoojyvVGPHqz8dqeRIzSgX8dsJQuNni-pI1dv
    4UEofEplJMcQQ>
X-ME-Received: <xmr:UprmYG5MioOx26I5srJ5-oAMpEAFWLWKQwWzt4tEQXY4wP9OlYZpc6fR6DP8oidF3AMMxzn3Ul-fis_is1qK0RI8bQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdefgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:UprmYP3K2GCrIXb7Hb8bN2bob7tINU9hWYH89_tAfrownhNcSsbvTA>
    <xmx:UprmYBGALcZrD-JP2ez14ii7YJtm-_hfWoOeDkwfjqUF2FQ0GTs0_A>
    <xmx:UprmYI9pAZHIe1AvKfpH7x21hMxwL392crPFUsB8CMgdWQspL6Nq2A>
    <xmx:U5rmYGQeqJxfiTb3ktnEox-FGX5wJhta6wKSBsxAS-Oc3XiqT7xKGw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 02:25:22 -0400 (EDT)
Date:   Thu, 8 Jul 2021 08:25:19 +0200
From:   Greg KH <greg@kroah.com>
To:     Geert Stappers <stappers@stappers.nl>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: real driver
Message-ID: <YOaaT59+zoewYhG3@kroah.com>
References: <20210707191836.nhqciiclpy4ghmj5@gpm.stappers.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707191836.nhqciiclpy4ghmj5@gpm.stappers.nl>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jul 07, 2021 at 09:18:36PM +0200, Geert Stappers wrote:
> In-Reply-To: <YOXB7FRqldZik2Xn@kroah.com>
> Previous-Subject: Re: [PATCH 00/17] Rust support
> 
> On Wed, Jul 07, 2021 at 05:02:04PM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Jul 07, 2021 at 03:07:50PM +0100, Wedson Almeida Filho wrote:
> > > > Last I looked at this thing, it was not
> > > > feature-complete compared to the in-kernel binder code, has that been
> > > > resolved and the needed filesystem changes added?
> > > 
> > > It is not feature-complete in comparison to the C one just yet, it is missing a
> > > few things but not for any fundamental reason -- we were mostly focusing on the
> > > kernel crate and tests.
> > 
> > I love it how you call "binderfs is missing" a "few things" :)
> > 
> > > Miguel's point is that it does implement the vast majority of binder features
> > > and is non-trivial, so it could be used as evidence that useful kernel drivers
> > > can be built with Rust; not just "transpiled" from C, but written with the Rust
> > > safety guarantees.
> > 
> > As Christoph said, and I and others have said before, binder is in no
> > way shape or form anything that resembles any sort of "driver" at all.
> > It is a crazy IPC mechanism that is tacked onto the side of the kernel.
> > Not to say that it doesn't have its usages, but the interactions between
> > binder and the rest of the kernel are very small and specific.
> > Something that almost no one else will ever write again.
> > 
> > Please work on a real driver to help prove, or disprove, that this all
> > is going to be able to work properly.  There are huge unanswered
> > questions that need to be resolved that you will run into when you do
> > such a thing.
> 
> Suggesting virtual null modem drivers.

That is not a "real" driver that has to deal with hardware as well as
the core kernel apis at the same time.

virtual drivers are simpler in that they only have to handle "one half"
of the problem, not the whole thing, which is what a "real" driver has
to do.

thanks,

greg k-h
