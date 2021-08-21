Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92D2C4338F
	for <rust-for-linux@archiver.kernel.org>; Sat, 21 Aug 2021 15:34:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B844561181
	for <rust-for-linux@archiver.kernel.org>; Sat, 21 Aug 2021 15:34:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbhHUPfc (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 21 Aug 2021 11:35:32 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:33662 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbhHUPfb (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 21 Aug 2021 11:35:31 -0400
Received: by mail-wr1-f53.google.com with SMTP id r7so18791225wrs.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Aug 2021 08:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VhrMBXMlywISDzSEtZOoXufUaYnDQFtZK2/EiJqh90Q=;
        b=KEh2w+Tu7S1m/agK4nJLPyEK+dKnzrzm3ugGmeJW7ljxfvfCUDkLz+GCkHT+/LpMh8
         f/T+qVjX07qVY2CazwDcxBLiMpq18ctx/afatW64YC1jpZE1gC2ej660PCYc0BqPpboj
         dnwipYJEoFTRLY5HiwGIiu7Klb53WAcvkZsR1rIa9dTgEAzvIH7mSIda7Olo4B920SXw
         mdWLS0HboPXmrIg+NFQ09TYtmmisOxdmc0MkO2OH7y6MyhOCdiRNeho0UdEd/Jfmkb//
         sqadp43bZi7ZS38KvQ186CNoozjzj4ZkMJXPbPUbdy3nWanlLK87X6narU8QONtbNbsZ
         vcFg==
X-Gm-Message-State: AOAM530JILqORG+xQ6nEF1yjlQMhfsFKVxniRmvEXTR/q2uTbq7HCvrx
        zs2wMqst+fTZU9Rs5laB+80=
X-Google-Smtp-Source: ABdhPJxJSOCjc4mJOzMuVoE4koLcVbJxjux7Mi64sS6OMNvHOHrIkVFRE4avT7aOLYjVQbXgxtkj1Q==
X-Received: by 2002:a5d:64cb:: with SMTP id f11mr4356370wri.85.1629560091606;
        Sat, 21 Aug 2021 08:34:51 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id e11sm9322713wrm.80.2021.08.21.08.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 08:34:51 -0700 (PDT)
Date:   Sat, 21 Aug 2021 15:34:49 +0000
From:   Wei Liu <wei.liu@kernel.org>
To:     Gioh Kim <gi-oh.kim@ionos.com>
Cc:     rust-for-linux@vger.kernel.org, Gioh Kim <gurugio@gmail.com>,
        Wei Liu <wei.liu@kernel.org>
Subject: Re: [RFC] rust: kernel: ioctl returns ENOTTY if not implemented
Message-ID: <20210821153449.6kegzubfqnmeyoo6@liuwe-devbox-debian-v2>
References: <20210819204422.64595-1-gi-oh.kim@ionos.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819204422.64595-1-gi-oh.kim@ionos.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Aug 19, 2021 at 10:44:22PM +0200, Gioh Kim wrote:
> From: Gioh Kim <gurugio@gmail.com>
> 
> According to fs/ioctl.c, ioctl system call first test the cmd
> value with do_vfs_ioctl. If the cmd is not supported command,
> it calls vfs_ioctl. Then vfs_ioctl returns ENOTTY if ioctl is
> not implemented.
> 
> Signed-off-by: Gioh Kim <gurugio@gmail.com>

FWIW:

Reviewed-by: Wei Liu <wei.liu@kernel.org>

> ---
>  rust/kernel/file_operations.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/file_operations.rs b/rust/kernel/file_operations.rs
> index cad665c0016f..c6f03938de97 100644
> --- a/rust/kernel/file_operations.rs
> +++ b/rust/kernel/file_operations.rs
> @@ -662,7 +662,7 @@ pub trait FileOperations: Send + Sync + Sized {
>          _file: &File,
>          _cmd: &mut IoctlCommand,
>      ) -> Result<i32> {
> -        Err(Error::EINVAL)
> +        Err(Error::ENOTTY)
>      }
>  
>      /// Performs 32-bit IO control operations on that are specific to the file on 64-bit kernels.
> @@ -673,7 +673,7 @@ pub trait FileOperations: Send + Sync + Sized {
>          _file: &File,
>          _cmd: &mut IoctlCommand,
>      ) -> Result<i32> {
> -        Err(Error::EINVAL)
> +        Err(Error::ENOTTY)
>      }
>  
>      /// Syncs pending changes to this file.
> -- 
> 2.25.1
> 
