Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17E5111A9
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jul 2023 18:34:58 +0000 (UTC)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CAC10CB;
	Wed, 19 Jul 2023 11:34:57 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3a3373211a1so4574321b6e.0;
        Wed, 19 Jul 2023 11:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689791697; x=1690396497;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SdY/5Q8meiAKhNAfT3xalCDIhAaUzCW0eL8sb8zkKUY=;
        b=B5+S/0ywrc/Fk/Ln5eH3PZnG1vo0KzCQZ2rJ7lVEcuIYrV9TKbPjGxOlaYOAbPdg+o
         e/Raz6jATEPbuCWCfJV8NFWuOA3uLN8MDr7GKT+RCbHwgfmpULHyjHZmqfEkiSpPwWQT
         JQQn6c7L7musZqxbgpfS9TLaP9LclordJ1v5wbRWPjMeIn4qohJ7t76zftMsT/u89kac
         zGgUpQaDOzeNqjvaB+ek3FFTG7xk6J8ytAM66hkTEVfsDw4QdgUqZ5b7m24adiIoqFXt
         axGoBCdW0jFBPSWpFQ97LsVHoItPLoEp9VODMnFh5iNhwyS/HlnqIz99W+BY1YsybllQ
         0/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689791697; x=1690396497;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SdY/5Q8meiAKhNAfT3xalCDIhAaUzCW0eL8sb8zkKUY=;
        b=Z19g0CaGmtSERqNEK0iudUiuxpRrasgW4oCLwvDNX8KRttyZAsKC3LzxBvJVqoOEkZ
         UkOIQThdSpjDXU5Ycv9walKUVzile8riB33V3XhJf/kfUeb+cUQ01ICvZ27oe2bFPrRM
         ZFXQzCB12LkHD+Ked3jrx5N0u/4hFAz7ecUZsJh1AOfNt56dkHbdzICcjAAnQ2ysi7Iq
         6YVWAYH16ZMptoADm/NiBtX0CEeFvUoZDJL3h115vSIqwpEstiEB+ziZnPqSKJn5ZPI2
         jcqDr9bCykyYthrD0jMEd6Ydf/iSdP060joqasAGHxiUXY3BOkttOyLzRQ/TMqfg+Njr
         U1UA==
X-Gm-Message-State: ABy/qLanMWQQyq214gXYWlbpOyICUlrf5NKCDJjc2p/G9UolFbzHgb9p
	RDO0WO3WOzZ27LpYT/mh5Xc=
X-Google-Smtp-Source: APBJJlGSJGj2Xe0Au+cPffCnmjxvuo1+gGK8/quPBcMrPMdB2tJEUvgeGdl/oL2Q4Gp6oeO7zzz8Mg==
X-Received: by 2002:a05:6808:8d3:b0:3a1:de77:2cc2 with SMTP id k19-20020a05680808d300b003a1de772cc2mr2941308oij.20.1689791696843;
        Wed, 19 Jul 2023 11:34:56 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id y7-20020a056808130700b003a3860b375esm2042016oiv.34.2023.07.19.11.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 11:34:56 -0700 (PDT)
Message-ID: <5f8efdc0-fcb4-3353-7ddd-d0f3c9fa5a49@gmail.com>
Date: Wed, 19 Jul 2023 14:20:26 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] docs: Integrate rustdoc generation into htmldocs
Content-Language: en-US
To: Carlos Bilbao <carlos.bilbao@amd.com>, corbet@lwn.net, ojeda@kernel.org
Cc: jani.nikula@linux.intel.com, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 konstantin@linuxfoundation.org, rust-for-linux@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20230718151534.4067460-1-carlos.bilbao@amd.com>
 <20230718151534.4067460-3-carlos.bilbao@amd.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230718151534.4067460-3-carlos.bilbao@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 7/18/23 12:15, Carlos Bilbao wrote:
> Change target `make htmldocs` to combine RST Sphinx and the generation of
> Rust documentation, when support is available and .config exists.
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>
> ---
> [...]
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
