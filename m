Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22D1DED63
	for <rust-for-linux@vger.kernel.org>; Sun, 21 Sep 2025 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758446888; cv=none; b=UIRlGEqNlOJKFVLACrKHo8F0hcVN6snlQobw+ao3Wz/ga+gwoCEEzUrwMOa1iC/f3RPDDomiMS99gW/0tslqJnimQjWsqRR/IMowyPs7E5ZCx7pnjavwqQzdEkiQ90kCoZ6sEdI5KCVeoNsNNRewa+cGARHvD2NEMrK655yaXPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758446888; c=relaxed/simple;
	bh=EtvX6spi3ViWv5XUhchmyhouze8VNd54v4OZj5G0rRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNKxLDUZVJH/cqk3UfHII65tGPrKmK5j2ChEpWuvnKzjZXQwrBT2Z27aO6kQ03vnSVuUKjx8wd+lMWxG5u4iLVFC6nOHBmr41MmqLBrMmRixEi1OAfxKWjNAehDW2YG7VF3Mx1iiB+l+XT8yzHb8pFFdkE9AX0MU0tAb3ZZpuno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPLPoOTm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPLPoOTm"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-269ba651d06so5561395ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Sep 2025 02:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758446886; x=1759051686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtvX6spi3ViWv5XUhchmyhouze8VNd54v4OZj5G0rRs=;
        b=nPLPoOTmadWh/fHHLty2OItn2e03cMVsTewWqKXJyUANpNnPc4neVSWe5vx2vX792J
         PGohrP/QrSCr9MtmOarDJS+llCNJAbWH/I+OWweg0HXUlj2vZoMAfRCQi70uqSB3MPTP
         gJcz6NY0zZChQqEj/2sDfMvtjX8G4eDSlZ8YY3UhqG6N4GTxPoIRVptEkVJcBiWYtzl3
         EauPMX0qobnJLy8+w7YKqmOp/kZSu1wimIxN1w6nr88L+m3t7TNMV6q7C63GQ/DL6WxW
         9dQLiXaO6ZtCMRy15hPOxClMK0JRer343qxn/dChMytd8PnMxEJIR5M1s4U9rTs76P8U
         zCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758446886; x=1759051686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtvX6spi3ViWv5XUhchmyhouze8VNd54v4OZj5G0rRs=;
        b=uCcWmePvGmRPDqN9mhOcF55OdEuoY7SIo+A4YsKAXdYWTGy2u2q9lljGTH86ppivq2
         95Si41tEpJlzee3WQ9mRYDXGgRoET7i4D/+hvf0Evn5A1ac3qka7OL7UOTu5jSIqBJ/2
         ig35hs0sCP5TMlU13CEMRfIZbplls6mpM4HoSKFi1aK7SZYlswbJn9DzPb6RhqVdE+sy
         32fXggmYJSbsgWWZgcr8DfHzOkOjsWzWuMmQY8qjYChn46XVUwIPVb9CGGVxTKwSmj79
         XgPzI6VLnL2+pfC5lrwmyri281kZC3CYdcmvBvO4xl9kpxPWnanTz+g9uzSjspnhpFbl
         LJug==
X-Forwarded-Encrypted: i=1; AJvYcCWof+JefkrxdTqgOyqz3F3ax+HuqcbJrS+hMp0hnR9vpNcpcNl0XeyuSrkWzzNb4BcVvIQrNKOMZo5v0Nm8gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3TbsN2s49r/Rk4htBNWU/ay5OiubTN5em0FCu8IScIiO4R0ty
	cxyy0FSIUzIaDJSmXDIrfLjGametym7PExeHCYvCER/9iSWYnr+gdWrE8UIr4mp3AWJD2GV8hCy
	0bxoqJbqo5hkiOvIde1HaDI7oT8Yeqa4=
X-Gm-Gg: ASbGncuw4+LjP319eZBX1CZTjzwjKu+JNuU7WT2AqIYU+Q1MWq4s9wWAt/kYoYxsktL
	moNUOCIelEUDNnWYUk4O7bpyhNhlYfGFo2yVyPII+CklXNbL/4FqT8WPh3Lwi37YGh14J8MVfow
	5QefUZwtJ12mQ/2dpJnd7Qw3L9K5Ncc94xrosb5SJ4XJ7U1BI/xakv9dNp5FEKblkFhaFZs4mMC
	frghjBivYR6qEpkh7UBoQCxpgmEWCNYBxRXrXRQxwfZWnNT3KvRj4sWlVUnvL8DXezpmPJpxp8p
	0Fz3L0OwaBvfKzw7AwioEzflXg==
X-Google-Smtp-Source: AGHT+IF+Dy0mlMIwczvjkrGSGBlKSHADOTMAlhPepZLysPmcUI5cC7xm/X9KEYN0oiR+8lSYpv07g4tim48igZ6n/UI=
X-Received: by 2002:a17:903:60f:b0:269:af66:5e70 with SMTP id
 d9443c01a7336-269ba53ab71mr45154625ad.9.1758446886509; Sun, 21 Sep 2025
 02:28:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910140212.997771-1-ojeda@kernel.org>
In-Reply-To: <20250910140212.997771-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 21 Sep 2025 11:27:52 +0200
X-Gm-Features: AS18NWAoOU3I-I-O4oc7FCAYxbAppgw72ctHtbKu_NpY6kqn7EZ9tMfGQmUs_fs
Message-ID: <CANiq72kB5hCC9A9bXEx489E+SMMFcFMiJB68NHA7megz2aG5HA@mail.gmail.com>
Subject: Re: [PATCH] rust: maple_tree: fix intra-doc link
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Ballance <andrewjballance@gmail.com>, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 4:02=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Andrew: as usual, please feel free to rebase if that is what you
> normally do, of course. This was in next-20250910. Thanks!

(Somehow I didn't Cc akpm -- doing it now.)

Could this be picked up? It blocks generation of docs for linux-next. Thank=
s!

By the way, there was a rebase -- the tag should now be:

Fixes: 6a25c101c7a2 ("rust: maple_tree: add MapleTree")

Cheers,
Miguel
