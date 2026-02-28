Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00282773E5
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 14:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772287784; cv=pass; b=f9pwJT9HF8fHbTHaBoAlW/Rk5aKQsNdbGZ2lVZroH+FUJXAdY0XA40iMdsVzO7Kt0juAsRtzzcehIWEWQJ7nWmB6tDPxcCCjZuyl8BjyAbgd1LVIsMnHY1H2nG/t90qX118huWjZvxqU8EJuhbyCnd046gqTNgohV+I/4Gz1TOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772287784; c=relaxed/simple;
	bh=0Ad5ViPg4F5q58dcml7U51wvG6H2OdjKxWdEWYbzf1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGwVmrOWVw0C3iSTUUa1C9uh9gWfWPo+1t4WyxZ9qzlMKe6GEw4ny3DI97+mupT6ykeQ99EF6wu9cMHsHo1IfDbAm/wyHbRc+MC86u5eP9u3FqJWwWXJ1C0lp47y7GPngww96nmA9QQh9tD12RukG1mDYi/OMsjqb2ItPOrrPy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1euZgs2; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1euZgs2"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bdf317f1ccso17200eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 06:09:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772287783; cv=none;
        d=google.com; s=arc-20240605;
        b=cVRYo9sTopxzbmB28MW4LrfxpBucxzZ9XqJt2WtAVyKO1yTE8IgcCOE1o3Bl1Uho1p
         3GxGaicdhA0KXiVSrTRBP0A63LIgwsSXooUR+wSFsV4rwYmXMxJKAOGPf5Op49M5kX0P
         mIKgKE2RAmYY/WiG0qanvQ4Y/DrEAUCAIvgMtHrAuMQGpY/UKzLnCGGQVN67nCXf/Wq1
         YtaxcE9v3VNq7SJLY5TqKBGZGvROYWfe40yyrfUIwQcUEr2HImSmDXtFR4BH0DS9K9h2
         qTM6Q+xKhgAAMcoGemcGVjQTj5layMginJRPTrGn5fJxJoOSQi/8eyDEQpbLR4GtJjfl
         9Wsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Ad5ViPg4F5q58dcml7U51wvG6H2OdjKxWdEWYbzf1k=;
        fh=AzjROoYqQXsN4S7o58WxN2Aq+sh2QLDJilf/eAUbMQ8=;
        b=KxWRVoTPbtDyB+h+SygAIQLz197UDr5y4JuzB7P0eBNIdEYhF/PEG6aRunUTZIvClB
         qW+go24Olnpo1c5Mpen7mdi+rdeVcY0vlmQyA/OEKqRxlYr+RTe0LGfJtQ4IcL/4yG7j
         sma1c+emLNZbX2s7Guk+ZtuRy2CE4c+OoWS2fn9NiKqvo8FJHVNIsAA2qe7qmEh0c/0W
         5kmZ06793mdjle8eAwbXD7mc5tBUmZKvRDyRvAEHyuIGIkBmkWMq1uRKR2VvG28eb3QP
         QT3qHN9R6liVXa8IK0BYMBS2HkUOpqFIs1pDqQ9F2QgvtC5SfKsm6OPR34VA13Kmeb1y
         KwPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772287783; x=1772892583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ad5ViPg4F5q58dcml7U51wvG6H2OdjKxWdEWYbzf1k=;
        b=Q1euZgs2CPWV/Z+aJt0ObRM3RuSj6VgzQ6KSvpRuqYACz0eiehFtHY/t7dX1Bmtz2Y
         ZpaMiD7ROO6FVRS5QitV+KQPDA48llFyL7xUk/oTiv4a9L5shfATiohBxDhgE0DhJIjx
         +25QCfLLSSuymkNDUz/lnvWd1PtDGyN303xNhd1Zt238M/skJKcejgB1eHTk38hYxsaP
         ya/OqfP58eeVnYZcLqE2nvJPX1Nly1EeVv5vDdDhzAbRNg37ho4QWDVHrrVyFPNjxkNi
         gkVwvxnOUgHcyGBED5DEdE5UYAElen2z97tPZiDfwauzWWWhZzd4VzWiVLr0zstrfTnC
         4zYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772287783; x=1772892583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Ad5ViPg4F5q58dcml7U51wvG6H2OdjKxWdEWYbzf1k=;
        b=Mgyw1gKiLZFNEZXS/9u62Nfd0Lw4p6wI/LkfqKNBXDX4LcinFc0zdthIFbPghZCtwM
         +fxoV07f+Ds3W2uMUnAzNGNqhF9v4PO1LcWHxJw0CJ+aysqrJby96k5i/eb+VH15Y8jc
         pEmf/AIB3V2XcE0hCP9cRVkcHEdoD3eN6/58wXu7dJIydlckVnNGVvKDWvulZuSAggpG
         4aotSYV4yTT69U6TsC/PR6aSDuvLdZVu/BxHqlMuZxjjqqzg46lQHQA+6qsfy5LAnVUb
         yOfqVJ6BL3/MOjrjTVpEr9zMWCLEFzehl5nqbS54tV1otTUq8KqC2bSJPeUMyliOzyev
         qN/A==
