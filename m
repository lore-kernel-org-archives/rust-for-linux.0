Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DF53264E1
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 23:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774221309; cv=pass; b=L+5ftgn3bccZuzzpY4Mw26zyggEtma9zRyKEoKpB7/c0r4RBZSJoqqLtwCkxr+R2Qt6nWU4v6Fl/tuNY/Fvj4Id8T3m8lNqUkR+weOqazBwRq+iR2wdj99yO/RyoGq6yuBLvKCjyh+wma7mkXvhXvlpijtCViJ3joQHJ1id2ou8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774221309; c=relaxed/simple;
	bh=l1xFqVRM5g0mldG5S0j0ArZ0bW2qE09sKE4MGLraQDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIDnJrd8zRgsCxA2GNVbuoFJYee2ULwMcDWaX/sTi+tXFoC1lVyeHnyNoKXpOIhUpW0bJ0kywQoCBVOjnl7j5HD0/kfbUKreM6hPmD1y52xD4Pc282AaWXqVs0AwbAaLTJaMGHoxQmRcfvF5+6iixXO6bb7Y2Lhw1OqrzemLWj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDnfcw0o; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDnfcw0o"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c0f76bd201so218291eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 16:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774221307; cv=none;
        d=google.com; s=arc-20240605;
        b=G0X+EOKn2E1Wbs0aycCzydtfFn28VYyFGQhXC5HF0BFnLjtsmJQdje4jWBrdcsYogV
         Cm118cp5SQvoGDlwOxcDSIrHVpseoYFC4lzV+2htSu36ONu4xA1LicfxhU6W+av2V7G1
         zbwqa/DoCdnsww+YdXrcpr9NLok7PUURgH7jDZ6b0QtkiLwlS9WHLx/j8xa4NktYZ43H
         daSzf2FO0OP0H4Zd8H43sF2mlWLThK8YaLtb5OA4ukHLnmid88GCuYykRlxR/VXMtaNO
         nUd1n6RNwez3lfcyzU6jC3LDRYhYcn9iHHhwZcSXytqciO9m1kJ3dCzFI4NIBWELjZ4s
         mzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4KgnFwGLkYzw7HlceoqXuMG6PSurTXLXtNmfOOTYj3k=;
        fh=4OSR9zJk80lortKr2tAKy0oiW6h5yhDXVLqlq40Dpmg=;
        b=LPVpBeRpq458MvcEfNd9JFBCBdZMzBMf25O3u+nb67Dp+u7S+V7Ps2mQ19SXRDvBhr
         Qu5UQ6PPvHaSCmA0+qI6kiutdfsZUwXkC9hagBf3U9lgCNUVbA8PlqiX3ncKAhYEeQcD
         VFf+pqhZgv2aYmQo8PlrT5sVHn4vE8a1AZlv8QKYaftHn2HZdfIdGDqqoegvXefWkfnK
         SeDoMnJM4/qReS+LfGA6zvw4bGBxIT32cxciHm89od1PtS+oNK/b0ynf/5AElcTpW1ej
         u0gu+JMR+iKXl0FvuM//OLfbQo1jNFFGKcW+zgbvAvCgslkAZ4jDzoW6We2WRXbKMXDT
         jAGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774221307; x=1774826107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KgnFwGLkYzw7HlceoqXuMG6PSurTXLXtNmfOOTYj3k=;
        b=mDnfcw0oTh3oGKPfquwji3xPb6UU+NsqbfbZFb/3KODYCjJy8+QNQpkOcJx5Ta07ET
         1MkNfTulXB8lJRyQVqZQbQD8v2YfbllatQAfB6WnkL8EYasZ4AZ7VklSiZPd1wqW38l3
         fNvOPUt8Jq7aCyszMJBI9ohPVzidCNISTAcm4w8P4K/8AFT0v0NAHVOwJ14pKSZcCQFa
         C8ZLZ+aBYQVnwMGQzKIQHyu5NSstW73IVW//MhvislGEAWgKi4zwjazi9TuN4WQB7JI0
         xIDEyx0rP70/EItbHXXqDz5ODHPLNlMzqrUA6ZBdH/v4bE9Nq43s1xaapugI25rwlLPU
         eEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774221307; x=1774826107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4KgnFwGLkYzw7HlceoqXuMG6PSurTXLXtNmfOOTYj3k=;
        b=SEIGKl5kKi2tAOuBi1olD6WRXI82kxrD74+jMDLZJnqCyqd9NSQbmYQhq0TfhMgz5Z
         98o81sMEWFFNbcC+O4+Pp5SGlUj9ET9Goz9VQyQIDG1MLylB5x9Xp15Et0qrI0UOnTwn
         g309gwiAtEg2HiNsTroPZjsSx+YFWdUAZqGOhVc6IPryK0urnuYEcCGKvMsBmqh4KIGG
         iulnw3uLXZIt2RHPu4FzlGiQUnTafPymi7mBZRc9PyBOcrlR3Up2aSPAdrTYWSTWVLTq
         AI17cBl+q8DT+Pwj/CQCXiK0tOEIhk8Hdmu6ga8vefe4Tzno+3e3UwBZjtLj8NZh3eDL
         am+w==
