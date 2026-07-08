Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765C9313E36
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 11:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510685; cv=pass; b=uiAzRtuu7DM3RXeZYlPNJNDRQM6+GbeU+2vcLhzrVYY1mLKgbX/6nzcdHu3fopQQTbsyOmnfEfytnz1z4f9tTCi0TI1g8uNR6SdE2/znCq3jF8QwyzFsK139DcJU2fi/0uOr235rbhW5TdWAYTShTorO2+YN/X/6g1oNNaK+pyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510685; c=relaxed/simple;
	bh=pNoVs7blsqot5igxuBwx40LJb5vetvIbgDoVCGXqkYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GeR4qx2RDD+R0anOg3Sx6iwbpLBc592EEMXQz8QFRgryA9pp18v57HXW3pARQMdlkEFfHrMjxnf9DQxChr6Ai8N8hCWB4uABOC+dbagVQcgVfyyCcoWoQBsQQwjSiiz5CsjCdXYfkcC8weH4PiBP0AvtDOer+G6Gt+p6Bfocx2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ez4OfRa2; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ez4OfRa2"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb40ebefbso159632e87.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 04:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783510683; cv=none;
        d=google.com; s=arc-20260327;
        b=i0ntApF5g8SYMiQoes8oTeUKOf+iFtjAN6aZrO1Bgf6tEu0DqfQF4goKfGqrGGeCuZ
         3iqgLZvIRRuNCQCpLRwv8M3GHIfx5fqfSNjwggp4gMjBtbZCWvfeJV2TIdGNtzNUb1wE
         R+ADn+3O8DNguSqpMVsDuUXOHb8K4AqW/iF9YMmNOHsJjF99JlQm9hUS0F635nXVCQ2j
         U4rJKT+yIbAhDA0HwnfYMeG5FdUmIthFKPwvZiB0dXLsZY9LT0YU1Ers0Yn2FYZ8N0JQ
         ZiNziWuBDs0VbVvUUPgIXo11qZdiE/n3A6E86oiE59Tr8qJjw9bWortmZgp5c2om2ido
         IIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pZzt8TN5yDA4YPeU9hZ28o3gpFUnqewczhaRpVyKlH8=;
        fh=Ijyba3eN/81886B36fea5k2BLrKzIDq1Q+EOJY2SpHY=;
        b=sIj4/H5QaKprNB+EGEx9Ix4GKbtlePRTGn8u1i31XKKDdomO7NRgSWSNJQFPIHj+Bq
         eXovTi7V+KF0LtgHt3hCGqmpIhJ29Fo/0/RWapPWNXBrPzIpq8N6tS9LQwT8GGw0drHB
         Wp5xMheZDL9l9EjiILPGwypruPdfGxwu1fQtvX/PFU3x4Z9KWezNiLAQl1H4FZgPeKwi
         y3QIJCkj6aox4nJ3xznRFtn8Cbnw3KfDEzb0XYwXybkGLyh/mf9+tk0XA67LMBx3WpRV
         J/lBxr88gYlvlRmBDzP2tQiBlChts7n3xRPs+ZUNZoa2kY+hkZdB7qR8h8K0y5n3z8UV
         d3Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783510683; x=1784115483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pZzt8TN5yDA4YPeU9hZ28o3gpFUnqewczhaRpVyKlH8=;
        b=ez4OfRa2dkNmupL5OxS+0HYN0tEcau13zDBnbGmLUlMgNZ1obtCPVODGz0y9dA6YUg
         elPHusxT7aTMNO11fVLvHtRZK9qOXKCThy3hNXwTvtOOHeRq2GyZACe2Bka+x5dvM5Lj
         Y8JF6IOiBBOnS7oERawO0vWyPqKc7pBQhWYU9NyFJzyalFwdrX7E+jozZYc53kxn5a8j
         tcoYpgsQP02Qtmc0ZjVhuiAWpALDZ2Z/MwCjXCm6MFBwIoR/gPNgfG+or5dQU0YJIe15
         LC68xF/UhjN592Qya1lwZCufDlJuHb0nZI5WmummbMlgr96LGPRTZQakRE1b9eSZshf8
         Wknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510683; x=1784115483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZzt8TN5yDA4YPeU9hZ28o3gpFUnqewczhaRpVyKlH8=;
        b=ZrcGuStaO7+5may7PwztGCkBc+oTsBsymXX77/0fspvMKDrjMoTYltRSRxOeJ6iwQb
         AV6QGvmysO/BOKSL666SssxQXmKMZ02Mk0GzKbf0zZYbuR461BIrVuQ8vmszuSlPj6YG
         xydMPclMe6BApvuXjuuWg1a6Qr/wLn7poxB5pNDr+8CqJ0QU2ooNWJQdJhf6ecOr5RLu
         vcrtepKSOgNSE50RnhcYmFKnrcUZm0zhlJBWgZPWm9MucVhp3qgxpxNesRwV6hQ8NIfZ
         tOA24flVehzRnmT8cksyIn1hLw4Bf+5hDNQJt14dSIWzl7NSB1pVc9+LV2+yF6WDGmYE
         iwdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrt7oC8n8731iOEnUjk1l9SxOue5CRcCnMQaRelN7GptXXgZp1/bRS8evZuW9aCoFO9i59ojbWOSplgbc8IpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEHcFf9Fq0gVmi6fcftcBvXdyOFkETMXB8zCS5sQb82DOQ6a/6
	lxZ5206PQtRSog6E0xWQ1FFwkoTimTPgiIMwLp9Nb09gM005sAXAHfBRZELODB0Gxd6AS4OdPAm
	KvX21GktxluZOZF//q6bHdeDwYAd2MyI=