X-Forwarded-Encrypted: i=1; AJvYcCUO2E9jadZ4oICIOVJO386QU99rH1nVEW8ShtOUYMk6KmiPS+373jWxTqS1aVk8U2T0xyjgoIGZUV675gErrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrYQ/mK5jkeWCeImmaWU+uVp8vu1BmkkI/PXOAznmhigqYwuQ6
	l/LwNUjRI0sJYIvty02HjEBl7oDXOcBLvVLQhVXGJCJU2AYZU2eZ943BriLasJ6IhGJ/Bj1DyDA
	NKUFnYzxsBSkAPvej/Dn87t1JH2XxGyM=
X-Gm-Gg: ATEYQzzWw5ZRsgO+5bgb7SeC0VDPoTXAGDvNttVVeZLAfYgBG3cZUYUuYqH8mEWbqLZ
	HKEuKkugrmCoUzJ5cdYpArlgh9cNpGyBHiZJFA92cUp/QYFfSk7LTMWXBFXnURLwFQbVVDn9lnF
	duPSdTI7WvRLk5fQx4UnZwM9XHkW8a5t2SlIpI4Nf+VQHz/u8sJ4lQD8Mbcr0IdRkfPY3ViNHad
	A274CJmwWC3jUg0LKudsyig9T2z5JTCPZV5HcWcR4M11WCk+8DvSSuIzQeoVTRLl1fA2gXQXC4o
	WMgg7uEPHEfCSHXwxLZ5yoxK41zvc6nHRLEYstOcH4vOhybQV2JKbm2oHJ31vAHLORvmPP8ApT1
	XfrgyAG9vq5LWzKjF9fGFrLEGV7Y9
X-Received: by 2002:a05:7300:724c:b0:2bd:db75:c283 with SMTP id
 5a478bee46e88-2bde1d5e3aemr1108757eec.8.1772287782724; Sat, 28 Feb 2026
 06:09:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228113713.1402110-1-lossin@kernel.org>
In-Reply-To: <20260228113713.1402110-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Feb 2026 15:09:30 +0100
X-Gm-Features: AaiRm50szvIfRFXSTL2frZgjUpT-JGt0pzE0jav9lOhN5cEXeTSsJV_EDM9YSmc
Message-ID: <CANiq72=U8Hvpz-cqHyc-3WJu07HLeaAkB2vhUhtROFqeWrFSVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: pin-init: internal: init: remove `#[disable_initialized_field_access]`
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>, 
	asahi@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 12:37=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>
> The affected stable trees that are still
> maintained are: 6.17, 6.16, 6.12, and 6.6.

6.17 and 6.16 are not maintained, so we can ignore those, i.e. only
6.12 and 6.6 will need it.

Cheers,
Miguel