X-Gm-Message-State: AOJu0YyYOaDjeDn7rpKxXojqESNL3H3tp6eeRMe/ZSUtB/A1emgODjC1
	IZr44f65YaXgJ3uaTNOaO45iL0B00l62rfTma9RroAktt0+ua90BYsX4LguAjhF+4frl7QF7MI4
	rtX+Rd/GnA8x/u+Xpt9z63bFK8j1RwHE=
X-Gm-Gg: ATEYQzzJxprMe+nwvvPKDY2RB4I7zi0kn9Jn+E18dnVMOMUIrqgJ3K6eySx+LiZh42J
	fO3p20bcszN2RXp0IorwOU/R2CJbq919W68+ywwIcSw+5YstmLJivBRR04+IIMq6iFw0qdtrjdj
	z13Iq7ecRJ8wfLK8qwF8Wg+gCVB0S53PzHG/WOkVrOwkxIFFM1EHdOwedq9E+kZp0/aM3U3dW0c
	mfjlx7HI0yarl4ec4maQGt50tckp8Sm/iySSGuqHjoJlK39qJNwo10QJW6ZTqk9ydUQUrqJSN3C
	uyx7DIrPKwTz89nTKYR7fLk22aTfMohcgGvcpjHF42bNKyuAd0fyJuxr1MmZpozKff58zbdD0nI
	7sBS38ANJREl8v+o1+uU9jHM=
X-Received: by 2002:a05:7300:5711:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2c10977df97mr2253511eec.5.1774221307002; Sun, 22 Mar 2026
 16:15:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119062925.1647-1-nakamura.shuta@gmail.com>
In-Reply-To: <20260119062925.1647-1-nakamura.shuta@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 00:14:54 +0100
X-Gm-Features: AQROBzBYz3IJaYDFiVjIGy1vwpTWgaJqfiwzorms4qPBSQZgkpujvS-b0NAbtfw
Message-ID: <CANiq72=9Dh9tN4xFZmai0dFKKa_GSD+WOhrf_bxpFprbfZrgPw@mail.gmail.com>
Subject: Re: [PATCH] rust: str: improve safety comment for CString::try_from_fmt
To: Nakamura Shuta <nakamura.shuta@gmail.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, Kane York <riking@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 7:31=E2=80=AFAM Nakamura Shuta <nakamura.shuta@gmai=
l.com> wrote:
>
> Improve the safety comment for the `inc_len()` call in
> `CString::try_from_fmt()` to clarify why `bytes_written()` is
> guaranteed not to exceed the buffer capacity.
>
> The current comment states that bytes written is bounded by size,
> but does not explain that this invariant is maintained because:
> 1. The `Formatter` is created with `size` as its capacity limit
> 2. The `?` operators on `write_fmt` and `write_str` ensure early
>    return if writing exceeds this limit
>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Reported-by: Kane York <riking@google.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/936
> Signed-off-by: Nakamura Shuta <nakamura.shuta@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Updated tags: it was a suggestion from Gary from the mailing list
      (the linked issue is mostly about adding a `debug_assert_eq!`).
        - Miguel ]

    Suggested-by: Gary Guo <gary@garyguo.net>
    Link: https://lore.kernel.org/rust-for-linux/20221114145329.0f47a3ab@Ga=
ryWorkstation/
    Link: https://github.com/Rust-for-Linux/linux/issues/936

Cheers,
Miguel
