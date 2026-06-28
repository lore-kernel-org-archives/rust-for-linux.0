Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E5922A80D
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Jun 2026 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782640818; cv=pass; b=jCb26bqxjtCE09KbAEgSClLcb3KFduxYrMVHzw9L/O9WCxn3hhJFxE0zd38AB700suAWXpyQ80gLs7fAr2qQfC0aNwX2oykC3mXu2uZYX+obtAWOv+luPc8ozVHjdVVS+4P68Ww6g2PN3hGIhCHulLQLhEsZBwj3/IGfRy2c/Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782640818; c=relaxed/simple;
	bh=rKOr+bOPAaEop+QOsAuBUUdGUuxOSw34AqHhAUajUjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRMfHh7uww0mxMtnsW3YEBc6H/pQKvKwGxaclCuwJM7dndUmq4B6dLyuNCYRdZaKwqyM1oRKwycF3bQ8BYMnQJDJRr+ZblA7ZKRC9TaCZsPxrzpMAprVU5oyshtOumamzu1qfl6hQI1kQOt+S4ht+gmkaAY1CUBbopvLYUi8S24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijk4qoGw; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijk4qoGw"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1364ff8099cso77855c88.0
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Jun 2026 03:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782640816; cv=none;
        d=google.com; s=arc-20260327;
        b=a7Oag6oYjcrA6neEZ9XhQqYuYjPl7h3Bm8SUzGHwj+REDCNOFSwp5jw8WBD+XRo/Ad
         6zHcxdx2AXxAhhVAgug+gxtzheihg0ixc3w8ORK5JDPLk+KtR/hk7+jxVenYU9y57s05
         7CZlbu7DBhg0W1Y6DH8g81TNMxSBttWQU9Q3SiXC/oJu4wy8IpvKkbB/abVU2bV19QK5
         RtibOvusmRB87UFfK6zeAsttxhqX+n0ZPjHCE0agvXAVHrmx7obuLMIsw+bQBiK2O+/N
         kn+NM/kJaaDQua5eZ8s2Bo/4RSYrqObuqKJI17KSwAqQLo16L5zOZh6hPZIO1bEqcyU8
         DTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rKOr+bOPAaEop+QOsAuBUUdGUuxOSw34AqHhAUajUjs=;
        fh=Nlud5HmlUk503yryixdiJa19v263yOfPJWp/0Z5rT8s=;
        b=L/WLRyqhTthabxgbjiYS8qFionen9QcM1g7pa4e3rjtAVxRKJnPedHHf109h0rC5WD
         oFUzxZtZ9jsu315+O6CVmYB9rtMHbcohSKpK4+hRf0UW3ZHYc/qeWnbAH+QRTEJ7YmRR
         /6u8jCENg70/oWKkJvgowj+Tpy32w4aAA36LC48oYEHMiUIFUM3qyi9WjMUlX4lO2mqi
         DqaxrjP6rw/AkYnNAU7ctvuj3ygEhmrDQCjTFDEcBt6mA+55y2QdkmiuD8ioGyDC6zG9
         xSnThPLV5Ux0RuQgwMvUW6Yw0LxXurLLrgA37ECoiJuJA+mOTrOOHPTm0nDcHfWSlszq
         ofmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782640816; x=1783245616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rKOr+bOPAaEop+QOsAuBUUdGUuxOSw34AqHhAUajUjs=;
        b=ijk4qoGwZRJLrr6I7a+BcCeTqIzeQM8n5RQXDDsWqCJ8EzKh89sMogMZ3pKHrgy89x
         ovLTPbrqhFv3CZq+mmqnatrG8GF9HsUqmb4rUEHlj5+V5//ja51B5hEvgRj0teKJNArN
         UnbRKeEK11P4EJOyq+123q6JXxRzHajhgu0suOwknEgYDackyltkgmFQlOsGF1szGvo7
         JvBcEc2nqba8bKCIuUd5OL+0Fl/IHvMZLtSDh4CkjS9OWveo4THuAQ1orFU7LVRp/+tc
         jbNhrXZsMxnSJCxHVGNBcUXmEkk1xBvaz1spZ5pY6cIjxmcVCIiurVyFUbr++edUTEmi
         cpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782640816; x=1783245616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKOr+bOPAaEop+QOsAuBUUdGUuxOSw34AqHhAUajUjs=;
        b=Hy9w1FVu5HeRQVmL/XRB9Z9V762L1kz4jr9zGpjv1Cv7fvpi91UduGoAhTT1GBQ/DC
         LYcw4BoFQp9pmwg18e/K4Fe0N8hkRDmD1KgHR/FG+ApoIMgNjQ67I1b/4/Oikm/xd4EX
         pn+RoRmqBWuuL/jKbQET9BoTY25zqXGt17Vj1fMx9jzkP9rvGeczkOHzCbCmZZo7/8D2
         rHFQ3Ugsw/nyc0ZbI6d7LBeNY6UO8IuRJn9TZOfJ7SwiB7euzUE5/6yVcwKwu62AVA30
         4fvmhecxRKWB6F89BZssBmlCPRMpCzrVHpGGG0ctsTHPIdY3b1MM7RZY6jP7h1jAqVg2
         9KtA==
