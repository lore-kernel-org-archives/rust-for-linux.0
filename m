Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59B5357A26
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769523268; cv=pass; b=h7NMpngJKQH+Yp4VWKynFLHVLl2FnuCH/1NAu60lKZDdYeLsGAiDcRQNYzIEnMyLbkAm6pC97chrXrN4MuygMOe7BT/A97idyNCjJNnapVTU4Eak5pLt368Nc/8LzUz7XCmadpzafM4Sy92n7wBTrEZ2VYB4eypTPRghIFXHr5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769523268; c=relaxed/simple;
	bh=dAHdYOnTFtUUfjLxek+jTi8Dv2Ts0LkzWr8wVH9GERk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3CCTo4cNcgR3NNVnN6313XhSuIejxJK1DLvL/QBY5siyF4ety/Yo643MDxzbqzGhLbJiklqUzxJmNCBbA2X5Zo0XiJ4m84PxHv98KqGe5JFGKoHoUAbAT2tInFdhynjKpLT8kaiRdR0OlXz1fWJq1scPRNfnO9hrzndLW26eGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S86uNwKh; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S86uNwKh"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-382fe06a9c4so43639151fa.2
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 06:14:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769523264; cv=none;
        d=google.com; s=arc-20240605;
        b=VAIeR5crsMNergiOjGBtybtGy1zyIO/41sOH/tMzV92anuuiAA1JB76imd81CPphrk
         Hf3cwrCvsWDr3935iT2AKcWm7K8tmQQZ5145TjKTuqcblnXULYxV9W+zwDWXEMIbZnrN
         RsXgiXmQZnaJk2aLi2CnysZ8ypYt4zahoLLJRVQBUazBFzNGIqSYPgCvnxLr4JqetSG8
         qWQ7UVSaegyp3xfcKTLkxWPHDrmB0kOqPbcBgFrk7stuzoI7QLVBagTNpgTgYxQ0aPGO
         hMWBZYG2dKqu5DEjx1YYzO8figvRH2jZ192ybEzcbmLDv+jQXaiXK5Gnf9yrmWgDBUx1
         jUfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TfrvELjsn6cJgRhA7JmRV4MxQA5oz5VbCbL+bgCyxZ8=;
        fh=VEEP7ao0Nfq/CYidI4JzBFnf/7LIXfAPMwvjxboGn8c=;
        b=RQi7KWilMijZ4tlmhHjnUjxhbnV8itbDNgq4MKMnui2W6vsSl2B3T5GtdUy1ZdLctQ
         7ktPwfZcPWhm5otiRXV2TEQwU/1SUt4kVLVFWhu/j4N+f8d7N1KTyJ5cJegSnkwtMZUB
         G30Dc19gHzbo0Z7d4uZgnulmh2tgxJ5vQZj0LGjxjfLs2K+4B6GrsHYwHJ6Cqi+hXEx1
         fxij8Tim3q4I6R7NU/qwFvCWDHPR0npWBrb1VCQnQbmciUcuOSGvFiAb4xMjmLVnTqAa
         56rOK+7G2GCqF0K6EaZlIZlmUsbOGc+QZjgBuLOeJuWRHxeO0DZbAltA1DRZkfDqf+nS
         ui8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769523264; x=1770128064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfrvELjsn6cJgRhA7JmRV4MxQA5oz5VbCbL+bgCyxZ8=;
        b=S86uNwKhxJfbO7sajSyXsjLQPSX4o9UngOWbW2X6W4tzws1j57x8dHjC4B7Fh5jOCd
         fkTsbsnq4EToPBqt+o8lunjGBB2VDa+3c6uv6LDAb8iIHVaoen75QlJPPSAB3J7UL3hf
         wQUbfZMbJMw9d/CakC0pTISbMrhFc0PZsaSrLshe0I1RIMNjPT5wa5AQCJNyrHZsz/wA
         B25aQKQm6A5oM3vbze09wzDhqDpqK/yMxNWj9uqog1b26EZmKsq7wcAQd1MQnMMwwKMV
         wzctNAzGHdtE8BcHS5jKdoAwVU7Mf+85/v7d/+SRWS8rtILig3njhp0G+CzpYmqULdjv
         6Y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769523264; x=1770128064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TfrvELjsn6cJgRhA7JmRV4MxQA5oz5VbCbL+bgCyxZ8=;
        b=sJdgKRPNHwHvqu6M1x864FXF0WczsSt3u7HQO6n6hSGoi0U+FH4OyRipKnVNnB88/C
         3ImdpdAJuXoy069WkQuN6LyAim7DprMLV+ahVsvUD6oqKJIXxCjYM9maiXxhwvQGVc3h
         t4a1VFKvEqeNLXhKTLDk//huiwEVqjAPG/AlZEt0wQ+UsZoo2tmgZ9xfchoRQccZd3p4
         RjOhubN9YQ0xox9hw0nf4Llm/Robf1tSDC+VOESddlDom1kZUzwqPNc52nwnxxCxUSip
         zj0/ghqWjBW7r80jobsgO1scR3jThiTDJ2OxWuV/1rzD1XohlIUoIouXVoUFN6NavdVd
         b6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw4Qahb7BKG6FS6WAavFG1xFKRY5yKXzTdPdyDOjEbMsXEspoXMIurAOBypYX8e6d7DMHv/IK0I+yVmIjKdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw38kzxWOKvWd8FkUlXDH3Mpm15fOvQ5s8L4dtYViaBJ8tLvkoJ
	YeFPcJhVRy88Y0RKGjxjW7XC2EctBW2xmwip9QsGTsxF0enpGlhDBTc0LMp+DxGNcW+VZi1Yt2t
	cY1lJPAGimI+UTDv5MQX5nGs+2ssaB476QCfDXQE=
