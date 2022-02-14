Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C09C433EF
	for <rust-for-linux@archiver.kernel.org>; Mon, 14 Feb 2022 11:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349734AbiBNLTW (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 14 Feb 2022 06:19:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350513AbiBNLTN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 14 Feb 2022 06:19:13 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9EA694B7
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Feb 2022 02:52:40 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id qk11so16143158ejb.2
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Feb 2022 02:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=E/TT01vk+TwDTxyVO+CySmmufUASQrx6o6WcTn2zA6g=;
        b=LWvXIogIhqRUhxWeVG/UvEOK/9eOLM6ssOlZy/3RDNw9vDq2wBdtU6s7kREbP0cnJC
         gCEPNNbIxVz9Px1HgdnzYzXC8WZKL4MCivjZM5RrjKfgwDDuCtxB7G/SMndpEDk/2rfg
         0Pgi/XwsUUXLkr419KVcuHZS58QmtN1jYdlsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=E/TT01vk+TwDTxyVO+CySmmufUASQrx6o6WcTn2zA6g=;
        b=79ikRjiildJSKIYjV5Zvp/FbTfA+PBpSHBVtN3nBjWqGAimCu1DqYm7PCPosb1E5T0
         EKUSflrQrJtfmhUl6IwO/8ufbUpLHzgpZl8QyNn59VSRUMdMDmEijhdJSeM+6f5m531a
         uipOEJ4gCFBdy+oZodCXoXzdR9JEdipsKe/JiriZ5T3ikXN0YK1sgzCIxdd5DnoeQbR2
         uIChchVvcRDa1j5wk3NyG1boMsKHHxgcjLDkRd8WxypxlnVbu7ET5gx2RXcoUSFLKl6S
         6eC2aPTFO68Qmbw06LPjj0fzCJwDJMV7MLA5PfcnoLO7iYatMmVuEYIP198SUbyMpslN
         J87Q==
X-Gm-Message-State: AOAM532JRgoDbzNynrvA6E7Cqn3mDq44yPvFvo6rWFzJNBDldb7rqRuO
        Z9EuPMh8glQESpKpe97NxUDuPw==
X-Google-Smtp-Source: ABdhPJyRmRhJ+m6AufBMjvO+EAajLPaNwsbL28+VihphAK/HPcx1aafI2fcRcWVtS458a+Wge2rcZw==
X-Received: by 2002:a17:907:7204:: with SMTP id dr4mr10860530ejc.708.1644835959219;
        Mon, 14 Feb 2022 02:52:39 -0800 (PST)
Received: from [192.168.1.149] ([80.208.64.233])
        by smtp.gmail.com with ESMTPSA id q12sm14773393edv.99.2022.02.14.02.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 02:52:38 -0800 (PST)
Message-ID: <dc9054f2-5e2b-0ae2-1022-23421668dd05@rasmusvillemoes.dk>
Date:   Mon, 14 Feb 2022 11:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 12/20] vsprintf: add new `%pA` format specifier
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gary Guo <gary@garyguo.net>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20220212130410.6901-1-ojeda@kernel.org>
 <20220212130410.6901-13-ojeda@kernel.org>
 <YgosclY9ebD3t020@smile.fi.intel.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <YgosclY9ebD3t020@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 14/02/2022 11.18, Andy Shevchenko wrote:
> On Sat, Feb 12, 2022 at 02:03:38PM +0100, Miguel Ojeda wrote:
> 
>> From: Gary Guo <gary@garyguo.net>
> 
> Not sure I understand this...
> 
>> This patch adds a format specifier `%pA` to `vsprintf` which formats
>> a pointer as `core::fmt::Arguments`. Doing so allows us to directly
>> format to the internal buffer of `printf`, so we do not have to use
>> a temporary buffer on the stack to pre-assemble the message on
>> the Rust side.
>>
>> This specifier is intended only to be used from Rust and not for C, so
>> `checkpatch.pl` is intentionally unchanged to catch any misuse.
>>
>> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
>> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
>> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
>> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> 
>> Signed-off-by: Gary Guo <gary@garyguo.net>
> 
> ...together with this in the current SoB chain.
> 
>> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
>> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> 
> I'm wondering if you considered to use %pV.
> 

I think the point is for vsnprintf() to call (back) into Rust code.

That said, I don't like the !CONFIG_RUST version to return NULL, that
will surely crash moments later.

So I prefer something like

[rust.h]
// no CONFIG_RUST conditional
+char *rust_fmt_argument(char* buf, char* end, void *ptr);

[vsprintf.c]
+	case 'A':
+               if (IS_ENABLED(CONFIG_RUST))
+		    return rust_fmt_argument(buf, end, ptr);
+               else
+                   return string_nocheck(buf, end, "[%pA in non-Rust
code?!]", default_str_spec);


Rasmus

