Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBFA3B9D83
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698972; cv=pass; b=ojhf91811vJHabgwY59vx6lIGWJThYUZt/kAUGxGNDt/x8M9SQalXdWLDkYL+oePqGfphLIEXosd+qoGG8qWIELAnrZ68WhLWd5C/j3JE12LlHfpUkHlM3GO0w4WpPiY0B3/A9XK5BoPsAe7iFG9iGrcyaFdib2YnHA2JtPCVPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698972; c=relaxed/simple;
	bh=EUIv/v9If5sMrJ7ZxRvlVjCML+V2/1G7/EZAFvUebhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoxrlD+MVypIBM85ZNhWxPb25Um/ghs9oya2PVdhJYjNxTLVjFaDkAQnCr3D9DvNhLtuCaS/1cYRgCwuDLGoubbkFJQgJojFKd+hsa4mEmBqJCOtUVr3wiZLSbBmK2O8XmvbYdjc/QF59vmRIXNVKoFFSb67ldex7LeDiU/aqo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqnmLP0O; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqnmLP0O"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343697ad877so295375eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 09:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790698971; cv=none;
        d=google.com; s=arc-20260327;
        b=Y9W30GJm3GYdlfUZynH2z10gqpFOIVH9fsvF7F/t2EopqCIoigerDz4P/9huZ9A3pm
         k/85iXKpUDg1Z9wW7U0pg6d7Y0WQngaeaFT93hRQyRGK8AkZMblZCE2ohSCnok2I9BlQ
         3QgQp+pNy17NACYbQWTIfn0H4sQ8mMDNQL2xCueln9XN23VGmnPFUzb+tfHWhu0HQh3m
         NhGFg0Nsh+ZrOvYUcfUIY4oTp/86b/zgRv0UW0CSbYztOeqxkpsx9FmhEpk0DDDJIKdH
         tCjdhW54+IUIibxbMEW4cKWzzMmbgOgON97lb2p4ZVuUVRIvuG+MgCtJoGQ/VqiXdWax
         KGlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aeqA9IgsbpJKecOhElEeP5QFRXfeP7pkj4jRPnaVoXE=;
        fh=d503ZY8NM8ZGcm77B9SE+HnNtYMxf5YUndqXsx1u3rA=;
        b=gLmkJ65WVQ9Ts5v4yd+wJdICSU3JtqyudD2DWIxFEGgX0corUgzbyLe4uRvbs/1wEr
         TzTRcU8yQgBYwYi2q07SkhVcMyJncfgoG1zfx1al+QhiUlbvrQR5r6ixnb6M6QXZKuQ6
         2vYsXsNUB+zXkirzqoXy5Nbuw2MpjNWUGniOPA49wWlkNXWB3EO0NQ3Lc5V/AJXHUtIB
         PgmjHaycAmz8X8BQ0SDBhFr5A4OfHC8wWJSDTyL6xuez966yzf6Atv0z9aAwn9jXzfKT
         xz3Q3QIgZ6MkMHRM6Gvz58S0tYGe4dNe4zkfQIIezf7ej2fc2nyBH93/vSKDLMOF3AX1
         qWOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790698971; x=1791303771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aeqA9IgsbpJKecOhElEeP5QFRXfeP7pkj4jRPnaVoXE=;
        b=YqnmLP0Oyf2iEMQAuB1FYESTQLGud9gQFsFRwPdTeKxbl28hgZ3pUkAMYsu5xb/Vxd
         cNb37XkHl6kqZ7sr/ey6sZ8mEGQfJaIuawhIsmtoBJNyy58eqGSUdSklX5rxeBb26vlO
         GZi1cbNv9TIqCd4fDYSeYGzV2J1vEau332vskxFI+ypkOebLghTwNIUr/8y9+8viPLQW
         5uUESiEvHPmjpaX9Ixj9w8VsGMG1yPnzIuFSD0+eyIDQ3/q9kwAE55QR04PHg33c89Rt
         xHJkvR6mNL/tqw4AwaxV9ULtKKcB4MVHmL5y3pnVFBZ9L7qroDDGhXLBRQ++1b8QSRst
         zP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698971; x=1791303771;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeqA9IgsbpJKecOhElEeP5QFRXfeP7pkj4jRPnaVoXE=;
        b=bG7SU69xVHK+nlq7hZPRGEr0YCVlJhw+ihgGQZLOqXJDDScK6R0PUWUlFTTmx4yHJ6
         86jBIkGy8mP1S6yMNMdR3vHej8JVMvFq5JDhDRStRgk5NRCzrACL4dD3BNkH4+X4akDz
         grafoFH0qlE/P4cNY0r/tVrz+XyWE1FOkjs+KqISmD7vd9kw42Op0NSGaEl+dYxduV51
         p983RBVxEw7llbzIvkSY3YV8sdMYGQtrSPCpfkgjeRCpaWA3Kjrc3fWXxB2Ta7CXfIYx
         m2I2uEm202oZ4YAUWJ6M0Vek3CVuofwAShdYAOfwCLwvk77rXuKmsa3PkTiTID+a2nsi
         dvFg==
