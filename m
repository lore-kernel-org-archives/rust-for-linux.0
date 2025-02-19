Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239881DE4E9
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739962490; cv=none; b=UfsZkxVkAPNJ2bmlPUsl7EwfrwyHlaoErXGBBMnzCf+K+f0DVhgFtPwPjJ8uUl9DSxqkW0hAIYJ02b7ZEOeQ/HkWAp5mzMAllu3kOSoJeHr0VvIoFtJ4nUqa8ij5pT2FJNtKNlbpzU9RUAVOkFGQm5gT4BDOeh4L7oUjM52a6C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739962490; c=relaxed/simple;
	bh=xIiVR/mUs6fGi4kFkCT5HKpm2bDuCcmRpr3uLRr7IEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MD0QidVyHhOgzs3AOqY+w68rl16yx6RwPvOphgWxo1ffm9UOBBOIEf6UoYgH71kgiR8QoZAK4y72Z1bUqwwNASC+y8dVh8g1Z7qbd+HZ1RmhuBcI+ZvxYfsY9PUOPwjXbAC193Rntl9snxKXSP4Kv9USwEiMu31A52z4jn/S+f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REaMlzi/; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REaMlzi/"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f74e6c6cbcso1453143a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 02:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739962488; x=1740567288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIiVR/mUs6fGi4kFkCT5HKpm2bDuCcmRpr3uLRr7IEc=;
        b=REaMlzi/wb2yZiCzQ7U99VQdm/x012B31oZgj+1dZVxnis7kt+A7IiNHdcVaDEJPlk
         KRU2/ZqHJwXQzm6WD7NnTSnWISu/X0LgHReWJxhL3dqZ5sfkHM0YxBMm/+orcquyOOXN
         VGT60+eZysw/35dLv+JZGOqb2jOeq5R8sJQHUzYAc6u2AacDWaF1C/tP68ghfn1yPjwE
         nSQXdmrh4/x1w4DN01Sd6a3S32Ao+63Umg2otCxri9SO/6KrnZKMNXCN9jp8ssYqhz/b
         deMxVHgQVD+XRaq8IQGRDQDSwpSIwMvhhTeuHFyJCFB8MJxZYzQl0a6R9gGZIk2v1gaH
         Na4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739962488; x=1740567288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIiVR/mUs6fGi4kFkCT5HKpm2bDuCcmRpr3uLRr7IEc=;
        b=MbBZUy1NBizfZtnnlbNyzgHHk7CEZRvSkLEP4NN1ZjsiYbppcNsuUgND4Rr91E8RJg
         4cV+YgS+b3FqlqAwyamvtWRKxulk74O3nS4PJpd1gkZo3LRcLpypuw+IAYEtr9295oPL
         r1/7HsMSyLvO5uvzVKGVaOyvTj7fmDaiVePDxybtaACA6rSZAKPbm8Py3pUcgBpcoJWG
         CXynBk1Zusl5Bqo3X3gc5q6HOoJC05rdGQjLFmqAfSKJiFERp62w3q/uIwmShnxKvkPj
         Ki6qf6z+UZjHSfv88veTt9ldJUJTRhMcxHt3zT6wR5WkgM1osi5VONYuwD5KT3bGDrcO
         +W3g==
X-Forwarded-Encrypted: i=1; AJvYcCXPvoESf+3pDmD7r9frfIB+MC1r7NHfQlrynFj3PE/1Z4m7CWOgXLDpMPTdnTMc96fcOcTt9MQeVnWuOIPmmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLZ9Jty20rCoAPt5R0JGNkrR6mzmlGSynwm9FrTVIZd+0adWk2
	1AbFTM2xXyFX8veYdx7YSn8QdipowJINyng2Ue8maSwcloPqaXNnebTbL3WtGyO2A0vrumPZUr6
	gIKnicPge6gP3jE1wxW+i+dCoEZI=
X-Gm-Gg: ASbGncscurZVqmxrSLg0tUzezpkoMmGSw2sOBFZQZofiwzXKW23F8lfbDxQj3KMgmgV
	RHPVsdloG1PVT46d4aXb/KXYM8G14+BaVpI57hc7RmHG8C+/jJw8ak9o8sTNnUJY4niuGFANV
X-Google-Smtp-Source: AGHT+IFQ+crdBFh3PJXSlTobLC8BmDEvCYXRkcMpyS58m2ETuUUA47rX2L2H5kWaraHK03EltJ9v24TeoQgQfBG+Bd8=
X-Received: by 2002:a17:90b:1e05:b0:2fa:17d2:158 with SMTP id
 98e67ed59e1d1-2fc40790a64mr10845548a91.0.1739962488276; Wed, 19 Feb 2025
 02:54:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <QD0GOJgCH2aX4JQuTDvwU-r5K8zcpSxD3eN6ixps2goHl3elDKOJFlkzUpSQSKaYDFls5CElJa-QXcoHLpInog==@protonmail.internalid>
 <20250219055516.359454-1-dirk.behme@de.bosch.com> <87y0y2e55h.fsf@kernel.org>
In-Reply-To: <87y0y2e55h.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Feb 2025 11:54:35 +0100
X-Gm-Features: AWEUYZkSvzj7MGGs_fJPUYe6SnTEWBl_4MuDVLXkyh-6B9TN-kGsVbE9i8p4Wk0
Message-ID: <CANiq72=ixg0kg7gY1m32pQ0f4hZDDdgpZ30hotHD=C7trevMtA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: types: `Opaque` doc: Add some intra doc linkage
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org, daniel.almeida@collabora.com, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 9:06=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> You yank the effect of this change in patch 2, so maybe just leave it
> till then?

It is fine -- this could have been an independent patch.

Cheers,
Miguel
