Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0D91E9906
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 21:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609945; cv=pass; b=h2ZOWBFnkTPyakWFc1CAX4urWQux+8DASHdGqcfNKZCKWaAjm0Yr7fbc4VW6rd/2GxPulWdEyqFEdDJKHWQjtXCJamx2mOUL+3wupwXpR63hH8pBO7WbtRxZk4kP62Cc95qdjxkia1OvfvbuRYnvth2y/xfjGMLUSxLnCh2MZlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609945; c=relaxed/simple;
	bh=wLO8JPLoTIlY5BWw18GWRcDZmAon87nN05FWy0CZqDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZS+cc9uJBDwR3kwGPAZ4iFaS8LUUqr4vijF/l5gj0W0qRoYNcxpaYtw/qU2Hk9l9c8mugXuIQMmzAS3ETsZUjpWXR1yqWFIo3vq1691jW4lI26lVhCVWIvGPBpmk23QLsvMRj7LjiRI7W5cZv8XJMS6/OBcKicQEfcOMAUnEOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQ+Ju6DJ; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQ+Ju6DJ"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b8095668ebso172473eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 14:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773609943; cv=none;
        d=google.com; s=arc-20240605;
        b=e7zzt4Y5jyOisZ8AAGXxnZxo7byBE4nIWgeggnJtMJGzzScVTmV5FVhitHXgUfZQkK
         7i5YqUSqzIola2XK2ZjML5VFp/RVnqV83v2hrK274iyDFzbYrF1ZQ6KdInSC5vXYKr5I
         s7dS7FDLWc4EL2nnDpVAGN/RTGBcUiEc0zOg41CuYfIJ2+ot1Nu3FpRbNn9rb8MgiFEl
         tI4hLuonYLHIo0wpafYRNx4SgSPS1h0rXvURdHtpdx5DJi4IrmysGXeXPEWDwbS7JgKP
         5QbKxehIHvMXQlUPd+bGnRTzeJl32TK0X8O4T+zlInpeM266Nx30c+MvF17+JmbUe5Of
         RlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yBrYU/YpQJMUv30pjYmmakN0JBde0JpAyidit4cXUWU=;
        fh=RSN1ZkL88fvGojsCGV239QnG7niLq0aipH96gOJkMhw=;
        b=Q3JJhfCYWhig/TBxGw8wGR8eLtspAuZRZckpaKsGPDgYWmRKhLovSj6NB2s5uN8s7x
         9F4VCQrSfArtQQUfLvdH/iuEBbhGXqRm105WY6qQv81gAYCnyYPx6lcnAft623iAkbq4
         8aNncJrnoP6u6AamkxHbEM8S6zwt7u+D1nSuzWG/Ct0sEQe6/s8r0dCiAUsoJtfZcULP
         awgM4GtgjN0ksx/ZkQ+E9uSF14VIK9qzue940N4fzA8cKFci3xomHC9eesjErlvDHzWF
         0Y9wmi2fg1jtnzJw4u8Qwi7sijtDpQyir2Az8yBT2wc5x2kHhe8w8G8eVoR5RJHABCiH
         7swA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773609943; x=1774214743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBrYU/YpQJMUv30pjYmmakN0JBde0JpAyidit4cXUWU=;
        b=VQ+Ju6DJyG3YGM/bQ5CD08cZSgMLe+twTnMsQVrbw9CTfoWNKfdPsZkOwmkrj3hQVC
         at511l0I/AMWpTstquVfmWJUeyl8j4hT1a11Xt/ji92WLSiulWUn3qmOiQ4YBZoOCCCX
         vH3oruNQOwC7onuiMnzx29y/0AhKC/dytwZdgbrkGyXoD9LL7KfATU3s1PsWClfkVBZ9
         pa+rmDJGeq72v/Rs0o+OTjDqXYjuoX/EnKZ7EpcCtuPY8zPdt4c51Nk6n2l5wVxyLmnw
         nkCHZHMDXZwcjsNu+ujD1d/UCEM+LjLoeDM0LNiiqB2QhlKAhJ+DtV1PQLMlvAdYPkcW
         YFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773609943; x=1774214743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBrYU/YpQJMUv30pjYmmakN0JBde0JpAyidit4cXUWU=;
        b=YYzyZvVyqLZY6BAixWJkU+zYeoqlfjYKRQLewQi1JewPGOk7d8eauKQciM/4GuRrDN
         Dg6URBSKD65tfeBtOaZ4HQZF44XpfP7ifFehs9QP9XLLzHTA+GOG7HcHgkUr0Uw8KnAN
         iGUmftF9eNwuxMQ3FBwGguGdm2wjyBDpy0q3g6PzgRufd1yF/jy59krQ/FSRvv5qdOPF
         Nqg47dojP+NvGJBGc55Qrjg4HnfI3yJqlUdd6c5CaDumiUfEW0I9SfwEhs2qgYgfAVSf
         oalmYjf7FTtP6+RYM1x72FjRPi8irrF91treEVUdpp8uJGaVRjChwLdkzGYS6AdVUfFv
         29Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXsNlTLpCDQmE+P+67Y+Hiara6ZlozrmNWkwLTE+PQOTnVYi8v4ossJu9S/tKg44nAYtU9bSnBh4i7m/wwW6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkgMq0MMBmtQQ19scQTPkPktb8eCgC9PfCfMp8Bi8FwbEu9cKD
	SQjXHc/QGN8wEHrR7hyJlU7dCyEKAHdmH4LZ4g29RQL1GkVJ+al4Z5XsOxHukHjdQmM4Ybfratv
	7s87RFm3qsxQu3tmGTjOaZWuzZw58a44=
