Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960CAC433B4
	for <rust-for-linux@archiver.kernel.org>; Fri, 23 Apr 2021 20:35:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FD3661406
	for <rust-for-linux@archiver.kernel.org>; Fri, 23 Apr 2021 20:35:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbhDWUfs (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 23 Apr 2021 16:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232636AbhDWUfr (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 23 Apr 2021 16:35:47 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD68FC061574
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Apr 2021 13:35:08 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id j5so48592379wrn.4
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Apr 2021 13:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kRB6tHWOcl3n4hXELk4ro+eYUj1grGgiLgBKKy9s7wM=;
        b=uDME4nq1cTr4DCvDc3OrzpO78KBD5of+214OtA4eqesp4uiZsu7bj9h/S2B3KM9Fpm
         ncDVr2JxBeuuM50wXSXdURU9hxN1hTT2ggFkTOnDYKG/WT9uIFwPy/cwclwE/v2BiMSr
         Ed7Uavuho78mr33DBQR8elpMXKnGAoenuZUTYjhmjI0nHBE+wz7agp5UDeM3zhBBTg60
         U/g3BVHRKvi9zAo0s1ORua/1i7FG+D/Z14fCK6DLs63fqQEnF/3J8ByQykGgyrmlbIu4
         Vj5T6MKb/MjrqWmE4+tbLiCMxgEg+53tfJMDfoIMHYWwvGpYcN8OzQWcXZsqa5eXRTnR
         kYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kRB6tHWOcl3n4hXELk4ro+eYUj1grGgiLgBKKy9s7wM=;
        b=m06bt68AkFEvoIA2GEN7w/sZRLRA21OB61+T1aQQ+wwC/CWmR6hR2Od5m0zeCVATcv
         nF/yjz1Rj24uvb+hTCkzw9oJIKvebZ5lgzdortlyqKjiLba6sZ+quGmeGOd4+7cyZSM2
         FigEZepONq6FcMakSGskXJbGOkJTjbN+zi9lHj2visOEoRSZvLFUsy/wQXiuj2MQArN9
         WLJoBUT6m4gPwN5Ji/HiCsyrLCaQMvElCaQTl8w+do2woqKnrdd+IDGv5hYWiMu8KP1g
         Kny14JJZXXPhoiDxUJFKlYOehXxWWh1qBR/I6jocUpt4TcjAwIOtQf0qr+DAnBpHKrkn
         GD6g==
X-Gm-Message-State: AOAM532EZCVvXeR/yXNtFXf2+QBTnxhZQrjcyelqFQhqiAu4OOCcVIcZ
        zxEd/H+UmsItLCNiA5OmiJtPzOZOdeZWPQ==
X-Google-Smtp-Source: ABdhPJxwQw48HueAQB3LG8g8hJJ3LT+IlaFm/NHHBQGeX11qNjiTPB9ioxf5ItfVFCFlW2kDlICCrQ==
X-Received: by 2002:a5d:4a48:: with SMTP id v8mr6858073wrs.204.1619210107382;
        Fri, 23 Apr 2021 13:35:07 -0700 (PDT)
Received: from ?IPv6:2a01:4b00:ea36:6c00:56e9:4ef3:28ef:7ef6? ([2a01:4b00:ea36:6c00:56e9:4ef3:28ef:7ef6])
        by smtp.gmail.com with ESMTPSA id z66sm12918573wmc.4.2021.04.23.13.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 13:35:07 -0700 (PDT)
Subject: Re:
To:     Ivan Koveshnikov <ikoveshnik@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
References: <b84772b0-e009-3b68-4e74-525ad8531f95@gmail.com>
 <CAHQrGVOy1wvLsv-OdtOZxF7urF0NCRA5sf+OFuJNix=SymwmQQ@mail.gmail.com>
From:   Kajetan Puchalski <mrkajetanp@gmail.com>
Message-ID: <85a8864f-8332-1249-0506-bf907067b16f@gmail.com>
Date:   Fri, 23 Apr 2021 21:35:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAHQrGVOy1wvLsv-OdtOZxF7urF0NCRA5sf+OFuJNix=SymwmQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 4/23/21 2:57 PM, Ivan Koveshnikov wrote:
> Hi Kajetan,
> 
> You need to send an `subscribe rust-for-linux` to
> <majordomo@vger.kernel.org> email, not to the mail list.
> http://vger.kernel.org/vger-lists.html page contains links that can
> prepare an email message with correct format and address.
> 
> Best regards,
> Ivan Koveshnikov
> 
> 
> On Fri, 23 Apr 2021 at 02:53, Kajetan Puchalski <mrkajetanp@gmail.com> wrote:
>>
>> subscribe

Hi Ivan,

Thank you, apologies, I realised that I wasn't supposed to do that 
literally right after I had sent the email.

Regards,
Kajetan
