Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757FF386C13
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 02:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784687144; cv=pass; b=Ec+nkSYNuwBKVlpPn4LPWUhYBuilpMdJ+SR0LLpdTlPLTVkNhEeIuFbIeOjCgiGG5v+DvIUZ9Zqp7G53qoy6OBvBueMf6U01nbOoBfzSU4AkxsCLv6KTjVuY9+ffrbRYLfBp12vSLqVUfYNyZ7JDMB7EKBDs0GNNNvKpJ23OmWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784687144; c=relaxed/simple;
	bh=ANeNjL6VR/cQt7Pb744006uEpXBPpdBNND0Q6vtONac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGvn8d2MbFCPYM9i9jcAO/ezy7VuLNXBVB4vjANBLVKmloMo2dDAO73l59ySH6PUpTfLTS3JACk9JEEv5v3sBZz6XTYqR3bnKIRqKTewmY/hFIPTtNFbA+o8udvTJmRDBXTJgZ+0hu3FVGps7iPHNA51By7Ww5BU63NG/EfK9LY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrjjdU0X; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrjjdU0X"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92f0b5ed131so778470585a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 19:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784687142; cv=none;
        d=google.com; s=arc-20260327;
        b=SJ+wHlP/lMVOpFZKV5akI6gMjHIIrfNGfZkHJrFd1OpV0aHXgGNCeJiIBprmtyCULW
         kj0UTjZvcWq9CiKNyfsXTtnh4FWuLhdec7I39kBGqg6VHMm33S0alM388Iadl2mremEP
         SPqO2FPJUx2HyHQpvxrcTNpJFo6Pndg5cJNq88rZHksk7w4oODkzE0T05Yy+RH5rYsCZ
         UmS8uEWTPpOjbQlwYWyWThift2UVyS/4B+vRffm6jWZIhOr7DuV95FSVD58wfvf9+Jik
         3GeVrk4qgRmZ7vFrgNF3mXZ4RBHEyXSIPKw26Lp4nuU91GmaEFNiO06rbhI6Pcvljn4x
         SdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ANeNjL6VR/cQt7Pb744006uEpXBPpdBNND0Q6vtONac=;
        fh=1VVvPHWFgIDUhSVWaKYpLxrZxWeX2qz/etU+8ukDewo=;
        b=XJcLhLjN2lCRWNWtI4OqI7DrkiSDHXJtCKrnJXRF7cMwYzBUYwJBysAbKOvbKlH/9H
         1Y/c9C2feM2nz5KLpjib74EBLSvskxlijGiX1bsuvs7hsJv8zsm0zS2paf/vwO/fDtw3
         tdDh+GFsdIS/GqLN76PgKvqASNVFGMC2JI+ePZ9VUYkLSFwcqp/D7qkvvTGh8cqPdwd9
         scndgxiXkyREGdSaJyZ8mJ7cGEcf+Q403e0gYNTFSngNr0aFyxgDi3aKfcHu1l/bF61x
         czZXwise+6SqhLNRZnWmHjPRedjAqay1Os9SG8zQQOMc2eeEtCAhCNlc4zjlONuBLN7N
         JlzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784687142; x=1785291942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ANeNjL6VR/cQt7Pb744006uEpXBPpdBNND0Q6vtONac=;
        b=lrjjdU0X55KIF9WLVm54dBvNwCcKZsh7SQaPXOO0Bspj2xUGw9zGsQp3f61DseQC0k
         O4UJNxEVc2IogHDnX6LKNkzmO3rafS3TbWe/QY90bbWIuw7RPvsv76FYU3n8YBSE9NXZ
         cv0GSlB2nSHW91UOskse98y1HEzt9U98lrdN9b0qnOGUb9hJ7+SeD494ZolQAqnTRSH9
         bvT0vfeall2Arb8FjbYcyYmQjTe9XQLNahRxYj2oWJ1ynyYtU/RqVYDHK5W2jnlTOKzV
         +JffTHeOX9NA8YA4YbCmhqy1s7jfmlRX0xIsVW2dw7F3cvRlhPD6RJ6YUvv2mcM9byrm
         XWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784687142; x=1785291942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANeNjL6VR/cQt7Pb744006uEpXBPpdBNND0Q6vtONac=;
        b=Alh8QmhJkQO0tcpMPQZi6CHWaSx4z4vU7K4g7+bgKldgY0uqeCCJt0Cbks/e5ohiZe
         3W/2FlHHBHu0AHIvOAf/R8iTQZhw85G7pcp2POEjnMAeWM2xMqjxc/lOXkhC7srQIWGp
         fNCKDuZ8PpVXRwaNWl21Vt44XPhv++1IuuskNDicOZEQoS9ffTvftxnIvooh8WYmpo1L
         nhKdYteEJ2DmF76R3ZJJN39vG995W7yyxYvqSTX24PgTDfmZq43DOy63Y7W4a2XJxbu2
         ZZDf4RPcKj//psVWvWMX6CW+4EqegSfocBlFt2gARH1O0Lo1U8xzO5aDiLTaBQ+hsnoz
         U+5A==