X-Forwarded-Encrypted: i=1; AKwUvBwpsuZCCCuPUaEpOkSMV+/wC7awbkUXiSpp/byDfYDiyooe6wVn7SPtP0+x9jptgX9XnIAUqaLjovhmLFe7oQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLJutIBxbxXeVbKrNZIeZIxhcDZkCWIF8hrws8dm4w4ec0hY3WY
	rgQkEpjxdY18VN9GjkpJEMSwLD9obaXtFEOcUSvZLWmLC4CrhA5kAv9RdPVW8gmh2esx9dIoCg6
	9TB7h823QXQAWd9TAS+eWV0woOUGxsHI=
X-Gm-Gg: AYBFou00adKVk3a6nT5U/GApIQZJX00mnOk2Ksmqn9A7uvSvq17iyRsZdufFo7L6zEy
	qxy01aUYqmgUQZPiGdIiVxEI2X1x+A18cjRMhEZyUYVYlE8C0tJZerDLO5vjp0X0ZQmW0Ty5YwS
	h8e17/hHgEPtK9EBCXxeWDpABKzWQyHt9vihIZHuyS3gvBw5HVedM0vtvPAY77P7vSB9RJ6+HLT
	gMYZKYBtiRSUZsyRYkQQR198cNMRRzkZVuwO4tNbR/z7AoM6LBa+2Mrrq0lN9BijSrnNK3ecSWr
	wFPpo09HpAyqlic0qSTFUWH/5/bLlQMTTH0QM9Bte1lubt+pqnW0+k/SjAO++4u3thO8Ef/TE+t
	nD55zr4d0s3jeF49Mr337wMZOgTQN3K7H/BIFlkmukcIOCX2nTJsUMtEcJ1iO+5hZwXGMtYxRsD
	6ixBJwfJnYg9H7cgWSG5PYvZLnpTGHcrlMkDK0tf7amj6dRcruNxE=
X-Received: by 2002:a05:693c:4092:b0:34b:7c9c:9a69 with SMTP id
 5a478bee46e88-34b7c9c9c19mr3727503eec.0.1790698970688; Tue, 29 Sep 2026
 09:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790599486.git.nico.antinori.7@gmail.com> <DLRXDBH5LB8G.24QDEEJWMGJG7@gmail.com>
In-Reply-To: <DLRXDBH5LB8G.24QDEEJWMGJG7@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 18:22:37 +0200
X-Gm-Features: AclHuK_Wo_2TR6t3qQINXg6vuhw5smx_hDmbOB227r8MxbF1Jg4nL8yAzsAQFa0
Message-ID: <CANiq72mzKkiDM7iBuDfO2u26roEaGGfYXQx4W0+33JHwE2p+jg@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 6:02=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> For some reason, GMail is not letting me send the first patch of the
> series as it marks it as spam. I'll check what happens and send a PATCH
> RESEND of the series or reply this series with thah patch (I already
> tried that and failed).
>
> Apologies for the inconvenience.

I would suggest trying the `b4` web submission endpoint in that case:

  https://b4.docs.kernel.org/en/latest/contributor/send.html

I hope that helps.

Cheers,
Miguel
