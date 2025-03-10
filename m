Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925C879C0
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741613523; cv=none; b=UkHZMZwiAVztqOsLxcQccGqGv/haT3uLKTMEyqjQHA1klp91J9t4SpBkD5jAg1v/nXIzsZal+5ZNYXW1GKUQxJqdEYZHf0WADzrydCM0XryyEW96CNnF51G/mVP8aSX+Q2Kn0SKIihlop8X2m7KVQhCf6xjJtrF/HagtFLb9OF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741613523; c=relaxed/simple;
	bh=vZBdnCJ6aielvCO+hhF/hENRgfb//pWDdJzfbwcgZPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nerMjnYJN6qPUdEcp2eDB326NgcQ0METfASGHRsE1mp8EcowtGGlWsSWwg1yYOL4GdQ+Vp42lUfCWHrhMb3dIjWHHFeh7BYWJD9fi0y2KMHX3ATKeg3o7f0EnzR4tx03T/RoBdcB8RrVZiqJJIdvEVm0LQkqiYkCYJ2TTmG2Nv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CI7aORzi; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CI7aORzi"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff73032ac0so1060672a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 06:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741613522; x=1742218322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZBdnCJ6aielvCO+hhF/hENRgfb//pWDdJzfbwcgZPQ=;
        b=CI7aORzirPfUMakzi8TOzRdg4WskrfW+lo+SiEgTcJjPXZ6mcV9EiaBD68447vHDGu
         Qv0ri8JQDPS5D8VznrVSLl1erW8OhuIELdMrjViBmWYcqltFTisNgkezj9ivNhQRLBZn
         6SiVc3hOvfwTwJCd7noYMyokbPdQAQ9j9JwSO9fe4fZ6yY3NoprMTxH2D/87+au5NSf4
         EUolQt5kf3be2wRP99m07KS4CIoySY48qEmmNJq0+siBooCJsnWzPKly11bM017Ha4v0
         cdrlWQbnSVRI2MxIkKl4zqAwbT7naVtrEq1wlrDXpIQEjoSutQPbeXbaffi1dQqb+vZK
         N0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741613522; x=1742218322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZBdnCJ6aielvCO+hhF/hENRgfb//pWDdJzfbwcgZPQ=;
        b=d5xccC5+FuiVeCm9jQdlhMKb3qMtKbvELKFboCuVvabGNI74Ye5ZAl2G9cq+K1SCez
         R5VcvZP+iCf6yTqrNxtfQDTpj5EYWIGHCPwfsv0nRNd2nafD1YS6FCvewQ60FnJsh2po
         VgYK5dG2iivysDzIwr6amFWpE53kguCF60z/G8TX4oXELFEYau9Sb4AUEoBIUJQXgtAm
         T1tnVL32dzKQc87AaNJ7Q3GoQzMXXK3E327hzxTy5J5gWbM0lWI98gnsnR37ady2rtX3
         IfTmYcbg2h3vEkvuKiDRwPAf6FiZlyS9k4FUbOiQGIL5cysqEh4O1ItUH6vsneOyMKoS
         EPLg==
X-Forwarded-Encrypted: i=1; AJvYcCW9dWdvR8PX4OFtHRKL+o9IT8hajlaYaEyVj4bMKqT1jsJDVOdEflW9hQ/rIz/n10Hwr8Du03XJiu2u2mWR1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLybq2zsvAjksQCCBsPrLUshYD0iZODzYr28QAexqwjdGd7xuR
	FUGYRnhO2Q5uElCZbh2yfLQDacMFR0yOs2fSChFnI3Hqd6UfWdcRF+fG1imAj6OOV+GNV6RI/H8
	lGM8nscQsXco6CYqbXAcQT21SUbQ=
X-Gm-Gg: ASbGncvvezDAwj8ZzY5SPkp6MVGebko+OR+dRxJ9yAgAEXUQJWVzcgNHg1/Zfqa5KR2
	tMTvigKQUkfmEnR2JB7YPuyFYbbBzs/d5yORORtiA8ztjn325mPj3hLWccQ1bzOWRgwDkrg5lSf
	jYneCFcy/JEj3P/2kuT8Bgzk3CqQ==
X-Google-Smtp-Source: AGHT+IFNUpwzL/d6BzHuC4IeUPVJsRi1+kC0G9q9zv+qVjILyvni5ka3wZJ1dDtioAaQ5PQENoLSu8XscdJX0vx9Z4M=
X-Received: by 2002:a17:90b:4b85:b0:2ff:7c5a:216d with SMTP id
 98e67ed59e1d1-300a57876a0mr5517154a91.5.1741613521619; Mon, 10 Mar 2025
 06:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com> <CAH5fLgibJ6wR4Y52MD0bA1Cwm2_PNMBsV+oZ+btoR-+jY_K2Ow@mail.gmail.com>
In-Reply-To: <CAH5fLgibJ6wR4Y52MD0bA1Cwm2_PNMBsV+oZ+btoR-+jY_K2Ow@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Mar 2025 14:31:49 +0100
X-Gm-Features: AQ5f1Jqeh0Fc2aFXojoZigSRILm7KwUKXVcbs4lkuVgWSC21jiL_cCJpVyM4mCc
Message-ID: <CANiq72nnqZVuSZBwDyU1C5Y4ydPkOSWXZ8mhMn9SWOLdJyJivw@mail.gmail.com>
Subject: Re: [PATCH] rust: add new macro for common bitwise operations
To: Alice Ryhl <aliceryhl@google.com>
Cc: Filipe Xavier <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, felipe_life@live.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 1:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Hmm. I wonder about having all of the bitwise operations. Most of the
> time, I would only want the || operator, and maybe also &&. That way,
> it's guaranteed that you can never get a Flags with an unknown bit
> set, which might be useful for soundness.

Yeah, I think this is a good idea -- if we need all of them in some
particular use cases, we could have another type that offers those.

Cheers,
Miguel