X-Forwarded-Encrypted: i=1; AHgh+RoLWGNfqOEEU/GY/yOb2I43E5vVWfyqJS9dSbB9Fgcn7tAfjStIWj5OUSVN8ZJQ8zzyAioDKiGtU84yJXIULQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn39go2prHrOzlzBHDeSagDrT+XqSGxEI1tyzKmCiftnaBEF4C
	QW5wAIAKYFs0qMQcVOQTcm+2s7JVW4k1xt4eRVac8pR7jbRqaklamKLAiPl9L9XYtNNZjVs4AT6
	5zOBG4kwUNDDkvppnrLLLojR6m4o3kQE=
X-Gm-Gg: AR+sD12H4yNkt+SbZTMSIF0sGE6SovLyeAJEzFqKQwhPBnddBLlBSKFDcl8yaZn5IMj
	63Hu5Ezfyt4zzRTPTFy+vXsXOt3CkGuCsiKKPx16/bIXL/5YLLP9GUPMTqXs4j1TfRm8M+f0b3d
	DzmXURrXZtWnnN1IRFVeLBebWb9Ipz46a96oQ4ep22QbOXjee64+j1lchNsNsreqgHc3eNvqc6t
	A6GGshmlm51o+YZUeQn2IIZStaTToRjO4X/msWfmI2vLgPzp2AfAk5QEWjYQLaGCEayHe/DzwN3
	diD84xLVpUos1qZyKmvy
X-Received: by 2002:a05:620a:44c2:b0:92e:6b95:237a with SMTP id
 af79cd13be357-930b3f45487mr2200330485a.32.1784687142364; Tue, 21 Jul 2026
 19:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617222030.15189-1-iganschel@gmail.com> <20260618121202.6258-1-iganschel@gmail.com>
 <CAH5fLggj_=zKfuanDSTJv2LVVCLnAJt7TD0yT8yqEDpakCh5Cg@mail.gmail.com>
In-Reply-To: <CAH5fLggj_=zKfuanDSTJv2LVVCLnAJt7TD0yT8yqEDpakCh5Cg@mail.gmail.com>
From: Keshav Verma <iganschel@gmail.com>
Date: Wed, 22 Jul 2026 07:55:29 +0530
X-Gm-Features: AUfX_myBN4NokaokJmYPSZMgB8b8u5qxw5iLm41XfNnNTTr10xlRQLBbAc5yDTo
Message-ID: <CAPE_3z+FV=47HmDCxgT3OQV0qZ+HvmvzLnAN9dj_7432ds+SAg@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: check context manager before creating node
To: Alice Ryhl <aliceryhl@google.com>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 1:04=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:

> Honestly, I don't think we should make this change. It duplicates
> logic to optimize for a case that doesn't exist in practice. I'd
> prefer to avoid the code duplication this causes, than I want to
> optimize for a codepath nobody ever hits in practice.

Makes sense. Thanks again for the review.

Thank you,
Keshav Verma
