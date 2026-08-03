Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31517403B00
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 12:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785759594; cv=pass; b=uTo6UfVaPrPRr5x18F/eOxxWaaD4n1TqiNA29yv1qBaKRmAZSvy+m8IQGxGsgv5FJyN1WJD9msZsBMZ9w1/XmuZKimpMDkGGflsS7JvSDURif3z9EDlRdw7S2YUXjkcfeRQNLcH0M8A1vfOGKcCrlAvIUynDFqdiHWB9825mGJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785759594; c=relaxed/simple;
	bh=eXQ3VPWvadJYU5espprbYmMDOyZIYjhLr1ThgYip62E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kuh+kEJFp64JKZeLr11cuxRS7qgivrzRcQYDb8OsyNqQ7hNZLfUzXNh3NJGh5GrQdMiN4B55YpznGWEhntID+Odu5zUJEDxc72ZRn+zw0GglUad/C1+HVuSo0nlCvkWzIM/BM8zEHO1d5/2Zp3VVW3HaB2pHBeC+lupAB5fS3Iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=omPi4nFk; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="omPi4nFk"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cffd93cdedso4554025ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 05:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785759587; cv=none;
        d=google.com; s=arc-20260327;
        b=JrQO1HxSjK08V1ww93jxUoh7KD4Zc/rDpn4B3gn74SgIOjOOexQYyLPCt0af0jEfV1
         ri3tLCHrnZuxb266Xhv5RuqY4DZpYp164yIHaEEEQ5MGOtwNtfXFfiQaBW1SOACx5QJs
         ynbCCfI3ewcwQSoZ0QT1WtQu/BQ/snMskdC3vgJ2AOOKH2dgsmYFHX5CLtayX2QhFOaL
         cFau5EaG432zQ2edZkjG5ldBzgPumIEKqSr6eN1lnecmMjypf32tvSoLn311RSQveES7
         Sf+0pmMl7nYIvm+CfKr+6AbXcs8kofJldWWQpESSahwkicL1q2D7dJozuk27PgynlNci
         /hHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eXQ3VPWvadJYU5espprbYmMDOyZIYjhLr1ThgYip62E=;
        fh=xTMpKjicZZ2SNpf4/JGc5GYOhL+tgULyABFcDy13EME=;
        b=ikaOZ2kf2m93Y+w2mMSh938IxI+/yEPp4nD3mTZU6hCDGzMN1Yt0Hj9s2Ww0N8fFCE
         8uvg60qjaJzydb6ESJHnmY9XbzcBQwictQUCclpfz3f6PuYeQE7l6YOzUi/6jeP9Udj0
         lK+btXN0M/WHko53SEf08+1hlovBaWtVD6ryBv0LnRj8/plGDqmWNveHBy9ifcGHDk9x
         PLQs/H1/OMwgbUHqXnrbTAR0Ap4hOO8rDwcBo+oVeBrfz/+xBp/OmruVfivcUb8prIup
         6MVIwca+CEO67ZUxsavm2QZD17wk7rHTEPRdAngtpEXXl+FPHoYUmpIeebmgkwQRCU2w
         q5TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785759587; x=1786364387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eXQ3VPWvadJYU5espprbYmMDOyZIYjhLr1ThgYip62E=;
        b=omPi4nFknQhc2Wj1/4MQr+2xTg5poqCW7SrazDUphJ8Bnjdv7pGAvjVC/rJnKTcEt2
         HrZ6EqxW+t1ND2DjIuLOuA+fvrBb0AwgSTQ7fXW+AlH77sCuRIM80JNYcqSt3JPsFXj6
         ielhCSnoJxWpzbJSXbhed4AB4DdJh/8yl69NmlAgShqBxOq4d0J+k//XPDcjsdMY56e4
         PQnuSStsyNE6VE5QuJLqk/mkVAKBojFH0U2w/u3ycjwXXzC7hGRhB8Z4TUpd713q2g1B
         QdqVPAR/UYLegldWNlYFOT4/umrNZRc0Y8HuvER1mCFLqExcpSOkFpMwCI+bg4tZWC53
         9uOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785759587; x=1786364387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eXQ3VPWvadJYU5espprbYmMDOyZIYjhLr1ThgYip62E=;
        b=QjMwAviYXAC/upBVGjhfWbweLYCXhQ5yueLJ283nIlQ4l5nZwIbvBBIlFT9x17HiLT
         tL0fdafEBwCGHYdXnJjeKVTMUQKOSAb6OfPPAYceAUFzHYUd2F/lsaYFFbaHKfCoa5OC
         s7C3RpjlnY9s9iuzIFZMCd/5hEWmPFGPfmovho+BcfMQrxuOFPQCyeFHXzEW7R7LZEeP
         UZ9tq9rtkh+CImiX1Xn1yOPs4mcjslj9YqG6QmdH3y9u6UR8YOj35Kb7IMAmgUYgX2/Y
         /f7lhCL/ihIncxqpS1wm3m7S3IFIrWgawgk4sSrLSKwTmgythEgAZCtIO7tNmkvUTRAR
         m5XQ==
