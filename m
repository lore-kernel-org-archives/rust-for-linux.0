Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D6A37C10C
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609819; cv=pass; b=ciHxJHTXWVevpHMJsuidUP94uK7gZGvpPt4O0p/bNsSLscExZK7lQ9uQhWkK9GZJOfZgqQIvY+ozFJEUYeQPiu5BqL1pYFWmETcswOCTP7pjT5wk9GEXWMUQoXNSWtwNavJcTCRC2CQl3dAiES/b9VV8Vti6m3s6jSmuATp0SJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609819; c=relaxed/simple;
	bh=PP2J4eDkV4dT2Pk3acy4PoFiAE07CbC3k3o5xlkGmyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUuDtXK5strh8grhSJXpi/YbzSPzc2ACh7POGwYfzp/mNg77lTtKUnZbOlC4sQ17cFO5WQGzCb84+LFs5Uf4E4XhhnYnA4iPyS6F1YvqVJxU/+X5Qxkh/69QZ/LVZhqztYzd5MgINMdOq4/ijjG0FFlheLkZH2WszjCL+xFWhxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HT8hY7ud; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HT8hY7ud"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c0c7267500so6947eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 14:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773609816; cv=none;
        d=google.com; s=arc-20240605;
        b=HLlwICZnWmBUb35F+4off695kDaze0VfG5XPwg2uwagIqs4yq9oySTDAckgdWbkWKj
         MN2QVuQkdQIGiOSk/A5ltL/T57bZj81NvZawX3go5UUyEOMyhLPEVJAeWKF7CARypTrY
         xnDFQyWwzbNLR5pmdBoF9Sm0rNHzsL51Yh6DaJjWhhd9ddQ8zzlWDQ9wWt8txnzVJSL+
         BX+klSmFfb89Ua253B3GGeyCw7hF2Kmc+xggt4fzGzixlSRf/syEuTxKGrtG5kizJDqN
         Di7sIgWQKvN4ddL1Go62msJViGwlUvpyC9x3jdRTZIg3agWRahhpWIji4vKOtqG5yQzD
         Cm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IkQe1o5B6paHiUn+z4l+GM/Kq0EzHLVr9WcX/nooLFw=;
        fh=kNUGhRcRW8FnYmtvMPS4vre4Ew/NwTluIKcjdy4m/k4=;
        b=IOtAO04VD8b4H8iYrqhzZ5XticyJJff8YaeHbeI6M2Zt0luzPQ0y0c7PbPnQWRqNd+
         ishYm/hpT5DLvlnrctRNfDml47eqEqzJbQTaS7s1pPL35QFeIgMUxj4oLmKSesG2wv9G
         bW/fJFUnJsmRE4QX0X+DOyHHU82paKIhGGB+V0r+eMcF9vEAl6mGMmSNw1edJQGpV2pf
         yptKtgt5NrokdTv5olo/31059AiQp45sULXZ1LNOkpf2HItojwc7dcs3JK0OfC3FGmOv
         n3ch4Ro0nnoBFC1CVHr5M1DgT/zl/Zu3HVqSd4UxrpUUN9IDKE6B1CAvgjNSpTjoJm2S
         /p+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773609816; x=1774214616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkQe1o5B6paHiUn+z4l+GM/Kq0EzHLVr9WcX/nooLFw=;
        b=HT8hY7udMPkogRrUh/oYbrvszNT3VMQ+d24BceY9urykM4mH73VhC9wEEtgPslgtLK
         PDtlW5/oGt7kJJzfMDn7enddERZfE9dtjqUHe3JRiLgelkK3kZY7SsWMdXjKkfoYvFTL
         mE5x7cfad8vifw54TAGmzS5iEbvAwtQ2rF6mNSeCGm33x66DMIRUbOW0SJgdfIZvNxAT
         lnj92w7pU3ZqxZU5s7F67ggFrmA4UIogf/cG8lhwNHkjum//GzC1tHbjmY1RhLleMeHi
         RccTbVnioBTZMQ8uomWRVwIE+4iTpZuv7uzv7F1zSkEE/JaIMhXNP7hu3mCbQwh9y8wB
         n0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773609816; x=1774214616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IkQe1o5B6paHiUn+z4l+GM/Kq0EzHLVr9WcX/nooLFw=;
        b=dqtdBbd29jRkmgkkmr0bLFPiaDVC6xo2JAV+tEPRloBY0dhn1jxtaG5eUbOpwx+/9m
         Tn6IKnHhHEdT7Hi/RK7zrwP1R3ih5YZoCocBKm7LB5iRg7RzguXMjZfhUrYF8ZKDhGJO
         3njZz5rTliVJX4BiuKCO0dqETYLieAzenpiFcor+TEuQbhFvp925SlC+459xm26NSl/g
         UiuKXm9Fglo3YW3ynLlvpJUp0P8A9rR1o9+OvKcbm9e18OsQIfcdR1mQoiRkizDoW0QE
         MZIqBycGwVmjUXBUnr6tq4F7zm3zBiwZiqYXN7Sow+eZE6rYpKFUoZD2ltDr72hMhYxV
         t1tw==
