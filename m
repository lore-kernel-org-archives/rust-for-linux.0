Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C2A4411
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 03:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="X0ZVDFh1"
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E870EA3
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Oct 2023 20:22:59 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-59f7f46b326so48925127b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Oct 2023 20:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696821779; x=1697426579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5rWOjZMA+Wx1ZERnLIr99/RJOheXn8WoCGO6fDXV6M=;
        b=X0ZVDFh16EvyxiO9et0O6aQ3j5adHnNg3Fo4O+d8pFKGfyI54PTNVBHmowrFTEmW4M
         eYCtGPFXV4y5rDYaP3HBe+SLkyR9YQD1VmMegwsoVgS2jG/bC8n5x9vjcBwmlQc3pIS4
         NZeCn3oxFbMY4WKF2dittkko/a6YBJ9PtF25vvR7HJgtR92Q4ggAqlKfhrA/LfyBniB9
         0pxEWURmmE4FflOvsynK/dU3tCrtrH+to28q+6NVuaOeaN9VLC7vQjZLLTB3pT+AqzX1
         EY9aSkiQxcONnX8yfMk4vUhVC9nYJMvXH+YY/6J0TOicjQc+Ye8PT92a9RTBrddwE9NS
         NZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696821779; x=1697426579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5rWOjZMA+Wx1ZERnLIr99/RJOheXn8WoCGO6fDXV6M=;
        b=r/Etua/Ykccpxnhr30XE1jj8TNSwczispOT/FdaZKI8YZutq7qHGtYMrKiJHz90KzM
         M9RbbjAG42WQvyam8Rrp9vsL1bahFou89c7x6V0zMJ46PVJjNBs69HiiSZIIRY8L/01t
         g0KdcOLd8cc7sx/MEMk6bfve5ZSeAF7t7TyBVxC7ab/2nW/8YiQOzBJsA2j2YnpcBTVP
         qJY+/XUSCMSihlYF+qwijjoeWpwGW/F3kvUWq9w7w07ydBgRBMnmALca0j8TYS462e1Z
         tq74bziW92OpXxDuAegjEoiFEsQOjwKZQf+tIHh9h3ze1BFo1LrTjURfxwovnWEMOays
         KeAg==
X-Gm-Message-State: AOJu0YwBFreD54LNMAavJQh52dWvNKXN4N9Xjc/c9+IfyRWJYZS9z0+2
	4k+zspzmlCuGJ2cBcGHijJL/VzIwRo3UP/Hr8xXU2A==
X-Google-Smtp-Source: AGHT+IGPH2zPpal2bpCB1kVhT4XQQWq7gTrrKUKB0nMKnPJYN8iHkqVbVtjTxFIwIUezE99urTybY4e4vygcYKRnwmQ=
X-Received: by 2002:a0d:e905:0:b0:59f:69ab:22f2 with SMTP id
 s5-20020a0de905000000b0059f69ab22f2mr13534388ywe.40.1696821779171; Sun, 08
 Oct 2023 20:22:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009013912.4048593-1-fujita.tomonori@gmail.com> <20231009013912.4048593-4-fujita.tomonori@gmail.com>
In-Reply-To: <20231009013912.4048593-4-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 8 Oct 2023 23:22:47 -0400
Message-ID: <CALNs47tnXWM3aVpeNMkuVZAJKc=seWxLAoLgSwqP0Jms+Mfc_A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/3] net: phy: add Rust Asix PHY driver
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, greg@kroah.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Oct 8, 2023 at 9:41=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> This is the Rust implementation of drivers/net/phy/ax88796b.c. The
> features are equivalent. You can choose C or Rust versionon kernel
> configuration.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---

Thanks for adding the speed bindings. The last thing is that I still
think we need to figure out a better way to generate the correct types
for #define values (discussed around [1]) but we can fix that later.

Reviewed-by: Trevor Gross <tmgross@umich.edu>

[1]: https://lore.kernel.org/rust-for-linux/CALNs47sxuGVXBwhXZa5NgHQ8F0MH2O=
oUzsgthAURE+OuTtJ1wQ@mail.gmail.com/
