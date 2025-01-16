Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A6F2343BC;
	Thu, 16 Jan 2025 19:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737054847; cv=none; b=EMDpzrKBpqI6G5B8e0fN/OXpLKcFqIqQTK8SsggNjicGPBgS4kt/vMmnqYthtDgE4oNOc3vakvpLQ5c65gmD+6qrlswxr7oANrdqgyWwAHwSEJMLjfCY5RiyvfkfNnmHCR0pg/IqbKVYTuuA0jHwmXCX3FFQMPXLC3vb9DVHqMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737054847; c=relaxed/simple;
	bh=10hMGmTmFqfnWWVOquZb9ll+8qU6p8tmJdf8yZ0P1NA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9TMxzFWG5+JywFysUztAnoN3IibgGCQmaDSfMsfVtbSXUixx5Du4CU014SqYM7iMJtlfXU70ftH0cLQDamQ1eiDMhkrJ2gRplvrjei5zRyyw39a+PXhtp7IUg3WAG2OHEKw2u4Ho3pmjQ41GRImZmXSleI+OP3w2X5AKePEiLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAjftoRj; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAjftoRj"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ee9b1a2116so271812a91.3;
        Thu, 16 Jan 2025 11:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737054845; x=1737659645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10hMGmTmFqfnWWVOquZb9ll+8qU6p8tmJdf8yZ0P1NA=;
        b=FAjftoRjr9URrds8/BdgJOOt0Eawt6euvowScYinuXSWLCViTysM/OJadPowIN/5gz
         xhiDyUNd4ukjhOkVXWgGqS+QB0jpNtc0ykX5fwpeEnnIj0rJZ5qpcsTU6KxjCBeGBW5h
         rOoZ66Bcvd0v2rswqiDve25pI5Wk6YyoC+n2T0ec1i7zyEWv0uA4O6hH8ytX5YNXT+uL
         9sODJyP9lqJ023cEUqsR1Py/1DBlP12r2dhi+P8oFVVdbSO48XLoF1BRcBlVJPv3JuMi
         wG+p0NPRAane/P/7gHuTnazN7MEX1KuYOP3rq533hD3yhDuWDoLxXlmReaXWK7q/9kic
         LlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737054845; x=1737659645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10hMGmTmFqfnWWVOquZb9ll+8qU6p8tmJdf8yZ0P1NA=;
        b=lfZQkYTcLepNO+FZaR6pfRBCqjwHnzrC4vjo1Srwyj1hgCe9IIWWTV7v/PP1KypQvt
         +Tf/AK1XBHk0PAh5LbCS4wXPY0OD/6G9ZM5VINEmTcj4UP8KzFbv+SpX4dhV+QAWj+j1
         D4TcXyRB+hJR3+gMNY1gT/9XC37pizhC5sHv4byU7Dy9LZPx4rc3tSaxMUEtNgMFZF3E
         qrwHRx/w/UMpkMaSMOWErPVtMw4cErO0VutR/hxcNv0G9Wp7YBL9mkb3cPcgiNWM0TGg
         wJwZCAd18l7BXBSxRWDf1qiPi5Yda7KAKfevpzf3glLf5jx7P3avaSeshtg89US7xJ6p
         clEw==
X-Forwarded-Encrypted: i=1; AJvYcCVi3QjwQGSthDE1hLdxYyu0z85fLf0shOsZnCnlSTI+Rt8am1K/oeL1nmqSCYPmpkhAAsmlH/j8l7My5YU=@vger.kernel.org, AJvYcCW/OnQclpj2Nl9cM3gKQhgBLyPwU+INR1Ig5ozj6MOEadBXohsBY826+3+xt9OSY4gMZSEksekD0e2EVkIW/v8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy44Ijzsl5VkyPeJS9OKrEbUN8Kqb7KdRjRBGSpWmYTzsvqAjhi
	jQT71Sd9RaZ8Wsw6SNbC8OlQjabEhfyTJzmGlQh0WrvRPCRUuSvvXg58u3EfVmLL5dRP2r154Pv
	XgNzOKph22ZS9d3k41m1dgFT/ZxU=
X-Gm-Gg: ASbGnctnVosdV21SDjpZV9HcLI49U5Iru3sh6iGO5f+k9R6eg2wZCTu/Jh/+XZUS2x/
	qQIp3FGfyw4htVLFMSS+rBwqcUeWO9S2IQG9AhA==
X-Google-Smtp-Source: AGHT+IFNgJ22DiktJUzRKVirkG8xnR14/GXp68rtUizqMrescViAjy9+Xc43APFDk4ojHTl/i8NVisRO2HmNojX5b3o=
X-Received: by 2002:a17:90a:d2c4:b0:2ee:f1e3:fd0c with SMTP id
 98e67ed59e1d1-2f548f75c6bmr17645908a91.8.1737054845180; Thu, 16 Jan 2025
 11:14:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
 <20250110-hrtimer-v3-v6-12-rc2-v6-2-f71d50f16482@kernel.org>
 <0DHwVcXV7YQr2_Xu8VEFljnhO7nfFVzGiV7jNm7CMv47TGte0u04V3Xqu3nJuPfGaJ0D06qqFGPY6CZvg5MH_w==@protonmail.internalid>
 <CAJ-ks9m9B1ibFtJNSTo0-e9y01-7+Rk=d8i2_L6Zq+qOeBvY5g@mail.gmail.com> <878qrad1ev.fsf@kernel.org>
In-Reply-To: <878qrad1ev.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Jan 2025 20:13:53 +0100
X-Gm-Features: AbW1kvZS_YZQWHvrPewovFMdmdG0B0GAkPWW_xdyXsYDO-Bt6ufTGmm4_wIMGtw
Message-ID: <CANiq72=4WPEvyd7_N_HPhu5UXtuJcCQe6LKD3U_2QD2SHa8cDg@mail.gmail.com>
Subject: Re: [PATCH v6 02/14] rust: hrtimer: introduce hrtimer support
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Danilo Krummrich <dakr@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, Guangbo Cui <2407018371@qq.com>, 
	Dirk Behme <dirk.behme@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 8:06=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> But that is OK, right? I think there is an option for rustdoc to render p=
rivate
> functions as well.

Yeah, documenting private functions is fine and encouraged.

We may not be able to require it for everything, but it would be nice
to achieve it e.g. for core abstractions.

Cheers,
Miguel
