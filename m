Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D7D3BE632
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 19:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773172726; cv=pass; b=OngeWSLwuP5RTEfk1yGqlWVyQI2TY+2fb6Gc0aRJ7GFvHl/kLBsscLRSwk0e6uH39ThwpKpWKC2Ro74X26ThNujG2/3NdKpDpxxkYqW1ILlDh2iOAu9ntnx8kC58KQnxByEymZUVKnsTdOm+kUDuEW3wOpIDoEeYQF52a1fUA98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773172726; c=relaxed/simple;
	bh=WE2eIdzJ/CezIDdO1ax/5TeyqAUbfRH/raRyKvvD7IE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnd0gyuU/lZOH8dtumwVuc/55hek87OpL9CB90VBU1OY1Eltnei9jT/Eyy+UK6XB//iJVOWfv4x/kJch/JfdKaCrdfvjAHMoF3SA/ckDtP2ueMk7NtZ6HLwG4P9z2dOyeQNGMTUuvtHKK3QYobE9Mn6fCPD6rauiQvlok5RJq0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3djdY+0; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3djdY+0"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a3fafdec5so648411fa.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 12:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773172723; cv=none;
        d=google.com; s=arc-20240605;
        b=AZLW4Fb9nwhD/CQH8JkSYaXArSwKNd20yi4ozpe+7T00I+gelny5AIbknEXyHddXhW
         fkOv7Ppj/wLNZN+2ttIvLEa7AF846TuPGeDfhbR3x8tP4/f8O5B5Isao7GysqZX0l0Qe
         yanZKA/2hoOYBax6j79rADjP98oTQR0vcLy0vM2GarOX34KeMToiSgtgHFBKfheO7TBX
         PHgBQ0VKQl5cECHirSn/YInWoho5JjMc2+PyWxwWXmJsUet2QOJcA3A1aN1fP7a2uMiK
         vJzgrGErSrmKxGdVWM1u4QNbRWWOPctKF/nrO1567gctwbw3XfbSV8CKcyO4v9qP0xw7
         VgLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WE2eIdzJ/CezIDdO1ax/5TeyqAUbfRH/raRyKvvD7IE=;
        fh=vDQd6u8JnKsUEHrEK7NyvAn6ennqdTdye8sHCujwje4=;
        b=kkvWLvQp4Yt7ga7S/+Z8krNrNKHTLy9UjdvAxDZNSOrNhGR6/yLFySRQ+FzSYeG89e
         WJcgTCQSyfaAmWrn7GrIoBoiTkMzWmCKBPBemlgmDbiB7zT7W6SW7psOa5TsDhUVYih3
         n9cqhHn6oEH2zt3szdyE5Vgxlwn5D5vTTYqn7DLq6YlKi8laZBL0JJq4zPe75TKaAzHC
         l8dnETa/4MBjGVldFu6C+nK+wHnxIOttF5DuckgDypWgXHWa0wmiWZi121pE7iISEnQ4
         uwNLe61FTXuwdJ2fRGbvQQhjSrI9HrP1fyDqsJ21msgtNTZeksYgAnoqmznI1dJpyGMV
         3HWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773172723; x=1773777523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE2eIdzJ/CezIDdO1ax/5TeyqAUbfRH/raRyKvvD7IE=;
        b=g3djdY+0zIQ0RaDDw1x5PbdRoDbssvGfFAikarukNjiubJdFEaEvwHCPUN+Eka8m/L
         tlhb9glwm4qfitEIgOoP5+Q4vzLOr03bUwPX0USIw1hKyHW9Tis9r0I3j9XAS9fQB/JV
         QF9xIKvziGA9JIhRIcGfqs0x2ZjxcUbHqJHBwmXb04/qMk1SK/Czt7YJiF5AM1bARsl2
         k2qppQCs/YR17UR0Lj+xsEc+Avhq2kHGG+gK7KNRlbObqjUKy/uNp5ozCEdOcFkL07Iu
         fTLrSjfhU3AgUt5wGW5673NcYeMNPvO4brN/npUY1gISAcFJ8aCVXSjECrZRiiY2OCSz
         xs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773172723; x=1773777523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WE2eIdzJ/CezIDdO1ax/5TeyqAUbfRH/raRyKvvD7IE=;
        b=dS7546Q9NSEZkxKGQs/e/GXpkBujHYQUj1LZ/EtK9nz0LoP5CTW6ROS97bDttT8oT6
         hq2nlYhYQlFQTKguIOtTwgkWJXfS6OnRL5f6AKchbJS22ViXTu4e6Vage8wG7pYgA0AC
         O8rPUGywnEFqhMofzWzk5G1PoYFznSjj5fqXB6mcQVCx1957PyY13pizcz02bmDRueV1
         hlO/x+S+V+6Gb8ifNo8+rbaH7RzlcAStI7Z2fKfUnjYVHSo15/508Oa6oCcNqxpMCs6A
         baKZJxRHU2Rxeu+WsoJQ93oJNjXu108Vyv4Bg9e0iQG1CbsmiARtFBdckxqKHn8gmj48
         OeQA==