X-Forwarded-Encrypted: i=1; AHgh+RreZPMFS18oOtgeOOZzTU2ozgWj3Y55aX5R9TeEScwJvXmmp+SsshP8f5Y9VG01MSwOLYQn8OT0woMPNyzPKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykmaelZmskoJ6byA/W8z/X9RXBeyEUcP93UC5MptWhMsVJCEDL
	YyVC5p20jLtEgsqOA1V5oai7ZBsb36jqdOhKO2Nkm0EugulpiYQQQ6wOTRDhYlbPIMl7zEzDNf8
	ezb1atDz/7DIrRKFlDTAZO4Qo1IpqNe0=
X-Gm-Gg: AR+sD11upNp42gnitaB4tomagCBCkpfh2HQYNdYi6JH/QsSFjpi7ExG2uFtilVO2AOy
	8Zz4ib4Ph5RBHKMstcQfEHR4OR3yz+VAihejO23IzXB5MLuAi7yg1TcmlCe18/TQhny5cGpNwpZ
	/56ELkxpd6XpwfayNWwHGEv8dygW3hKJCZi0xe0gjGetgoqnLwgZSUZCwHYFRrtLhYD3EuraMAF
	9NhzUeihOA1LDKJNauay5ocJInsYKQnRSqczdjxemwVafT9Tu62AO5nHCxfhT8q3EuS3Tn587Qg
	2TJAb4D9UBywKhOEUaPYH81iqI5TiUnItnZF80mE6w4uev85hapgPuS4KLBRpU0ysQdQmqHUc7m
	xLwrvllJQivo504Sz+ZZQaBEOrNtcHc93uMMHxlyYDUpxQ403b1fajRuluGDPRA==
X-Received: by 2002:a17:902:da81:b0:2cc:d6de:d58e with SMTP id
 d9443c01a7336-2d05242299dmr147840255ad.4.1785759587288; Mon, 03 Aug 2026
 05:19:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729-merge-init-v2-0-26adf47109e7@garyguo.net> <20260729-merge-init-v2-4-26adf47109e7@garyguo.net>
In-Reply-To: <20260729-merge-init-v2-4-26adf47109e7@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 14:19:33 +0200
X-Gm-Features: AUfX_mxggK0nYOD-1UFK_0KovZ5TNjx88JI-10YcKvyrfX-OouE93-BiJh0IJc0
Message-ID: <CANiq72=b0a0cG+yXY90w30esgx16ZxJ3KsPb+5pbuPrd_izpmQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] rust: treewide: replace `__pinned_init` with `ptr_[try_]init`
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 5:39=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The `__init` method is not designed to be a public API (existence of "__"
> is a hint for this); replace users with `pin_init::ptr_[try_]init` which
> does the same thing.
>
> There are a few users of `__init` which are replaced as well.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Since you asked:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

But I obviously trust you to change this even treewide! :)

Thanks!

Cheers,
Miguel
