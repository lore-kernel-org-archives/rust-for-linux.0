Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D284A313547
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 11:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762948258; cv=none; b=bekQBV1hzNZfhPX8UeIHVFkGo26RdAM32tHDFtcBd1PIvRQ0br5JEa/1Lu5obUuWPdhKt217jB58Z/b+HWI5QwjjNKujz849+amV3vIKbgAnsmEB+3/KyJzTwagEjaClr2/ExFf2KIv+vHhCRpxWImR5ku+1glIGpeA2+3tNfIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762948258; c=relaxed/simple;
	bh=xvlwHWf1SMuF3y/TP+P5AIWO7Uq0VOvUIReTHrd7u0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3z682YP8qFTH6Cm29nUTorsf+aW2Q1fgCtQDB4wXe7VrQpFskDuVMLzuG2NR4DId9dHpaQS4HYAqVw0vf4qRFrRbAhFrt+2X7caoivHVn0UuOKOy9w0xx9TPyUnIHiakkO0V9jblU9oVx5rTeDe7Bk6YUzrKFWGpUXS4jOZn+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGuhsPBd; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGuhsPBd"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297e2736308so730615ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 03:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762948256; x=1763553056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6GdXqVWriU7YAQ5HMP7u4HkP5SDJbJWdJuWZZSvfNM=;
        b=QGuhsPBdZE9cQED307f+SafeY914FbvXj8POsaolQcBzXmMK/4NtLBVc6Vp91LpGfY
         RBhqDkPBpyLtL7ktt9cJ1xtBlckGcfG8mv0lCXDyAaIleu54IiHZoyqGHQO+YK35csyJ
         rd+A9YiCqRl55BCEnPwn9gJXsdKA9WO9gwxDjd5V+o1xUItzW3QOFBPKYMVbf5X8RzXs
         TvGw7bqxIot0UennmR28YRVARIO65YDTZ2OwVfjv/+stGyHyQOexvEiwM6XdjkWzC08D
         LJWFTwwamr9qZNpVdmv3RhvFYzWP3b6WyGUHBJNg6FwlQfaSqM9TtBhy5je+SvAuNL8R
         SCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762948256; x=1763553056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L6GdXqVWriU7YAQ5HMP7u4HkP5SDJbJWdJuWZZSvfNM=;
        b=h5ISLXInvAvRDu4Yh6UcYrfz8AYAlbEc5AxRrdd+4NhLkqx6xWQsOa48YSl6A+/9ML
         lKcLVtFPV3+9YFPCFRgXSWa7fjA+KPLmepJZWNMw92EpV3LjArBZAabx67UrOFiKNtwg
         m5H2+cix0ztYmod5XNGmH+vP076ZHnHMCsq1BG6KYz7O1aPiCviPVrtff9H6d8PYbDyE
         A3aEWhaaioRiYXrZaQACLQy/lbrjVG+GXG3Esh/TBvXyzE5N0Ojof3yZQQ8YXcXLRnRP
         6S1haJ+RBugRyVK69BqljGhlWI8qx3AYsRn1Tu3WeQc8nlICQgeN7TUEYiQl3VAjXJ+6
         pQ/w==
X-Forwarded-Encrypted: i=1; AJvYcCVZIwxvzuDVVdDKg80GqYTSEDkqvU2e1/A6y1v48zjIhGQFfrM8l+q+3llPem7qbFvA+pJe59IomTVn+KG8yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm3cYyuOLyXtfYsjO0SvliQtF6p6PskK6WlxkWKxxWUAzoxljH
	b5HmKsdkDik1dwXDMnXz+o5Dtwf01puAW4vnov8KkeseMh4JRDi0UWdXiUhcmstV4/n6vRl0Cfw
	jfP4duR3PJwuCRYjlsLSfXZHYwqiVhMs=
X-Gm-Gg: ASbGncvei7ZfL/IX6VQ3JHFb/yhbudGB+B7EriKgcpdHUFf2qOvoO9ZHfbXvckiXKbW
	9EHNEM1YffWZdYNwm4Sa6OrJ6lAuquZQ/wf7tYSZuL+K8qy8/RCok838a6ANkf1Xeni4DC860T1
	iMlrzK9daIeX4jyDBRpk40VBmQS6bYOzY+IdHgNdEAlfIVwx886ItblgsTU6si1fOtTY4oeScG1
	WiaqwWwPCgj3HwCrO5Sr6pHFrsKQeeD93jDQX4AYd8e+MBAiEmWXinA/ms9gOnh+YGRgjCoDdHr
	WYwcyunIZ8ivgjphlcYJMJrvRAisw89gffSbCHd7k5Nt8c5hxX5BH7Qej78Uok5m9TpkNnEOmjg
	s09Q=
X-Google-Smtp-Source: AGHT+IHJac4HVCmu5Dh9YFRTfhcVyqy3R7ppk8nIqv7Fjiu3amcoiL+MboK7bGpoZlkJ6T+p2bAicskCFHV20oVawIM=
X-Received: by 2002:a17:903:2343:b0:297:e67f:cd5 with SMTP id
 d9443c01a7336-2984edefd70mr18586945ad.7.1762948256198; Wed, 12 Nov 2025
 03:50:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-resource-phys-typedefs-v2-0-538307384f82@google.com>
 <CANiq72maV_j1uV=2nPGbTgRabnk8cpc7TNN_FQ+ou52OpZ=k6Q@mail.gmail.com> <aRRgbZ67cuW4ZoBN@google.com>
In-Reply-To: <aRRgbZ67cuW4ZoBN@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Nov 2025 12:50:42 +0100
X-Gm-Features: AWmQ_bnHL2zcHUg9QHxtpIL6OkJJHQbSfHaurUXNslUBcWWv6xMSKUqjoGHiz_g
Message-ID: <CANiq72=5WDFCufEhLSnoSzUrTZ+dBwEeyGWO+OkGmdB5AyXqog@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Rust: Fix typedefs for resource_size_t and phys_addr_t
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 11:24=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Maybe later. Right now I think it's more trouble than it's worth.

In case it may inspire a newcomer, I filled:

    https://github.com/Rust-for-Linux/linux/issues/1203
    https://github.com/Rust-for-Linux/linux/issues/1204

Cheers,
Miguel
