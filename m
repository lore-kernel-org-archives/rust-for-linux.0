Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5AC283683
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 22:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763333702; cv=none; b=rWHuCfDbTtey1zLMkJB2ck2okQNTq+l9CZ/pBksT5inAeGSA+k6OXd+uHj6mB3Yg/EYKOb60jHYi3Ekt7ZeWqT2gqkdlfOmIoU56OM3IJkmIzsWMRjJSdOBvelJG9Rpb0xCMcPhV/yZHq9YOhuZLyZpNRRi4oUM8I1AhZgmOoYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763333702; c=relaxed/simple;
	bh=u8rw8igxH15SPPt51q+eBjZC3lVn7st6YgN8bjWkSXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIRhlYwOoMK6QzhYl6p2YM+cPvA4cPg6PeAnjM72B7f0gGtwoZoPleheLjKVa5YsVmeS3eCwmgecCxVl8DuUqE2AOVfTT1P3Ksx1iGvtWG4Y6mBpXTnn5TpfsVxOYgx9ffNbP1NMd0nyRJkZ+s7E4jUgFazPvWZXldYY20DIevc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDbCBZb8; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDbCBZb8"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b87171370b5so321090a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 14:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763333699; x=1763938499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8rw8igxH15SPPt51q+eBjZC3lVn7st6YgN8bjWkSXE=;
        b=YDbCBZb8p+nwhYAK/IZLGxXBfMIYSRHAj2LmrfcWShmJe+hk44ALJ6tH2BEa4luPeL
         MJpZLl+/sFjCP5uxH2tP2IBk9Uzh6jqOWZMMzLKf8xFo5XZylI3ZxxaXi5gJALzpJTvD
         6PoM/dKQzzo13tPWfxHEREJPHZPGgpkq/scLfEdi0jH/AK+DtSQm0oQ03HwOr2euWv1h
         Uuxip5NaiorJFywsgo4p+uMYHuoJjbo1GsCUwYSm/sVXqLGx7VZbXdKz8lgaJ4luw8Jk
         0O+Q5wcScpCkHfDf5GS3zwF/zdJ9AoSG4Ul5DWnW2pUtiT+NkXAi4axZ5jz913Z9y3YX
         RelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763333699; x=1763938499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u8rw8igxH15SPPt51q+eBjZC3lVn7st6YgN8bjWkSXE=;
        b=U7XH1VEVdcKicqIyN2X3+jEwEVE6xDQFt8+hJKai6tZ4RO6v+7oxi5xoNsAkhaKPv3
         S5j7yC7zYtU1qOBqjUfoFHtyEBtXhE3PxZWuWGj9HJSQgXsC8LAMSAh13OR0uMK14Lbd
         GuRu1xr2UL1Duyb4BhLd6DpuHpQwtF8q8v7grU2TIjiwO13De/fQEl3/8H+OBjlq2w4f
         nDXBxwqa8excB0Oit9iJC+TNX5T9J0RUnkTs/DMcoh2Y+Jcu9+hOuaxAyyQBA/rdc/tC
         0WGqB4J+4fRE1Y95vpBtvn6wi34t7ADnY4b+5Sd8J/cqpL2YIDG/K7fpWQxnWVDRYPp4
         wXvA==
X-Forwarded-Encrypted: i=1; AJvYcCUPkwrGODK7Qc8KPKAGwA+847eFRvWqGcFgoW5KisLyeuWB/G6G8Vw3GRIZqAD3UJG2le1HdCdliCKs0qwOdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVaFk8zB7p/VMzid8WoZCB4G02Njg4UrHQHif4Zv37oILirJOG
	AA1/kEifg5xm0c5Ft6zByfBxcvBI9Y2MZKfqG0g6L4ggAKc7XefS5zD9LCsMfYcqEteFEZa/gN1
	Te8CP5E6Vge3XnvqkBL4KPVKDeWThvYs=
X-Gm-Gg: ASbGncsHwg5OQ+hXv8rHWLfdXmjCG/wmdOqzXMkr07ujFHr8dgDQmFlZYp4C8lrVcwz
	/2pjFUI06nJtu+fPo7EqerwDSXmqG+m0d+4Z6YUGFuGpFrXRem9QxxNg3e6j76zfVMkSRDknzF9
	FdK86/zkT3KdGjQZwKZjkRj6eVOILjD06hubNscpqrU1PHnYszg24tp9dO35sV9XhuvICSK6lf/
	Qy9aBEF33BEM7ddJ4xn4hEGcninkyG9Kw3+DeV8MpfLdGkhHFGlCEOjgURnBW1qOa3SUaYcfWPe
	uXIqn7eVeNfc3/puUaA35tP3XeK8FTaH7b/NsL6Hsn26mL11zebTHdRlSl/Dh8rHt4CXJowqmip
	cmlsDrheLuoq3E1xSbjQvlYuO
X-Google-Smtp-Source: AGHT+IHhWib2hbofO5AR585vQ/ehlpO7iragqRX0aN65j4kw3Yrtel7mxi5ENuehJqXIVsBQ+2eAsjKmwhzfo+kLQSo=
X-Received: by 2002:a05:7022:e0d:b0:119:e55a:95a1 with SMTP id
 a92af1059eb24-11b493dbc02mr3486565c88.3.1763333699366; Sun, 16 Nov 2025
 14:54:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113-core-cstr-cstrings-v3-0-411b34002774@gmail.com> <20251113-core-cstr-cstrings-v3-2-411b34002774@gmail.com>
In-Reply-To: <20251113-core-cstr-cstrings-v3-2-411b34002774@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 16 Nov 2025 23:54:47 +0100
X-Gm-Features: AWmQ_bk9od_BMaTJXEDsnPofuZ0-9K2n3ZCa9h8ue8i5g17ewbCUg6ZfYeY1qAs
Message-ID: <CANiq72m0w8HkVmD46UrAEn8nVvR=U5tft=GUBLSMqDWGk9m64w@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] rust: net: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, 
	Tamir Duberstein <tamird@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 11:58=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Tomo, do you want me to pick this up?

Thanks!

Cheers,
Miguel
