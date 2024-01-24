Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7632BB0A
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 11:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706097196; cv=none; b=tC+4ovvKWynUNY97PydfQCCPWCDc+8UK2am1r94Y+R+h1sYbAq8jNDE1M5/IJ2xbP2ukHCo5kQzkJR11to5/9YNxEYmhT0iPjMe4eHCLRywMw01eQBHW4ueXjhw1Ow60a0BWhEF6WChWMampoDxhFGT/WEFlMfUmr779PVMNCaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706097196; c=relaxed/simple;
	bh=/r0gvC9hPKKB4PzuyLUk44LoRdlm4uFfU0Rw6I3Vny4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IFxXEn938v9oq4369apzOgPagJp44rOFdxj16MD9myxmm0Jxdc8JyqK5lEQraIXMzgQ5VZjXoYCnKXe3m80zjCh34SIzJc/t7L6PiLW0EAhjKZ0p0p86KmYsVjxhrGOqHyIDXA2JB9JRD12jt/sY6ROmf6NIaH0obbh6gyy6/E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zS9oVjYP; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zS9oVjYP"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7ce55932330so1083327241.0
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 03:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706097194; x=1706701994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0No3uiJe4nCYK5rzPxJQMUkZs8QGyMNVOjpXwdTbkI=;
        b=zS9oVjYPNh6acGiHcl0qz+5uoSS4iXFiLDMuDO9U5/s6Wpm/WFsS/O0YDQ3gXRIQmA
         8WpmnPK4nIAyWsH/j+9z//KAlqL49fDbs2dKUSKNtg3VlKtFmDl+RkbGwhzWajcNqhjw
         RBxGRlCNUPFyMpBXMCPk6+cEnNCjAEyKumI3Sbeu3xSZJrch9FDEmYasDFjrRYWHqCfw
         +sSeXyfj2CntERo3BA9UyzWolsA5FJxR5I8MI/WZbYtCcGufXQS37T7Oli73uNwlSu7p
         e77rBOfFfSrWQa4iDrFhh304wZ0psjoozDvPWA0khDYjtA4xR3LDmfB5PPNKpa6ANa0m
         ouRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706097194; x=1706701994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0No3uiJe4nCYK5rzPxJQMUkZs8QGyMNVOjpXwdTbkI=;
        b=VRmG48U+2TZBQhoGvyK6hgZ16yq2OMq5ytBO4Hw3PvixgQehdAUVNgLc0AaM9MOywI
         qD9x9zx4r99mzs+aolOsfH3w3Hr6gBdfpuef06UHA+Q1v7AbUwmPKeMGPhQB6psWsGXZ
         QG2BpWO9Q3PrY8R2vYEAdNV5bKBQQhkOYbjBvTAiJ+H8Be3XuYPhd9bsJZCyPiEVrRBE
         SS4M5krNKYPKROE9AkgvlCPFA5FXZD72aJcBRGH2wEa95b1/M1NYgRZAQZ3s08RHDQBf
         z0WGFKSNx2u7FD2qRCVKmid34/A+xic+ayxrbzLBZqZFVBGr7Z6makY+z9qhiV7ljEX/
         IdAA==
X-Gm-Message-State: AOJu0Yzst0n8NKNbU8Y3jUUHmtL4DVDaM5ypbq41DfiNPVxqauGZ9oxV
	7DT2KFS1mS9uCCUpqg4j0EzKz/zgFB8pJlqnAt8Ne1Y7niuuKhg4b7fVbkUkg0tqkFEg+2h58R0
	ze4lAHT6hQu7c0RtTTldkHXtx1p6NulUO/exL
X-Google-Smtp-Source: AGHT+IHXuryP/Kukheku8rD0vjwcd3AtNiYRyWthsy99APvedhkafc+4O1FtYK65wUKYRR2MWR1FQcvGy/DMTToNEq8=
X-Received: by 2002:ac5:ca19:0:b0:4bd:6486:16fc with SMTP id
 c25-20020ac5ca19000000b004bd648616fcmr157904vkm.6.1706097193395; Wed, 24 Jan
 2024 03:53:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124113241.380026-1-linux@obei.io> <0100018d3b3e9621-dd8655bf-d355-41fc-8a10-a6167b67d77b-000000@email.amazonses.com>
In-Reply-To: <0100018d3b3e9621-dd8655bf-d355-41fc-8a10-a6167b67d77b-000000@email.amazonses.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 24 Jan 2024 12:53:02 +0100
Message-ID: <CAH5fLghtZK94Co2+0agG91SZQrqke8H=oyHfmRxi2KbRTPJp2g@mail.gmail.com>
Subject: Re: [PATCH v3] rust: types: Add `try_from_foreign()` method
To: Obei Sideg <linux@obei.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 12:32=E2=80=AFPM Obei Sideg <linux@obei.io> wrote:
> +    /// # Safety
> +    ///
> +    /// `ptr` must have been returned by a previous call to [`ForeignOwn=
able::into_foreign`] for
> +    /// which a previous matching [`ForeignOwnable::from_foreign`] hasn'=
t been called yet.
> +    /// Additionally, all instances (if any) of values returned by [`For=
eignOwnable::borrow`] for
> +    /// this object must have been dropped.

The safety comment should say something along the lines of "If `ptr`
is not null, then ...".

This was mentioned on v1 and v2 as well. Before you send another
version, please either make this change or explain why you don't think
it is appropriate.

Alice