X-Gm-Gg: AZuq6aI34nyB5lgAWKYLGJVM2RxmpH7w8tLpCIhkgJJIua3FO2r6ZqL9OnwFQRiKDzT
	LQ0WlocFngbK7YLFNAUJC4Obx2NBo8jnAsURqdY0vPk1DuwRRlniDtfY4ftFYI49x5oApj+ScTN
	SmAd1PzcS8kCVotgbDbhSdgYmLZ3BCbAI0tPiyA9zodXYlwkFrMEitvQF7h5iLLSuv7WknEZvG1
	8L5iWS8LWRpvI7CcllxuuWpY4vEYOB08BI1GfSuMf2XW5KoOmbtYDxpspEseDgKBuBdloo0ixGT
	YtiPX/oqSq5/If4JTfFlft3b5+szyAeB+kt8YJ74qN2IwWTYZrIoamdOF4mCWyiwo86bcP/JMYh
	TTgtgasKZ
X-Received: by 2002:a2e:b8cf:0:b0:386:13d:40c1 with SMTP id
 38308e7fff4ca-3861c843341mr8162801fa.11.1769523263576; Tue, 27 Jan 2026
 06:14:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-vfs-v1-1-18e3d327cbd7@gmail.com>
 <CAJ-ks9kDy2_A+Zt4jO_h-=yzDjN024e1pmDy4kBrr5jsbJxvtQ@mail.gmail.com>
 <CAJ-ks9nZA84HYL_7+raFvcS1G77O7FyHk7_fsPMYuv2K1Ecp8w@mail.gmail.com> <CANiq72nFuR+W=sKMgmxx3VjxtrWGb66N3UBP6ZDG1hhhU9Bf9A@mail.gmail.com>
In-Reply-To: <CANiq72nFuR+W=sKMgmxx3VjxtrWGb66N3UBP6ZDG1hhhU9Bf9A@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 27 Jan 2026 09:13:46 -0500
X-Gm-Features: AZwV_Qjp2ZD3V2IpQAwWSHlFmvmXLxbYh9A-ttXDvcr15-3ozKqBPEGAKqKuNgo
Message-ID: <CAJ-ks9m6AbgTVWEMd9qUNgyTN2OHnrxXHybYp5xK0JUUUwiFYg@mail.gmail.com>
Subject: Re: [PATCH] rust: seq_file: replace `kernel::c_str!` with C-Strings
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-fsdevel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 12:59=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Jan 19, 2026 at 1:53=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > Alexander or Christian: could you please take this through vfs or
> > would you be ok with it going through rust-next?
>
> Either seems good to me, thanks!
>
> For context, this is part of a long migration:
>
>     https://github.com/Rust-for-Linux/linux/issues/1075
>     https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a91524037=
783@gmail.com/
>
> Cheers,
> Miguel

Another ping here, folks! Miguel, what can we do if we do not hear
from the vfs maintainers?
