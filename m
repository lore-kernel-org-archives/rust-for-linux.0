Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EB742E428
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759558; cv=pass; b=Rh3k+lLUXnYdZtzvxGr397DHt/QVuGzw0p/AMEhAoqVnnYT8fc2Vie9CXYnPi6DBrj0IErnaUN1mr4sjBJPD977lqj5pB3SVSLROZoybvDylJUzLuijWFQhg4oHQC1Ljkn4NUSNR2U8LX0InyKSYLWJT7axknDxl05WRRx+1uSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759558; c=relaxed/simple;
	bh=3sCYKDjhxCoL+MufuJuPd+TE5a5HbHhTgY09VgieO1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bHatb2Ri63Xc7cgVkUwiNkCSqUNB3XrMNYpvb8ZY2qE+6Im2Z2oFGJ/icy7/2mWIpbCD0cx/6/v/Ys6VUBvdgKQWVVR3rA5jO2q8YN59f5RFPQ2x//z7CL+MJOs3n+c3LMNg+o8l2jBRIovZ1j4qwoN38DbU0vQFhNW4rnR1X/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePB+gW4V; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePB+gW4V"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-340d23b6a9eso376089eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 02:12:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790759554; cv=none;
        d=google.com; s=arc-20260327;
        b=hVf4QqnxS+ren08Ys23aXuMFii86AGZTkGFjgBIGr1Ljh61Pkqogcnjbcmr6BW1aIq
         o11fYTsIwVaqD6fda21YX4kMCzySdoYCdemmeUIhlhF+IsUzerFz7b/s2IAHE4MqArC6
         7otmLBL5FvPZPNd8RGGbmYsDru55Zgn23RyfI3Zl2sfPuEPt7kZ8FSiGxDQevC782Q1U
         dvAGgSiJAtKJe4pTadNBKIxFAp/abZrRkUaUEhGKY7maoJ4PDnUXJeDkJHc0l4fbLxSx
         0DAlSh0zXbRI4xlDYyBmVeNy4N1LVnypCXkRaMrCDQQvjsvzdJXGQe7ZS19fjAy/6V0n
         OB0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3sCYKDjhxCoL+MufuJuPd+TE5a5HbHhTgY09VgieO1Q=;
        fh=BehjW1DhjC71jp1CO4cbdbOtBvs47cPkYafuL0+iaSA=;
        b=XuEFIPYe/z3NI8pgeUrfi3YFWOgZS1Baw68IZKfO2aYEILdpJZGK6+PFiApCDJpIwt
         qdxkL1SajOulbCJ1aeR9l2z4BqJVF9KRpnxVqvJr2r2X+npwAtZ9sHVobfri3H0K6vu1
         uhINP28kXbW7whbVlp+oEt975SMClZv4gj5ca9DdIWRWu8OkO7dNZe9bOw+tOuAINNab
         oGpo//GPwchGSLuWgouHAmJOa2iEo/L7sQbuTaI1xvfKGt/ePWwfjjLGCQ+XjKyYSJrw
         UvzpJHRUpumZbi2/DxKw8rCtgTyga6nfwKEtVUeVgd44b6KWv6bdKHBoSbOszS9IRl9b
         swQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790759554; x=1791364354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3sCYKDjhxCoL+MufuJuPd+TE5a5HbHhTgY09VgieO1Q=;
        b=ePB+gW4VmymVXIUdACG+tYQ2vnxxqlK7nN9uqBBsCs9i+VP1InmWXdWKwAUBpgjTcL
         uzxqri21fLsOfHeRiXgw7q9rEl+RJkYkhDtqs+WWq7+8sZa1bION337dXRakxLR0yv9p
         AYdro6jk9YQj2DOLxZECEue5hsZvtJ3dj77+Ggk1ZVR21Xr7jSeWlp+lNmjO/FXSABdK
         DS+xh9UFdBVSUp4M2oMvnouvwbmrKwLgH3lJoQC/tr14cG3iVmx9jfZZE2dVp2KTDzKh
         fTmtn7/Cdj8uqV3tZcGpOttIgzPeMnXhPlzIrev89ebSmGFPgLmRXW0eDa9B4cMaz/nB
         AHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759554; x=1791364354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sCYKDjhxCoL+MufuJuPd+TE5a5HbHhTgY09VgieO1Q=;
        b=FvLCZnjPpGMhsrS20adwWDohHVYPE6T8d3+Trog7NnC6St2PJAOWj68SwoGIZk4bUE
         E4Bzz7l3Q2Kk0HsHJkWZBRUNt5yy2ozP93BcVMiFz4nyx2yXX+fBOn8xgEftPv2BfQgD
         4I3VZzViyeBMUpsQEaiKAFm6FplemGjbeNeU1HZNI+uDWMpwzgaaRMYYlko9EV0BnKVb
         5xpPYFDd1f8joItMDbwoQDpVxt3dJUhyjm1S/QXH5c+6n4tB8A1ALZ32YKmb61s2BnxK
         +BmK/5wAY8aJVFODwMILlzR6USCqRkGqCI5RP33hf6WVaW2TUhQureWcwPHA3xpHq+u5
         xgQg==
