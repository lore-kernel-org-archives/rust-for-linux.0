Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53091CD0C
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Feb 2025 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759995; cv=none; b=g2h8tpvfrU0NjMi9XbEFBuqG3LV4OrgSISWyrL0k8XxR9nlbNf1YfnynZuyS1i7OGB45KmeYBDmiAwVgwtJKdk3Z97iFg+pi2kOiilJepkCCnUZiO7JOn2V8LKQpvWFpmXoFb2vrpnXi/zw26CZ0ForGf0ncrH5JQ2Ayvl8f6tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759995; c=relaxed/simple;
	bh=rXpZYcqOkTTnR0rQsXc7qQYzx1Y5CVaeJbx68mC4OSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sl0wiHAO3W7XNUwLPbKONw6l98mpIOyb2wdGgRSgkcshVP/61UVfuRUzjlFxuRdSWGqglGNCo05hETitkIncWo1yq2zA8BbyYQU3Uc4dBq3xzaQ5gz+VXIKOdyJ2bQuoHbf7KhcXkAa7ExPiBt9+PtmEvOO68f8c2cJIquHleL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dc5UmIiX; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dc5UmIiX"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f9c3ff9219so387646a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Feb 2025 04:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759993; x=1739364793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXpZYcqOkTTnR0rQsXc7qQYzx1Y5CVaeJbx68mC4OSQ=;
        b=Dc5UmIiXLJqg0tqXsZAfXylwKNBe54Fn39jMgndyx3i0mcm0cGu+qfgT81Y1eZCOCx
         5B7wyhxJduIM0xidPMkEORZsYo7jrmpe0kbQ3XnvFdWKegbtNeu5gmDNc3fx6/uXT1E9
         Q2WOqwGAE5cpVwJa6k6pcG1Mll0jaDsWpdTK4/kQqNDTrEQQ6clMv9UGQ90/8458+bz8
         zMwNnBJ2yWpN0TUg3hnax4/7vsorYa2iuu3t5joKb/OmrwgrUGh7l043Mp6WCtyk427a
         5xtSY8uGf/zSv7qmh+n/+BgaelEK3MXItLuXHXumxEf8vu2P+1Obf15p/tZEM0q7WSAv
         LIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759993; x=1739364793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXpZYcqOkTTnR0rQsXc7qQYzx1Y5CVaeJbx68mC4OSQ=;
        b=rI763TNxbLWqV9gPw9I0mLSbbLVR+z8LcsyMFMrsdVIKx9D3Pmi0Gy80TeYUZ75m5G
         8pm03hj1UFvVcd8uvvbrgIgpeGyUbCQd9Uhgc4hYmo+5xeusSUGOz27Yb85eMVFFkGFN
         TWcxSfUyI+ctKCwNJ1IoiwMPGaxx6RLqd/vOwj1dRshdBqg7hXH3YrFEtn6oPAAvyiuS
         v6mu0eFrxRwSS4oYa54RPUGh+riH8df7UrTqsQR7rjY3BG047dCrNYw/hsZ8Db0ma2Nn
         p8nTWwLsObHAZZpfE/l2NjoEOH2WQNcK1VJ8Z9SCY5VxROVoLSBIqZjnMbaw+I55AUyp
         fjBg==
X-Forwarded-Encrypted: i=1; AJvYcCVay1ohPVcXMP9L/iM+EM1xuCX+IekO1qenWLkV4h10Eee2TLP+XZ2jADL1KUFloRl+ZqYD2JcHzZmXxzx6lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuJJi9CbHSS7ObNCpfO/L5AF7SPnv/HKixDgRJVUigaLBT9ZJo
	hlBYu5zBtHYaz60mKD5waB9obVF9opR8jSFI8ymjzV5BEEnknmMZ1+kklzjh0emjoncKeaTuWPc
	A+oq7YrWX0zyp3ZNokd8fpcToT7I=
X-Gm-Gg: ASbGncs6cC1TVv+E8MpO29LwtCHw0ND6ZJHCxNhmXbQq5Uei+bughBuWKvyDyZdKwjJ
	Ml0DkOsdbWUdKiij5e1Ldw8YFgrmDdndGmBuYEu8ASIg3JabTsN5FMUhzzqAOk2KwWNw5eEBW
X-Google-Smtp-Source: AGHT+IGFJDOVIsSZUbMkyLtjXkz+thZeHfu0QCg3+lvS2dvHyRCYmAwbfoJzs/G6fmJPOcPefzgcHsdaWVnmWMpoO+A=
X-Received: by 2002:a17:90b:4f4b:b0:2ee:948b:72d3 with SMTP id
 98e67ed59e1d1-2f9e074cabamr1735656a91.1.1738759993009; Wed, 05 Feb 2025
 04:53:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203133717.264522-1-kurti@invicto.ai> <m2y0ym3dzn.fsf@posteo.net>
In-Reply-To: <m2y0ym3dzn.fsf@posteo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Feb 2025 13:52:59 +0100
X-Gm-Features: AWEUYZlpFBPXHlE4QhvY8oAuQTD15Ik2iJ2kdroUK2HVSF0qZRko0Y-M-r5oKH4
Message-ID: <CANiq72=ZUmH_Wgohm02LEdgdP=TU1TaQtuOqrbRwVXLRcwpSNw@mail.gmail.com>
Subject: Re: [PATCH] rust: printing macros sample: add missing newlines
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: albankurti <kurti@invicto.ai>, rust-for-linux@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 10:38=E2=80=AFPM Charalampos Mitrodimas
<charmitro@posteo.net> wrote:
>
> We also have these, but not sure if we care about them, since they are
> comments.

Yeah, we care about those -- albankurti: please fix all across the
tree if possible.

Thanks!

Cheers,
Miguel
