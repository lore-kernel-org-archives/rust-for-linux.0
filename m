Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB1C54652
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Aug 2026 02:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786243744; cv=pass; b=oCKn8AXIyPA1oB7+9XvVbfxoqGzxAvUlWMOBoD3Jedn6WBjiHTxr5Rz2WC86sMw0lXG44aQDvxYwJjvaPTwGjuiQ9wzD7aK/NYLcOAwWlMiy6DfQ79VK3FRjDQ/m28+PcV2tAGk1Gm6mQNNhDbkGmcSa5NTwQtS7Cb/xPb/stQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786243744; c=relaxed/simple;
	bh=8ceEeto5KCdPz1voVkMTMa50zK01PwUlz0yGTDGu0x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KpSx7KMXwub2yEq/Zli0/by+tZRv6ZO7S+aTDlGqBnD4bx63b+5QEYLrsG+UUuVaKxH/D3y5Q0lQ0E50FY3gH1rnjL+tBqFoWnKmBoyGJzqXieyr5eEQ76atLteDVebvWCH2ukpFmpO71VQZEmVYykE3cGC0GArJHxoLXY6ECBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjtKrJV9; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjtKrJV9"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d027b7c8easo1881995ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 08 Aug 2026 19:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786243742; cv=none;
        d=google.com; s=arc-20260327;
        b=X9tQ/UcSp6N/5gEIdEfvlzFa4tVdGgo6dC9B2d0HtqZKyvdnyvlvoWRr7Q5BzkXdf5
         NTs7/g/DZp/0jMI1l8EWRrHvk3Ey/pXA4S/QQyb1WWXdfBoZaEpo/+O4UFsXIKePggrX
         yWAfkK0ngtyyiSJ10irLreXFU01CZk9WBo+bSv6dvXPUKuPMLbqDqXi9JvdLYGQZxcBh
         pEDKI/GWT88bssrfiOro1YyW4QfDUAsaCRP0C7D0MlCrkTy6lOQ34vzDCWOf0JyZ2Wg7
         2pVONMMmLc1FbjM18z5iOKxpjozEbwplP4oftnyVIOV06YkPRqMFoouMPRyjhfzpdv8w
         d+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h4X4SnjTxzelt7WCL3tT+/zS0JnVC2aD9MhdFWAa5eE=;
        fh=naZaNxo2B9Ts4JDiFiIo/LVGDy0JQYcT11F8MhWBkYc=;
        b=lZwUoLm3e/ED+UfvZhMmoyYpj/3PSGmkACC1dRJLX/GaQUYvFI3NayulSbCmvw05pz
         pESNSh71MEgnW9byVolycbMj3rVYe+LxqG06nne8xN4tMbhq8h5UQz/dXEC8FRu88DJZ
         x5qYrbl/LTTFNsjT0iBekzxUlzdAe5s+dKpJg9SVFeqcKAaofIW56ZKtvh6ka8S+4/Oa
         eIWJNyr+sxwwbVdNeyR5IoTBma4Yz2mNkVs3wn0cBplw6tEx7uUOAXAYJXlLRRryM6e+
         uZIexeSeGLyMjTjkhyno6SBI2ddoySDB1O7WFQ7wh15qUWf3CnkFJeMQmnESQnu09Qll
         P6ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786243742; x=1786848542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h4X4SnjTxzelt7WCL3tT+/zS0JnVC2aD9MhdFWAa5eE=;
        b=KjtKrJV9OIYRA+KtNf15gD5J9mq7VXShzmpiIpQJsarWmGcRL0hbzbBxHyVHoza5uV
         njowSQKDW2Xa/SQMXh5s7GD1maz0CIE6zoZwA3Tlhn4Ceo6RKrxtXCm2Be/FxorJ8yXF
         EfRDmQlM8N6Ite/SGxerQ6TbU+oxNZ4gJ7WJ3jphjdHj/lwihSCEzSj9XaYicbbFS+3j
         I8RekJu5y0+MxL+zlx/jqrF8nE+Bb/8hqXGDZl3pkZIhssz2Hp+MINqmT5RJdvpKRanI
         SGZWHN9Dd+hy8dEkHxcOThjURhu+CpthW9jmNyOUsDS27dL0TZhCCJfEC+SbUeesxXju
         YNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786243742; x=1786848542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4X4SnjTxzelt7WCL3tT+/zS0JnVC2aD9MhdFWAa5eE=;
        b=T1KYwt2SMz1ii5gM5hkl/jDvn5/5VFBJ6q921nFEgRtHi9hY3iflqndGaAkBUemjXE
         G3uaEZZlgECNCxkiMvGlLxgf/rUaZ6qnSul533ioMwgaEEgcsCUydWQ6XC5pXoKJCBRp
         BqpAlIRx6Bai6VtIOHF0v3P8MqR7yDvuwC5xN3Au3yl64cpj2FwpoUrHT/D2UthgcjqR
         cbpbzBWL+hVLJ39bHz5BSLhMAmdSzYtFH8FEdoBVexX8xzd2WfAjvXnxFlRmzEMooqpx
         ZlCdnkCXQO3T9iCyEc7oE+c4YOmvgPpXKp+64z33MiDHodVAtOsf1UUaHbNj1gFFPrIT
         kfxw==
