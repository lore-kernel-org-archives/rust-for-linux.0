Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9A73993C
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 17:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="fhYDhEh3"
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDED1EE
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 10:35:46 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a7b91faf40so1174617b3.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 10:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1697045746; x=1697650546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIY5526cSOo5HuUd0WMK7b4fAyIKUG5CB3o0hLJzb50=;
        b=fhYDhEh3qtBOHIJgJoxdq6G812gMM5TnlzaSQDH1KKpqe16f/lv31QkCQgOFYX1fjX
         LueyBgIaV+ie3jNvTmStwmHK5OkQbAQV+XAFAnQDKEIL6nGHXqbLAtM3yp4CxJrXMGu1
         d7WFeYnyTHJaxyz+QweoFSnbNxlyXX74m5VeB4MyjEJ0f+FwsKmzw7cL9RsMWO0ZrAaP
         CNA1TwivFmkjVcUHgo686rdjtrKDLMqWnowHVHwcslD3YWRHHGhF/PRg9X2Vk8b9icVd
         hXw0v9UAJM4ui2Yv/KT4M2TXFwZVNtbhVn92EfY0NPQvB6k6+SxI+hCv/0UyIJxlsdDc
         09dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697045746; x=1697650546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIY5526cSOo5HuUd0WMK7b4fAyIKUG5CB3o0hLJzb50=;
        b=hePVyWYBV8dunZLLIJ4pz335CEF8Qs6+Op1YeP1xaA3DKZV3y3LuTZYgFpy0EKoznS
         +WzexFabqTl8fshpWWX8esu6pJe90ts0Trd+OBhxQxvWnc3DX/1Nz80XMUfmkRb3zb2c
         eyb7rimHemoWH0S7Y+xsWnbQMCtn/aBUW9l9+awOez8qxxPG2DI3OyROGUoSey/+gqk7
         dVj35aYRQ+d358+19XoMYnuU+C19Geevav9LXAtupRgvBnJKOa2Tvri9MFYY7PskLUa1
         Kt7dxG4nHQA03cvoavk7Ds3apDNY47tFetOdjtCxrSfyQd3LEKVQpWxkkQyX0bv495iY
         O3LQ==
X-Gm-Message-State: AOJu0YzIe0eaqq6imzsuhACX40Mgb87ajKAx80ZTSTBMSgbat3JyRUlj
	nwQdCCk25RptFP2SOgoMxseH/p754OFpByVl2xYV5cZxL1C7PodwuohNNw==
X-Google-Smtp-Source: AGHT+IE7gMJ+zAQisyPRIG8GvX6qmBtkW7K07txufnZ7g4bXtRia6o8ZBb4QfXqGpCEf9HNJDUmENCRJd0K3oLxfkV8=
X-Received: by 2002:a25:b1a0:0:b0:d9a:44dd:fe45 with SMTP id
 h32-20020a25b1a0000000b00d9a44ddfe45mr6329144ybj.49.1697045745850; Wed, 11
 Oct 2023 10:35:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com> <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
 <20231011.155656.1088666692728270489.fujita.tomonori@gmail.com>
In-Reply-To: <20231011.155656.1088666692728270489.fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 11 Oct 2023 13:35:34 -0400
Message-ID: <CALNs47tegHJNBwckpif29UAorOOT0fbpBMMRxeU9e6UHzKA=Ag@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: wedsonaf@gmail.com, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 11, 2023 at 2:57=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:


> >> +}
> >> +
> >> +impl Registration {
> >> +    /// Registers a PHY driver.
> >> +    #[must_use]
> >
> > This function returns a `Result`, which itself already has `must_use`.
> > Are you sure you need this here?
>
> Ah, we don't need `must_use` here.
>

Whoops, I suggested this but gave you the wrong position. I think that
applying it to the `struct Registration` rather than the function
would give the correct behavior of warning if the handle isn't held.
Mind double checking this?

It doesn't prevent all cases (still needs to be assigned to something
like `_handle` and not just the black hole `_`), but it should give a
hint if anyone uses it directly. You can also add a comment

    #[must_use =3D "this must be assigned to ensure it is not
immediately dropped and unregistered"]
