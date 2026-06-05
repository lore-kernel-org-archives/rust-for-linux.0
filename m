Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13381390987
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 18:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683655; cv=pass; b=YklqgDkl/AZSr3yiyrQFEdobqQoUuN9hvqXQSevbr71+ISUzvKsSoonpR3yxl3xqpZbmPDMRKqDC1Pib001YAcKp7NDWL3p07YhjGs7frdhAiV+q13Vc2VVTcQcEn14g3dzWmWJ5ZIkNZY0aDvpd5IzALtxUm3Vfhqy/yWQ+BFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683655; c=relaxed/simple;
	bh=Tv7+bwb6YfWfrz4piDdj+r43ZvwPktako8KiF7Yl+Gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mV3uUUMKLUCIJZ/xwSB9aEP3vEbpQ5Bciqa3Sa4VZJTwZIUMY3dd184u/4YBF91RiU1rAbqT2bV3rHX2ydKtp/j4TKDlUblYdrqhAjKtx2ata5iMpLDIn9IM81x4GtCag05HC7f1QvKbchNf6yzkXguk734GR1Fan3uqsE6vREA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjJjT0Px; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjJjT0Px"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-137c0db2638so180844c88.2
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 11:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780683653; cv=none;
        d=google.com; s=arc-20240605;
        b=QLzxmh2jOfdDJIZzjRDoN+mOK4AtGQZbLbvHGc9i1qB1hYNAh3FgbWs5qaCGYmO6xV
         uqjf38wbAMYQwn0LcH41+RllZnPnrJpLObZ1+d/SQJP5O16EvcvNoQiKrjKng+tyhNfR
         P9gYYA8iuIWPk/mbtkU2+drzh8zQBOJQLM9pOzhveg6CbCZ50TOiz5B0hQq4mDwff6LN
         iu+b7WHWXkx0poi/Wmo4kI6v860ofRbjFw7saXnYbk/ShRFDlfZvstlIS8CdfOw7fF56
         68AesYeZfMupQAluhZI2erflciIkUj92rFGB5b1ilOP+SaF80DWlBGjvniEKOBgM+fzB
         eoow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6pTatVJakjuHfmvAEENA/V/Qv+gKy0ipwl8zbFUhePo=;
        fh=kRG9njIq6LnX9TQwxmrS78ZlvtIHqLCn6CKfzLMKMs0=;
        b=aq7uUA6DCjpVBSLgEqHn76DJRhwhYb2PA2mpjc5uI5OwZGsHaDQ2JPEwYXVEuJtdpI
         /RJQFuO7wYlheEz7duPARSAE2JMGNUmTXSyCe0CPx6S9CRX2d0UayvdfIuvS01YvTGwy
         dpDmDom33/DlbHpEQvQbaSeMQgNM+Hebn7KEOXfH49Q4l0ymr6sQJ73/R+x7NyStfi62
         CX9Mo1Hx5xVGZ3rEB6jpBv6lhRGx5zBd7H4AaC93PLmc7P4y2Z05s+NwBa+vj9IUfsgp
         wfAK1JVbcwJSHLzCP4rt3Zen0LieTOZXaK0OdZtKPuCOpVJg73tXTJJfJMrWrsCCKvES
         q/pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780683653; x=1781288453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pTatVJakjuHfmvAEENA/V/Qv+gKy0ipwl8zbFUhePo=;
        b=RjJjT0PxyJva67btuj9zvBN4yTkmv4JKMGilrrN6DLDXR3E1aZfUHa0b/uUfOPRxnP
         BI51a66e420bt9XiUnBW5v5Jj1f6ZiFDMVMg9qU1GXHd+Jpl3eLHfzZfi/rW6c5HEeeZ
         8sIE2C3mBl4rsSbheq+80FI+bqkVw8bmdGLUjzuZCOSF77M75L1c6uHgS3wDrrs/sx7l
         DtHdnTyqdEPpNQLNsDxZ07NOl0dxHD5Fqx3qeZCEuYv0pQmQlodvmuIWvlqdHHWVa+Yg
         XS3ofzKbeoqvmccvqDg0Arc3LmphI5fEVRmjRg89x39vQl1qVJNWN765H5rchM52Hzhp
         A5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780683653; x=1781288453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6pTatVJakjuHfmvAEENA/V/Qv+gKy0ipwl8zbFUhePo=;
        b=HjXqXQD0s0z2mNRXIz1U9hAu160IEEArCK6XnRgLZMTQizKniu/ZrzxrLDkWUWSgP6
         m1ePRGYWOcif2nUQSfxjCMDd3l9RqoN2IVk/Z5oX2z7JMUbzlHRCXXFYk1W+wgiKliIb
         1hLTJwCvzYJUyyzC3ltiprXTlMtOXwJaEpjllOM9tpt18H6bw6x6j7+TfP1RDbvX1kT8
         ZXhv2tJFn0XgGcSRkRCsl8ljoy4YyuUcwvyStH770kEBr8cJnrIJTzCaow7S4zj9/j1u
         4D0u7r/D3Vqe0j95BKnRnXAjMvmv/tFYL0Cu35/hpRTNouwvt04iU1I3qJX9T4w99SJZ
         OiDg==
