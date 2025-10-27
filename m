Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D243081CD
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Oct 2025 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761577433; cv=none; b=B8kQ+Xx1L8fNXlPfGTclMCErqcgoDoe6RwW3mwg1rmIhL6cax11mZMe/lN91QTJ+b3ydfEH/ZQODH5RKpWmKYirta9S89okFtKFs2WUyxVEpBX06hgRMx5zkTthRTp/FyWHzJc9GezoXCOpbs05u0FZlSGWCbfNTzoJF68fw4Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761577433; c=relaxed/simple;
	bh=DApS4hcsGD3zyYGWIsdcOdWVaOZg+1nVqfikxiXnXSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ke8ASJ2BMiq9AGcm15dYMgBx0x5mxrt7QARM0prE36a7ubkhA2mdq0snnJv0n8u/zu0ymrpfN0cY9Lv1aZdmmWLl52M+CvOwfeEg3gPoq3hAJyT457cPf9g1VGU0Kk7rr+jfcbU8v8wHOHYV9FU3+0G1huW3QpP2b20rT7wnRBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wx+VCM2R; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wx+VCM2R"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b63e5da0fdeso446585a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Oct 2025 08:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761577431; x=1762182231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DApS4hcsGD3zyYGWIsdcOdWVaOZg+1nVqfikxiXnXSk=;
        b=Wx+VCM2R0fsKVqU9b59kYe+stTvAcTu/QgA+Ri+sT7Gwfp8avWcfVp5u7UE3RFIolj
         KECsraq5ZrAsP7xv3453oaPG3CFfFP/AM7qEUvuFWqx5f3K2sd8+jfmwnHkSugkeNxKK
         5mw0HhlmmsgGhmaeyLA023YxVsqyBUCiaRy0QXPT752dj98VjOtkvwFwUTUcEY6JB/Mt
         7bHqaxEddQhWy2bgyaiWLR9YQx6Jst0Ff5HL1pyp6WnYH2shWE2WFb8xiqzhngjd1jSm
         jk55Z0CN9uQArwUieaJina6bcaR/w4WxesygZowXhPaCnV5w4DFeEU+YLdS2DQdf6Uw1
         xaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761577431; x=1762182231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DApS4hcsGD3zyYGWIsdcOdWVaOZg+1nVqfikxiXnXSk=;
        b=kVQGt6LBfhEWPLfyAK5LiFNUebHzGNsVAqzukrYGuRJvq2B5s7MkYS2ModqBIRH78z
         o3ZBwLpgmJkpP4xIzrYJBTz9NLDedW1oeqgy9HuJ4P68FsYBSRDjfxJrgNMgeDbRqqZq
         5kQ2PbcKqm6mGhu0nLunp5SA/4csXoGi+66klP2ETyPTZ//+UtWEst6OHICJYfdCvtjC
         v0sJqakCGHXeynLncAKQNfh3Jibta3+sZIJ6MC5nTIeNXRvzqobRo6PJthqFDf8OdEnq
         WqWM0njOIN2aSKqyXJWzC3kNk1ix1sq3xQOEIKRzDQToorWyeCQTR12uPKtrZqanSXuM
         g2wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaegFNTsKIR0IJv544ZzRaBMR4lC78Guxnf3Fe6bNz1VM4gOD/UnmuZcB6aStFFYf4ZaNcWlLo/O4boQheNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc0ykTZBw8CkgVjW1gYDbS8LLzArVJlJVKCB7AsACxtQgIdt/g
	KXGzTDeHHZI8ARp1clCFhDV8eEUK7/1EJcZvVUReeJ8IaWOFdqShKcSSPxEtKMRL4SAd9LlPi1h
	z4mkNQHpAAxphnaN0oUNv+XIOCKPpNAM=
X-Gm-Gg: ASbGncsRPPqlFPZ9uZI6SyCNtO7CxtrUK4HvdcpIION5u/voMF6WJwxsR2NDg7Hcd0f
	6uYbK5F2+o2wMbelo96BtFM388uiKcnj04PGxw5rTYnHm/V4/IuBNJiAwI/QoqwQKHQ8zFYHGIg
	v1b1ApBRR9WPc0kDKyzTJlrisRO6foednBYqYzyjGmagEpyKV+1TjwkZSx1aY6hApXKCay/6TKX
	8IuXt3Eak+nMS+FdWqE6Sw/pMxMZGXdaQ0fNnMfWMqUi8RlnsmqRlPtSlgf583KETiv9CuK9cfb
	K9jCGtAefejORh33XVgIhPEaPONiiRi59KiOBLohxB8R3QQmrLimWM2vXy+ukekkNIjR1I0nRMz
	yIUE=
X-Google-Smtp-Source: AGHT+IHZ0l03J1yw11Ees0ZvURyj2fdVG9g7KrsSHbaLFL6bHoHKGgLcoCtIOomRh9t9yoDHMruQdA66vlTUVakQCeM=
X-Received: by 2002:a17:903:15c7:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-294cb38dad8mr1426145ad.4.1761577430243; Mon, 27 Oct 2025
 08:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016231350.1418501-1-ojeda@kernel.org> <2025101758-mystified-prideful-8016@gregkh>
 <CANiq72nXw4+HesrgNqJjTy6Ji=pVqUMzx7GDO+6U9VYWezTt6Q@mail.gmail.com>
In-Reply-To: <CANiq72nXw4+HesrgNqJjTy6Ji=pVqUMzx7GDO+6U9VYWezTt6Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 27 Oct 2025 16:03:37 +0100
X-Gm-Features: AWmQ_bn7EsgCH1WfjYQWlmM5ETWJvrKP7qcsX_xSwmLv67g4Qr7Fxq14134xbNs
Message-ID: <CANiq72kn9HZy2kYaGHM9yj2nR+SAQ=J=Oh8k2doPFMDCRy1wBA@mail.gmail.com>
Subject: Re: [PATCH] rust: usb: fix formatting
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, linux-usb@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 19, 2025 at 8:59=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> They landed in mainline, so Linus' tree is again `rustfmt`-clean.

Pinging about this one so that it is not forgotten. It is the only
missing thing so that linux-next is clean again like Linus'.

Thanks!

Cheers,
Miguel
