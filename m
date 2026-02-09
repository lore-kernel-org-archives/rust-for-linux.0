Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36EA376482
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 12:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770640129; cv=pass; b=VpPMWAZMeD2gF5yWzPoQ1/MR95GhzxYM9/6H8sLm/xHE89Ab6+nVE5f/H3whuTBy/R5GapMUEz07Fr9PfYkKb+2+LeYoo0jabYtOAvZ0IccxF/kOzCWRHNZVltlSogPwgBUjB02zXELj18qG09gUbL7LKcvyCQCLgSyeyPndg3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770640129; c=relaxed/simple;
	bh=3rUsFNA2uKxkZ71eWzXYi5h9LbHKZxja7rQ+Rtbw62A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKLy5UXnW+tw3Ye5CzjHhvcP4w4gz4CptP/aU8LeqwrL6boSRW2mzoJjEX6ZUD+Y388Xavm9RarbQ0N/A0oOPzgrIiyWKAA/RaKh38cwHtHF0Qq8ef+IeQ8xkwflsNXDoM8mVgNtj3fQ5G9rzo6ukbocrVsoT1kdO5NXuW9RZfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpZPtjcr; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpZPtjcr"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ba716126f5so64489eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 04:28:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770640128; cv=none;
        d=google.com; s=arc-20240605;
        b=QMbe3y6BatvJARwkqsVlzb74bAs6Ax9hXUPpM/7ACOljzyxO7vW390TI+r+WI+g287
         P901Av8dcjj83mSpdphGvlt+NhmQOAL5nOdqoF2WwD7EervCucgM5aX441qBIMEapMwz
         KFmcTo4PMPfyEHx33gAQZJWnkIGvlQCHhQnY1FAdM8zu8l6oZd9cLqHCBmCy+J5DhUwI
         tcj1J4+OHVLYGA2i3Wbu2/hpJRPeU50ieNeQUL1QDa+2IlJrGsxWF1YWMyJGQi2MEkZu
         79Z2AA1dBAKFZ9SHe8Jn6RsMW5DyiIC7uUZIrpkZIio/2JpyDiNSvH714okC9uWgJ+W+
         KpMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3rUsFNA2uKxkZ71eWzXYi5h9LbHKZxja7rQ+Rtbw62A=;
        fh=knniUDkvjMKnrU1Ifj23Ig2kyqA152gdy2zptbGn3bY=;
        b=LCnZ3tzojkbKfLZscuic1zRV/xODQQ9vEv6w1VMwNhldB2m7YBqdqzfalVo5/lnFj3
         2j0DZxjFZZvY3HuUvwRNUiUpmszTVYH7pna7dQCWZYC+vtVZqrXHB5I2wt5Q41f6q0yO
         4SXLstfDhDnbmT/aVtMTl2u3ipeJYMHQu2AfdQfYEQ7paAVlTHlFE6R+sTayMr0EMnfa
         H7VE4xbOhFMeqYKFZlyWoqBU3J1XN6OCJa4by434Mr2CERJ6+nsQoRY1Q1K3SzfChUwC
         slPkQ8UO+F8IhlCXQL4s+skBIIVrOhz4R3nVYIY/IfVmkbeHa0uleA6HOWFzat72fDIW
         K5ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770640128; x=1771244928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rUsFNA2uKxkZ71eWzXYi5h9LbHKZxja7rQ+Rtbw62A=;
        b=DpZPtjcrbNpHDT+qSAZK5u9E35A6R9unWa1k0W8qEKO8VFmuPcLQCW1oWXX7loZjqN
         1OWxKJzsDzlmyiBOO0ZqECVG21RVsm9kf9hP/smnHzg03L5DmWHfEQ0OXPWeXKZgxVDe
         iymujjlaJb3RTSaaKavj3SscaG1ZKq4MWcGfAWDdR4dVWJjp1a/vza5CAA6TcBcjcqsY
         uonE3nZLsObd6PWBDgAL+AidTtzfOUof/kcwOLjU/GSDizPTRnj7c2gPw0SiMMaT812w
         70tCc0V7RMW9zM8mlcvlMJMxnzu0TOR+vpJK4RNh0PBaQBQu9PSP7qGUkAUv8BjlFPVB
         acxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770640128; x=1771244928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3rUsFNA2uKxkZ71eWzXYi5h9LbHKZxja7rQ+Rtbw62A=;
        b=dz7RJbogdrkqjW6mQyyLXGG4aWfVvJipAu4h3AxQTrK2ajY4mQ+p5CZaeKA/3yig9r
         57N1PXKH7BxSu5Y00KNVRhGcruIkiHD/cVXyaCcz0QpaXmpEP3AqOlt2r/543+67Lxzv
         Nb2B7zU7nKZVadiV8aL97FophQ/Kk+WI4e80SpIV8ow1KAqgpdC9chRCXH0l2BxBb9Q0
         ZtTbGP4n6zW32wYkRjMGsAr0p73pnHH6w+GeKjr88y8Lvf9YDGYMTrmxb8Sy//bqxz6B
         HO48DAhPEpBN73onIpz1WyDKrOiTlKi9/O9xaSIvexrKMC6PkG7htakCBhony8OiKrj/
         p7kg==