X-Forwarded-Encrypted: i=1; AFNElJ89IegYzLyQ6Wz1QHi50dc1oEAabP/dykG++ItRaZQ8/Ari35HBn4g3Sl5kK2WJ2X/fqRZj0UVQnL16wU8YfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxftp0Kh1cOxRjm19aWCMXB96jyJr21Cyv4tTN8PFBnLEC5h/Mb
	TPmO7K95OAFFuGOWi5wWnkn61hBZtIsUeJAdHJVeGzdrvrsojiOmq8FP5IDwEYPhSWT8zs3miOw
	A90VvK/9GYfFNalRgK9wWHmhUj3VQhHg=
X-Gm-Gg: Acq92OH8faqbU4zpeNoW/ehuwFBqq7e4bibVNOhq7eqJIbr2kGFwSgocBiGd3FQUKuz
	9bbE0qsozSgp9EsU2cpXtgDk5s7kq1Ow+mDqOefst5p3C1TOmiOHcss1GRUyOfMXYxd8KVqwLjs
	U4rnJUO57ujj4PaxLTE7B6VuPT55q4M2PivyO+mz822HRrQfww6QnjnFB+GUrJO5sy9+TEoHbnJ
	m/Fbi/zVO27juK53uvp0omvU4CHJi0XnQUubLZtQpIRLGgYqD4FX9rI92cafstdkNNjllmsXoTH
	ms3Voyl3Gzv2ns93jVAbIfRYsWstDnipWxREm/R17caCKDm++gj6WSimSauhzHBeTF0cP7l06TO
	3g/Yprrih3fXEhryIz5h81KWP1RgfuM7ZuQ==
X-Received: by 2002:a05:7300:1352:b0:304:c73b:79ea with SMTP id
 5a478bee46e88-3077b576885mr1086279eec.3.1780683653180; Fri, 05 Jun 2026
 11:20:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-impl-flags-additions-v2-0-0d27242f460b@kernel.org> <20260605-impl-flags-additions-v2-2-0d27242f460b@kernel.org>
In-Reply-To: <20260605-impl-flags-additions-v2-2-0d27242f460b@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 20:20:39 +0200
X-Gm-Features: AVVi8CeIl2vCLCHZZ3Gcx1cA-h_fk7WHGbREsNmGiGSz7tsS2M76m0o-rEiXSuY
Message-ID: <CANiq72ksbJPBtOhB+Oo0bc48g+dYLXPOZz=yQVTE1C5H+jyKzQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: impl_flags: add bitwise operations with the
 underlying type
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 3:04=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Add bitwise or operations between the flag value enum and the underlying
> type. This is useful when manipulating flags from C API without round
> tripping into the Rust flag container type:
>
>   let mut lim: bindings::queue_limits =3D unsafe { core::mem::zeroed() };

Can this use `zeroable` nowadays?

>   if self.write_cache {
>       lim.features |=3D request::Feature::WriteCache;
>   }
>
> The above code would be needlessly verbose without this direct assignment
> option.

v2 looks better overall, but I am wondering about Gary's question in
v1 -- not sure if you saw it:

  https://lore.kernel.org/rust-for-linux/DGPT710WN25X.1B9P21BE6X8P4@garyguo=
.net/

The commit message shows a converted case, but is it that much
verbose? Perhaps you can point to the use case / code that made you
think about adding these `impl`s?

Thanks!

Cheers,
Miguel
