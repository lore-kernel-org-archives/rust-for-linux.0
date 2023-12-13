Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCsoDXmj"
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66CFBD;
	Wed, 13 Dec 2023 10:43:33 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5e309941f46so6509167b3.3;
        Wed, 13 Dec 2023 10:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702493013; x=1703097813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Py7pGp8pdHDiaozPkIU0AHzFq8SxGOJ+oThpJ6qUk8=;
        b=TCsoDXmjafpgTI7Dp36Z9MC4UU8R/1Qw9iIoo+8ZoUeQsOyyqFQWZilKs+FMwsFIH/
         9i1JjOKAy4S0q/R1dlXxDCZJlVVCWoe+nA4cyILEYKV2hUf6MrYohHEowTrtzmlltWj6
         NaSvgqDNVsVVTQ54zHE7XP8SpfK1U215WHxBG6/XemML6PtTbfwpRg7LfONwwI9MXv53
         YukPwv2YvtnSgwsIzSceaPpubK0xXUaU4d8ZClluSyZg5bB3NtS69iz6F9f04VYfGpIm
         slIqwUdLP7rGkmqqfCbC0d50dIwJqZuwVioo24ihwh4r5UPB5n+PqhpuspCQCDbgBuLu
         TMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702493013; x=1703097813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Py7pGp8pdHDiaozPkIU0AHzFq8SxGOJ+oThpJ6qUk8=;
        b=JuVZsFuZMevMP/CkNmzG6kR8KwXiGBG30ji3nh7LXNBe72IFn7QRV8eWRQSqNlS7sj
         Boc5zrEtZLjOFCsTvGs2b4DXiM+QLAcVChWAQ+lyqkSTaHzz25s4GpGb4YFLrkjcnOJB
         P7frBq4n5jPulSUxGELGyYWJMvqNAa4DaFVorMAMpUbdLzPcAuGq77VBnc/4NrX4ngVO
         f6MOstT6mEhR7IbzV3fhmE2GHzfHtPHsBds3jtNO3MDzD54lGUXbecpSkdC6v8mHf5Iz
         8y6dchP673AHzUXvhRY6It7XinTCe6UcdC5KLz0DrrguyoPE+Lhn3G7zAaXzrCejReUj
         I42g==
X-Gm-Message-State: AOJu0Ywe4EmrcrCwjBBfbHk8ihZq2L40n8DV+CJkFjPAbwBwJ3Xp/aaU
	EnNfomtlR9MApvxu7sdkE42wBhHtDWXGaqTQtOI=
X-Google-Smtp-Source: AGHT+IFB4zWxh1M3w3CvBzyO4rpXYYmJgL1IXBNWAJoRVWom5OIFB/LGcpzZKJ1btMxOVZajc1S1A+iIyRqn5nNfjNY=
X-Received: by 2002:a0d:dc83:0:b0:5d3:9fcb:b699 with SMTP id
 f125-20020a0ddc83000000b005d39fcbb699mr7277271ywe.49.1702493013147; Wed, 13
 Dec 2023 10:43:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230714-cstring-debug-v1-1-4e7c3018dd4f@asahilina.net>
In-Reply-To: <20230714-cstring-debug-v1-1-4e7c3018dd4f@asahilina.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 Dec 2023 19:43:21 +0100
Message-ID: <CANiq72n0OiZ8_Ot8-PxU2rV8k+qrAdk_6tvCiWDMMVr7R7nbsg@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: str: Implement Debug for CString
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 11:19=E2=80=AFAM Asahi Lina <lina@asahilina.net> wr=
ote:
>
> Trivial implementation.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Applied to `rust-next` with the commit message from Alice.

Thanks everyone!

Cheers,
Miguel