X-Forwarded-Encrypted: i=1; AKwUvBws7oUb9t/Sx+o6pF0gvVVX9vN6UtUYgZF4JkZlqmpltbOBuAhHpRFPfcioGFgV67neTG23MPz6IOCqAi2IhA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKAKDEBYkYri3YsGllhqobXo49tNWJU4HGolEyMPCrsRA6PW6rc
	Z2SSgRgFFK2ASoPXPjV6JrNehs2tV0ttdpYyJhr6xwWXQxRXt3J4ZxaORktskGQHEv5LIN7rGov
	+w+ctHrE0BuwMPHlKQ2nClRFlFSQYrwY=
X-Gm-Gg: AYBFou17gO9k6I0y1ugPTAtwrca0eJBv3flg7YtOt5R5d0Qb23JPKx368TktkaWl168
	92ImUVcFEfQ995ZzJ/hve8vCQ4A23YNq+AA2lqWi6x0XpKhxucpjVYFpbsTqHK1nsLsLHtZbjyZ
	x461+dpsNlRY0c17ctq4SD37th6j0Av59FTCRIKF6HfWGGJleSmFz68EixJcyotu/djXu4RdX+F
	1VhUwF5HrH/lst54sLWjVtFTPqB/KrS0ZnrPoUh0jot9Pj9gqZRZsH4mOoQ8vDsYUG12iXWDk0c
	avYv+H/Qi27IdHJrX6u9uoY9IuPRTkt50gKvpZVkEdUtGFkhzwsB7AOlS58hB0F84JbbViS1rrG
	cVaSzk1rnlKYfGHCVMqQIGV6kyt4HbgpmQc76UMb+4giS7XAzP23nqI76S68KLEupiuFMYTPNNu
	A7Vw9looFXCrzhA40imgTB0Gkd1VKA45lkCh2eB6TKL7dhAb08f20Ec6rKuIgUog==
X-Received: by 2002:a05:7301:1503:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-34cdbecb18fmr1744208eec.2.1790759554357; Wed, 30 Sep 2026
 02:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <20260930-chid-v9-3-0d6cca376cff@nvidia.com>
In-Reply-To: <20260930-chid-v9-3-0d6cca376cff@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 11:12:21 +0200
X-Gm-Features: AclHuK-0KwyFg0Dwivk-_8qXi4qsCxM4xdJVFSz7hSpIH-HUHIS-SB0FCeiFTpk
Message-ID: <CANiq72kcqVfvVj_b7KTHKrCDj63LMKpsfP30zafoYB8c924i2Q@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] rust: sizes: add sub-1K size constants
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:44=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add some more size constants, mirroring include/linux/sizes.h. This is
> useful for making `Alignment` implement `SizeConstants` in a following
> patch, because these are more common alignment values.
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

If this ends up going through bitmap or DRM or similar this cycle:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, I can pick this one up this cycle.

Thanks!

Cheers,
Miguel
