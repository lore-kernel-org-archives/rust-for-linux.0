Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFE7C433ED
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 16:06:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22FFD6145B
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 16:06:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240807AbhD2QHM (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Apr 2021 12:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240748AbhD2QHH (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Apr 2021 12:07:07 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F08DC06138C
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 09:06:19 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id j6so11438056ybh.11
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 09:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jwAwMYGB3zKPItofR/BPfB6TIHy0CHGplF3fhwVLmi0=;
        b=dQez9+ElP9cdU5I/TLoFb0I4EFyFwI8RspBHsiGQmxcTm/5eAK94PCPLgVqQ2pt602
         A1TeldRyFif3ZZhmfbmHgJHZKZAVQnnzYS1hfBKbYyoKb1ERSx2rYe1CRqNlkkaEio4r
         Mopi5ewXkvXAZtaeeO+gOuKbE+9Iu8HaRNLf5pItf9hWVn3ZPBYkH2ixqGExxN80sw0l
         NEly4w1i0jaPBL6fs+bF5Jjo5nAU3alLnbPwHlTlhiw3ULUAdyTmaeITmOG6yKF4FZ50
         89zHv4PLipmcnY73ZQBGNuq6kneaJcWnZbpbcncz2vy3Kts6MHjqa1vsAgTZ63AFVFT7
         wBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jwAwMYGB3zKPItofR/BPfB6TIHy0CHGplF3fhwVLmi0=;
        b=UX7e1PpdDaTfnU3mbT8BYjNi9Ca49PSi6xzpCTO93ubC7jD06iuNK83U/Nd5k3QBX5
         vX7eQu+hpE7gOvCm8n34mGZQzDWPcdrovzupxJznnoekFdQLru1f9p7ZkZFTFq7b3hIh
         jIw3U8l7yZKClfJea2vXF5l25PAV0f2d970cAYlC+Sl9drxIukXSShQK6iJCUOSRSVSt
         qZlz/Eri7G/rwlHOxuw81L+DDb3Q0y4Cl1klUz/KifSWxXv6527p51NRRyYDJB3m3VxI
         XLDDQLnSSNfM6iWtT/U95XXsx2jsXUIBPddNOOvmfMixZETDIS4sSKcE1sXkKbxvWUXD
         4w/A==
X-Gm-Message-State: AOAM532aEjUHh8A2iHTettRyHsBnmPAOCnFa7Z586kapEPvKez17eSXv
        q+O0DlzUyoUKqcVF+ld/hlf2/ydd6qBYOFacRqPE+C18oR0=
X-Google-Smtp-Source: ABdhPJyava8DsAODCoE1nI3ns1z92BcKCKKO1cSbB6rXqNpTCuLMCvEcD5kse/Kj7q3HeYyGw7raEBHUrPictA6ATYA=
X-Received: by 2002:a25:880f:: with SMTP id c15mr272867ybl.247.1619712378446;
 Thu, 29 Apr 2021 09:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <YIrDgupEqcmsUfGX@localhost.localdomain> <YIrNuQlVnvpktDcl@kroah.com>
 <YIrXFt2KVovbM+Fs@localhost.localdomain>
In-Reply-To: <YIrXFt2KVovbM+Fs@localhost.localdomain>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 29 Apr 2021 18:06:07 +0200
Message-ID: <CANiq72mGT82-fsiper_5ExgMhywFPCpKVJme-2uGjKEKUxRxww@mail.gmail.com>
Subject: Re: Loading an out-of-tree module
To:     Carlos <carloscarral13@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Sven Van Asbroeck <thesven73@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Carlos,

On Thu, Apr 29, 2021 at 5:56 PM Carlos <carloscarral13@gmail.com> wrote:
>
> Thank you all for your responses,
>
> I get why the OOT flag is there so I won't try to remove it. What
> concerns me, however, is that my printk messages don't work as expected
> (i.e. They are one off). Is this behaviour caused by the same flag?

`\n` is missing in the strings, e.g. `pr_info("hello\n");`

Also, please avoid top-posting.

Cheers,
Miguel