X-Forwarded-Encrypted: i=1; AFNElJ8uv9ms0U+EWg/jdSZGcx3fyFN1A82c1yjzpcSw2Zoop7q3JM7nUPdkERQwOW3tLGeJj1ErCjl5Ymo49lsEhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpxrsNPa4Xfntfbel6AT8KC1oxeN7l0xbEnYnJytX0T4F8Ek+P
	BcCQAliY4a9LXKb74Mv6f1XinIDiFYUU0Xm+LVQdlNqG9D+i0mDbaogAPa9PmHBnYNggbaZDRka
	FpZtjFljs+31m1yi4Lm/yrzX2T5rPTFA=
X-Gm-Gg: AfdE7ckNhZeI7nFZmyHfL66UJXQMB1TMnDvneiGAkOVYhPDIt/aSf+7mBdIz+pnihT5
	Kg+jSWa7n8Fiq4/wxV/zx5stLh8TOh/rchXJiXjuFAwYCGdTOHrieJceaZb8Faj4htd7he2V36D
	SyQxDmVEVcMGI3hs3aGKdIFiP44AUdUdXxMXfljz5JPsKlWUX4NHGsHD14tQAtQjOWDbDM1G8FV
	PkVnaqsxZxTjxKNyeeWUC9ZxBBPqoln16bUWefH1kTtI3+qXccsq41ZWhjsR1scyFiIBRDHpITi
	lz8f2Hg5ItBD94+53wbisiMFfHoTthI9Yy3ho5p9tRwkvXycZqQcJaJKtRyTO+1TPsHFmbRA3WG
	HI+ZYLh47VPtt
X-Received: by 2002:a05:7022:459f:b0:138:2790:149b with SMTP id
 a92af1059eb24-139dbaec420mr6043173c88.7.1782640816464; Sun, 28 Jun 2026
 03:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625205146.5047-1-niyudi.honda@usp.br> <20260625205146.5047-8-niyudi.honda@usp.br>
In-Reply-To: <20260625205146.5047-8-niyudi.honda@usp.br>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 28 Jun 2026 12:00:03 +0200
X-Gm-Features: AVVi8Ccn1HJ8X_hAz1-AEqOSd2k8M8FF3q-xf_jEPBCIJBTgp3WrHNp6qT-BDlM
Message-ID: <CANiq72ki4YkLKUQw-iR_GcF_ernUvN75m8VdHCeWmQh8Amy6Ww@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/nova: remove unused trait in commands.rs
To: Pedro Yudi Honda <niyudi.honda@usp.br>
Cc: dakr@kernel.org, acourbot@nvidia.com, nova-gpu@lists.linux.dev, 
	aliceryhl@google.com, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 10:52=E2=80=AFPM Pedro Yudi Honda <niyudi.honda@usp=
.br> wrote:
>
> In gsp/commands.rs, remove unused `transmute::FromBytes` implementation.

I would change the title to say something closer to what you have in
the line above, i.e. "removing a trait" sounds stronger (which made me
look into the commit :)

Also mentioning the trait name makes it less vague too.

(The formatting on the import is strange, by the way)

Thanks!

Cheers,
Miguel
