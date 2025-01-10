Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AB520551C;
	Fri, 10 Jan 2025 10:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736505907; cv=none; b=Wv2n43mhmEEX5vRoTKDq6obdAHqHdndWjeFnQo5fdbWT2bAS8f2mT+4FH1t6gS7iK8tBTvzhbFeY0Ewffmpyg4Sj6Z0kFvuOD7GvKOFrJOb4AQzVJr+BwlMPA3KQfZ/AsBxmSgHawM+0OSGyl2gJcBzn7xFqyHqU6Wv3SoLguS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736505907; c=relaxed/simple;
	bh=oo9bGb4bFrCx3uBpRyZM133GR4ua2TD5WYyaLAYD0ME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppov3x0mhDoWgjbhTur3p/pErHnkj6IIoJNvIZSoeOaBUXcvKyjKJYmGy6+hctgT9uzRJxPOHUHIiC3DCd1KJi3FPIco/+GZF2geeEpVIXyY/8VUYF6RBl/3ZZu4fAhU6mHJVlPvRfK0/X1Ut/jLqEiBi5FmIQjveEM7VXDq/ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+rjlF31; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+rjlF31"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ef05d0ef18so383102a91.0;
        Fri, 10 Jan 2025 02:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736505904; x=1737110704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oo9bGb4bFrCx3uBpRyZM133GR4ua2TD5WYyaLAYD0ME=;
        b=I+rjlF31b1cQsuGf3F8bOQFLiLpzJFK4y7x9gCGsrJPJsEamQK8uHDWj3SZOza0qcn
         /O058UNK/GNTQZtEid7rYXefd6QNX/BUH90ZNtNNOegl/lAdS/TNvmzYyzTLNigUqRmQ
         2FGbuQGU+XBRpQuRTUt4PB+863OlPAcmmJaKTGHJ7IgdqydBuUwWNEgwQ7e4irXgtA55
         g+rg8rZguOT0FkjJ/12ijfUt9OzS3BrmiygPKhFTfSt6jeF+5++6ejTItZ6CdUTgniN2
         EAKi8e2UeNUJKQIZmmB18H3IGPM9zT4WR7jJ0y+BM4uFvESRUtLQ5m6PUJ89g16FFOxO
         OGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736505904; x=1737110704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oo9bGb4bFrCx3uBpRyZM133GR4ua2TD5WYyaLAYD0ME=;
        b=JSKP1ZrT3ObRotynZWlx9whAS6+11n2dakyFDtaH7HAiYlTWuRgn9JSxttrJX4TJ1B
         RYQhSiCFkQkEyDN22XDpOpZsBjhfAYNTjucIFnJgwR/VxYFM4zV+a16H7X7/RzsYEYr+
         SImITBGs6KeGHCRGqnGSdsOsDS6Od2X50N2pA/gKo6RWbgNxJbgr3b7rP7GsGGslIL1Q
         fpEl4tcT9mx9SBjTrs6f04uc0+KzjgAGcCUsUwSaklQqB3iFQPQ+xm+0ffurPRAxKY1e
         QZBxlJwGfQmx3hJ3jub64ivmd/yWnbeoTrTICgC965b4soYr6O09H74pOddTnMdCD/9r
         c9+g==
X-Forwarded-Encrypted: i=1; AJvYcCUvQ0LF5PMN5gUIMXqEahRIRj40QEvOYzKegzn2LXr5y+8Oqr67NqIHAPJh7UINOF6+DYpKuy7jNOVEork=@vger.kernel.org, AJvYcCXpFxpmxTCd6iBmkrQuMioUJ14Oo6LaQwUdnmpjsQsTnu77w19n+m8SuSfbjkw0GlulfHj3kApd2u0XqoMRPGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtDpFjz3v8/0xbLrx8A+1Tvpmup7Iv6uTBFsoq5XNq8uWIbOJ2
	4srp9ur3MSw/w886lZOA7ksc5R/FcOKPd/UoCWU0mInPLzVSA5G4e5ntl85NvMthx31NUkAuP26
	0UNV8NZjtPpmjn26XFm6+1ylaqso=
X-Gm-Gg: ASbGncu9ODIX+u3hQ5VHvVKqeWUYEbRtczOY+E7vXwP9vXotQMB2lso2n1i8DbqkDwS
	Dy6IsEAub66peaq3TWKFBRgyWKhM4zeBawhDvJg==
X-Google-Smtp-Source: AGHT+IEbNZBuLmaRgBcsm8R3xQ2C1O267JEPoFSswVUc2c6LmXdzbOtsRBMHYlyDSMraiJjX/QPW1oCp1JhPbpPM0m4=
X-Received: by 2002:a17:90b:37c3:b0:2f2:f6e5:d28e with SMTP id
 98e67ed59e1d1-2f548f1c677mr5770456a91.3.1736505904016; Fri, 10 Jan 2025
 02:45:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123180639.260191-1-ojeda@kernel.org>
In-Reply-To: <20241123180639.260191-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jan 2025 11:44:52 +0100
X-Gm-Features: AbW1kvZ-6wVsYLH3Z85aGjQeaQNh26yqboHEUAMw9amj89Cs-YdsVrsxZf1LQ34
Message-ID: <CANiq72nvfGOkVCH7sie5mtn7Y3jzV2W0fbJacF5W-r+XUHLn7w@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: run Clippy for `rusttest` code
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 7:07=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Running Clippy for `rusttest` code is useful to catch issues there too,
> even if the code is not as critical. In the future, this code may also
> run in kernelspace and could be copy-pasted. Thus it is useful to keep
> it under the same standards. For instance, it will now make us add
> `// SAFETY` comments.
>
> It also makes everything more consistent.
>
> Thus clean the few issues spotted by Clippy and start running it.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks!

Cheers,
Miguel
