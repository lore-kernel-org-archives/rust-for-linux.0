Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D9F33B942
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 14:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055520; cv=none; b=kjtZduwgF/hI+NFdcLuSIQ5mJ144VdNlKtaVnjOFDw82RQW1B65kZbhdWSog0DLcjAtH9o28zJ5ow6wj0iS3jHzkBhAbWpeRgTp/mtp+YgOAM19FXJwrZDd59duaTB0R/93qrkUDQ8xVKyHNkm6VmtmK7XtfNRqCrHpEA+CNkRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055520; c=relaxed/simple;
	bh=mq8McGPYiW874B2f+zFkcUVzTQ9LMatQN7FZ2wBtMl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SP4/1J1QZQwTsMZxDAfZRx04VEFya0EIU7Ztsabjm4erVWfE9ev2mY3R1EPz5Qnx4XTRpA+l9R+7v1OXmd5eSBG2/kpZblHaTFaiKdTn7ImnyNJICCApGvLNhfUFtb00kOOrxjMJKb+0R/xVN0ANSzb42/s97bvoVUsP3AgwQmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gXe3rnJ3; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gXe3rnJ3"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-36f13d00674so3989375fac.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 07:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761055516; x=1761660316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mq8McGPYiW874B2f+zFkcUVzTQ9LMatQN7FZ2wBtMl4=;
        b=gXe3rnJ3KHSvITc0SDt4dw0qkK/gFOZVqleHsC2Om5ZU8gyRNKgCYsj77XIZ4aSc6o
         a0+i91UtdyYib2xbNwVrKq4kkSkX2yagfSPUZ9hiinkr9G8J8gw+dBiguYRZ8JsDUYyQ
         nZtZPwY5Ik9CFIYd8AAzEWBVDef2haR6AH/gW9S2AyaxdcEbPd2b9aOdfx9X8OhKp6c2
         8/VHL4f1+uH6UAKAWdchcNqAc2hQhox9CVer7C04OvJjCjKfYVzqS02v0HUY1CY/7DCU
         rjiez0KaaIsYvoOzMySJnxMoxfXFbCJIEAW6V5wRAPoy4NAx5WCakb1RJFbwsTwZuQ6L
         aeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761055516; x=1761660316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mq8McGPYiW874B2f+zFkcUVzTQ9LMatQN7FZ2wBtMl4=;
        b=DQUscX0g8EZ/hq7JCUGovcZpwtppTNwIxkBMlWdG7FeTQk2UW9CsZPyYxwjTp1aIk5
         iQU+nfUnKj1Jkmoja0s7h1ONuH9RLqYKYJ4jqP1tl5MpgoqQ3YP9yObCymHDHlxd86yt
         P7o1f+rsoQ7AX08lx6EXtWHYJ/hst3tbTn0bg4TAcxW84gzaiUFkKMNvzm17BL5Tp3EZ
         FDcavMWcRZA7EqCCE6nbmgd+veHsgdjY/BqUknGERBFivqOIbIKRzvKbCd0QObGcB4oe
         AW+zKCkLrtjMyX2fll0Km4pLZ6By51CRk12vO77fdNae4GLtTTVX1wokdwnVZ6tx8FUQ
         BrGg==
X-Forwarded-Encrypted: i=1; AJvYcCWMvAAfO6GGQYSM4jTjYmZikFE2ysgVXWvc8v6WsLYWjSlwnBI2KeQZf/GYO5ei9Ol7uucN9NwHwXCxwQUFmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs5odK2kRJQMtMLIl35HqT7eCaxgYJTWxqsAnKv7eJ28Gc2wJm
	QL5XgYDnsiYWiCn5EqMmd1E8TPIuFEYbdbma83EogwUyF8hh9p4baO3bdUsW4LTB7F/dfC3F5dX
	YIbBAtswxh7TyNVIGJxXCgp0zZCuqJlDBcTFJP8p4
X-Gm-Gg: ASbGncsDEEGd2GYXb5trGREocRcNUOzceG7FbL0jew656L9pAE+EjGaznJjmnjTiF4P
	pDUhBawh6NkaLGeUyBk0nVIxVsaEW9RzV3A3hiu0pI5eK3BcqraSniEI/5MifEWwol69DMwG07e
	8bPMAQuoZPQYPvjmtn78DGtr83hPISHx3njEdFJGgudR96eRTb3YsEzcZDwWXKD1ABWDDHRezpq
	3VjzxOR3wZiV+RdBaSj+qrUYffkk0kh7HjN2Mw7yauAFJ/4g5xE7ojfbksTLvfO86wpQL7q4vMM
	5bpr2bqfHlHjgrXdT/XcyI6owWEJTYhG2sta
X-Google-Smtp-Source: AGHT+IGxyEfZPwFVSruG8W1/xOtQIYhUrG26ocIcVhqCBqGSQIVZHtMYXA9EgHmYTpDrY7g9PaD8hiES7sQkipj302w=
X-Received: by 2002:a05:6870:7022:b0:2d5:ba2d:80e4 with SMTP id
 586e51a60fabf-3c98d0af208mr7622302fac.24.1761055516155; Tue, 21 Oct 2025
 07:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-binder-bitmap-v2-0-e652d172c62b@google.com> <20251021-binder-bitmap-v2-2-e652d172c62b@google.com>
In-Reply-To: <20251021-binder-bitmap-v2-2-e652d172c62b@google.com>
From: Burak Emir <bqe@google.com>
Date: Tue, 21 Oct 2025 16:05:04 +0200
X-Gm-Features: AS18NWDQtrxzrHOACCR6JG2HeIVeQkNyxhpo8UqCQDFYz8WpeBgJR0vYtvZDDGM
Message-ID: <CACQBu=X9NmVdOPU-Uckj6oFkwNFq8FnrUFYwnx3y=WX6tDPuFw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: bitmap: add BitmapVec::new_small()
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 3:33=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This constructor is useful when you just want to create a BitmapVec
> without allocating but don't care how large it is.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Burak Emir <bqe@google.com>