X-Gm-Gg: ATEYQzyEz2cBfVQP48AZaT/oQ0aEOsndmbm21esMTToJQ2HUNCoIC416Hqb/NvXT0U6
	Cc1yRTskqpikijqyhK11Qwem4rcxmtEVm98bqY9LRj1qIq9UNIlrBiMwUqss1qSxdez63Ylx8lF
	JhRTMiMyfHWvxLBqSYTzzE7CbGA43uolR1HyWIHVwQmoF70lu3mNCA0MB/jKuF31rYUv1aVAj55
	ZmZ0GHg1HonPQeqlwKopvgFOTGZz5TObVe/+egpqjHC3yvjW1PTUQk3sUvT9kCoyTngZF/WpLCI
	fJvrd4rsl6NzEwuvZwN9aw2p9oyfYjXmzGw9t91+wIwSgLEagG2Rg9nKK1m0iI/eOWokIG2F0ql
	pJcN6CF2tmso8UH5Xa3q9FjE=
X-Received: by 2002:a05:7301:fa8b:b0:2be:1946:858b with SMTP id
 5a478bee46e88-2bea5537069mr2722765eec.3.1773609943341; Sun, 15 Mar 2026
 14:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260102202714.184223-1-shankari.ak0208@gmail.com>
In-Reply-To: <20260102202714.184223-1-shankari.ak0208@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Mar 2026 22:25:30 +0100
X-Gm-Features: AaiRm52MTVMiTpM0i9MlUZjHffQyXrw3KWoskvowMtDy55m8md6c4jG9AKNO8_g
Message-ID: <CANiq72nXHj2q6=1jPYTds99=sLf6VX3WQwYDXBCjWfObnx9tFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] rust: refactor ARef and AlwaysRefCounted imports
To: Shankari Anand <shankari.ak0208@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Wolfram Sang <wsa@kernel.org>
Cc: =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 11:16=E2=80=AFPM Shankari Anand
<shankari.ak0208@gmail.com> wrote:
>
>   rust: i2c: Update ARef and AlwaysRefCounted imports to use sync::aref
>   rust: usb: Update AlwaysRefCounted imports to use sync::aref
>   rust: types: remove temporary re-exports of ARef and AlwaysRefCounted

Applied to `rust-next` -- thanks everyone!

    [ Move `ARef` import into the `kernel` `use` tree above. - Miguel ]

    [ Rebase. - Miguel ]

I don't see anything remaining in linux-next, and #1 was already in
v7.0-rc1, so I just applied all the rest, i.e. including the removal
of the temporary re-export. Let's see tomorrow if all goes well.

Thanks Shankari for your patience and keeping track of this!

With this, we are finally done with the move.

Greg, Wolfram: if you didn't want me to pick them up, please shout!

Cheers,
Miguel
