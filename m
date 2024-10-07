Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DED320F
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Oct 2024 20:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728333516; cv=none; b=Hz1HrJEy1CpU1pFs6kt9c7690UBn3pV+iT3DyyFd8cqD1N4xWTqwN9kPt9XaIFNzeixbzlD8l/RiCx7ZC/II5V+QO/xfI5Co+AfQaCMl7GGVVaq7rpHdwa5r5D3IsWXsXyzFvr5w0V7WHsfcMH5/RSG1+uollMsLNMc+nILOyys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728333516; c=relaxed/simple;
	bh=7vloF/+aMNQTQI0PYc2rOM8eLkF1++eij7P6yUx6LOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvMQaKFmMzRgtJBKrIg+l6TpbqhxwvuxpAy0lJBA+m/SsfyouWVz1WVBRi2UF9OygAiRgWxogDfeUtO6j/+Tbc4G/LSXKCgGbC+1SBoWbMwtx0yFGbokeX7FkEYyS3RcGzdgwaNrMneSHG9AmXw0MJvqcgUIOxJvn0/WQjyPHH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoAXlAIR; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoAXlAIR"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71df7d6c3b2so259594b3a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Oct 2024 13:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728333515; x=1728938315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2po+eQYYqonQgVd3A64eVxDq5KdyDWHta7Vt6+LyeA=;
        b=CoAXlAIRhSVVYsXO1zZCEhx+5wafY6GJpHmPU96LBm+C5LOnBO91dLUVTd89KIXzbn
         j9DWyycj6easowqBACg1tzNeKKKcpyoW8V1usxZjGTVH2a4aZyzS62cscKp2sASLmtWe
         +vpfe76jM/3ZzVR9MICwQwM0gOcYrR0cXj01ENvUU1w5GWYvT8RGNuPrWEFciFxSweoB
         8TMvFxRhD1hz7r0H9XAqw2DTyEh5fmF8daN/sUfu9M0peAWw8uu8kMocPyMcObRxxWpu
         geFNcUhP4INtg5zInoHiZEEbJma4qnngptD1AQHkIv1A7u1R5F+zfdwU/IItJ1I2lq3s
         y+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728333515; x=1728938315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2po+eQYYqonQgVd3A64eVxDq5KdyDWHta7Vt6+LyeA=;
        b=Ngu0vkFnFdnUvKf642VIJMVMcRZm5VlW41HTIUbHbNzpA/aH6NURHVnX3dGJi89mhD
         VwEYstmipcE8ioFUnXHF/zleoso1SI15wseObk41R5m+gxTutS0RHj3InHoAisZkYn6G
         enC90tv4dhwlDcRMlSTEaYz4y+brFIqGhF8eILCE4oQHvmGXASUkWoyXQY6ie8ayKblO
         Bgcn/QajvHNhZR+A/UyHWXOTgXB/jDz1IEcQ7Vb2bEVe1LW96kTq4XjXlNJkt4xLCtWa
         9RBV5Waz10KYQni/EL6Ri4+VM8jXPdcPVXhVUR2QBwxVFkE7ifZc38/pcE7/y3GMdLBG
         oPtw==
X-Forwarded-Encrypted: i=1; AJvYcCWQlk7pkfEgUYYUwgVBC7jKTS/8EP6xq+pKpYRQZfUaQtlBigomC79OooTV8rl7m1tgqOcb74UdMihtcvQ9Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6LoF7Y56F+yM/6vpvkDl03X8hCHHUoe+73MMjLtY4a0cNZq+N
	RXjpI2xucZYTVIYfh0Qmk3tapxDeKr887jgt3xRnUZFj6fntARbQZmUXM6Kwhl+g+kshG8ZspDq
	OPbZqBZJ/w75ZwjE/es02BYuFuOU=
X-Google-Smtp-Source: AGHT+IHSy0j+orhwIeFy6dVr7i3NJaWS8zPfqumxOehLqAlcDMU7YL5+tMmI3acbRggUUky1BzhFCcNX88NWXl4ctYc=
X-Received: by 2002:a05:6a00:3a01:b0:717:8b4e:98ad with SMTP id
 d2e1a72fcca58-71de22e2c05mr8532001b3a.0.1728333514557; Mon, 07 Oct 2024
 13:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <BL0PR02MB4914B9B088865CF237731207E9732@BL0PR02MB4914.namprd02.prod.outlook.com>
In-Reply-To: <BL0PR02MB4914B9B088865CF237731207E9732@BL0PR02MB4914.namprd02.prod.outlook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Oct 2024 22:38:21 +0200
Message-ID: <CANiq72kMg=HKkuTTUhGDmCamgJ1c1JSM8HZyUKwA9yi_6nF3iQ@mail.gmail.com>
Subject: Re: [PATCH v4] rust: optimize error type to use nonzero
To: Filipe Xavier <felipe_life@live.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	Benno Lossin <benno.lossin@proton.me>, "gary@garyguo.net" <gary@garyguo.net>, 
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 5, 2024 at 9:51=E2=80=AFPM Filipe Xavier <felipe_life@live.com>=
 wrote:
>
> @@ -107,7 +113,20 @@ pub fn from_errno(errno: core::ffi::c_int) -> Error =
{
>
>          // INVARIANT: The check above ensures the type invariant
>          // will hold.
> -        Error(errno)
> +        // SAFETY: `errno` is checked above to be in a valid range.
> +        unsafe { Error::from_errno_unchecked(errno) }
> +    }

Applied to `rust-next` -- thanks everyone!

    [ Removed unneeded block around `match`, added backticks in panic
      message and added intra-doc link. - Miguel ]

We should avoid duplicating the implementation of the check now that
we have this, i.e. reuse the new `try_` constructor -- I have created
a "good first issue" for that:

    https://github.com/Rust-for-Linux/linux/issues/1125

Cheers,
Miguel
