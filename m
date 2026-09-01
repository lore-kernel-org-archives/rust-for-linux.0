Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFAF40B37A
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 15:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275750; cv=pass; b=u7QwCE17GsOAn9yKbbnAtyyxt+7a38kjpu20I07TJdwNG33FIRGwxjslz2t8+Ny7oEEwfZvw1Wntv/6P/OEIjEWeRHg3J6+B6mTxlKsrUHBNKdYCmEr2DROsTgkS6EfetZbEa90Ac4he5MSEJ+Oz1RdZ6FVVnqqa4qwgWBiyysE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275750; c=relaxed/simple;
	bh=HuYPxegkskPf+GiccQRsxv+rP/qZ+uaMTftGIae5Hzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIKgUw7kHYIirfDqdkUjVC2naSZDUU4gZnvCmG8pcZK8HLpLQaQZ4hl2X3rBncPhZfvvucTmdYybUXyDjwokdt58cjRO763UPsN+dogP2KdUo3eEaBynwfkHJ0gfpaEV1NytfzrAO5cHTmPUfUGV3GUDIyMhEWZELqEfvHMUsSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeqLRLqL; arc=pass smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeqLRLqL"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6a36049e770so70035eaf.3
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 08:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788275748; cv=none;
        d=google.com; s=arc-20260327;
        b=ctVCwzGTfqbzKIZp17QUHf4bEzBW/Onex29xX7Nd7Ji/lQnrdSgNGm6FESo4tYeIN0
         Lvv2llUGu8af/oPkkHQ0ry5PiEN9BWledeqNB6ABaw6gxJJJCkcmXhjElPsGVzIfPIx4
         Kl+JEuedSiLZZ0MpXtzjmIi6eGkykpBw6pvnG5yUSBJBjeRQfjE2HNIKz6mmvthF+AON
         SKPK5U2CgVjZSoc/yFmGHGB6jbL2ae21WQ0MtNCNhLM+7PW1jxjJbEFFevIx3VMoEKgJ
         pyuqt40qx7JoCLGrs1/GOU1tvAB3z+QpxPPmkmD6byVLHyTZkarVKDj6T7Zph/DVZaDf
         BnLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HuYPxegkskPf+GiccQRsxv+rP/qZ+uaMTftGIae5Hzs=;
        fh=2NfRritIk6iW57ZQGt2e6fHMLVc3x2duojlrcEGh88k=;
        b=e4WcDhs8WfTm8P6l2AWegZVPBPvLhln9mDt0h7HrPuolf31lycFmXPmaW5i7GfgprH
         8SRb3eyu8UhnHy6rnXjckgN0VJAPPWpbEjWquDXh+O1NwQgO/v6PzEQVzRTsPQDuWa5d
         Qdzb2WSSJL0Ql9BbZZMpM6C36V2CPwWEl9MovIfl/+GwpnK9amN6wYMx6DXlt689um8f
         iOaVygEEu/Eojq+HZKErEWUdNjwldhZLxmLLXfM6Kd3Doo8hNkvAJBLKGEy26KU88zh6
         QGLWsmUd9Q1PqWJj0bQCCJ7xrSIhRSdcMSCu5/6zx+5WcR1CNJksLzW7g9mkt6X90CO2
         bPrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275748; x=1788880548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HuYPxegkskPf+GiccQRsxv+rP/qZ+uaMTftGIae5Hzs=;
        b=OeqLRLqL2m3aPFmIV9yysbgK7q7jLF9Dqw0Jb7OaIBbJJBchM4MZDZxBJvPGUbrk7c
         q65IXzrLjSLH7Atrgmv/RN1Hnd/DYK2/YJZvsqMOjASbmm/ItoIW9aga2XvdxWBwaBzP
         P/64FitcWRmxCcOzIuwb/7ZsnjkSlW3pD+aTY+Qaz38rrdJjjXyJxUscRYT/aFxaZsXJ
         cT4SA12pxTbAlZwhkj1r1SX3cOEOqe4R1gVHLYKAHErkaYwaKOUpvDJko3A6XIPX59l6
         0hU1+wxQeVRmNMwWdFjSJeYMHY3IK83jjaLmqt+nzXxOGKpxRmMN8BsktAGO8GchmPDE
         VcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275748; x=1788880548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuYPxegkskPf+GiccQRsxv+rP/qZ+uaMTftGIae5Hzs=;
        b=UIFX6RBCzaDolOzE/Pmre9/aiHRTuf00bFzRGYdhg5+JShn7v8ZQQetkCP+b33XyDX
         3UO1AtHBuOUDPkOqxsE1ZsSKcHRn6zbx2Fwn6UE89Bf1dUt/dc+0VJe4OO9nvRQbK3SW
         /ZutK31fzD1468ttzTVpRq/lKUNMBcWIRj1KiDyoIbdADwe8Bs6zMFQSLejmio2oDKAT
         yyLWyNxoSPfaEuw/PwXNeNkbNnq4YURYtGvJ2sa9YESd9KanKMLr6M8hukkUUncK9syw
         IagpulN11Z0ofXSq9gD5mCNne9QTCmbwcQuTNx+Fy5vbXhXcPXipK82rUsoOTJFOKFza
         FqQw==
