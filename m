Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203BAC6FA8E
	for <rust-for-linux@archiver.kernel.org>; Thu,  2 Mar 2023 14:21:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjCBOVa (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 2 Mar 2023 09:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjCBOVK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 2 Mar 2023 09:21:10 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427E832E77
        for <rust-for-linux@vger.kernel.org>; Thu,  2 Mar 2023 06:21:09 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id p8-20020a4a3c48000000b0052527a9d5f0so2665302oof.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Mar 2023 06:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V0df8BTus5piizQ2Nv9XB0wJmeBaI5UY8DKjSCsanuk=;
        b=b1Ilb0JqAAJUmbIERvTHlj2gzvrhrNbhp/KylaEgYqx+75vUxnSy5Zp9P+FCGM1/+b
         48k61uiimN98pRn869Zr0fmh8TbmBq/PfapypzMARNmi06nE6VSETwCbw8qFtKE2+HEq
         ZPgswgkpRHpuKDDZcz62CClxEcEtrMEWXb3/tI9XIu2z3HPobVAzw2ug5CqQa2ZVgksW
         1S4/f8zJPeHDGyl2ra/9pyvTgM7MOVO7PNVpanF5wvA5LfK6F3Fjh3dHjYmWnt8AQ5P9
         bhaVWLqC97n5DOnhdC2tyadrkOyVNb260ZLjoVV/lS7cUpizpWQmM+7iLbwTjMlqaKNA
         Ui8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0df8BTus5piizQ2Nv9XB0wJmeBaI5UY8DKjSCsanuk=;
        b=hWL0nJAJEisCjvnwFJ/q0uy4uXQrSYfA/q7su67R14UFBypPBfR341SDOwvO1wiTDV
         efsGj/wwXwY/si0Ue5XSjGnXPMhNX1wvEHxJvdrUzyF1e5rq8o0cQIdhNS9Tn0K9QEny
         qVSFGmFgGIpLnOQIagds5TR9K5EAzQaqoqbrq05NBCQR8XnfanrepxXK3VfD48NJFwaE
         8NMsiPMwgG9unwVeE95n9wnqrwKywbz7TsnoWThKqJ3uahe6qkK0qiU0gPWKRGXXYNks
         G4yii0yxfLdg1XyS3FwkLKyl18AMbt0wU7vHY+f4fp7/KBLx9S0KMFPud8bj0DAZfZAG
         Wyjw==
X-Gm-Message-State: AO0yUKVpJyjlt3j1CWfsB4Pt4WO0EoxGKWc8DykUkWm+JKt1P80VwH7s
        0g3EX5W06hK9N0uZix90+7k=
X-Google-Smtp-Source: AK7set/BTxBon4xn+2Q9xKNnPctK34mXfVHy/od+0NzXEhCg934G0RolQn1oONwxLN/JlHVEzNYGkw==
X-Received: by 2002:a4a:e658:0:b0:525:c83:8176 with SMTP id q24-20020a4ae658000000b005250c838176mr4815798oot.8.1677766868544;
        Thu, 02 Mar 2023 06:21:08 -0800 (PST)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id k22-20020a056820017600b00517a7ac36c8sm6040120ood.24.2023.03.02.06.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 06:21:08 -0800 (PST)
Message-ID: <8a6a5f29-e329-5129-9c7f-e40b737de70f@gmail.com>
Date:   Thu, 2 Mar 2023 11:21:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] rust: build: Fix grep warning
To:     Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
        rust-for-linux@vger.kernel.org
Cc:     ojeda@kernel.org
References: <20230302132107.210502-1-vincenzopalazzodev@gmail.com>
Content-Language: en-US
From:   Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230302132107.210502-1-vincenzopalazzodev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 3/2/23 10:21, Vincenzo Palazzo wrote:
> Fix grep warning during the build, with GNU grep 3.8
> with the following command
> 
> `grep -v '^\#\|^$$' rust/bindgen_parameters`
> 
> I see the following warning
> 
> ```
> grep: warning: stray \ before #
> 
> --opaque-type xregs_state
> --opaque-type desc_struct
> --opaque-type arch_lbr_state
> --opaque-type local_apic
> 
> --opaque-type x86_msi_data
> --opaque-type x86_msi_addr_lo
> 
> --opaque-type kunit_try_catch
> 
> --opaque-type spinlock
> 
> --no-doc-comments
> ```
> 
> Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> ---
>  rust/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index f88d108fbef0..41ac8401a8be 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -283,7 +283,7 @@ quiet_cmd_bindgen = BINDGEN $@
>  		$(bindgen_target_cflags) $(bindgen_target_extra)
>  
>  $(obj)/bindings/bindings_generated.rs: private bindgen_target_flags = \
> -    $(shell grep -v '^\#\|^$$' $(srctree)/$(src)/bindgen_parameters)
> +    $(shell grep -v '^#\|^$$' $(srctree)/$(src)/bindgen_parameters)
>  $(obj)/bindings/bindings_generated.rs: $(src)/bindings/bindings_helper.h \
>      $(src)/bindgen_parameters FORCE
>  	$(call if_changed_dep,bindgen)

Because this is surrounded by quotes there's no problem to no escape it.

Tested-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
