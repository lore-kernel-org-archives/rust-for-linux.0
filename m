Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D593E556
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MrV3m5se"
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C4497
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 03:02:38 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7b07c3eaf9bso1322815241.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Oct 2023 03:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696845757; x=1697450557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeHC4fUNzptIsm702Gc729/mLFYjfVybbm1yE9/t+ZU=;
        b=MrV3m5se8NFOytbLB9GHYXxM2dcxfeOftqIP63agQ/mHJuDCvtKYkiI1jmGNNBz4AW
         ageS6fInH34dctCeSNHRStHAY+aGDcFq2hfzuz3Jwm4Eq8ln7n5Up1ICOV5lSzajV+7z
         ztMo+O7eJR5B/6WbabN0F9/SUcb1v1NlrGx8Je9/pwe9edeOMeBKCa0VVvdRNLDkRpi7
         i7L1X74yJfEAwNFRfmmDiXt8Aex3zm3tGKagodo/X4mgaSrDf+MGY97TIMjpKwi151DK
         pWnIEbO9a/KBE3uEr81uY/SonyTZH85HsPqi5ibIs5qpSMBcPvsmeWyvQtF0XBWVU/ec
         K3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696845757; x=1697450557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeHC4fUNzptIsm702Gc729/mLFYjfVybbm1yE9/t+ZU=;
        b=dceBC+goPtIAeASbT2XHI+wbRhv3cjCnObl7FhNwX+6SwamNkBw0tR4Chq2t6nk+lI
         sQw3Dbb3o5lzYhUpvIP0mvDun455aANBcIALaGe6xUxrcRyoIHDZacO4P+t5rbqRH/9h
         b7fTkomC2cUUC2hJigAmsDSFGpfzZGpiYKZzmY9E1xrbGjqLz0yJ0YzW0ytxEZ4caJgQ
         5WxhM+bwm5eF4d9AKxpzIKW1aK0d6PA47sFjr/sE95/qTJQkskMoWtSO825sljDk1woH
         qmMai0rH+7key3ww1+S8+8cyISb7qVpAIcbvnY1RYaocFTbd0VFsLpJzIobPP6pcjRuO
         ie3w==
X-Gm-Message-State: AOJu0YyKj/0qGqyuLPPtgGDXc4ghL8MnWw1rWschAxRcUHXHcsxcgAdl
	UZltlDBONQ7beDXEj8BdCKC9Pdzbg5M0XMINkzmX5w==
X-Google-Smtp-Source: AGHT+IFb9TiFL2rRm2CJq/eWV+YaqZXixEAA+lusEldkhIm4jX1txiBO381BakZx7EsO6YdAN9AdFYadt8kGouypPZ0=
X-Received: by 2002:a05:6102:3558:b0:454:6891:a53b with SMTP id
 e24-20020a056102355800b004546891a53bmr13033111vss.13.1696845757062; Mon, 09
 Oct 2023 03:02:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231008094816.320424-1-tmgross@umich.edu>
In-Reply-To: <20231008094816.320424-1-tmgross@umich.edu>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 9 Oct 2023 12:02:26 +0200
Message-ID: <CAH5fLgg+3B5SCFwxLz_YJT1hqU+Ev+XvLT+hA4OLpBk7Oi6Xrw@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: update 'paste!' macro to accept string literals
To: Trevor Gross <tmgross@umich.edu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Oct 8, 2023 at 11:51=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wr=
ote:
> Enable combining identifiers with string literals in the 'paste!' macro.
> This allows combining user-specified strings with affixes to create
> namespaced identifiers.
>
> This sample code:
>
>     macro_rules! m {
>         ($name:lit) =3D> {
>             paste!(struct [<_some_ $name _struct_>];)
>         }
>     }
>
>     m!("foo_bar");
>
> Would previously cause a compilation error. It will now generate:
>
>     struct _some_foo_bar_struct_;
>
> Reported-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Signed-off-by: Trevor Gross <tmgross@umich.edu>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
