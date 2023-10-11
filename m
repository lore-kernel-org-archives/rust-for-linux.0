Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D932B741
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 23:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qe+RxCIN"
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05975A4
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 16:28:32 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-690d935dbc2so72308b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 16:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697066911; x=1697671711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwujPudKFYCsPnrnKSmAUVpmsot+w68z5y+kuVkHG58=;
        b=Qe+RxCINrdjtU380U7yzNGMpfOxiqSSBW0KBnEnpGECPcubgeF+dSxDU0VieZfJKcG
         Jb5Kny7Cy6vftBMwB3Xq/f1A+CaCvj17xCDxub2UV6qNIW6ksroO4TXMDlG2ldg6ZVa2
         xopMUruig5krBldjho8eVabT7jrjms1Q4pBzpTIn/hFx+4Z/e4UXX+pzVMjYNsIuM+4r
         TP1Z/n9FxQh8KowMmCtbcdMyBwa0T2KCOceNMGO54hUOXsqEiX8hevtFQftFXL+DFd9t
         /nCoQuHzAzldDYDX6IKicQ18yuTQhbtOeribIuQbXGE7pN2+XdPARdGnZea597chbjm2
         cCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697066911; x=1697671711;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cwujPudKFYCsPnrnKSmAUVpmsot+w68z5y+kuVkHG58=;
        b=RC7F9/9QtOwYhcAuuPUpVzCWZTMQ4UNSks33266ZqwhCtaoZ3BGZ6g/3d+9+2yfWtQ
         WYVY92dO9WL6jV/Q6CagKXbCR4+IIfPGrAaJZcQoXvrjeTep257rmbANNXV6V7T1QunV
         z9z10QPX5fZXkwlg733dhSPoVzb/K0yizRiOcMTMZWTiioKP6hDM7+jcRJ9x8HIeUt3M
         0ZTu9U1CGNefJ5ZxInFF2qXejFGVocC9LwyqeGk8jh3XYBf2utJj5cB1023QG3QRVzwg
         z61NkKOjeh6S1RlAYids+FTqwvEbQeiaRu75GSc7+IOJ43FK4glDDuANuXXloug+fciJ
         TV0Q==
X-Gm-Message-State: AOJu0YzzwrPa6C8ZTLC+P0gYcO6YNSOSLdCIGRfDteLP+/I+GGrHM69Z
	fVq3P0ZSI0X+NXGP8eBJ9Xs3vOXwB+n3I/wO
X-Google-Smtp-Source: AGHT+IFUWcrvsSV4J9v0Y2DcB6R6wYiQy0rNGG15cMfd3qjVm4TS/kbNtDQg2EOb86oqcteOkH/6UA==
X-Received: by 2002:a05:6a00:1d8f:b0:692:afaf:32b4 with SMTP id z15-20020a056a001d8f00b00692afaf32b4mr24366328pfw.0.1697066911340;
        Wed, 11 Oct 2023 16:28:31 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id u20-20020a634714000000b00578afd8e012sm401860pga.92.2023.10.11.16.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 16:28:30 -0700 (PDT)
Date: Thu, 12 Oct 2023 08:28:30 +0900 (JST)
Message-Id: <20231012.082830.1636551674822069084.fujita.tomonori@gmail.com>
To: wedsonaf@gmail.com
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com,
 benno.lossin@proton.me
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANeycqrjD8VW-7oUV6Q9xYh1=WmAX4X-JEzMUaxvggu3OCXjFA@mail.gmail.com>
References: <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
	<20231011.155656.1088666692728270489.fujita.tomonori@gmail.com>
	<CANeycqrjD8VW-7oUV6Q9xYh1=WmAX4X-JEzMUaxvggu3OCXjFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, 11 Oct 2023 11:28:06 -0300
Wedson Almeida Filho <wedsonaf@gmail.com> wrote:

>> >> +/// Creates the kernel's `phy_driver` instance.
>> >> +///
>> >> +/// This is used by [`module_phy_driver`] macro to create a static array of phy_driver`.
>> >> +pub const fn create_phy_driver<T: Driver>() -> Opaque<bindings::phy_driver> {
>> >
>> > Another instance of `bindings` in a public function.
>>
>> Reexporting works?
>>
>> type DriverType = bindings::phy_driver;
> 
> No, that's a type alias. If you really want to expose it, you're
> better off creating a [transparent] new type that wraps
> bindings::phy_driver. This way `bindings` is never visible to drivers.

Understood, fixed.

The first version doesn't export it. Using the static array of
bindings::phy_driver in a kernel module makes the code simpler (avoid
dynamic memory allocation).
