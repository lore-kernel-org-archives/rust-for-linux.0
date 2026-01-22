Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF4A3915A4
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 22:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769121254; cv=none; b=SDvi7vZ7u6VkE91gppR2DX4jkuii8lqD3SGoG8z7TFsI9guO8L0C4kJTGAq18vAfthzkVy65neIjmV2Th42ZAvt81zUPbk6AFFou9D0cxiuArd17Ly42PD1wFJseiMRc8btXP+rIKAsOspVx+cCWG+D2X0YZsW9vUQzBaewTJms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769121254; c=relaxed/simple;
	bh=Pf34kHq7cnvC5iZCbNe4kZ1nNnKmLCvUo4I1jWmsctM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5GDGud4iTsZdxOnr0Q+Z2//FYfhxiiz5nKmlFejmdQVXqkR2IbQ/mxEFnQB4xHYQ/FhuAKXp9uJQdslTwW864vq76cH9YOs0b/ybpGB59jj63cJjaVVouwH8TVxZ0U6PRCW8b0JBpoIpjnddw1w4zNY4oq/mEtCnWEbvUW+wHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnqoA1ST; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnqoA1ST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875F0C2BC87
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 22:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769121253;
	bh=Pf34kHq7cnvC5iZCbNe4kZ1nNnKmLCvUo4I1jWmsctM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZnqoA1STAD86HQ5wIjjrAIDKDIpW4zp6xslecaAepeGx1+cvJzE+Ilohqu0oX+3LE
	 p2bSHcJM4ruTZLKVzDg1FuAv1fV6ZfM64H6dnOZ6jTQ2ukrNI/NoWh7pbfhdqYE0w7
	 KK/K/gA8TyPq5b/tYOhv/bd3UBPpm0hxlR2b8iW8jypgy7fBQ8EZ+Iz1/PYjf+al4h
	 9NC9D2AjXwFKIlpjuj5y/koBdX1xeWFSuAY8LvWlTmMXH7c4OC62Xgy68IMbjFKuby
	 kEmxv6Q6n5tHsX9kLWMDiytrpO8VDd5QAI9MUzTpwxdpKtTNy57NODz8cLzIpsJhNn
	 Nmy6am24hmHeA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38316d0c26eso12654501fa.2
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 14:34:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDS2WnbL53DFjoyvZ/boUQOuba623x3YUwTZ+p6lYKQcxcGYgh25LhMv4qgqFm5Kc9tkTXFHAfvS3jHXFN2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqwzgzClxkHUN4yJFvtLgBLRhpWi51qP3jG07E9If60A+M44oT
	cXH7zFAEMS8YTjwHkSRvxHhvRZ6LTlpBuGFwJivkzI2lX4AOxhxuxPY2K8kfdUnN2sHcGSuWY+A
	2ic5kmvsOW6wCPNiM69z3Ios3Sbr16p8=
X-Received: by 2002:a05:651c:41c8:b0:384:9355:6a3c with SMTP id
 38308e7fff4ca-385da06bc27mr2148921fa.24.1769121252225; Thu, 22 Jan 2026
 14:34:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122144444.265412-1-gary@kernel.org> <DFV78VWVSJXY.2RW8FAP4JS8DM@garyguo.net>
In-Reply-To: <DFV78VWVSJXY.2RW8FAP4JS8DM@garyguo.net>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 22 Jan 2026 17:33:36 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=h7_3fBCo9SGLxv0VAvmFuSD3jRF3rtCaKe7izqHNckA@mail.gmail.com>
X-Gm-Features: AZwV_Qih7agyzZ8WfcnlMVjpa-B-y0CDbN1xe5Ra8RaQaXCPyYU1ykhnH7HFr0M
Message-ID: <CAJ-ks9=h7_3fBCo9SGLxv0VAvmFuSD3jRF3rtCaKe7izqHNckA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: task: use `as_char_ptr` instead of `as_ptr().cast()`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Panagiotis Foliadis <pfoliadis@posteo.net>, 
	Shankari Anand <shankari.ak0208@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	kernel test robot <lkp@intel.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 9:56=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Jan 22, 2026 at 2:44 PM GMT, Gary Guo wrote:
> > From: Gary Guo <gary@garyguo.net>
> >
> > `as_char_ptr` would provide the correct (unsigned char) type without
> > needing to convert to an intermediate type and cast the pointer.
> >
> > The `as_ptr()` function is going to be disallowed by clippy warning, so=
 fix
> > this usage.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202601221157.89t3Sqbl-lkp=
@intel.com/
> > Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
