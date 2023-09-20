Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E2623CF
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Sep 2023 23:01:53 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 388B9C1
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Sep 2023 16:01:51 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7926a450a0aso15225339f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Sep 2023 16:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1695250910; x=1695855710; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=YHS0g09D6vc1thRPLJnGpAPdP+yVHQW0z02dWszN1A0=;
        b=PaieXlJHRsMjfC3fjDiReZ9AwKblQM3mT8XDx3Nfj8mdRGgLBgdZSb9cddSfQVREbv
         mTj6vO4BZf8ebNw3VT9DNHgFnYqqu2XR1eIyqk2dYj0JRC4aIeDF8neBqQzP5wV/E3AA
         7K4P+si7AGjg23D39b2j4MwFnR4ySWx67n/pZPDHFHevs8offQ9UDP9iQsXy8O7yQFDE
         wbhuAJeUVamMS+W8ZiJK7OItopGYmxachoV1KdahfjTgTnxvY3wjGSgzB9suVGX/lVAJ
         KGCQXsPNV/bE5oJ7xQWkPeAOENu33bvYGCcU0lToPp5NxgpJgWbwYd/ZKWelDfELaCJa
         YxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695250910; x=1695855710;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHS0g09D6vc1thRPLJnGpAPdP+yVHQW0z02dWszN1A0=;
        b=DoOY6bJRmBQy7VHxoqc45n86fsaGr8XaCpYGm9yM7qcMNzDewcWV+tETvTqEbsRc7q
         cPrx94ATlt+kKv4+9txDyJBe391qpG4NMNGSRNAj3auX4s0CbtbEBXDdMawOMKB5grSm
         AdBSptzVlbNIquWQsmDI46NWECa1Y4ZakXEUxscFR9GPyMzchZtMlHn8Cjb+dmwmyovT
         iV/kVvt2HFN7UsEBeLX2a4T8pjgAT/98r83IoRyheKgndMzbhYggvOl06k97aRiKuZLW
         Cumv2R5K4agvq/1xAGW5+rKNJoXgyAUIVCbJaOWhw3qaGI8C0D5aPKHSNk29PfjLhYMj
         mcOw==
X-Gm-Message-State: AOJu0Ywf1PDEDAX+ckGYx9YbNhgTNU2EHXA5gajMfUqBJI4djL3O0X11
	Nutl/kzvYJDvKefq2AqdjlUZhcIkZSJ76L7PEGCRHQ==
X-Google-Smtp-Source: AGHT+IEHrF3yRt5OaS3ynJdUvHgMnpCvlGeaGnJh9f4vOkGFecidC0lD/kLQsvkNbHNd0tUPsMmf/g==
X-Received: by 2002:a05:6e02:1b06:b0:349:36e1:10fb with SMTP id i6-20020a056e021b0600b0034936e110fbmr5083232ilv.18.1695250910530;
        Wed, 20 Sep 2023 16:01:50 -0700 (PDT)
Received: from localhost ([158.51.192.73])
        by smtp.gmail.com with ESMTPSA id a17-20020a62bd11000000b0068e38cf211bsm54027pff.197.2023.09.20.16.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 16:01:50 -0700 (PDT)
References: <20230906204857.85619-1-manmshuk@gmail.com>
User-agent: mu4e 1.10.7; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Manmohan Shukla <manmshuk@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: error: Markdown style nit
Date: Wed, 20 Sep 2023 16:01:13 -0700
In-reply-to: <20230906204857.85619-1-manmshuk@gmail.com>
Message-ID: <87cyyc78km.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


Manmohan Shukla <manmshuk@gmail.com> writes:

> This patch fixes a trivial markdown style nit in the `SAFETY` comment.
>
> Signed-off-by: Manmohan Shukla <manmshuk@gmail.com>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

