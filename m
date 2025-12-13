Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B4E2D0C73
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 03:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765596118; cv=none; b=eur7oengIr2S5Cbl4xJV8SaHKipk8EbT8D57dqvzuNGMWCzuDSboUn7BbGyJNxMQrV7LC02ERrxWN1zLYZRbkUAVHSN1xf/Db+Il2lAyOgQMO8fqMfRexPzZypLK3yfKm+1NLnyv8Z5nlvMMf7bv7MrKo5s5I/HJMf/4W2tx/QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765596118; c=relaxed/simple;
	bh=mRaI9Z++/VCgsKZiUk63AhgsMCccajIMQgvLgIeN5qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LbbDf+nv39Fh32bgX/UYtkP/uFb4Z0i7T9v95cUcjfCt4QfpKdWAw4yLbYN9JMHomzlXhv1MUmg1BOU1KAcON70RJX0zPY6luF9wsjgmkcaQef96i10G03b2AOVplBaCdv0ohqVLpz+chjd2i0w32Kq7Ep4/IIEJ7ML3IcKBEEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWI6clXu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWI6clXu"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a07fb1527cso1685485ad.3
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 19:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765596117; x=1766200917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRaI9Z++/VCgsKZiUk63AhgsMCccajIMQgvLgIeN5qo=;
        b=fWI6clXubGVaU4AOe1iIwPh1T64l8Odl6DY31ZqUtxoM1aj8WwaIppIDFyIhkmC0Em
         cxrkYKw2WvQyWdvA7oykhFbFiwnADsEAxOZ9c8l7ZV3Hk9ScdDsNmz5cjcsk/hJK4yeu
         VGGNKKFSMCtP0Yt8auYNqcKJCciU1PlgQmv8Qyf1WOaMY5FevOqLdI/RCAcRnDuJPwQS
         sOhz2ljfNSFe34mNKAF4Z2XYktKaf2DMkY+P8LxId8CzkFYH6t+SV7uG7TmfZcYc/hx/
         iFhEPd4PqFvKzVSM9Uq+Ni+3BGGKlzIHzgLiweh02LmmzZTfmMzYHogcO0hdSH/W8lrS
         5svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765596117; x=1766200917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mRaI9Z++/VCgsKZiUk63AhgsMCccajIMQgvLgIeN5qo=;
        b=jNRmOW3Fys37l8xBX1IFppPLKPPwmQpk063GpdBeaf2GBYBZla8X3bPf7k6bCunqem
         rltO4IhuqciIBZjj8mgTwnKNUn42e8Dty7Yb6uJjr79vZf9ccNa83QIi9XtHNqzAi/y8
         a/hvyRCQE+86IU37V8FIQsZ5zCL/8rSn2mbnyQTF1Vx44j0aj/JBkMoAxETdQRXRqqDu
         cB/QBdXlFqcilRwqicHWzJzW24MYesRwzSQwWi46YciLtqyUIdW3gR2vpUEHbs4wlrNA
         mIymg2WKbaqjFGqmJWyYAEMNsAndJFWpFn/FnCl8zJu97haeNzObB4D/K+P7t3ROOwHq
         d54A==
X-Forwarded-Encrypted: i=1; AJvYcCXFx2VBK0/6vcLBVPbfMaEKJ7zg2+lb85qJeiid5wWNOZzMg/LE8drlL98AHxMQA2vGC8tYmTELguF3fFnknA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7YR0Vc0lmzcIRMsjhjkfW133RN4Nn1yov8az6B3UDVnFVwHTt
	urQAzDA4U8z/SqwM//qWdZbrqAjfuKkE4qyF2f1U+RgE5M5ak3D5wocqRbAoaXFIkyyDyQsKe8d
	zwcvxKgFgujvU0JPvFhqiGJiRRow8P7w=
X-Gm-Gg: AY/fxX6ToeRY250waz8U9qp+5Jhr99rvYsprHj2xmeFix4yp7apxlRWXPV4YeJzlWky
	V0wuox8iPOV4W8QBkpTIYsqwgWHc3Q/+UiM7gkOvPoDGwPgd5wu0bbnk2X84cQf+IfDCRFmplag
	GIoCcEAKKj41pQpUa+IArGvL8gsP4MVm7lWqDJV+Fu7Bx5koQc/xStGJ9V3h3NE81MjU6U2c6wm
	fcY9tpBJMeQbOL992JL0v98uo9i4mKSSmLhRnzLUmnY3phUnyg2kJbwR+Uok7ddiharHVVe921Y
	mDImgLOBA8GBr9YsFhitrfNPcYe8t8kgrrUWFYolHZMUTWiLBG4kaaSE0Y55h2jW5AXxRwbM3Sq
	2vypFBY43MnE=
X-Google-Smtp-Source: AGHT+IG7kc51ITB0TV8t5l4CY48rAvMyujDTMuDQxVLymqc2wXd7JtVdmEeTYYp6ZXqJOLBk8XWycnXGaXjGOVlkJnE=
X-Received: by 2002:a05:7300:d213:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2ac2f395b31mr1316213eec.0.1765596116580; Fri, 12 Dec 2025
 19:21:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213000042.23072-1-ojeda@kernel.org>
In-Reply-To: <20251213000042.23072-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Dec 2025 04:21:44 +0100
X-Gm-Features: AQt7F2p4DqVhk6jW8S13j3nU0FRlIDOnQZskSj-KbArnsKIZbsSKggs4WSmtXBQ
Message-ID: <CANiq72n5Jx2xNy3Yy8H0-OcUEkg=WLxgPQRgei6EQiU7-ySciw@mail.gmail.com>
Subject: Re: [PATCH] rust: conclude the Rust experiment
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 1:01=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Link: https://lwn.net/Articles/1049831/ [1]
> Link: https://git.kernel.org/linus/8aebac82933f [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> I could update the first link to the full LWN article when published.

It was just published, so the tag will be:

Link: https://lwn.net/SubscriberLink/1050174/6b6d55c90ce1100f/ [1]

(LWN is OK with it being a subscriber link -- thanks!)

Cheers,
Miguel
