Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6338C2912
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 01:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705542450; cv=none; b=U2xS4owAzt9vWJgGm2LUs52mmE5q/UhV/PcvNsyEZQN4SzEd5H6lBnMGGfwAGjcf8IMyjgurus7ml+B+jo/LuulfsBeDEUu2yjCby1N9XDLvj3WAJfm/0q227B5wClQIKzl/A5rj2FKaf68w1TIFsSwnf97qPzUc6B1LNO4l4T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705542450; c=relaxed/simple;
	bh=IzCbt6Kn4zEE1yM1iJiCGXyejnVITdsERAAt6Fmoigs=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=eGNcA4uOmKRYloJTsD+MQYAn4pWjB8f0grsArTw5tNzvCD/gRBVxz89pr2WL+f17P2y+bAt0Tm2l8NA9oxJJsJJKYX1OtN9ZoNn8oBD19RHhq+tEzNQDvyq0kZBHMJLvlbKSt8AaLN1f+QqT95MxuMdQX+vhuU04hhH4faG/Mb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=By1B/KUt; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="By1B/KUt"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5ff7dd8d7ceso7118337b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jan 2024 17:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705542446; x=1706147246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSPD4dVB7yQhkt0VaTSNJwmcnifEmy9Ij5Sgpl1CTcc=;
        b=By1B/KUtj8do5OtkHGwzzXyl2s9RwiZoD5Vg/Yk1Ohid8YscVuZNNqZDjCPfNM7Me+
         AaY0Jbwk7g5Zr7/qBsBw5y5FyJ9xSSMiaw3/MrYFg3CQERsPe5RZME90E+HSay8DaEW5
         GQUsoFQcmL8ETyfjPFseypXmLIxCa/3Qv+sas5XWbpPBuGkR6uu/I4mv+0gGseldfKWn
         2lNDyax93cTHE0qnHfNxlN2PMyzM8XqbjFLyKrAWDMQtWPGqLQXcGRr3/LyI6tvj4Ir0
         +QFsf6c4604G+EwgBiDld5MpfWi6MtDkQYoMnlaV8fbQlIG7TInQm5vMbMHfV01XN3yD
         Y+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705542446; x=1706147246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSPD4dVB7yQhkt0VaTSNJwmcnifEmy9Ij5Sgpl1CTcc=;
        b=EWDOViFv9qz1xsTNegcaJ3LuE9OR3Hm737/tcbRb8yMQbnULfmh//wqAowcoWsEL1q
         dnap6+BzTTLa5g7WsJk//1yqAbZKNFt+fSoKt7KmKlik85MM2rUwvTcXmz/7YOOaKC3s
         RX/Sz7UKqjZNYVv8CN8tF5jstLQHvyU5t0WxQb9SEyaOimwQpR5wbsejcFznp//P/xWt
         nUWS6GQvrtibrMvdDhMnZxbSyV7x0x9/kEHhu6iElMXe58YuqSTN1HfkdEZ543gMXxTN
         eBSF8vCmHp71ik1BwF0p9OCKYA2OvQcodbjLSuDhbmy3NF7R9qqli3Xdj4Yyp1cVXtUr
         0Z9w==
X-Gm-Message-State: AOJu0YxEUZ2zzJ698CE5IWXKIZbGTMeOXmU2j/kdfgewyQSX9SssBYHv
	Xvady9rAZszF4NsKFbNiupNSn47jgwywCsYYSjkxz26Uj0trzAWfBDl2zy/1AqYNoPKd2+6Te6z
	xSWSAT0ikniFKsEjt9tAUl5OPe9Dsr+DLOYtFng==
X-Google-Smtp-Source: AGHT+IFdpoOGBI1qBIxAzKo5lmEL9zYK/Wh3v6+6V/sZxY5+aJ+pxdGKZeFpOjaVByK73f1FBkZyCHg5w859zoq6520=
X-Received: by 2002:a0d:c242:0:b0:5ff:49b8:747c with SMTP id
 e63-20020a0dc242000000b005ff49b8747cmr105605ywd.74.1705542446398; Wed, 17 Jan
 2024 17:47:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116160141.165951-1-kernel@valentinobst.de> <20240116160141.165951-2-kernel@valentinobst.de>
In-Reply-To: <20240116160141.165951-2-kernel@valentinobst.de>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 17 Jan 2024 20:47:15 -0500
Message-ID: <CALNs47tgvK-3=0CrZ0tUuk91T+k49m_N_BNkwBvaNGFiZnt3UA@mail.gmail.com>
Subject: Re: [PATCH 01/13] rust: kernel: fix multiple typos in documentation
To: Valentin Obst <kernel@valentinobst.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 11:06=E2=80=AFAM Valentin Obst <kernel@valentinobst=
.de> wrote:
>
> Fixes multiple trivial typos in documentation and comments of the
> kernel crate.
>
> allocator:
> - Fix a trivial list item alignment issue in the last SAFETY comment of
> `krealloc_aligned`.
>
> init:
> - Replace 'type' with 'trait' in the doc comments of the `PinInit` and
> `Init` traits.
> - Add colons before starting lists.
> - Add spaces between the type and equal sign to respect the code
> formatting rules in example code.
> - End a sentence with a full stop instead of a colon.
>
> ioctl:
> - Replace 'an' with 'a' where appropriate.
>
> str:
> - Replace 'Return' with 'Returns' in the doc comment of `bytes_written`
> as the text describes what the function does.
>
> sync/lock/spinlock:
> - The code in this module operates on spinlocks, not mutexes. Thus,
> replace 'mutex' with 'spinlock' in the SAFETY comment of `unlock`.
>
> workqueue:
> - Replace "wont" with "won't" in the doc comment of `__enqueue`.
>
> Signed-off-by: Valentin Obst <kernel@valentinobst.de>
> ---
>  rust/kernel/allocator.rs          |  2 +-
>  rust/kernel/init.rs               | 16 ++++++++--------
>  rust/kernel/ioctl.rs              |  4 ++--
>  rust/kernel/str.rs                |  2 +-
>  rust/kernel/sync/lock/spinlock.rs |  2 +-
>  rust/kernel/workqueue.rs          |  2 +-
>  6 files changed, 14 insertions(+), 14 deletions(-)

What an excellent commit message :)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
