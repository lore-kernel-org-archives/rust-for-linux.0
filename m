Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765031CC171
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Oct 2024 23:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727997841; cv=none; b=T6coY4rhfSSPLBINXR/+e2TDPyNLnEmNmny5VG0cJ4xQy3F7e6YFVxqll40YcJcA012FadS+vwJofm91bafjPC1yikA3URAOtfYZ4iPLcXiTvADpEed6I9Vy/MTJVmfG8UTnzxxeIimhWZULvjCb1do1IIo+kwlJx0f23laqjdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727997841; c=relaxed/simple;
	bh=s1aTvHYQp3zkzyaAQ9GOpvxrmVdNZxFnz17IPXGmbHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvA57x72cyV9qTwLuVCK8T9PMysuYGkunzXTsK7igz5ze6QFiiG1fTjp/lGFVd1rAacPtnzX+kycoEFOmlCSAcfnWFFh6yVDnBXtAt/1csPIKHU8epDnW82rnS4bO0xDCvI6XnbVGgs5w1h1d5Hf6XLQwXV5fXC00b17UE27Odk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFgRptis; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFgRptis"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5398d424b0cso124107e87.3
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Oct 2024 16:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727997837; x=1728602637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1aTvHYQp3zkzyaAQ9GOpvxrmVdNZxFnz17IPXGmbHk=;
        b=aFgRptisJoPgCzS0kJqDtF/w/s+DF+9oZsewpwoBSdBG1zkpG2uQyjGePPxuUKrF5E
         YVTbERNAaFXM5l1lHJjbxcC3ifntx/EaeMgDhAzdqT6KR3YzpAXbrPK+pTFkhL1y2eTa
         ISLkzsSkBqgWGRTiGCS8eZvGdqs6Zd8FXV2hOBox0Ws63ua5BB8v3fsnx6yp5P61bpw8
         fMixjTSXMjAYY7vJUKfG/fNkxvPnHx4UU1MEaATiYu/19tdJGwZ2YnIU+46ABPFW1nkX
         3xN3PUvZrDh1f1kTBvWya4UUEezhKu1ybUIxmoFclrFezoNrV50nJbd9nTAiAojnp3KU
         9K9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727997837; x=1728602637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1aTvHYQp3zkzyaAQ9GOpvxrmVdNZxFnz17IPXGmbHk=;
        b=AcZxlHjcsGbhMifQgEBE6KoJKaK6GNCJ04obGXymX9ME18n4HvxY7FllfTeYYQX6P8
         RLpNp2+Oi+s9L35WCd7wymEs+8WPQGuJOLAoNn7flYON0wcj3Prh29+GZosSMwF60d8z
         bKoCEkl6nQR1Id26msgSVxMoKAebgmvLyr3/xtSonc68seXj5GZ5JJzhlPqGUnwMHz3o
         H0++nmh53mzyja2gcNwZxmFAKkGQYBMvwwEJ6AiKnDX+iqjoTuRcC6TkKMOYtyKjpyRM
         DPHMGhPk0bjnnnq/CeLzR1X8APxr3r97x+Gm07u73wM14zXo6hYx4mPrXf7RFweyNnDA
         YSFg==
X-Forwarded-Encrypted: i=1; AJvYcCUP9hn8JlWtcx3fQYB+jLnOfKts3yx7hxJ/2/rZmOF7ztsh59VpHw3f3TzQLCSvIVywjus4oZl5bv0kmSj2wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOmKA9KT9y70UawgJmRlSp7h9QAT7Uv+vg2z1B4oQd1OhhJyBz
	jVu2Xk7toHaZohzKY8FM3kn9jUZWgGZ8weKmtQ5Kuy/1D6OLaky539CDYi53+w66F4k7f0hcq86
	+klcRf0b8bzFwzphfzVSESdavw8k=
X-Google-Smtp-Source: AGHT+IHJZeK7Q79kxXmRv2tR0GPA/t8FWzJ3QsoTgiIqivBGw8I0xHmv7IGqX2ppM/JYUbD9ERUTGwsOm023Zkcfcgc=
X-Received: by 2002:a05:6512:3e09:b0:539:9505:7d2 with SMTP id
 2adb3069b0e04-539ab9f0723mr135692e87.8.1727997837165; Thu, 03 Oct 2024
 16:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <BL0PR02MB491443BD775D5D63635C3F4FE9712@BL0PR02MB4914.namprd02.prod.outlook.com>
In-Reply-To: <BL0PR02MB491443BD775D5D63635C3F4FE9712@BL0PR02MB4914.namprd02.prod.outlook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Oct 2024 01:23:42 +0200
Message-ID: <CANiq72mGJK==2YFnBFG06oPsrf8i3Wenx9zO9_WWWzvhRknh8w@mail.gmail.com>
Subject: Re: [PATCH v3] rust: optimize error type to use nonzero
To: Filipe Xavier <felipe_life@live.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	"gary@garyguo.net" <gary@garyguo.net>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 1:16=E2=80=AFAM Filipe Xavier <felipe_life@live.com>=
 wrote:
>
> Optimize `Result<(), Error>` size by changing `Error` type to
> `NonZero*` for niche optimization.
>
> This reduces the space used by the `Result` type, as the `NonZero*`
> type enables the compiler to apply more efficient memory layout.
> For example, the `Result<(), Error>` changes size from 8 to 4 bytes.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1120
> Signed-off-by: Filipe Xavier <felipe_life@live.com>

Please note that, for new versions of a series, it is typically
expected a changelog below the `---` line, even if small. Otherwise
reviewers need to scan between the two versions to see what changed.

In addition, you have sent the new version, but you didn't reply or
have a comment here on the changes you did w.r.t. the feedback, so it
is hard to know why you changed/did in the new version.

For instance, you are using here a `build_assert!`, and that may be a
good idea, but I mentioned in v2 whether perhaps this is guaranteed by
const evaluation (or not). So given the `build_assert!`, I assume you
found a case where it is required, so it would be nice to mention
which one, for instance.

Thanks!

Cheers,
Miguel
