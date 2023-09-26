Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0603A185A
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 06:54:25 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4B0F3
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 23:54:24 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-991c786369cso962126966b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 23:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1695711262; x=1696316062; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mtaQFeErYEc5SwJkh4GjNe1ui54OdRbC163GbH+CxIE=;
        b=ce66e2et3I0n2Ds6RlEAgVzIixZsYB2bMPCZsO2pL0GkxdtMnBgMJtnTNaPupLmTD6
         mz0tiCUmz1hClQs/yL5A4KxSwb4lzUFj7FED10jxbXXdYHyFr2bYqy52WHaqyEbdPiRj
         md+alJM4aMqrY16j2hxCbtNjOKinaiOoUIln2D8HKYq8LB/A23QOKBV5LAycmwHgdkIP
         XMXbvaJFj3DEhwaeiWYOBdxcI/2Yt3Xa/yYi27eERegmwx1pWJoDZlmIxrhK8YYp1iq2
         V0AfhWzxjhobV7G6WD5b1KQPA2YqRA47NBvjzC4rDrdJ9Rl8RrDQyQlS9czURzWBtnKD
         WmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695711262; x=1696316062;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtaQFeErYEc5SwJkh4GjNe1ui54OdRbC163GbH+CxIE=;
        b=Q1izzQXPY5czkXhFKil9/BNL75dfY1t+zBYMzUXkUIbqECXBMRhsdqxZfAje6Ih3Uq
         cStPEg/QFJ+dC34mk6VsAoDQa33yHnrs+ffCz/QR1A4p8GRtMc6B48SvbkN7JiZZcmvG
         NvyDjF0vjvXEHmblmtLX4xOpihN1At4UTEle9rDGn68RFrndI2gPwn43vtv4HaEfwuXo
         EyoYUuJ0qEluCsWN73Ie0aTRaYSsasiXbpMrZvnrFFyQMxNvOritMWSIBrmEL8Km9VS5
         STLyz1mPlmzFcLV1TXhF5CEDAECdfJL1vqSO0IjaD/FiV0yVzNN/yUS1nqSBDtfHggS1
         V6WQ==
X-Gm-Message-State: AOJu0YzhOqael5cI0PlJbEVVfQvanmar+LDM7SF6m9eP3QiP8h0/5soA
	JLm39Bzqr+/6Zsuyq7gBrslIp6PI+bc9IPWRpZIHmQ==
X-Google-Smtp-Source: AGHT+IGPfbLtiHynR02TkddCLmQUtUZRNOqhYo0NjZP/hzU1k8a6JUhSCo0L+XzCYip9eCK9tCWctlh7tsZmbYLnJ4s=
X-Received: by 2002:a17:906:5357:b0:9ae:6196:d80e with SMTP id
 j23-20020a170906535700b009ae6196d80emr8041065ejo.18.1695711262477; Mon, 25
 Sep 2023 23:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: by 2002:a17:907:708:b0:9ae:22c3:5b8 with HTTP; Mon, 25 Sep 2023
 23:54:21 -0700 (PDT)
In-Reply-To: <20230924064902.1339662-2-fujita.tomonori@gmail.com>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com> <20230924064902.1339662-2-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 26 Sep 2023 02:54:21 -0400
Message-ID: <CALNs47vE7p_m=q0Q5+bHUSVaNVEbfeJfZFHS9AkT1UaUMvuevQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 9/24/23, FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index e8811700239a..0588422e273c 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -14,6 +14,7 @@
>  #![no_std]
>  #![feature(allocator_api)]
>  #![feature(coerce_unsized)]
> +#![feature(const_maybe_uninit_zeroed)]
>  #![feature(dispatch_from_dyn)]
>  #![feature(new_uninit)]
>  #![feature(receiver_trait)]


> +            // SAFETY: The rest is zeroed out to initialize `struct
> phy_driver`,
> +            // sets `Option<&F>` to be `None`.
> +            ..unsafe {
> core::mem::MaybeUninit::<bindings::phy_driver>::zeroed().assume_init() }
> +        })

I think we may actually want to avoid using
`const_maybe_uninit_zeroed` and other features that indirectly rely on
`const_mut_refs`, just because some of the internals are still TBD.
That means that the best solution is to create a `const
DEFAULT_DRIVER: bindings::phy_driver` and use that to fill the
remaining fields.

Which really isn't all that bad since it means that if any fields are
ever added to `phy_driver`, we will need to confirm that our default
is OK a single place.
