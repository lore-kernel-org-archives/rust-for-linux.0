Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C455810C
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="GxkqjlkL"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5ec7a5a4b34so64222047b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 12:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705006367; x=1705611167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yHX/h3d/Xp4YBP3YjAZG9bnZdbX80dmaqEAg+o5rd4=;
        b=GxkqjlkL3qxA8gL/cwUkIzJVwwwTD8pOHfpgZPaeoP9n5jD9jJXlN9r5DsFhkdE4BG
         TFa7PHSg4/f/FVR1IL/lt3DrXw1ZP6wjx9cw1XIfqjVNmWP1n8Fxuhg6tcjJZM0ZoB7k
         5waz2lXCto/Ar6RQHc/h87MLfPsbuU2HCtNzOpW1ozMwvUxdNuAEH/r8wc5zUuTjWmge
         K9gH+5gq1qWoxx3CQit/Y5DLxGzNl3N06s9ghFWXlxas9w1yqGtaBxRCH8cFmnsEh7Lq
         50HQ9lhxw80G8vfcoEPfsmyDf/ytfm37otdXv55wL+mNllLsNkL0QbV2bhQeOVCqzGUx
         mUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705006367; x=1705611167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yHX/h3d/Xp4YBP3YjAZG9bnZdbX80dmaqEAg+o5rd4=;
        b=kuAJLkxM6HcJtBYSyNSWQ/lKuoaS/2LlnxdUf6PpOVn7MpV8ZyoyNldgLjoOFDKl1J
         sZ81ZsynpYoVa7sg3j7HG4NMkae9EjLM4LWpamISvTthGr71lppinaDWCY8Th39gRfQQ
         M27pYSNMT1P2DKZPa3/g7CCi+bTJ/s2nJDsIY4hVBvTdsCR8g9N1V7X+CTfy1TFFduXK
         kckJU65qIsLSZQ6q/6/40JABaa8wlGP/s/Wmd6HwsndS9kUqlDFrZ/+xvqKL1YHyRz2D
         9Iz4ZUdZfEZyeTFIPlq+j0z3shRR29/ZZVQrWE9bJs4qNab7EKnMUl+QgidapOnEeRv7
         /wzQ==
X-Gm-Message-State: AOJu0Yx9YsN7Pqyhpm43s3/03L6LKLRWc7+EaPxzbsTCNVWWXT+4xHjo
	bn5UqZK4ighP8hyHAULB9q8Dnvv3aF/LcMGFPRd60Sm1Yul2BQ==
X-Google-Smtp-Source: AGHT+IEzly3BSy5RBgiabGGdZ1vZmeMl7gSM0qAQvsfagLNQ5ve4qsCNNu2+SQbAY+u+aF2GslJk2jft77yKgOU5jvo=
X-Received: by 2002:a81:a784:0:b0:5fb:16e6:cc01 with SMTP id
 e126-20020a81a784000000b005fb16e6cc01mr380326ywh.71.1705006367076; Thu, 11
 Jan 2024 12:52:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240111064415.908487-1-dirk.behme@de.bosch.com>
 <2024011114-tartar-jimmy-9e0d@gregkh> <4b2265c7-3ef3-4bca-8237-3752d2915c0a@de.bosch.com>
 <2024011108-shortcake-underwent-e12d@gregkh> <36117a36-18e9-4961-8761-ed32f8cce02e@de.bosch.com>
 <2024f8b1-eef2-4666-81e5-a8bca65afef9@proton.me>
In-Reply-To: <2024f8b1-eef2-4666-81e5-a8bca65afef9@proton.me>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 11 Jan 2024 15:52:36 -0500
Message-ID: <CALNs47vHptO4pzY-hAxN5LBH5JS9vS2V5CQ8Z9TeQ_Sz4vJ+Fw@mail.gmail.com>
Subject: Re: [PATCH] [RFC] rust: error: Convert 0 being an error to Result
To: Benno Lossin <benno.lossin@proton.me>
Cc: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>, Greg KH <gregkh@linuxfoundation.org>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 7:18=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> Why does it return an unsigned long and not `void *`? I looked at some
> other usages and I found several cases where the result is immediately
> cast to a pointer. Maybe it might be a better idea to just change the
> return type to a pointer type. If that is too much work though, I would
> recommend to first turn it into a pointer on the Rust side and then
> use `NonNull` or something similar like Trevor suggested.
>
> --
> Cheers,
> Benno

I had to look this up too. Apparently that's an older use to prevent
accidental dereferencing [1] (?), and `unsigned long` of course
predates size_t/intptr_t.

[1]: https://static.lwn.net/images/pdf/LDD3/ch11.pdf