X-Gm-Gg: AfdE7ckPIUlujS8hiKZ6gB7iy5CyXa8H520gisgRSqqdvqawMT9s2iTSgx6HNUDy/J6
	9k8bSCwYNglBTUlGc8jx9AGAnZQfFLntpltT7Pe+1+VkAVZeCid6ESs9TlWAxbKQ1DMYieNo6VK
	x/kotoeC5TZgqYy/ljz5WAAyQtgvoKiX3XvI3X0+hGvfPH76Hp5zsM3apM5SlnH5aVu/e4gCbP7
	azNyQo/EfgiySOdQ1WeGB0GTPRTUJ4GAVnD91/zfIVLy+mK/QECE/BfhuqU4FkXcWYo7fp5Z3Hd
	tGKPAHJDbZ337nTzOciDJc3gLOodr2d/eO95ISXobM2o0ry57qoblYyrwqfQZn4IWPA5MSHH819
	uF83KNYeyDeQX
X-Received: by 2002:a05:6512:b98:b0:5ae:b2df:c11a with SMTP id
 2adb3069b0e04-5b0113d80f0mr363726e87.0.1783510682586; Wed, 08 Jul 2026
 04:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-zerocopy-export-v1-1-2bfc355853c6@nvidia.com> <DJT5P43GJ9MT.2527G7CFCEW46@garyguo.net>
In-Reply-To: <DJT5P43GJ9MT.2527G7CFCEW46@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 13:37:46 +0200
X-Gm-Features: AUfX_myln-9cNDRr5VuipsCL04B7v0Mo-zc1P-iQXRMHt6J6C0V5pnBXV-0LnIk
Message-ID: <CANiq72=HwD=z-t4e5qPwc3WjmXUsJhV88JaN7OKyf7E3rrAFmA@mail.gmail.com>
Subject: Re: [PATCH] rust: export zerocopy symbols to modules
To: Gary Guo <gary@garyguo.net>, Joshua Liebow-Feeser <joshlf@google.com>, Jack Wrenn <jswrenn@google.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 1:34=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> It looks to me that this should be done by fixing zerocopy.
>
> Both these functions should be marked as `#[inline]`. I would expect zero=
copy.o
> to be having no .text.
>
> Instead of exporting this, I would vouch for going to another extreme --
> completely leave zerocopy.o unlinked, so we catch cases where code is act=
ually
> generated.

Cc'ing Joshua and Jack -- context here:

  https://lore.kernel.org/rust-for-linux/20260708-zerocopy-export-v1-1-2bfc=
355853c6@nvidia.com/

Cheers,
Miguel