X-Forwarded-Encrypted: i=1; AJvYcCVzx9Yj2qX8j/BZfbNcfCiUeKyWnDOelPkIF1Ad6AsHJ6MkIY+5DgT52e4XuzK9ipi2dBbmuEHSWQjH8R7i0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOUEHD9BjMxfMR9pLfTA7xTfY2s6yXwmyokG8mXTkQJkj8W62H
	MQ2pEPn7Yww7rgHuqnrvSV4gE7Bt8s+ZISWbpOZetnYRYOiPvIcXxZy4d2zTg38gphmjqLUnp5l
	CSyZ5D9n3nDbNj1gB6cSb9h1mcKKd1xQ=
X-Gm-Gg: ATEYQzwEEeF+xwsYTmrxY4P0Vv1TFmlqPU7XRIdrODztUI+1gOXAzEOLhkqT8abHZHJ
	PHsKQ/lQGWF2hvij3vORdwYfC06NylADOcF96wN1CKxqAW57cW9IHSahMDDO28nAgtFV0v7x3Se
	E+FnCE5dKge9SumjHuhOTZOPA9FwmxHG3CPPM4X7U2eLg4+Y/p4R655UdPeejjAkqTGwB4XRxRJ
	3tTO7jO6pyEVRV7aCFzFl1nw2Zz+m4uUrh6HBjl2LRlH2xVEiy2MihORBtcMurdIUAYnOIly7v/
	Zjxq0UL+tuiCzZ1ZCfasqk0olITltaBln/luWLGBOvbhR6Ahs+mcFsqvXyarXXN9Z0l4DJTmR0s
	ErOhKy+/6pX5esQkEB/519ZY=
X-Received: by 2002:a05:7300:8ca9:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2bea56065damr2711462eec.7.1773609815900; Sun, 15 Mar 2026
 14:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-cstr-rename-macro-v2-1-25f7de75944e@kernel.org>
In-Reply-To: <20260309-cstr-rename-macro-v2-1-25f7de75944e@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Mar 2026 22:23:22 +0100
X-Gm-Features: AaiRm53Z5esmB8NqhpEo3Ukkf4yvUe-1ALiBGT0hKmtMX4C3iH5_QYhJU6S78z0
Message-ID: <CANiq72=1koL5z-5WzyPfFX4otxgSL_oKGVt8ju7iShki0LwJhg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: update `kernel::c_str!` documentation
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Breno Leitao <leitao@debian.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 6:02=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Now that all literals are C-Strings, update the documentation to explain
> that use of this macro should be limited to non-literal strings.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1075
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Applied to `rust-next` -- thanks everyone!

    [ Apply sentence case to comment. Reword title. - Miguel ]

Cheers,
Miguel
