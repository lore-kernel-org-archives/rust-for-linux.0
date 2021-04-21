Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DD8C433B4
	for <rust-for-linux@archiver.kernel.org>; Wed, 21 Apr 2021 10:55:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DF7F61447
	for <rust-for-linux@archiver.kernel.org>; Wed, 21 Apr 2021 10:55:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhDUK4I (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 21 Apr 2021 06:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhDUK4I (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 21 Apr 2021 06:56:08 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9252BC06174A
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Apr 2021 03:55:34 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id v3so44332617ybi.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Apr 2021 03:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pUh8abm1bXwC/AmVv15q91XfWPtt23JuQDu96Q97bLo=;
        b=AfssHHZ+BYleot0PSdZe6GdZpAsZ26ZiD+Kge9ebzX42djzYY0YcXkVLCJgAjusyrg
         oaC0gSzlQuPbhaIeNkvoJB0lYUUswWNX+TQ9SrgAIVlbfF9hv6z1qzfM0pE/ZIXU/q8/
         fPLYUdHF/YkldDYBZq0Y3WuoOBb15ImeoCe8LxOh2WYP4S3GItOBobAFAA+Gt1X/5jUp
         jrLTP9vvwtZ/IU/abAy8qPPBYZ/he7CopbIo0bizQ1Px+W+aCdC+rHlecYe0qaHjaxfW
         fcDnyJxjfXXajYjaB1oc53vTrLdvt8KXnTbZ+PBsMcVY6WNETwKbx2uaJWyVDYSRUUW1
         oLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pUh8abm1bXwC/AmVv15q91XfWPtt23JuQDu96Q97bLo=;
        b=T2m3Pt9xFVsJE6RTqGPULM6XNeDFESWSn0wtNwqSRNOJZ4qTPmGlS2p0Ku/81HHd05
         KinE3z7A9ShcUf6WlfrWXVk2wqD4pJAhozsHYtORdjofpYvx4U/WAsytaGb/tCxDGLo+
         N7+Gq3oiEdHzD7CXBlvAi2wH9398um7lqsc74K8+uVqH9IQ2hb+tGSQfudjAAkFdPhQa
         b4dvZdQUqij0c3mDlvI6Du5aYwpgUmhxXXeKGeb53Is1wNtP/qL8pJSVfTNPCNARI2eQ
         MrTA8h/Pj8mpfPg05//O+jHTfd9F/d2yZS0VFDoRqIgBHhfEj6pM3LV0Gxt5PXcZjEBF
         zLuA==
X-Gm-Message-State: AOAM531x+7MjJ8ruy/2c3YldNaBN7xH25aIc4eiU8qErxvAJkRdvX8ee
        JAgLUG7Kw7KxC6vWXR6VetAM4oxe+6On0YPLrko=
X-Google-Smtp-Source: ABdhPJzNDV+hlq64u+qR9CXG7Xa1CCMBDGJMzKjilngBKGvhe6eZIIjKkFv5Lvm4FE1CsMs7ulvx++fiz+Ewz69S7qU=
X-Received: by 2002:a25:818f:: with SMTP id p15mr27882856ybk.135.1619002533499;
 Wed, 21 Apr 2021 03:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <BY5PR16MB311024F4BD76CAC678CE647F97479@BY5PR16MB3110.namprd16.prod.outlook.com>
In-Reply-To: <BY5PR16MB311024F4BD76CAC678CE647F97479@BY5PR16MB3110.namprd16.prod.outlook.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 21 Apr 2021 12:55:22 +0200
Message-ID: <CANiq72mduw5+3ZoPJ9S8vPs6y+H1+GzqH-C3tinZTyJSPkBdiw@mail.gmail.com>
Subject: Re: hello
To:     "Chen, Herbert" <Herbert.Chen@activenetwork.com>
Cc:     "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Herbert,

On Wed, Apr 21, 2021 at 3:26 AM Chen, Herbert
<Herbert.Chen@activenetwork.com> wrote:
>
> subscribe rust-for-linux

If you were trying to subscribe to the list, please see:

    http://vger.kernel.org/majordomo-info.html
    http://vger.kernel.org/vger-lists.html

Cheers,
Miguel
