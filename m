Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0391C433B4
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 16:05:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAE2961458
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 16:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233770AbhD2QGR (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Apr 2021 12:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233846AbhD2QGQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Apr 2021 12:06:16 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874D6C06138B
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 09:05:28 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id f15-20020a05600c4e8fb029013f5599b8a9so9662353wmq.1
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 09:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+4bMSlycan9jSOMLQR4Mjqsb/P/oF//iB8AuRm7eHuc=;
        b=twmLUOemFrKJLdqL4l6PClu5/X8mXKYNXwVmb6ZE+/HaMwvg3xmreLO1K/Gaz2jh+1
         hfHioVMa0txYwf5aBym2NVv+j19EiTat1njWa7OVaGRL2a0RrVKTAAPQ3cye7vWXTYNI
         fXQZPhP40jXOiDX62RQ92lmNAOg/DKtQnWwUPtXqXWZZHfWBMWPR75yphZEZS8/EUxnD
         tOnBGq4YTA88FP2dELHcTRFbOxONsVya1emJ2JkI2uQWvK2RZixQnuf2F/QVLHRG8zvA
         BIcLZGdFHODDYlYg/Q2cgwTvQxm1d+bEBrY5cCbYEKjJkCKowOrrrmJvTyXraKJq3NIe
         +OFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+4bMSlycan9jSOMLQR4Mjqsb/P/oF//iB8AuRm7eHuc=;
        b=TQaOicE99neBZGsfkYBY5M6TEETJpbPc4zWFhLV5m0EaolAfs8zin+CfUvFd0z6I8R
         iEb7I9WQwsejIaixIUqYJYWbOZKAWCo3uhquujMyH3VKgQ2CDbIQa9u3wmcTh+DSt8v+
         afJQc/nteB2dotnhLL1z4XD/7NVLhPw157nyMun4qUpZS+oQBCkr8jLfZ2JWcbvjjKdb
         l43ha4sZjd9D/SamTJRWewK2rT0sM+lloC+I81fECaP+zU+IeT/aumCVpFLKFWGxoVec
         qLFY8VducdcCFmLvsMO6XWdJ/VINEKyKc9bggoSjgSbBJHj2HcoiUnLDuK76wFH+vMUM
         lAOA==
X-Gm-Message-State: AOAM532u1LYtchueKlWii1QHmJ/3cJHMcBQqtXfvMCJJRZdCTkWIafk+
        Z8uHyed4uByA/pIi/lT1JLhO
X-Google-Smtp-Source: ABdhPJzkCizFU1IjoeiUjheTolH2LjrGZHLm9dVWLGnfh2zc3bwqeL7nuFUJeb422yngwlWIp1c+NA==
X-Received: by 2002:a7b:c012:: with SMTP id c18mr11515043wmb.94.1619712326930;
        Thu, 29 Apr 2021 09:05:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:3509:36a7:e954:c7bb])
        by smtp.gmail.com with ESMTPSA id s83sm491449wms.16.2021.04.29.09.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 09:05:26 -0700 (PDT)
Date:   Thu, 29 Apr 2021 17:05:22 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Carlos <carloscarral13@gmail.com>
Cc:     rust-for-linux@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: Loading an out-of-tree module
Message-ID: <YIrZQk6eTNUiQa/I@google.com>
References: <YIrDgupEqcmsUfGX@localhost.localdomain>
 <YIrNuQlVnvpktDcl@kroah.com>
 <YIrXFt2KVovbM+Fs@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIrXFt2KVovbM+Fs@localhost.localdomain>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Apr 29, 2021 at 10:56:06AM -0500, Carlos wrote:
> I get why the OOT flag is there so I won't try to remove it. What
> concerns me, however, is that my printk messages don't work as expected
> (i.e. They are one off). Is this behaviour caused by the same flag?

Adding a new line (\n) to the end of your messages should fix this.

Cheers,
-Wedson