X-Forwarded-Encrypted: i=1; AJvYcCUBz1l3O9j/6/tY558KczR3FA5fGNyGNdB9uE+u/p0FB3cRKIyYfhpve181kEHaDG4WRB1OGqsNnLuzFl+nTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3TQMZEimcrlFeIE1JoOxqi0JPodpoEYxssmkFdoCtJEDF/GwY
	cSog6oLyxOWwlPTS0cdnA6ma8bGIvjmwgZ5LSws7V/ZRF8w+rrpZJnP8X/DkFd5jUe6FAoiTuNF
	yd/tFs+DmkUYtCtNpIVt2IJSE5Wk2niM=
X-Gm-Gg: AZuq6aITFJq3DVD5W8DGHBtHw0N4mI5RqHbmaVfWDdVkrep4g6aqpYSDU9kYoXD0+y3
	W/ipb/OClYbp2suptZNRHOyUOa1ngv9OC3vrWMyrsiH2QxWN/uDdadcyqcfFjscKWkePl8BsmN7
	btX5Y9R1d7/vL4cmWjL/pSX+NMU1aQxIlnZTontV4JkIJ+vxcsfa+zzDgHDZS3u170WmtXF2gxE
	83ezfDXZyCDAc4C2BPxNYpHNix8QtIx8XXXXAc4s6uZ/CvV2pfoCB1W8FFQ3KbYlJCg6IdGdXHp
	On31+nPJu+fVq0wP9+xvBZ4jwQfLAGu+BNKFrjPP77vC/0FYJPOkqU1mGk4rPSRiFLX4xe8EW0I
	dC8sAKQGKGcHZ
X-Received: by 2002:a05:7300:bc0e:b0:2ba:8204:3f81 with SMTP id
 5a478bee46e88-2ba8204a0eemr69625eec.9.1770640127841; Mon, 09 Feb 2026
 04:28:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208224659.18406-1-ojeda@kernel.org> <20260208224659.18406-3-ojeda@kernel.org>
 <DGA6GUR58QJ7.1XZZ0P4VZNW86@garyguo.net>
In-Reply-To: <DGA6GUR58QJ7.1XZZ0P4VZNW86@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 13:28:34 +0100
X-Gm-Features: AZwV_QjeWownS7EXrHKorJsw6RUTwnyzrIgxQgsKp8845mOO1OK2C3NwqsRI644
Message-ID: <CANiq72mB=-5L0hJ6dSwagDz6cu5v-ydhhOjAvZiTHoO=6O8vWg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: std_vendor: add `{likely,unlikely,cold_path}()`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 6:22=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> Instead of using the intrinsics, we could use this instead:
>
> #[inline(always)]
> #[cold]
> pub const fn cold_path() {}
>
> This works all the way back to very old Rust versions, and the codegen se=
ems
> identical, too.

I was trying to mimic the standard library to be as conservative as
possible, i.e. in principle there could be differences with the
attribute (perhaps in the future).

But if you think `#[cold]` will work just as well, then yeah, let's do that=
.

It would just be for a single version after the bump anyway.

Cheers,
Miguel
