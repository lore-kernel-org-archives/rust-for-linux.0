Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32918C433EF
	for <rust-for-linux@archiver.kernel.org>; Tue, 22 Mar 2022 04:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236372AbiCVES2 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 22 Mar 2022 00:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236363AbiCVES2 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 22 Mar 2022 00:18:28 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A94011C0D
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Mar 2022 21:17:01 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id o13so11763891pgc.12
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Mar 2022 21:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1SX7VG7pcFZQTL6ghZ/zYF6sS4uvEZ0uS9Ptdb4LiaQ=;
        b=UYRR7DOJp+47629aFz0Vdy2LnsEHUTiyqbRnOeLHCm/tpXSA3Fl58WaYTxmuPMqD+M
         9/TJ+vj1PSdG9oX0jFzKLOOJ+CPj1Nyx2iZ6KYzYleGNoAOegMo/WhQfwuNDeiwcsZ8g
         2X8Fj+beFHqamZYWsKxa4waCD/QqE3MUFY36k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1SX7VG7pcFZQTL6ghZ/zYF6sS4uvEZ0uS9Ptdb4LiaQ=;
        b=zafEyl4kl4v0+Q8F2WBzZeeDBs95KrxZMIjotx/qA2bpltRZuboZcYdvIdY5GHrDFC
         kdM05Qb0H/FObIMlNS3wYCUmC89KMiiDxEQSD7WIG4uqn+im4lJ1oenxk56EKWK1+IY2
         2iteWpv9tzRkR2VxgNzIeAei4NWMxDf2FfamH9p1iuOKmKgHDynVJtw2MH4TfzvkwF7E
         YxGWfG3+Pyn2n9VMqCteo3uNBJVpfiv4jswmX242hgDXC0nQwIknGa7dqjS9jd3DRuHm
         8eC9n1k6wPZvB2aQ/DUc+3CYxJ+Maf5b4s913rnOY3SGehidkysfCQ+fx5sdZtuiuxdv
         9Ttg==
X-Gm-Message-State: AOAM530LhnFMn8324Mdas8Lx/za8yH+7TdMQCWcXwbQmxz+VpH1EtrC3
        TNu+WE+XHp4EwCprhFjKJi0kQg==
X-Google-Smtp-Source: ABdhPJxs0Y5O8LkJlXrrvhdEL8fgYGIzetMPjEFGIwlWa/F8vit8lWjvms4F/1c+Dv7cFyN0kigQGA==
X-Received: by 2002:a63:5024:0:b0:380:83f7:1603 with SMTP id e36-20020a635024000000b0038083f71603mr20118067pgb.289.1647922621067;
        Mon, 21 Mar 2022 21:17:01 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:51af:6dff:4acd:7fa5])
        by smtp.gmail.com with ESMTPSA id j14-20020a056a00174e00b004f776098715sm22006057pfc.68.2022.03.21.21.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 21:17:00 -0700 (PDT)
Date:   Tue, 22 Mar 2022 13:16:54 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gary Guo <gary@garyguo.net>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v5 12/20] vsprintf: add new `%pA` format specifier
Message-ID: <YjlNtkNP1FJ4XEyX@google.com>
References: <20220317181032.15436-1-ojeda@kernel.org>
 <20220317181032.15436-13-ojeda@kernel.org>
 <YjSSI4cmGblm+6j7@smile.fi.intel.com>
 <YjStnb7nNTC3kYw6@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjStnb7nNTC3kYw6@alley>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On (22/03/18 17:04), Petr Mladek wrote:
> On Fri 2022-03-18 16:07:31, Andy Shevchenko wrote:
> > On Thu, Mar 17, 2022 at 07:10:00PM +0100, Miguel Ojeda wrote:
> > > From: Gary Guo <gary@garyguo.net>
> > > +	case 'A':
> > > +		if (!IS_ENABLED(CONFIG_RUST)) {
> > > +			WARN_ONCE(1, "Please remove %%pA from non-Rust code\n");
> > > +			return error_string(buf, end, "(%pA?)", spec);
> > > +		}
> > 
> > I'm wondering if the Big Scary Banner as trace_printk() does would be better
> > (in case we can tell that %pA is used in the code when RUST=n).
> 
> Good question!
> 
> The advantage of WARN_ONCE() is that it shows the stack so that it is
> easier to locate the caller.
> 
> On the other hand, WARN_ONCE() is a bit misused here. It should be
> used only in situations that might be potentially fatal. It might
> even cause panic() with "panic_on_warn" kernel parameter.

Stack trace is certainly helpful here. So maybe dump_stack() instead
of WARN_ONCE()? I guess I don't mind WARN_ONCE().
