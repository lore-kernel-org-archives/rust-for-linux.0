Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8033270EAB
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089692; cv=none; b=jHd7XemegihDF7pjLRRk26goEMjoP1yGpmH2KbG7XHpDpMuISOT6YFCEjzmxvfzIBNZVKMZjqgHjsk1d7sMvdIuFLSPYwBOP03Lw1/MMLjlZBOD52W6na1QeLQRE1JjjW0r8xRbLSWnUg2Thq3So7yfp73kuVDnQ3NbHlOfy3Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089692; c=relaxed/simple;
	bh=Vw0YBd+yagQHj/GI8F7SjnABsBmKOd5j1qud9rfR2Qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EzftzhkxbyMcprpZ+NxiON5bkjZWAnwKrJZl+fydWmKhoeZQPYTGmcHaar4pHrIhTqamhfrVDij+Hs0gu3ylSw8NjGyZLMCI/+EQYPxBQBj50ZIQCEivtzMS8oCvX5a1V16hKLGEo/tfgbia4XxPAH05GtvohH9ngge0Mny3cDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImUczByz; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImUczByz"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a110548f10so34230385ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 02:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767089690; x=1767694490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQooNBO9/nbI1z3yswqtit9Ay/A7mvKF89wR8GBnPGE=;
        b=ImUczByzP2OsLZbqijIvMFiC6Y/jy8XJ3jVn2vSpR/Qfsw+bexp98xtv0wCbrAmU/W
         9wZbX9NmugajfkOQHugt9UzEo9dCWvkzFuw5ZbymasB1aZTC9YRT4QKPj/LNxDt9Ere4
         kcIVrONd8LIC1BJ9X+WsJYvgbbvJXlqOaQrVLRen1ozOvug9iZOO6wHrBQPITzWhak63
         1gz/13tt7pIuecjSVhCMSqibY7u038y3PXr4Cif06mniK9yOi8ZvlITkVF5QCz+6IgxK
         cy2ShVvcJppLa6LvTkuOM7rUzvnhgqxs7d298pJ8rLYIgk9JL2XnvJmS957GQDsReJ0e
         IQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089690; x=1767694490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EQooNBO9/nbI1z3yswqtit9Ay/A7mvKF89wR8GBnPGE=;
        b=sJ6/rUFDsuOmjDgT9bhM3/bDz7SZSZwdQ+lhvc11ukVJ71yt7q9N8cU56+Edg2RluE
         Ojwq4wT7WW3hlkWBuEWT1O395nkWZYNJK7UZEatboIk042IxNWpBwExw/a2978TYDAgt
         tnsvuY7BmDpM7j1vTGDKPiPweEaoYDLPzt/yGkz/m9w1ZTo2WiSQLpXQsLaY+jauAQBe
         WQk0uXdZV3L54SZdMJSrYLjorMJiu+DV98K0h51WB6XH6wLr9IToPPjLl725q8kLu7qs
         XUGZLFtlC51j+pvAUJa1TVvB7JS1FQCyGjCkCZPHNrD6lFZlrN4N4L4sQfgv+mNIr5wk
         gFhA==
X-Forwarded-Encrypted: i=1; AJvYcCUk7jnPNXMT9lgXz5Ysi6x7oOiBBBItDVb7h0DYIGFQtTf7Zl+W9MusuesgcL6MltmHBOvg2cW6RgSPlQ7a3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqmjSG6o3+ypqmb8ucP6TaJumW+zKdWePn4TMWuUjGj0scsNNi
	UkFDgSSr1XSKFGKQMwiTAGzBFfXVsQ0fjs+j0vJU6jWVxeKfWkvly/+brV7DwL6vTZvB4Uyt9dw
	aX8vv1Tws6aV7DP2XCkLN2atfyfA+Um8=
