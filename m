Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7054C433F5
	for <rust-for-linux@archiver.kernel.org>; Sat, 23 Oct 2021 10:07:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A44A560F02
	for <rust-for-linux@archiver.kernel.org>; Sat, 23 Oct 2021 10:07:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhJWKJd (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 23 Oct 2021 06:09:33 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:46847 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhJWKJd (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 23 Oct 2021 06:09:33 -0400
Received: by mail-wr1-f42.google.com with SMTP id k7so188892wrd.13
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Oct 2021 03:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent:organization;
        bh=BtvKTNRM1ufVMrUKQuKY7C9ijfBOccvsGcReMZF+Wqc=;
        b=o6tuNJCFJmihkK0fiWPP/HwOiwuoA1BjlBPFGeJT9vryGI+Q7U++0DZQuFF2B63lSi
         nGQ6Eol1eTodcv55mLM5JEzPshRx3n5zsQlyE5Qj51taWPufgrpKl5fpRXLdYCQ3Oy53
         zk4A7LzXHb77oel2KLOVkpBTxqwOHyzkm3rqe2LLBPm1iZhp96TbS09myOC+wwUiK9Z+
         Z/nAZHt+l+cGBgHzz1VF0wjeo0qQLpozP0284MoURDv+WeCBrCExRKfjWWqH1Tm6YYqB
         384iLDDew+7fUNIpxPsdiXZUlGIkY9s+L9i7ntfgzysbM5aiCAsB0XjaI4tChzSFHlQa
         5lWw==
X-Gm-Message-State: AOAM530LOOFnId/56CsrCrJUpLSPJgfTpE0MmoUir3WNPCl5T7c9RKhh
        mmjOc6nI4rumNvGxWZ7nJE+1Bg==
X-Google-Smtp-Source: ABdhPJyGqNsk7PRdRlSckaaEopi/r4nsBQ2jKv3kUR9YOCrA0oZTHpRug6WXqqg3P9LervEAg7y6hQ==
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr6909523wrs.190.1634983633322;
        Sat, 23 Oct 2021 03:07:13 -0700 (PDT)
Received: from fedora.tometzki.de (p200300e68f0105009e5bc999bd8eb7e0.dip0.t-ipconnect.de. [2003:e6:8f01:500:9e5b:c999:bd8e:b7e0])
        by smtp.gmail.com with ESMTPSA id q1sm3158695wmj.20.2021.10.23.03.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 03:07:12 -0700 (PDT)
Date:   Sat, 23 Oct 2021 12:07:10 +0200
From:   Damian Tometzki <dtometzki@fedoraproject.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     gregkh@linuxfoundation.org, tglx@linutronix.de, clm@fb.com,
        corbet@lwn.net, peterz@infradead.org, mingo@redhat.com,
        will@kernel.org, longman@redhat.com,
        miguel.ojeda.sandonis@gmail.com, wedsonaf@google.com,
        boqun.feng@gmail.com, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@fb.com
Subject: Re: "Using Rust for kernel development": Memory model
Message-ID: <YXPezv907nRp62OD@fedora.tometzki.de>
Reply-To: Damian Tometzki <linux@tometzki.de>
Mail-Followup-To: "Paul E. McKenney" <paulmck@kernel.org>,
        gregkh@linuxfoundation.org, tglx@linutronix.de, clm@fb.com,
        corbet@lwn.net, peterz@infradead.org, mingo@redhat.com,
        will@kernel.org, longman@redhat.com,
        miguel.ojeda.sandonis@gmail.com, wedsonaf@google.com,
        boqun.feng@gmail.com, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@fb.com
References: <20211022210315.GA2582977@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022210315.GA2582977@paulmck-ThinkPad-P17-Gen-1>
User-Agent: Mutt
Organization: Linux hacker
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hello Paul,

many thanks for the great article and your time. 

Damian

On Fri, 22. Oct 14:03, Paul E. McKenney wrote:
> Hello!
> 
> This email is in response to the Rust memory-model discussion at
> Maintainers Summit (https://lwn.net/Articles/870555/).
> 
> My blog series entitled "So You Want to Rust the Linux Kernel?" [1] is now
> feature complete, and a big "thank you" for all the great feedback that
> this series received.  I have recommendations at "TL;DR: Memory-Model
> Recommendations for Rusting the Linux Kernel" [2], and this email is
> therefore TL;DR(TL;DR).
> 
> Given the Rust-for-Linux's focus on device drivers, the Linux-kernel
> features requiring special Linux-kernel-memory-model features can be
> avoided within Rust code.  For example, code using RCU, sequence locking,
> or control dependencies can remain written in C, and higher-level APIs
> based on that code can be exported to Rust in manner consistent with
> Rust's current ownership models.
> 
> This approach reasonably straightforwardly accommodates the more likely
> short-term choices for the Rust memory model, which would presumably be
> the C/C++ memory model or some stronger subset thereof, for example, one
> that excludes consume and relaxed accesses.  If the Rust community chooses
> a less mainstream memory model, the code that makes C-code functionality
> available to Rust code would need to take up any slack.  For example,
> memory barriers might need to be inserted into this wrapper code.
> 
> Longer term, I hope that the core Rust community will become interested
> in supporting modern techniques, and to that end I have suggested some
> longer-term goals in the TL;DR post.
> 
> There is already plenty of interest in modern techniques within the
> greater Rust community, and number of people produced prototype wrappers
> for various sequence-locking and RCU use cases.  I am grateful to all
> who took on this challenge.
> 
> However, arriving at good wrappers requires a sufficient understanding
> of Rust to be combined with sufficient knowledge of the Linux kernel's
> wide variety of sequence-locking and RCU use cases, and unfortunately
> this combining seems to be some ways off [3].  It therefore makes sense to
> defer the need for such wrappers in order to allow time for this diffusion
> of knowledge to take place.  So, in the near term, if a Rust-code project
> were to request direct access to RCU APIs, I would instead ask them to
> create higher-level APIs so that the RCU APIs would remain within C code.
> I am also working to better document the wide range of RCU use cases
> that are present in the Linux kernel, which I hope will speed up the
> process of working out what a Rust-language RCU API should look like.
> 
> Of course, the corresponding choices for sequence locking are in the
> capable hands of the relevant maintainers, who are CCed.
> 
> Thoughts?
> 
> 						Thanx, Paul
> 
> [1] https://paulmck.livejournal.com/62436.html
> 
> [2] https://paulmck.livejournal.com/65341.html
> 
> [3] This process took four years in the C/C++ standards committees,
>     but perhaps things will go faster with the Rust community.
