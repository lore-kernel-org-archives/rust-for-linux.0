Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9C2303CB0
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762945014; cv=none; b=LfvsZ5YSaN6FuQnidkOPsqd9O+H3LJEiRildXHlAZQ+/JNITsdDSp8TXgMaiddQGwn3uZETUwXbEoY4oZKCSDhfJp6fF/JwaoIkbh/S/MOwgLSWbJxScd9/Y54YlwiVNisIanJw0LMt3y/GcYPk+8EM7FP+dpg21nXi9roaF/Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762945014; c=relaxed/simple;
	bh=TNohQaMM8ZiJd5FBk7HxCy8RYGSgToj4TZLYuUXuyKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgmoLj0EJ4plFjvUv9tjF38opwF6EHPhhFij5zXd/MaRcTmZrNLa6MnEkPjYHlZyMITlb8NCj6R7VP7MdTr163PkCJmG+B/rJUqEGGh4tAsabYVx14N3QlADVg2zmhldkZe0KNU0DZAoe7Atfq7aDuiHE4sgWZdJtYp+KxIx1X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nASKfrlj; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nASKfrlj"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b67cd5d88ddso97025a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 02:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762945012; x=1763549812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNohQaMM8ZiJd5FBk7HxCy8RYGSgToj4TZLYuUXuyKQ=;
        b=nASKfrljVQyPcrhptgG/ufKjQQZy97uXwADgI47jB0uvv/4gjicXfG7FL3t13FEcws
         8HXpupXpZtatRYxzzC1h589b0ljO9YvhPAAPH5FZAWKds8wXu0YHxmtd8IcBKJshZ3FC
         OXvbH92IeL+VehYBk/BniPPo+973GXZLFh5igAb7nn88IJzVpT1ZAR0ye0v9nvbjnK4v
         bYSfSL/Mhq3ArFrWLVHtGBSm2XPff0JUQ4ztdW2qdlnAqO4EM1PkglLaCGY641bV2eQq
         RnWeOvdyGI0m/mgifLf2oeVZ2HjBNounhLQAYlQNGAZUvR87TtF8tx4RMt7orr1LDSAF
         yhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762945012; x=1763549812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TNohQaMM8ZiJd5FBk7HxCy8RYGSgToj4TZLYuUXuyKQ=;
        b=Yn7rUnsPltwTqMRp3VuLXRJRPEv6stZpvcWA1V89GmZWntLKyfKYRnAoBV98FcS5e2
         8l4hxPUhhpbwRdXH0nKsqgIKaT4fp0idNte1vQwwKgFymQC4Q34/SIhXmzl6U/TTtX7r
         UoF9vO82BLEbQxrZCA3UZTh8JumopnWaaEBgvrVBCCmj3vnai2WJA61GyOYHE3aHmpgk
         uDQ8+9xNBWJJrGEL/86AFlBMUBCRp+XRPXMpwFvQkNaCN5oposrQIY5efNCadWv6gaDM
         mo2fI5ZzAlgpUBOITMAq+KRjqI4PI3bn/yp4CzE3iT5l+bB3LCCzQDi9oBhpAHpWnbM2
         b8Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWcVOuF1x3VswsdB4PbZyH4mW/MzzqXAw+/uLcIjPCO99p9sEuBXWswvV8O+gMgkl+kFy0ReY7RZYD1TUotMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJhuAdt7ccrYd1TOj4NUbC3ek4mgNbB8zXjVZsnzAb/yWd5v3m
	sMY+BaufKDi99M8vc/bgcqYZUlK7zentguvyOicl33f+B0oQdTfA6N4/EUsi3mVFhjWJMC5Y/zG
	Pjk3a+7CYz2/WHwpfuYXUN1l5GfXBJxU=
X-Gm-Gg: ASbGncsYIghOOJHWLxzQmm5Uvc/f5Pc5y06yQp4PMXc1lH3tnCfAWSMm94soCXsuccD
	YsVf7a3FtZPBs41/MlkfFRY8y5nmdBKcT2iRrYZ+3Y6pJB1RXSKFrtvG/+Sx6ioNFQksT17TzjU
	agi6N5qr+AKaxxycybBoOAJxmyemzQ0AhOzvjoEi79u3FmzYr5NjwKbPt8yE+RkxqO5tBIoUpPl
	TDD9yOXdVOxZXp9p5GgWCVvXZ6PWQCaACqd88oUBbRFNHxV1uzAZMgvlbH26qSoPijGFENV80iU
	xkoaqkumZnC1jEVBDNbl+jOcHdDAgp1DED1WGs2TGmi88xHdcJNkqlzs0k/A1ovyTHrk6g0wgCs
	qzPg=
X-Google-Smtp-Source: AGHT+IHrQNXhY9YMT1oddk0XUMNLWOjlpzyfDcWUjLwcM7Kn3IniWXjD6lX8+8ZvTPxv0gajGvSov9xtpg+vUe5CnfA=
X-Received: by 2002:a17:902:dad1:b0:298:9a1:88e8 with SMTP id
 d9443c01a7336-2984ed82b3fmr20553455ad.5.1762945012322; Wed, 12 Nov 2025
 02:56:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-resource-phys-typedefs-v2-0-538307384f82@google.com> <20251112-resource-phys-typedefs-v2-1-538307384f82@google.com>
In-Reply-To: <20251112-resource-phys-typedefs-v2-1-538307384f82@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Nov 2025 11:56:39 +0100
X-Gm-Features: AWmQ_bmO92eCjDN6AY2pabBMv1OBSxVkwHvhLYHKrQoHuNDmC44_4_AWypybmTk
Message-ID: <CANiq72mL24KA59E2HDgME4-nhxw7PCvRAF_2XA02SDnre85kUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] rust: io: define ResourceSize as resource_size_t
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 10:49=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> These typedefs are always equivalent so this should not change anything,
> but the code makes a lot more sense like this.
>
> Cc: stable@vger.kernel.org # for v6.18

From the cover letter thread, if we treat this as a fix, then this should b=
e:

Cc: stable@vger.kernel.org
Fixes: 493fc33ec252 ("rust: io: add resource abstraction")

(Replying here as well in case it helps automated tooling to pick it up)

Cheers,
Miguel
