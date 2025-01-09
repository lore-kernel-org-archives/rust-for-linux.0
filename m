Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CF521C19B;
	Thu,  9 Jan 2025 14:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736434320; cv=none; b=rFEV/5Dp5i/E2J7fbYUvWdG8zMMxdqxYEYq3NthTASaIjPq4ofKlcxwmDXDQ7H0p5VdL1A1facgMsl2mt7Q84DrrjmfcAJcnGgjNv2uWRspGPBBrrCsEbicP7qKjfoavICvVq7ZeiBGmohqasBtyHT/m5L3TQLLno3EJnU9JdkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736434320; c=relaxed/simple;
	bh=vGufw494e7AVXh5tSsVjnihLIZW0pgD5E8k9h5gHXP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EdYWaw0gYhkIpf482c4oihmOtyT/+rdbQK+heQBTSN5Kvf6IyQ/wULTtC375UCWVeQVnKyURZLRp4X618O3MQsEC1uj73uBJxtQXmzBCD/fxYiXd4jWj50qJktlsLEvGS3lK35XAi9Lls/vv6YtJtddfDKkbOiIeI6JmSDILcmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxUM7Pe2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxUM7Pe2"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2162f968cd7so1890655ad.1;
        Thu, 09 Jan 2025 06:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736434319; x=1737039119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGufw494e7AVXh5tSsVjnihLIZW0pgD5E8k9h5gHXP0=;
        b=KxUM7Pe2nP+f7RFz/MiTAun86iTnm0mXpiET9PLqesqDxgadC8KV0Mxb56vUYXNw1T
         trqOR8ycKNFrT5BGWpetpRHFmlhBw8Mcvg7MhOSXr2CSPzUvDlPUkRS4DYpYhNSwV9p3
         G5r28pBfsCldHqnDxk0t6ktpV93g66xVO5bysEZUT5nNX7IEATR1OHSaQx6BFEFuKTP1
         OTjDdgoSTTopRgz/j7jfcUIUFAO5CVi7UyQ6wxfuu0g8bE06HiGV1Bl4miY8D1ZVFyE5
         8n3GfmmQBfVDg65JHHPH6+w1+Va1llF2MuSQgo9WMi/bkEIXSOHYmhNU1YPwZ6tAzVOi
         3Gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736434319; x=1737039119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGufw494e7AVXh5tSsVjnihLIZW0pgD5E8k9h5gHXP0=;
        b=IGJ8MZ6YTsfSwB9KDKhw+1Pt7fE3h7A6cuMpodOqOs5orGHONomneJ00ZUiQLzKrY2
         pxUVbvLdHAyBE1CHvpk+4MNrvXFzqdBqS+DUwfuWh44hGhWvkZzQerUFs+tSk+BUc9Wg
         r9luY9TbAHtBZ0r9VTRYeDuLG69A/6FHXgD9hCC/H8zKOQEjLEjAzvG6puAuVzG0TIlM
         +IqVjaVZC+C7Eu2e4sQmL7KCqs0Zoc/rwKVWuNWiXuvxzr+8yn97q1gePp1Kp/uafPZB
         guW9KXDPM4Q7WYYLoag7Kk6tsmIfDjrOqozsg4SvdqRxnScrewnoQCZ4knZAq/oKTZHx
         qyLA==
X-Forwarded-Encrypted: i=1; AJvYcCUB/ETt5d+jlo1Cy9sV1vXFpC/W2xIeiBvQircc4p6ySUOU6gg5OMg2oin+h3ogACFRpARauidniwq+2I7VQRE=@vger.kernel.org, AJvYcCV/Cei+7LXfx97UXBLX47aZwC5gNs0GFZ8Wq1EEUUQHJPfKjcLHrzhO0Rm49V1+4AX5UvOv7H9Kd4TqzW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKQMO6EZxzoYwwIWyZcfallG+K+RvtxJ5VAb6SflIdHOBYBAHJ
	8E9Iy16CWnJmbKkncBVMuP9S8cPuZ5gHFHjpIYYrtl2eLDnU1s0+ZCTj+zagQQdPCsL8cIDmjcG
	jYrzSRRKduQ6Y50yJd4jhWjkXz5g=
X-Gm-Gg: ASbGnctzr9hyjD4jSzkgf5AmDzzJ2FYmF9XQr2aAuaXHnXF36UkjD4oAxJrCfBLfIws
	3o78duyogAa18A+B2zmX3R8b52XEQRunjmsXrLQ==
X-Google-Smtp-Source: AGHT+IFqNT8q1pSMMob7gWW6dLdc3C5jBhpyogdxQ4jQ4PQacYaeZXz/JaXG5GK+wbEAFynpACiar/4mvaK6X3mkMkE=
X-Received: by 2002:a17:902:e5c2:b0:215:a97a:c6bc with SMTP id
 d9443c01a7336-21a83da2ae3mr39042525ad.0.1736434318601; Thu, 09 Jan 2025
 06:51:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119185747.862544-1-ojeda@kernel.org>
In-Reply-To: <20241119185747.862544-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Jan 2025 15:51:46 +0100
X-Gm-Features: AbW1kvZR7Xwq8pBqsleSoij5Li9YxDLLzZcWeC8ntsndOTqzMLEhMpAg4Nk5iUQ
Message-ID: <CANiq72n4Fw96hcuqQeorsfH7z4Tb+R1gdf80H_XkD-oA6z5TSA@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: allow Clang-native `RANDSTRUCT` configs
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Aaron Ballman <aaron@aaronballman.com>, 
	Bill Wendling <isanbard@gmail.com>, Cole Nixon <nixontcole@gmail.com>, 
	Connor Kuehl <cipkuehl@gmail.com>, Fangrui Song <i@maskray.me>, James Foster <jafosterja@gmail.com>, 
	Jeff Takahashi <jeffrey.takahashi@gmail.com>, Jordan Cantrell <jordan.cantrell@mail.com>, 
	Matthew Maurer <mmaurer@google.com>, Nikk Forbus <nicholas.forbus@gmail.com>, 
	Qing Zhao <qing.zhao@oracle.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Tim Pugh <nwtpugh@gmail.com>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 7:57=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> So a patch like this one may just work already, at least in some cases.
> But a fair amount of testing is probably needed for this one, so if you
> have a workload and some time, please give it a go!

I may pick this very early next cycle so that we can get some testing
during the -rc's, and just drop it if something breaks for anyone.

But any other testing beforehand would be still very welcome...

Thanks!

Cheers,
Miguel