X-Forwarded-Encrypted: i=1; AJvYcCWVxSv8Si+1FiPgP2VfLpQm1MN/A0TmOQpd1G3QMz1lw7rGagLPay+m8N/l3wI3Q/jzv9vSGxl9N3MsuVA35A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu+uRtdzcIlAZm2sVW3z6+TXAKjuD2C2fZ3YFnJEMuuIy+A6g+
	B79F1YJjiFQT8ecaiRB5IjmTuaofh6FQLbhNI+13lz7kHE1qIU/tBqA81qGbT6x272l34besu5M
	KrXDSPDHilvlId8nns9Vx0RX27eOcIJQ=
X-Gm-Gg: ATEYQzzOZ858RuHz3Grlr0oHVaXd2ptrTrNqFYd0RL83OxyKmYf1GDVhNeKq04uNK2+
	wpa2qNF65GsvkGeY2DY/cPitgXon1OqLjyVUVywdtxRwx9Z1o7fZFte+gYCKgyMTkPmkI8SzEpi
	vjeIkUSAg6uYfD1ey05y7/xdDJXh4n7RSoqev7AIxAGTt2s3jCfOnQWFJN3VHTJJOqaK2Orj58o
	sHa0ZJnyekr9fOKcD2m5xn4/DQMTUy72PIbEVU29QmgCHd3OrxSgoVQbclKqUOYXTkrF7PfZqsc
	wJ9vJ5BvGgAwR3takCWf/zh8LZFDf0MZI5E6HbAqnmsCs6hNLiZ9tPkBgdkip5KeiPeFk7xX13k
	5eTm6EHvQmx1be/c5JdxT7S0=
X-Received: by 2002:a05:651c:2211:b0:38a:2e66:c9f6 with SMTP id
 38308e7fff4ca-38a67e7f4b6mr9991fa.4.1773172723213; Tue, 10 Mar 2026 12:58:43
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
 <20260310-binder-crate-name-v2-1-0f7c97900d36@google.com> <abAzTFLYsUxK7VJ6@google.com>
 <177315751568.96522.7020199079773666163@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
 <CANiq72nM6ECBE+iiKrBRzCwOyd7BtQ4w6o9AH4+o5rcrcY30kQ@mail.gmail.com> <CAJ-ks9=ijHBzOGxViDzJzGhEBhLg99ryNpN-FRsFN+NLJwVUYg@mail.gmail.com>
In-Reply-To: <CAJ-ks9=ijHBzOGxViDzJzGhEBhLg99ryNpN-FRsFN+NLJwVUYg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 20:58:28 +0100
X-Gm-Features: AaiRm50jqK0rDv9muNCDqsLWESCxUfIO0NWyey9s3iCV9i75UgNNIkOt1tydm6Q
Message-ID: <CANiq72=MfwGU7wpeUdYWhhOd962X8-KU9NyWDFY=wEo2_iPdqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: support overriding crate_name
To: Tamir Duberstein <tamird@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 8:39=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> The change to `generate_rust_analyzer.py` is safe to land even without
> the other changes in this series, so it should be possible to take
> that through rust-analyzer-next this cycle and then take the other
> changes in this series after my PR. Do I understand correctly?

Yeah, I think we could do that, but that means justifying the
rust-analyzer change on its own, which currently wouldn't be needed.

Sometimes we do things "for the future" to simplify landing them, but
do we need that here?

Either way, what I would suggest is that the changes take into account
your changes, i.e. to base the patch on top of what you have in the
branch, so that we can review it and so that you are happy with it one
way or the other.

Cheers,
Miguel
