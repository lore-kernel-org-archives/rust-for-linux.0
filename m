Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DD2295D90
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763151709; cv=none; b=d0OdKsPI2zlef0WlszNhea7unmfBRqpZEK1T4zgkEyMjjUtTuLvdecRBkzmfmqYJql7c3A+mHohjcvIR/qwf8DKQgJmjtj6SU3blThdvLfQCKtqIcDYkMTzlW/iUFUYntASt704RUHXa2M4zxcDYHkLdA4bwMfTeja78OBniAyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763151709; c=relaxed/simple;
	bh=CAXOEBmlGyNNEssrSADdGzRGvopqSTABuu9S+it4WpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IljwyPkfkKKaMq9ETmOk5dYfkurACRVXTbL0L/cuJWbJ/vIrJPDlsY7r+GJENYoAo3V54XLoCwMz6WTLSWHvoo+IzosyCpuZDMPO2217G50oJJeSOVlix+CdLYcPg8akjy6ZWN33TikJZdGIoF07QxQeSescGoMOlmUthfNHiVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdUr4Azn; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdUr4Azn"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b9a5f4435adso212733a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 12:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763151707; x=1763756507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTT3H9Gg61FCiRoOzgPmH/JyPpMysqxbakVqYmjx9YM=;
        b=jdUr4AznAs18ZeZR5U1txOvQO+WvCTBBiT9saEahdGZsLBRjHc3u3UV9BSBn2+2ELI
         kHZ0ZouTG33yzUtdCKUI8HPpVM3axjTk7pREEY4QWA4rsVXvMCmnj4UUzRTtNdIqFB71
         dk5j5mw+rbHEYXEpdLqzw4CprC52UxU6fhJMf40Jldwca2TWbqDN8qAtfRxXaZ+Rpesc
         JrJbByEldATvNJ8dVaU98vYSbQtMD1MzQ2If2QixRSMDTA+ebHOzQE9wN5ncaSb8kw9g
         UN0+iGmO7v+rDJki0q8//YmOteFiV1f+HmpHX8HyFSVZsQeCotH3YX988QTAiHLNAGxw
         TxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763151707; x=1763756507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bTT3H9Gg61FCiRoOzgPmH/JyPpMysqxbakVqYmjx9YM=;
        b=egTG8nS+86zH1mGbFFE6evyU9YiSBzgMK7M+RwS3ht9GYFObwdjupgDPpN694pnwZU
         shUYqZ0fh/j0muZHDic1uRk9oK7aBMw2kMq1aaP2n9e7AnX74QoF/2U+2gRkwYTcLGIx
         nheVHEY1bIFrJ2FGjg6Go4aWf4i1KmS4WVHM8FDbXGbLfnfmdbJ0XisiPtYrRPiuPBj7
         HX8Lk4sQFU3wr3c4JpzXJ1lF7YxUxCb+aJuxYTRuXKuGESJy2rwYWAVffoto59ME367v
         o64NqHMFK8C7Vw1G4Yvtl2/Gyx+2kjvJJpCwA4SCdXbTh6rYY5SgpQe+S5CkfHAG6Fda
         NN4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUP4etqSm/8IipTyjLN1fjVgirQJivaZXtWatrr8DtFGbd5gy/8YFcD8rXGSOz4YDuSKCXf/87CO8hptWjkjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxpGn1MA1pKxSnR7cEIny/l41J3oQoyOAgb72Qwmxpd/h/Rk4q
	d2pcwFOXaPYtY7sN1IB528EDvg6Y+ZXFMe9aQ5Fjjn4XtwsD4KCUgjNMLuprjOllCIiY/xp4Uy+
	WcU6y81ChCw7b4HHLJP+cHoIqcWa4Ouo=
X-Gm-Gg: ASbGncv3xmaxZ8apZUqCnxBvEy2R7e01LfRpKyAwKdOH8XsV+VEd7QVLCQlyEwdpZOc
	/20uEguZ9GJEpuSjV46N/1zBvt7baCy4IOM4eU/VjetLD9+BpWNx6wbZP2uxbFWSWqDoLEBIvSa
	0IyqFa3f2FP7kLGRKhMzWNA7h09nEU8oZXk2Vpda9fYjbISg1l3vJ8NJmyDNA3ge0GfDNkdU7eb
	WeTAOsQOWLlF9P9YztxKTXnCu1qL2DkTYcLKl6n+KjVFPcJZmytk5Zx0SpZWV8kftlk5RSUqAan
	eI8TMqQQM83UYVUlwuz4T/Bq+mWpEifcNECbwCpTC10jatFhL8+NEpukBFHoEZlGe6YnUhMrBPa
	6ovM=
X-Google-Smtp-Source: AGHT+IGMFQDwoMZEWpjK8UbQtjsdBk9bdCdWsJ9qhrqh3kXciGGw7PJtWXIYgl9sYigCNSUPeSPhe4rRFa2nCqOzpTk=
X-Received: by 2002:a05:693c:6293:b0:2a4:3592:8625 with SMTP id
 5a478bee46e88-2a4ade3e618mr1225432eec.3.1763151707406; Fri, 14 Nov 2025
 12:21:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114140020.327075-2-phasta@kernel.org>
In-Reply-To: <20251114140020.327075-2-phasta@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 14 Nov 2025 21:21:34 +0100
X-Gm-Features: AWmQ_bmjq_0rsvBZZSZRVuLJuFFj6ulYa4kteJFwzhem_Zw4DvHJpqGevQVPKwY
Message-ID: <CANiq72m_wGhXqu9es=zOcDbK4UqAiSbn5bBLhjDewXV3=4ckmA@mail.gmail.com>
Subject: Re: [PATCH] rust: lib: Add necessary unsafes for container_of
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Tamir Duberstein <tamird@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 3:00=E2=80=AFPM Philipp Stanner <phasta@kernel.org>=
 wrote:
>
> Add unsafe blocks to container_of to fix the issue.

The root issue is that we missed unsafe blocks on the list macros
because imported declarative macros from another crate do not respect
`unsafe_op_in_unsafe_fn` (or Edition 2024):

    https://github.com/rust-lang/rust/issues/112504

I have added it to our list at:

    https://github.com/Rust-for-Linux/linux/issues/355

And tagged it with the Rust for Linux label there.

Cheers,
Miguel
