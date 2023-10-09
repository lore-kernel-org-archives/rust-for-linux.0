Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0273034CD3
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 21:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="f7fK7oYW"
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB5893
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 14:07:30 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59bebd5bdadso61040407b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Oct 2023 14:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696885649; x=1697490449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhHHmnMpAVB3xgxYZZEuhrUO5GUtsjcq6PiX2il6rXk=;
        b=f7fK7oYWJlJftB0XL1nTp0ZYAEpgw7JNQDxX9sRzoEpDY0j67r2T26bcKEZlnf/TnI
         CQ3iRbSpAsCbALPA38LqJY2SMd3mhHXW7vIXqb906+NFwZECykCJoes4lGugQF01BSmk
         LukzsK2A45EYYjJZuGcHiY5N4VWb/MZzgxI7rXQqyAE7q9WUwVLVaYVuWEtyv0rfK58W
         jb+zJvcQSSEahFicMDcR/U/niXMWFNMgC4vyOGNV1KTL6ws4iVq1tfNjLPaC/SiQpCYS
         wKoq5IHOU+m8ztNnSNfkSbLEcjCAbvn3pSIhI5KZQIV/39DPLyka6D4z6U5qWSHQGLZa
         StOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696885649; x=1697490449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhHHmnMpAVB3xgxYZZEuhrUO5GUtsjcq6PiX2il6rXk=;
        b=sNurLk7fDHgbTOVpgNRMvLLEfaApE87+8sWoihCs6oZMxa/lTQpiHw7hW7YmImFNkp
         4dYuyYSRJJxfhVF1buzOeeZ8bk0zDuUflP4e1QB8csmvBUK1EgJCtkleZ+zkQI8ZtPii
         /dzzrDu4GqHGWkaPjByok5S949CboMdAm94ty9lpvBEDIz3mN+DC+IhNZ0TLVUDnGMKc
         aG0k4EbqVFWeI/4LsE2RWkGWYOVCDnLPRTp6gSe2SjAYN1P52luXhtk6ekKuArg6/Ypk
         U7MXRiR18+r2ujUa6RDz37F5DMdNL5NJB4RmQx/7EZvqndUqI1wdwFRVuQKavs5X/siL
         Na+Q==
X-Gm-Message-State: AOJu0Yx3MHaMtMWITEkn1PW0DaYEbZo9tr0GQT6uKpAZ0gakxrWqvfNd
	fvZ3xg5sDipDqzlpZA2JvR48FdWGfwfZ78oWmKjgPw==
X-Google-Smtp-Source: AGHT+IFOyJSwDK4Gvh2QH+SIfWKit9G2xxBqdIDWi4IwiYePhqViFWyKFTSML3UW7GWqxckhJ4dflsCHMK+5nqmTZyU=
X-Received: by 2002:a81:778b:0:b0:59b:ca2f:6eff with SMTP id
 s133-20020a81778b000000b0059bca2f6effmr17595885ywc.40.1696885649746; Mon, 09
 Oct 2023 14:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72nBSyQw+vFayPco5b_-DDAKNqmhE7xiXSVbg920_ttAeQ@mail.gmail.com>
 <20231009.224907.206866439495105936.fujita.tomonori@gmail.com>
 <2023100926-ambulance-mammal-8354@gregkh> <20231010.002413.435110311325344494.fujita.tomonori@gmail.com>
In-Reply-To: <20231010.002413.435110311325344494.fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 9 Oct 2023 17:07:18 -0400
Message-ID: <CALNs47unEPkVtRVBZfqYJ_-tgf3HJ6mxz_pybL+y3=AXgX2o8g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: gregkh@linuxfoundation.org, miguel.ojeda.sandonis@gmail.com, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 9, 2023 at 11:24=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
> Trevor gave Reviewed-by. Not perfect but reasonable shape, IMHO. Seems
> that we have been discussing the same topics like locking, naming, etc
> again and again.

To be clear: this is ONLY for the rust design, I am not at all
qualified to review the build system integration. I provided a review
with the known caveats that:

1. The current enum handling is fragile, but only to the extent that
we do not handle values not specified in the C-side enum. I am not
sure what we can do better here until bindgen provides better
solutions.
2. Types for #define are not ideal
https://lore.kernel.org/rust-for-linux/CALNs47tnXWM3aVpeNMkuVZAJKc=3DseWxLA=
oLgSwqP0Jms+Mfc_A@mail.gmail.com/

These seem to me to be reasonable concessions at this time, but of
course the other reviewers will request further changes or perhaps
have suggestions for these items.