X-Forwarded-Encrypted: i=1; AHgh+RpOxExgkPhHpfuC+B3zS+J7OLc1TK0rzEStRjwnbz9ydCwXz03D9Nkkk7PUiC5+Yf/1WGdfzcwjlecazWWGJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YziSM1ZHpqjEGcNZ5YfUAGEujvOh4MQ7w3gGslkvDyePcjjXwCD
	hl/m7xepd9EsDVZqGT/vYPc30dHGmXYLo9sCON+CqqE4XAiOo7/PXWXLtT7peWK9cOXY6zQdyAH
	R2+y+vxVdKDihG8+Ug8SXOBAlRHv+H1I=
X-Gm-Gg: AR+sD11+1fc8pqUC0wVz3S2VixSwYqv4/KXJVq8I9oFgWwaJbQUQ2T8Y7zGlc8yw3Ab
	6iHfweaGY42zowOwU37rwz1CS205UOCXgAprcHTRbtDx6HoR1w2x3XpHTyH81oYI22n3WAiYT+Y
	Pz1TIZ5KY9jl7H0OiRjfofmgMZ+j0oR7gmBmhxR8J227Rwd8Gt5iqiCsYE+iqX3m3+BKvbUnaVj
	Rst5cgQdquPtT0pq4/1Y5AD08Falx5Qgr+99N4wkR1wonU7U6p+aqhIHfJAvFt4US8AYL3iabQZ
	/4bEikSNfDsJGNqNHOTrZMyM22PEFL8C2gUwCncWYEVqB6sqJXgj7dlqzbqBNkMr+P71cxNF69I
	z4/vDF9hCOY/3u3Du6vb0ez7jalm0VL95k58YFmwmnAqErdjmovU/InbpNi9S8lGiYgKGYTA=
X-Received: by 2002:a17:903:234c:b0:2cb:2b50:d9da with SMTP id
 d9443c01a7336-2d0caa0b9a1mr257014265ad.3.1786243742106; Sat, 08 Aug 2026
 19:49:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720035510.4048145-1-tomo@flapping.org> <DK6CISNRMHJD.391EZL08Z6HM0@garyguo.net>
 <CANiq72nWcqd3aSKdPqOSRRQBuwWNW-s2EOscYszQ9kSbmrKxcw@mail.gmail.com> <20260809.093415.1407278992536442461.tomo@flapping.org>
In-Reply-To: <20260809.093415.1407278992536442461.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Aug 2026 04:48:48 +0200
X-Gm-Features: AUfX_mxHmPXKtJzUmc7goYoYFscwm5HvMV4wlC_QnVHoUN7c_P7gKOaZUlH9EMg
Message-ID: <CANiq72ny0qhkMp722t9kTbX444s61NLNfZktwatNPXEhLcSYow@mail.gmail.com>
Subject: Re: [PATCH v1] rust: bug: prevent dead_code warning from warn_on!'s
 flags constant
To: FUJITA Tomonori <tomo@flapping.org>
Cc: gary@garyguo.net, ojeda@kernel.org, a.hindborg@kernel.org, 
	acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 2:34=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> Since it marks the expressions as used without evaluating them, how
> about `mark_used!`?

Yeah, that sounds good, thanks!

[ I am not sure about the "without evaluating them". While the Rust
reference talks about "evaluation" in the `if` expressions page, a
`const` block there may or may not still get evaluated anyway.

  In practice, I can see e.g. the build being stopped with a const
assert at least in some cases. ]

Cheers,
Miguel
