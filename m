Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423884503A
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 08:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722501969; cv=none; b=t3iRi0WE6NnpLwR8pjha26evOe435MdbJqFM/ljz0uBoxCkxSXAS0gYjxnh2ejn1kvOiG4aHb/k2pQVrGyh0wVAIEO1u9RXi3Hg0/YxjHroIbX14Kg8rYMuypLqo8Rop0jxGAX06lpw5vC11pzDu6LbeIdQQ4qd1j4CFC2kv4Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722501969; c=relaxed/simple;
	bh=5nfLyUhSwdCvNZ7U1JIKCThQBYGQcPVVZFNOS2yg99U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/E2kcyUvjl9S5nZnL/DbFr51ACl5k4Pc9K2wHtq4HBZHP0TDYjDfIwdbBHY7efRuSsnrygvt6DY7zeEFN7wqug0Cj+LOHxUnnX6WbJmR+XdaSs1nfySmn7q9bLfv2/Vv+KnVcQuf+TDwkLRHCssM43ymLYK+apqvJCOjLfQ8EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FTF0jKq8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FTF0jKq8"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52f01afa11cso9965039e87.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 01:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722501966; x=1723106766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nfLyUhSwdCvNZ7U1JIKCThQBYGQcPVVZFNOS2yg99U=;
        b=FTF0jKq8p+PDVpwZ//pp1LJgmFSTtVYD1FidUhseUC9MegaStm+BxxRD0Pe/IKnOCp
         WwqpnWW635/VxTWIYVnKJYJHU3yf26kCGcUTfnTgHdM9wI9Qsu1r3pq2dQsLUHKU7xSn
         +BAhhoF27LjWF9bSnbqvHm1anrA7Eby35uyaFT3ya4DFlfOCy82NyuiFkT9lDvJbfA8K
         HLu6wp+L1WsZB+UbG23QM6SNd8L7NzwfN8v1/ic+5zBG9XV94AlPMk27NR+gUT2gTUB1
         Sag3q9Dgh5PdYfL7ghCMeXxtk+BtsGKmZUR+A2mVnjCRVlM57JjUHNIFHhQkje38BdqS
         mw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722501966; x=1723106766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nfLyUhSwdCvNZ7U1JIKCThQBYGQcPVVZFNOS2yg99U=;
        b=EVp0n/B/EpHJbJfNg0OeoxiU6oM0L8YQgHOXO8Z5UMfj+1YuvZNRPMAVptdxwmOxTh
         0nAZiGhH3P25pbRMVYuYXSD0LWidfNY7ca0idNLHPjsiS1gJXGs+5FdOj/OqjXlp1QPf
         SPkNtvtSWNezquw8thb1FZeN7oicjLaxObnFZTi2dS8Axhy76PuomiLszLtpq/3CGtO3
         72oiGlusoe1eoPGRNB6uXToDonD6x/wkBU451Rvy/Qz9hgYT5TmtO6DEGm/2WcaJp9tl
         3HwG1lXMlDCIMDQ18uhHdfJG2WbB83HbthMrVfFlvVKQ6aKiNQ/azSjPFc6dsPqApeeg
         vuUA==
X-Forwarded-Encrypted: i=1; AJvYcCVV9Gaf5JgGowUVKhcaqoHrF6ctjk6Wmt+/dB8BlXa6Ukcy3MhuXClZ8Bt37t4328p8Kvh8wOKdyntsmNz+vyaZXMSXzQDSgyCJFYla5os=
X-Gm-Message-State: AOJu0YxRn/5Z/YQsTng56AWSzADbrqA43clGhOOV+JdJUPPDxh78AKlv
	WpPXbV6Gab6ltmAMyUieMQ0gy4VVQNK1mlUMQ8U3QMEefIvThZyqmO4JnaoQg8sYx+6rksz7be+
	R2CJj0P4KpJTuOo9Itc+bK+lBdqz8GIVMPkAA
X-Google-Smtp-Source: AGHT+IFN2UR8WSAl5gylhHpTY15QGFvKiCG7UBeB2JpSyJXc+k5DXeSah0KlURrlJr8LyFkVwCQAWTEobHctV/efbmE=
X-Received: by 2002:a05:6512:685:b0:52c:82fa:ef7b with SMTP id
 2adb3069b0e04-530b61f8e09mr1087052e87.44.1722501965930; Thu, 01 Aug 2024
 01:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-9-dakr@kernel.org>
In-Reply-To: <20240801000641.1882-9-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 10:45:53 +0200
Message-ID: <CAH5fLgihauE8enXj7x4BjtpXpG+CkWDrfx=3LOwQAuRXgMxybA@mail.gmail.com>
Subject: Re: [PATCH v3 08/25] rust: types: implement `Unique<T>`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Implement the `Unique` type as a prerequisite for `Box` and `Vec`
> introduced in subsequent patches.
>
> `Unique` serves as wrapper around a `NonNull`, but indicates that the
> possessor of this wrapper owns the referent.
>
> This type already exists in Rust's core library, but, unfortunately, is
> exposed as unstable API and hence shouldn't be used in the kernel.
>
> This implementation of `Unique` is almost identical, but mostly stripped
> down to the functionality we need for `Box` and `Vec`. Additionally, all
> unstable features are removed and / or replaced by stable ones.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Some of your impls could be derives, but looks ok.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