X-Forwarded-Encrypted: i=1; AHgh+RraviX2AHXUh94l92PXQeAcy9rbMOUbUW7diA2PLPnATMeNF3EmGn683jE3K31sQtb6wMwRp/au/LbbbWM15A==@vger.kernel.org
X-Gm-Message-State: AFuF++kWO8nTL5rLdnXf28wMSZwI9U/U9JHDvwue9P6XeWuPoONZt2SI
	SLj+1w6aePkzcW0IikdY4nAfmp5T7Z6V0St+rzd1s9o/2xpBYw4SNdWJPRaY6NtsKLqnWMqW/iX
	kiOm6INasSsK7q+gkHmoxO5PPFnmYsp0=
X-Gm-Gg: AR+sD11vhAYzsQnqEwrF/BrvKhtz16wH+UpkWwxa6U3DlN6h/S0qREuUA7/bmbbg1VK
	Oce/NTSaHlkyD8xp4ZNAbwtg9R77YJFxltrCol71pRTR25TlmeNg9gQhvGe1SCILChegE+m8s8K
	QI5Hf6NsLAHmH5KLYTETanmVXyL3wfugdiuwdiKhCmbFWUA5k68Sz3uyjiO1lqOfi+Lb5fH9JRi
	SqGGeIzqMkQ/TCnLIlev4ODgOBWI4ixfjDdyRI2B3btj6+p+a1xYyixVZ98TrJAHm89CytJ8elZ
	c7Hsnvybq/9PkgiUr5s1tPI4IRH8e4MrWjdRKSJmp7pt0wJwUVgOvq6sHTP+kkez0d+Xz2uZogs
	7pqQ0kevBft3jgO2zoVE9SSHmiPthtfGJp4rxAGFn5tuwWnTzW2RdnWgPXGiv
X-Received: by 2002:a05:6820:a094:b0:6a3:d9c7:376e with SMTP id
 006d021491bc7-6b1c625227bmr13192942eaf.0.1788275747912; Tue, 01 Sep 2026
 08:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828133543.2259029-1-georgeandrout13@gmail.com>
 <DL2Q7DG3HIF1.6IU0VQX54L2A@nvidia.com> <CANiq72nh1MtnUU=sDVjRAEc3DxAmKcd21cdPohPwjDizujngFg@mail.gmail.com>
 <CAESH5ocNhHk-vNSH+kODfxuUpo26AO_uPao-8qR3bk=Kw-c3sw@mail.gmail.com>
In-Reply-To: <CAESH5ocNhHk-vNSH+kODfxuUpo26AO_uPao-8qR3bk=Kw-c3sw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 17:15:34 +0200
X-Gm-Features: AcwNN1UvpZ78AwCbPQhdzJX1I6Ers-qx8RXoCcu5SYg32Ous5g6lZNPBbVoK9SY
Message-ID: <CANiq72mgZg-QBy4gwzHmD4gJm4wScktfpdDtyZt3Zijk83h2CA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: bitmap: document panics in `next_bit` and `next_zero_bit`
To: George Androutsopoulos <georgeandrout13@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:09=E2=80=AFPM George Androutsopoulos
<georgeandrout13@gmail.com> wrote:
>
> These are public `kernel` crate functions intended for driver authors,
> and nothing in their documentation indicated they could panic.

I tend to agree, especially since we have treated even documentation
typos (and especially so if they are public items, i.e. rendered in
the actual docs) as fixes before (not typos on mere comments, of
course).

But it is also reasonable to say they aren't, since they don't affect
the end user (directly, at least).

Either way, it sounds OK :) Bitmap will decide when they pick it up
(unless they want me to take it -- I will be sending a rust-fixes PR
anyway, so I could).

Thanks!

Cheers,
Miguel
