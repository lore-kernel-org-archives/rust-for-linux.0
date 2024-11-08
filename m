Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B2E1A9B2D
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Nov 2024 20:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731097544; cv=none; b=GdyH/GZCtX3D5IkIcpk2vMg34JvXU9x9QyFeeaW4wyDmbMcSjYltUjw8vWxBeCVeARvHx4IwlkWDoR8+0nn6WyeQC27c7ic2vLXbT150XqcaaTa5n2o7LRUDZ5+3n63CCdbPhBUCjuHCgy8TqN4WrEUYDs2BSl5M/WyloZ5YkBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731097544; c=relaxed/simple;
	bh=2vkSK+/g806W92Qz+xLzypmnCyBR38r3BPq0IGY0p28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzAORp9qaRyiKEpd12NLmF9OYcnHvbyzOeAZqBixJ6I9A7LnZTy1I6Vtq5M0OYnnvY6oGZ56dlw75dRWnfBtnmcAHM1zJPQN88L7O+Vmmo6Nt8YlGSF0VkYXhFDk62bsbLJV9VAPPlLCA0wJ/5a1R59NMQqfeWI69SLsJ+aYhcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c52PCWS7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c52PCWS7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2b4110341so349860a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Nov 2024 12:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731097542; x=1731702342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vkSK+/g806W92Qz+xLzypmnCyBR38r3BPq0IGY0p28=;
        b=c52PCWS7Fm1xDeL0ac7FXy8LtAUNwvHRHNDscUExz3t7LzTFuKRBXaYQQJ98+XwjpT
         05pp0ncUnC3A41OB7dXR6ambMjnVKEr9w6dxgQWAmE+NNe2sjHaNnpaMijXIMIhejioU
         UuelvI2PQq8erhzA1cfPWQmJzKyT1tg/Inm9Y1nnG9HqmS0jrzG9ywK3Dj/5zj9wLTJr
         uDbMZV7eJXs6eY6w3bOqK8P/uFK2jZCPp69W7fcf9t35xf5GvU3GsdX2foKpxLdYX3tm
         IvON+FFcIHe00hP3mNmdEmps5C7hFjP7whCjrlVJj7pP15dAUzjcexwtyhj872upgNKN
         FMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731097542; x=1731702342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vkSK+/g806W92Qz+xLzypmnCyBR38r3BPq0IGY0p28=;
        b=TTTqubtq9yYGNU+6F1l6Z7ug/Iq3bY8SDhxZcXfv4EbLLXIhXkzfcKEIfrRaDlsxpz
         1u8WwhzhUfEnV6vWjp+1naYuSbxaJMDzUneFBSGD1SAh7MU0Rh/HcVCbDYZWa8awE+NY
         9bynfT7NF6p1x+Gb9GgqQ6Y+4z1anFNvC47pexHKA8tARhhFyqV7MjbcdYKTRc/itAqp
         PHilPeatBW+FqC+VkRp/+X/yb4DRu0eoREWBiKwWVurF7awX1l6ehbC/1BLfDOw9OHRH
         yUAdZLnuyKpzUrKfMcpdPQ0Bj2jPKHIfFgi9rCTBGxW2QeqKnpdihGTxXw4vQaQ2iEZt
         r6Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXa9VkTYA8xrJsNp5BIaZK9/VaoQZwhOJkJK1BeX0VBoQkywoXZMKCX2KkHCF7j0bHI+WPLGu08uRLKQnnrhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YylDOEhSpF2Nb0JK0xFVjUHUDoTXDgcsSv64HlnrGzp/WhhS5ho
	VEg9cAzp+e6VCCoXNmc7/z40B+0z7Pp2btXA0XhM7eQXo0WwqnVVyR4WtAjER4hxBHthlCyiFz6
	V4atmC8C4dmlPQ859UwhaiYtzb9I=
X-Google-Smtp-Source: AGHT+IF0aZigish5loqwOY9YIfoRgmPHMOwASpjvQEjY86ACtCotKZ5AqJwhPGrpJHS8l5hu+vYKXIZrAQm1MtRdPjQ=
X-Received: by 2002:a17:90b:38c4:b0:2e1:682b:361e with SMTP id
 98e67ed59e1d1-2e9b165272amr2452150a91.4.1731097542279; Fri, 08 Nov 2024
 12:25:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107-pr_once_macros-v2-0-dc0317ff301e@tuta.io>
 <20241107-pr_once_macros-v2-2-dc0317ff301e@tuta.io> <CANiq72k_Mcf=i+0WP5_VBV+vsgWoRJccNNgtU=BtNvoJbO1+Ng@mail.gmail.com>
 <OBCOT9J--B-9@tuta.io>
In-Reply-To: <OBCOT9J--B-9@tuta.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 8 Nov 2024 21:25:30 +0100
Message-ID: <CANiq72kwQ+Oy1rdYgMbVXwX3gf-JxK+o=HWFU+_unqTNHnG+0Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: print: Add pr_*_once macros
To: jens.korinth@tuta.io
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Rust For Linux <rust-for-linux@vger.kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 9:10=E2=80=AFPM <jens.korinth@tuta.io> wrote:
>
> Should each commit in a patch series only contain the "final" code for th=
e topic? Or should the series also reflect the development history (other t=
han via the changelog and acknowledgements)?

Only the final code, i.e. you would typically craft each version by
modifying locally previous ones, e.g. by rebasing.

> E.g., in this case: Was it correct to modify Tomonori's commit, or should=
 I rather have added a separate commit that changes the code added by his c=
ommit?

I see. So I asked the question not because of the changes themselves,
but because of the SoB.

In other words, normally you will be modifying your own patches, and
in that case the expected workflow is, in fact, to modify the patch
and sending it as a new version.

But since here you modified a patch that wasn't yours, and there was
no note about the modifications done, it looked like Tomonori
originally did those changes, so I just wanted to make sure Tomonori
was OK with it.

> Thanks a lot for your kind help!

You're very welcome! :)

Cheers,
Miguel
