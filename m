Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4etOjFNb"
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56AE1173F
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Dec 2023 07:35:14 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6cedc988cf6so465137b3a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Dec 2023 07:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702049714; x=1702654514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WMnlzmKg9DyRCjTIo9NWw3OAfaXxDlGMMCmq8eYBwns=;
        b=4etOjFNbpPoHS28boUs7sYRfWkdQ2tCUS9pvXwumN8uZlSsec3Um/o/V9VEM3fUad+
         g8T1idhFVN/aeHE4Os97MT2/pQb9kJCL19UweaZRH2fPU2mfhtOKuAlsogwOSYCxA41W
         dtpK/aedkwBbBCDUrOcJ0TS5/6PyjSDdSnTjv2Mv/q1WHKDtnsqcGa1ld3kVguDxzdPV
         kUU5K6BWS0M1M+n1HPRuvR5+iFhSO366VDvIOvOEO8pLP8KUaE0uDpOF2JGHy3sZLQ/l
         1lvVpYOX/wFJv7qa9t5wvAXsGjR+/vZekeb0AuKtGaFkijbv9hQBV5WUzhn9ig6S8N4m
         zWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702049714; x=1702654514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMnlzmKg9DyRCjTIo9NWw3OAfaXxDlGMMCmq8eYBwns=;
        b=t7RHaUyNOSBWxizB51Y7bIdXMb/YpvJamqk7QcMiosPlXii08OX/rLL68n2iCagWeT
         5dz35pjgeEIXTMljSXAZo0HN9f7ZskmwELoA2g8Sh9pUJjdc047txYTYd7zI+0sDE4TR
         RRwQSUlxqFaaQb4w/jqDpg2V7kppmVXBgXtuQKRJYo5+uop4D1MFpVzu3JBVBUaZMUhA
         WobptrDdU8PIhX9ufrsly2CCSye2l5hUegaCnAJ/LKMW5F7WFusev60CXUP4HGDJff8m
         JT9UKIaJ6C3XmxfTh5RGxCgVfXneiRAmULrJgnMLctsO1VnO934zOy1A1mI/6zTrCzzj
         2Npg==
X-Gm-Message-State: AOJu0YzYKzacDNPsT4TZ4rmDChZTNopQ5BLuQygvd1nNjcGIDZK0lsr7
	mu48wsC5AUqucdVBZ96EWfLI3w==
X-Google-Smtp-Source: AGHT+IESf1k2n13MqKMWia14nJinAeLSzbt4CtMuDPySehvv8O/Fb5ljzWIN2rcZTIGwCXb+V2Y9mQ==
X-Received: by 2002:a05:6a20:f388:b0:18b:251d:d6fb with SMTP id qr8-20020a056a20f38800b0018b251dd6fbmr206420pzb.1.1702049713574;
        Fri, 08 Dec 2023 07:35:13 -0800 (PST)
Received: from google.com (170.102.105.34.bc.googleusercontent.com. [34.105.102.170])
        by smtp.gmail.com with ESMTPSA id r3-20020a655083000000b005aa800c149bsm1496119pgp.39.2023.12.08.07.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:35:12 -0800 (PST)
Date: Fri, 8 Dec 2023 15:35:09 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <christian@brauner.io>,
	Suren Baghdasaryan <surenb@google.com>, Li Li <dualli@google.com>,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] binder: use enum for binder ioctls
Message-ID: <ZXM3rXugrgWCqqgP@google.com>
References: <20231208152801.3425772-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208152801.3425772-1-aliceryhl@google.com>

On Fri, Dec 08, 2023 at 03:28:01PM +0000, Alice Ryhl wrote:
> All of the other constants in this file are defined using enums, so make
> the constants more consistent by defining the ioctls in an enum as well.
> 
> This is necessary for Rust Binder since the _IO macros are too
> complicated for bindgen to see that they expand to integer constants.
> Replacing the #defines with an enum forces bindgen to evaluate them
> properly, which allows us to access them from Rust.
> 
> I originally intended to include this change in the first patch of the
> Rust Binder patchset [1], but at plumbers Carlos Llamas told me that
> this change has been discussed previously [2] and suggested that I send
> it upstream separately.
> 
> Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-1-08ba9197f637@google.com/ [1]
> Link: https://lore.kernel.org/all/YoIK2l6xbQMPGZHy@kroah.com/ [2]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Acked-by: Carlos Llamas <cmllamas@google.com>

Thanks,
--
Carlos Llamas