X-Gm-Gg: AY/fxX7QKMwmd3ZfvMmzvx8uQ0VfSQ0qSoLUgJWXAAeOdEvg+Q/B1h1byqTVe8Ccz2W
	42LgzNwtwTKDxCc2tzXb8K1WXr32N51zHRr1f5xNabhjfTRuM7egTvx5cCDne6UJhIJ6WDyIFMR
	GZbeTY+FzGUTHCrrqFpzX0e6096B+Q5dgxDtYNKb4lTtN0T2oru09EcqC2KHOtOdiYeOqC/1j1x
	JkvrajcMBy80Mg7HQorKLjYa4MB8gUxA9j7fpfUxDnakx+98x0ms1pkq7wW4zgMBJs/BHJG3mHp
	vxP3sVx0lTjnYSzkKX41UU8Z3TXSZIDNWITbOUuA51M8W+mDWRQZqxrKBZSyS0R9TXr8PsssN+Z
	BYRbZvzr89kNO
X-Google-Smtp-Source: AGHT+IF41PIsxbRrwF/2Ikh0B42Bny10GO5CEeoMYAV62DMDkBm131qGKK6V1epJeSUCc/0Nq6cjM0BfxLcCw51ZJf8=
X-Received: by 2002:a05:7300:c00c:10b0:2ae:5d59:3ef6 with SMTP id
 5a478bee46e88-2b05ec8546fmr14162320eec.9.1767089690063; Tue, 30 Dec 2025
 02:14:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230094841.76830-1-bshephar@bne-home.net> <aVOhfWmyJBxD4SUa@fedora-g16.bne-home.net>
In-Reply-To: <aVOhfWmyJBxD4SUa@fedora-g16.bne-home.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Dec 2025 11:14:37 +0100
X-Gm-Features: AQt7F2p8HE-4A4GyPdNNakuI5GpD0xhbJ71lZfkkAolIhUEE_Y1X8nqw_Gg8VpI
Message-ID: <CANiq72mdkb6A82oy0DoUWn=jv75-R7EHTNvJRW7o=JeNa3eeHg@mail.gmail.com>
Subject: Re: [PATCH] rust: Test page_align usize::MAX boundary edges
To: Brendan Shephard <bshephar@bne-home.net>
Cc: aliceryhl@google.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 10:55=E2=80=AFAM Brendan Shephard <bshephar@bne-hom=
e.net> wrote:
>
> @miguel, Thanks for the pointers in:
> https://lore.kernel.org/all/CANiq72kcMLXz=3DxyZeKC0=3Dj_e0BzJEY3wGpBTTxfJ=
sc6EZhCnXA@mail.gmail.com/
> https://lore.kernel.org/rust-for-linux/CANiq72mLPvB_6Ow3bW5-V4-km=3DRyA59=
chQ1g1x9qUt2P-zZweg@mail.gmail.com/
>
> Let me know if this addresses the points you were raising in those.
> Maybe you just wanted usize::MAX and then one over? The first test
> case might be unnecessary. The last two do a fine job of illustrating the
> point I think.

Thanks! Yeah, either way looks good to me. Personally, I tend to like
tests that check both edges.

By the way, the original comment mentioned "overflow" explicitly,
which was good since it conceptually links to the main docs which also
mention it. It also seemed more aligned with the other two comments.
Perhaps you changed it since now one of them doesn't return `None`? In
that case, I would just remove that bit e.g.

    // Requested address causes overflow.

i.e. I think it is clear that the first case is not the overflow one.
But it is not a big deal either way.

By the way, in commit messages, we normally don't use paragraphs like:

    This patch is a follow-up of: "[PATCH v8] rust: Return Option from
page_align and ensure no usize overflow"

Instead, it is better to provide a lore.kernel.org permalink to the
patch or, if the patch was already applied, refer directly to the
commit with the hash and title. However, in cases like this where it
is not really important for the change itself, I would just move that
line below the `---` line so that it is not part of the commit
message.

I hope that helps!

Cheers,
Miguel
