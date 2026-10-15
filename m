Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2F53EB0F4
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 05:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043694; cv=pass; b=rHZwT4B2rS2hHHw66Qo01jQAl6812i1ATdBY62+bdf2BbvWwBlg5kc1VD1EP4+oxEA74CS4/hBDDsyPjhND+Dhhegz8zRSFU+MPjTi1rwpog+JU3gDg3OJyI0v2gfeQgwrqhlkgSfvrV+nxPSpTxlR/FPQj1fogpqzI8XEnxIvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043694; c=relaxed/simple;
	bh=CS/WlN4e7LCvLKWGXjb8Z6prVrP9B4xMbuN4Lt91l2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GuHstvK0O7BV4eV4+IimH5rqPiLFsNMv8BTs30yAnncWqLiw3w6Q8QzyOtAvk3YE/g1fimdgU4E5zGZLf+Fdbc3/fiyTyhCaDmIqNtJm/aFObsGsoT3iK/d4Dd9JKpEciv6lR7RZR0gnyHDPuvLbhGOwcYhXEFKiQmtahQBhWZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPuxM6S9; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPuxM6S9"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be41a7aba4so4533e87.0
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 22:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792043691; cv=none;
        d=google.com; s=arc-20260327;
        b=YHfRnZ9ClSor/UkyULhyH2C2S8FuMwXl+mQ59jj++EF3I1AVOrjYhMNFjvtlR/sdWs
         vDeEFo5WXy5y+yRiK8VUllY29WPEhYeNJaf4N+M8U/IdFvoAev4tQWfqE0dB4Pc6lFI1
         ZVm2vcRxdIzTxiD34jxsGO2O+tzfhfkPiqWVmlf2M61QdAlw0+aRzcaIUej5Kn8x9ZAj
         VC3Gk5LOHrP1puRtihgPgQED/BL367pN5reEwOE5XK2rLwoHPWatwNKrjf4jsXRY5nb3
         dWqaN4Nqz/jbfT3RqPKTpP1TC9nmY8rVnJuh2RWu6iUiKw1UJGXJjL6J/HfEhp7AUxDe
         ziVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CS/WlN4e7LCvLKWGXjb8Z6prVrP9B4xMbuN4Lt91l2Q=;
        fh=RkcBe5PuCKqId4OUAtEz2wxQ9PWO2YtvPeqHdwzj9LE=;
        b=MHWcMWs/GPDgSlX2d1esJaFdLzAJEobeVI06Cf1mMpcsONeUWzFNgDL9Cd1l4MLbDP
         S4QpiMXFog2ZE/UVojQFqLCyfrhV8ByXdpofHi4mRzNOQXRBUhfwybnAFNWf97Y6RxKK
         KN0RQKTBzr7HthJxUUkD9LqW44J6d8LfTZKeHEBcG5TUchkDBYAClah2WDYc9Af5havi
         ll+XUDl/0QNAi4rAgiDB7GKKjH6xkaGX4fN022B7tac6rnrA+kMFIZNtqkMGKMZyTPq6
         /0VG9jzOQMI1r4XC4XchSvKnWwmG6FtySK6xD0nlaMOP/9RSF5OS3KlSRGdcbFJNOXoK
         q/1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043691; x=1792648491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CS/WlN4e7LCvLKWGXjb8Z6prVrP9B4xMbuN4Lt91l2Q=;
        b=FPuxM6S9p2v8n3MuLy5LbCmvh3M/e4BYOVO3lYHGE7sDQYqB4AJV5d775id9IxWoQ7
         2iPd08e1ZlcOExL+wk34LR1qgzwJlqHIh2bY9i4dDwN9WxQ5n1c1ODb4l2W9et1Nnvq5
         67tw/nmX9GG/4VaH08gNR6JlZER1uQaBCKbFvYRxen/4DQhvMUNZSg3zZbT89zUJTomB
         aFcc56JH6a1xK6eGkBViLmdDd4Qa9Ak3aEAfnnGHGY/vYD4kAInzFFnWMx2s+/O3JaI0
         Iyx+Vf5+WH7zZ2YAmf1rlWuKHrrXgl+GZAkFZbFIEAWT941+VYn0PmJxF+D2bLjNYtbK
         Qb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043691; x=1792648491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CS/WlN4e7LCvLKWGXjb8Z6prVrP9B4xMbuN4Lt91l2Q=;
        b=kTT6qBMFICOFjebXia6mEt27FUeRNp+tb4wcnGLjeLdaHSU/434mUfndIFUxmaOeT3
         HeVdGTaLdW9vd5cGJqPSk09aPGYbnWJXHUQmf/FrtWO/yPvKZO4U/lXeaGv7GLUl6zZz
         +kmJQl7CSJl8kj/uiL1dAbHBQ5iMXQLqspGOEnNT7RForImM0QIUTi5edhohC4QldRWu
         u1y8V6eJjjMl5qawDuFn7yQnntF8oqwGkTz14AtHAda2wR7Ek22vwT7PrXKAtgy8DkDb
         OnvyYWmb/WpcvN5pUHyOpDOMDeeS0qfAKsVf9tOI+km/jJ8D8vBVEx0C96ALXAvWRB8m
         waaA==
