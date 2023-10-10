Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C698354E1
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 23:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="nnpXzSxb"
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9B098
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 16:12:55 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a7ba0828efso19418987b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 16:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696979574; x=1697584374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koUGrcPWC3s6cj646ROMdpigwc+NhJOp+QlvmhaIuxY=;
        b=nnpXzSxbGdfXoRKJnHvuMCmYN+3q1JzZOvfeBi4w9lh8wx9dPPEfL7aEnlkY4g0wzl
         TGgdaLd7oghXjgUwxArHR09cFS9KCM4xb4cMDwDs4EaEtLdUbxLxOBBglEACfackBfAQ
         KKO+MytBTjG8TGgbqs6Ip5dySFhd7PyHYL6K9aQceJHzLWuu6f1/UaFBS4jMjngLLj62
         l5c/UmqNmbJ0b30IRuzrjDrXKi+Blr5z6Fxnd5N8I/KZ74bGoZdXkHNXFuh24iLAWdja
         PaaggekkvgtPpmQbavvTvsphOTjDBGhEwadJCAPPFqhA/BHwKqB+yG/xsKfkHnvhm8ay
         U/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696979574; x=1697584374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koUGrcPWC3s6cj646ROMdpigwc+NhJOp+QlvmhaIuxY=;
        b=lGDZQco3NEO/eLyDUJe+XbgMmvKSqFi5Hfm1UlSS/c91cwMlp8+inUn7wfp+xIWqxX
         1q1Og6a8IrY8dakL3w8E7iwHujSjvTEqOYv8la3s3x9rJT8IPsyKR++WQDYO+ecJ3tOh
         EaocbfH6h8ONpTzw/lGcCoW295CSX9+Xo+N2L66NSDqVX/XSlIp53/ZQ31B5FNPGb+Nw
         7K3o8MlqHTJZbgu623iWIckiL5FIDbeuZAggibydudvzvLKYEi1+mHNbDLovEimBnItu
         2fO6hG5W6ZS/EmFJCaLvL8XqzkY0BqX8XgY9SOaVK7oFxLf8GgJeP0ylduRwRRxcyxCb
         2o6Q==
X-Gm-Message-State: AOJu0YwbHRPZQlTafJXbIwXjd6phesZoHmZp1ZDL5KEHHEk9WPgZ9YRe
	X85C5vdq8o1YCb18ERJdioUa/2IxZpW0+zn2xvBJHQ==
X-Google-Smtp-Source: AGHT+IE3/f+CxCQcNwAZI40dan2yNwsSHIS6HuZIbqowqw6LRCdsIgaSzm7WZ4vuFNhU2biMHRb34x1z1CspLl/gZnQ=
X-Received: by 2002:a81:5cd5:0:b0:595:2094:f87 with SMTP id
 q204-20020a815cd5000000b0059520940f87mr20770527ywb.47.1696979574342; Tue, 10
 Oct 2023 16:12:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com> <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
 <CALNs47svn98i7O5Gfm6nXo_N0VFod+1LVj0oe2j_q46yGAiZHw@mail.gmail.com> <CANiq72m4JhSmNjkTKh2AKwc2KJXyKh6taWFJUcjm0s_NCT-skA@mail.gmail.com>
In-Reply-To: <CANiq72m4JhSmNjkTKh2AKwc2KJXyKh6taWFJUcjm0s_NCT-skA@mail.gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 10 Oct 2023 19:12:43 -0400
Message-ID: <CALNs47uCJsTsPVPcL5-iYvzCgrJhPnEXgQ5Di-SEh5WD9vF1qQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	rust-for-linux@vger.kernel.org, andrew@lunn.ch, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 10, 2023 at 6:54=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Oct 11, 2023 at 12:50=E2=80=AFAM Trevor Gross <tmgross@umich.edu>=
 wrote:
> >
> > I agree, but there needs to be a way to use a driver more than once
> > with different IDs. See
> > https://lore.kernel.org/rust-for-linux/CALNs47vyW+A5uwCQ-ug03373xj+QMeh=
x=3D1pXZ8ViS2jZ8KhfxQ@mail.gmail.com/
> > and the followup, maybe you have a better suggestion
>
> Does it make sense to generate one of those based on the other, unless
> both are provided, for instance?

That is what I was aiming for with my example `{ phy: PhyAX88772A, id:
some_other_device_id }`, it seems to make sense that we default
somehow.

Or, did you mean something specific like storing >1 device ID in the
`Driver` trait? Changing from:

    trait Driver{
        const PHY_DEVICE_ID: DeviceId =3D DeviceId::new_with_custom_mask(0,=
 0);
    }

To:

    trait Driver{
        const PHY_DEVICE_IDS: &'static [DeviceId] =3D
            &[DeviceId::new_with_custom_mask(0, 0)];
    }

Maybe that would be better because the information is all in one place
and the macro doesn't need to gain any more syntax
