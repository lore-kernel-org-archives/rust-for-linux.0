Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E7718E376
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 07:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139137; cv=none; b=FR4NRafJ0DdWW4HOoyBGbSGVOXe6Svikzi7uDLut/nPF8FWuZtTA8jwJq7VkrnDecFNI6J8UPPEE/n/gsq2XVlESi8tZ3OZR6SYXeMMh43w4L9+8o0Uyat8M65D6N3FYNgyBEQH16y+KYTU8QU3fCC4gJiKL5LyukddnsYrHZZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139137; c=relaxed/simple;
	bh=IL/y1cY6YfVaj4LGIk1Pv4EO7nz/Rgn6PAjX0tqMgOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FzSStUlvb6g+QlmmKpgMe/Ema5RjZe5aYuYZ6QLr5M+l80UZ7ShFFh7IgTw9oZYsezYS+yngAC/1DSG+X9ola+SEkyzus/5JLPuyLhx0/h3h5AwMXqFxXUO/+/zcEWi0whJn08fpZWP+jpee4rQZtWGoR10E2i5vvAEgX988BgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DAjTgSUc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DAjTgSUc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428fb103724so31733705e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 00:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724139134; x=1724743934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IL/y1cY6YfVaj4LGIk1Pv4EO7nz/Rgn6PAjX0tqMgOA=;
        b=DAjTgSUcEiHg5etkEqHE4+6WtuTBgPhPDOX/0qpsQ8SMKaNBgXNBTLHDuOmNaKb9GD
         e7wjkjY6U+N0Qb+2z6q/KIJ2SP8Tpby2C/M3fLltS9disSmrbZUOdtwkKZUhi+Vqu3Gk
         hc8xt85GZatQv7Ja9Twq/M3l+FUbNEFsQALltGXru+1F0BA1aMD/a+tRYcFwp7TGAqBy
         VPvM4MWiIklm4QzAk30dW6naKFiKjhvZmp2WmHVBfA9oZvqeIDozLNgBUBuEkVeDekM4
         g8ex3NOYAqlhQOyoM+xi4NXYfB988o/wHuFzK2mAWfFp6yS9IB1+3KG04tai4LUaGMLu
         tY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724139134; x=1724743934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IL/y1cY6YfVaj4LGIk1Pv4EO7nz/Rgn6PAjX0tqMgOA=;
        b=lRTDMWGebTfQB0L2uyphh2J5nP3w8wBGYmfB4ZYuS3WBZUyreFPkYQsg8Dt2TnlAPf
         /gXS93kzKB4Erv2/K1+21kkqbQ+huPqMnSi95WXsWaFonD95lp4/JAcC2msjAqjFvS7W
         XuMkrNbmUOkUyIktUinhSkGHGD2QWmFKGGoUkpYeaDSMqNnOeIsKdVl/L1h115jEsCYn
         A9YSdx2jFMeB0o4an4g8DMkYJqkn8sOXgUSEBf7sR9vipD/DKFRXDkdE5OnzGS4ucmTZ
         aMaG2vEai1AIrS7aCXobCv606lYPcus28MR8Yj1B04WfrPo0PblxhTlG2oB4wDYq8Gf9
         golw==
X-Gm-Message-State: AOJu0YyX0CY4+QEown2MOSVEiVof6zQhjBQWQbT6ACleyXPEWSqbA1Ve
	LcaNHiwYzpnpobMRYigMan2c0PlP+wsOM4CCNKzl2DxnpWx8UP2zjONGOVa+vXd4F6xEx/03MKg
	XGnFKj5KVhZrOX3aFq1CGqaRdSnAl5fMCfDT9GpKmg+zA/teaSw==
X-Google-Smtp-Source: AGHT+IGWwbeXKnMkq1gwChscZLcENgB6f+UvPLx6GwK1d5Qo2RzVPrZBgm/C2IDUTco1IMkiWhLF19N+NSooaQf+w/4=
X-Received: by 2002:adf:e0c1:0:b0:366:ea4a:17ec with SMTP id
 ffacd0b85a97d-371c4a9be3dmr1113729f8f.2.1724139133500; Tue, 20 Aug 2024
 00:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819205731.2163-1-jubalh@iodoru.org>
In-Reply-To: <20240819205731.2163-1-jubalh@iodoru.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 20 Aug 2024 09:32:00 +0200
Message-ID: <CAH5fLgjLksWEFjeBddgVKQiNqFrpYkB2CbyorCGmQYZABAKakw@mail.gmail.com>
Subject: Re: [PATCH] rust: fix typos in documentation
To: Michael Vetter <jubalh@iodoru.org>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 11:03=E2=80=AFPM Michael Vetter <jubalh@iodoru.org>=
 wrote:
>
> Fix spelling mistakes in code comments.
>
> Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