X-Forwarded-Encrypted: i=1; AKwUvBwLrfGLzJd+D0USEtlI5BidwsZ42x9KJ6fL///9Zim90Q8+6c1bzlqbPOrzfgjVwaaYhVxXdWiDexVkcviV9w==@vger.kernel.org
X-Gm-Message-State: AFq9FYINbN9wl5C2+PjK4k6CbZ00XB7xFQkvblMOk8cz+KtbX5a/bIyW
	VZ1B0BIBBzLzpXhaS3JqRfq8KQHVzBkPhHeoPr15PFh2TBEqnwKFZ9E2tN+y4Th0IvQwWnHJ62B
	1rGOwsKxFhPfKxS2GCFUlLErquVKFtzM=
X-Gm-Gg: AYBFou1CY+1slIVs7J399SDr3o5Xet0kLuJS+LlVCfEkA4/7wHlk5N7zD99bfrQOd5m
	3et2/7LqLLH3ENviURyr8G9EXm5+7hgnJrlaz/NVQ+Er4O2PYm+RaJH3+dXl3GxuMDkGEu//Q0o
	ptV23b0irTW2yoxUrPn8pN2DSJyoXSDPc9axmLzFgwAakERHJQDgUs0S0OSU8XuLz4EfFAhcRGV
	ZCHPTwrbYie09AkIvBBagSwHgyW0isduISIrs2/vfkPA/ddmJrS4r7Vq7ahs7u8xr4P9U5K0z4d
	U4SbnD+9pQ0jgrF8Us+WrjSAjWTl+WjoSFversASlEf2SK7aostcQ9mJe8llEJzDuWkEHw2lP66
	Ojc2eWVGmCV0EcCThZDI16esJ/kMZraUMf0rxG744Qg7w4TnkAGvrStOqiJGJ8wov1ODguYjoC8
	8Awr2FX2Z7dJvRwTtv3/89g5L7iSFnKl0dKbU+unYFGnPW1oGVffo=
X-Received: by 2002:a05:6512:39c6:b0:5be:3f94:ab0c with SMTP id
 2adb3069b0e04-5be3f94ab5cmr192058e87.5.1792043691116; Wed, 14 Oct 2026
 22:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928011123.450800-1-alistair.francis@wdc.com>
 <as_r8n7p_wdbChuQ@google.com> <CAKmqyKOkmwompJqaP2k-oJicmXmqHY4E0wuLcrvkHLx+oauQ2Q@mail.gmail.com>
In-Reply-To: <CAKmqyKOkmwompJqaP2k-oJicmXmqHY4E0wuLcrvkHLx+oauQ2Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 07:54:34 +0200
X-Gm-Features: AclHuK9vg-7Cq6bGY2mpKNcgjuHSAWaQMnCCX0Z82MCYQeI0nb3RkBYX20rXqpU
Message-ID: <CANiq72kP=BpWL5-X3iGARu6ekW52Lt0uCxd+efa+ME02mUbSJg@mail.gmail.com>
Subject: Re: [PATCH v4 00/22] lib: Rust implementation of SPDM
To: Alistair Francis <alistair23@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, lukas@wunner.de, linux-cxl@vger.kernel.org, 
	akpm@linux-foundation.org, Jonathan.Cameron@huawei.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jic23@kernel.org, bhelgaas@google.com, alistair@alistair23.me, 
	djbw@kernel.org, linux-pci@vger.kernel.org, wilfred.mallawa@wdc.com, 
	a.hindborg@kernel.org, gregkh@linuxfoundation.org, alex.gaynor@gmail.com, 
	benno.lossin@proton.me, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	tmgross@umich.edu, gary@garyguo.net, ojeda@kernel.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 7:23=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> I was trying to avoid adding crypto and X.509 bindings in this series,
> as that's a few more subsystems this ends up touching. We need to add
> PQC as well, so crypto bindings are next on the todo list once this is
> merged.
>
> Is this going to stall on adding crypto bindings?

The general rule is to add safe abstractions first, and their
dependencies (i.e. other safe abstractions), then finally the users.
That is, adding code that calls C bindings directly without a proper
abstraction is generally not allowed.

Exceptions can be made, of course, but they need to be justified, i.e.
there are cases where the kernel may really need some code to land,
but one needs to argue why -- it is definitely not the default.

Cheers,
Miguel
