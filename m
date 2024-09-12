Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017D4185B5C
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Sep 2024 11:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726141856; cv=none; b=HADnSjI1lv4H+BI8p1RoSU/7OD+eCUATGrxm8UNcl2m817DgZtSdzTBExZla1wL+u2fEyAqVImgiRK5FULuRY9rhZwJ21ClH5t3P8gAtddgr5dfGa2Fysda4DWiKZlVl8oxExF9psW/HVyEu5Q4W0+OsgE3ywZ0Pff9EzZqrI6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726141856; c=relaxed/simple;
	bh=LG4CMPuOFnmdH1t5axrY9tPAgRqRpiPSyXXB8gyHbKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syMKBnwp4GQg9QsldYricMMXsv/BxVjdnNOGm4hTMEfzjK6RgeETV5KeSTjTJPLXXdjtvto62evHi2899DM+i6p/itzo4B7uD/Jnfd/3ACOVkgFBrrQGDjr/zxOpesGIZ1ypc8qJxjxTBejy52NgrktzZG7HeTC5j+DFfFA08Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tx/DMoH/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tx/DMoH/"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71798a15ce5so1417067b3a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Sep 2024 04:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726141854; x=1726746654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LG4CMPuOFnmdH1t5axrY9tPAgRqRpiPSyXXB8gyHbKw=;
        b=Tx/DMoH/RAyLPKmFZCW7zc/uKy/xNnDyoiLBwPYY1nX+S7A9T8vUR3PK2M5Uip/FAx
         tSJha29PPdN1A2d/6loMEtAYZb5FxerC+nzVDIduvVuAHOA1NMuXWK0hFM3mOHI69AyM
         NLU/nUjO5Th1ffYGPRwjX9TlTfXjNlhpKsIgWN9X97BsC2v05ZC21wHJl02kqO8c15hU
         kh/gwZIpRfNDeAc2v/76Rbx86ZLuHqCle5eni6t/1a2A4sozCCo3v05n5UtME/gVuQeP
         iZkaC1DIOWlYAyBRdngLoT/3eLgiDPzLOSkgtkxBISSFr99eyH+Qmfshvwt7f3JzXml1
         gyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726141854; x=1726746654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LG4CMPuOFnmdH1t5axrY9tPAgRqRpiPSyXXB8gyHbKw=;
        b=C/XFgngWnlwdpiFd3oOIqEQp8YEcZ3dxM5nFzi5OQGniV05n1RLDROY+Lr4OKfnYIn
         mLqDMa8hk4xi+9AVOa41/9taqeZfOdM47jvc/TZyipZoAI8/TqaKzcWmiFQ7rz4/h3Hs
         iuGrASvwRrcL5kxgL1rkNcvXhZDXJiPVPL9gSqMMhiiZySyAV9WKqbuXhw20lODrm8cP
         Xp+7Ccp/ksHKah2I1stZVvfbLOVvXrHfAg42iYe7HSxJUDQIvkmsaaSTH+hb+4pc9sL3
         xmT9X4uTODsTyzNt52frjWfSMYufR5jIQnccjd8oYp9BPT7W6kQ1GNbn14c1OZHMOTyH
         3gMg==
X-Gm-Message-State: AOJu0YyFAQyJc/KjwkNADp5RHXgN/hzaPliLzl6u9fEZFfFYaA4cjlut
	d/6ttyy96/P7vpKDbetzxWQp9AqToGWH2+wi32BnND1dWr0f1+q/ilVzMB7p3DxAR/QAGZiffLy
	xWYVsy13ecg6T4ALSE6jKEgUIUiqFlulttGED
X-Google-Smtp-Source: AGHT+IEqnK7iyumn6h1PrAh4/fjw7ebiRx/lRd1Hs40/+Eny1Ow0X9VY2pxIckVJTvdkXtSNbsU1mSso0kugknqJqYU=
X-Received: by 2002:a05:6a20:c01:b0:1cf:e5e4:a24e with SMTP id
 adf61e73a8af0-1cfe5e4a30cmr1606985637.16.1726141853955; Thu, 12 Sep 2024
 04:50:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aa1b4059dfac001945745db02b6f6d9db2e5d1cb.1726072795.git.hridesh699@gmail.com>
In-Reply-To: <aa1b4059dfac001945745db02b6f6d9db2e5d1cb.1726072795.git.hridesh699@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Sep 2024 13:50:40 +0200
Message-ID: <CAH5fLghzVpHT6Z5xO_rEuEt7oANAUiVKqbjM=O6jio=2Cg7qug@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: kernel: clean up empty `///` lines
To: Hridesh MG <hridesh699@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andreas Hindborg <a.hindborg@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, Jens Axboe <axboe@kernel.dk>, 
	Matt Gilbride <mattgilbride@google.com>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 7:45=E2=80=AFPM Hridesh MG <hridesh699@gmail.com> w=
rote:
>
> From: hridesh <hridesh699@gmail.com>
>
> Remove unnecessary empty `///` lines in the rust docs.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1109
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>

Other than what Greg mentioned, looks good to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
