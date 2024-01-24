Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0539877F3E
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 14:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706105908; cv=none; b=Tjz827qYLXzrIjbREDxGGwMEiJfHI+cTvyijuPF9Aw4tgEtYoNZjEUNikQIm/R0hBT8bskTTNJIID/fJnuLyInPk8KKxoN2AZal5FHfmmHt2DVqTbVpFRhxwzGjTBV+m3qP6l9CsHE/xAziG8d6iQRUgwWbH15t7+PviPV0hDLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706105908; c=relaxed/simple;
	bh=v3AfQj3kEUxjlvd8r03KFoGJX1jvJ+SJUzmC0MuR3BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5jsVZelBCg8VzyEA/GhyrHyYJdOlmf8bkm1++uqs3wX5ULU9NoDAIWwE5hnzn3UBwpFnCV3IgamZ//C/y0GxYQAczLb3L1Hd6dQ1uVGCqCagdDCABZGBs8gVaEdptzTNWr4L0iPtnsoD7Ls7WZka8wxeJXURGeijtp6tFNwPUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XljhzPVx; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XljhzPVx"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5ffdf06e009so32360697b3.3
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 06:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706105906; x=1706710706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3AfQj3kEUxjlvd8r03KFoGJX1jvJ+SJUzmC0MuR3BA=;
        b=XljhzPVxhgRHVNscsE9jG7tDPV/2uKVjeon8gB4XYqtr34bWyzNZw7oxgZ1ZDtuNxo
         NfKRlhlPpJvbTJvygAOAFcA9ehMVStKRR/7/Z/VSIMgpJfRnVLsJY/rxC5wLk8AOfLPx
         3potLcvdJrhsDMHseCIoWNFUHvnaSCXSgiW1CdYLmHOVcSRfu/qQS2jGX/p4ICmg9Kfe
         71CTtZrYNoWQCBYu7jmrDpATvhWkY7taYSIC+lT02Lq3RUjqexdRXKtkRy3LhpWaWcBO
         gPOi0ouKrPmrY3HpawSRVV+wPbkkyab8tH1sjRNjceoYSuko0CBvYLJrylqGMLa4r5Or
         uW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706105906; x=1706710706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3AfQj3kEUxjlvd8r03KFoGJX1jvJ+SJUzmC0MuR3BA=;
        b=nvsVkeZESisKP3YgAfIOWEQiMtoQ+Z/RqSn16vLKVpbaS+F/bIirjKghbXRTDzLdUY
         BaGAbYwqYtDLWQNsbS49hnRFS1toAcJDpQFDf4WIF59QIkFFKzJ0Lvut7kiDCYBpwytc
         q4e98ZVIMhdbj22Vc9XoqPvIzD2PbTtsm2ZWbfnMKlM2PToL38Sj+ggmzd4CzwyrCSXc
         cPSwdZKfelmhwm4vwayxtvwv6G2kPXKYJ0HeQyjaSpBfTCOyC1ev5JKoWjDOPsPawTN8
         yJQ1AhUlgK55HUBl5IQBrRVoT4+gVdXyXDydcF/SuU0QQum9OBJ0GXs8B5ybuJJ/1CiV
         +PLg==
X-Gm-Message-State: AOJu0Yycu31qBtNwl50J0XZxt7YqsnW4I1KN+3Ly1yfmzbfYzEvK3Fai
	GyosVBDcVfBJrOfVTrMQOk1D//C+iZKLV3PbBD0HA8t2vUUSYjaxlZL3NMidh3WKDh/7ZUVMek/
	zs/hRau5SZIjG1LCgwa6tdcu5UeGjTpX59n96
X-Google-Smtp-Source: AGHT+IFPMSuM4/kK0jUobdkC0kYBbbgtpN8iDkj1x49Y7Rkw8hwRXvL8AKqcbGOqiGmTDMAOD3z8SuF8gpmCRE2brNk=
X-Received: by 2002:a0d:df05:0:b0:5f6:b6b7:8a06 with SMTP id
 i5-20020a0ddf05000000b005f6b6b78a06mr528539ywe.76.1706105905628; Wed, 24 Jan
 2024 06:18:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124141632.546912-1-linux@obei.io> <CAH5fLghtZK94Co2+0agG91SZQrqke8H=oyHfmRxi2KbRTPJp2g@mail.gmail.com>
 <0100018d3bd4f712-766b98b6-4052-4e7d-b6b7-19c4a793a33b-000000@email.amazonses.com>
In-Reply-To: <0100018d3bd4f712-766b98b6-4052-4e7d-b6b7-19c4a793a33b-000000@email.amazonses.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 24 Jan 2024 15:18:14 +0100
Message-ID: <CAH5fLghKdkgNSTrd2Z+FUp5-jfHOEX=KOF72a_iHrBWRt9XqOg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: types: Add `try_from_foreign()` method
To: Obei Sideg <linux@obei.io>
Cc: "a.hindborg@samsung.com" <a.hindborg@samsung.com>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"benno.lossin@proton.me" <benno.lossin@proton.me>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
	"gary@garyguo.net" <gary@garyguo.net>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "wedsonaf@gmail.com" <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 3:17=E2=80=AFPM Obei Sideg <linux@obei.io> wrote:
>
> I will change it to: `ptr` must either be null or satisfy the safety requ=
irements for [`from_foreign`].
>

Okay, thanks. With that change, you may add

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
