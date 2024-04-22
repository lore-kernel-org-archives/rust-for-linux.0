Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EF4175AB
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Apr 2024 06:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713765940; cv=none; b=uPSQ19RpH7IVILejo4HzCYPOO/aM61l1c0+zjlHGt/Ge67zkPiCVp5xAS1qMV6uHza3lcMpZkmbfVhnh61OKg9A3S2eIBKxYiGzTz6gSbZxha78cjDgbQSJYkRueL+V4QMb+Y7LfrkyyYfIfwhwF1scSruUmnAI7XLVPjFqgOV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713765940; c=relaxed/simple;
	bh=+YgMqfSk0sb1Wwg0ylywQooAjviRNpVbBkZ3sknbcoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c0mH4z0grOeP3QsQIZ0kqklriHhXPwOOMa7eX8xFHbf/NdWmd8pI/a+XOKW3Det59CLN0T2VwYts2JvCi+EwT/JwdqzCyICHA0/8CHN0s6dLIXlGdgElOeGHhx/lYPB/DaqFHUEvMJaIm+l5c8ndhXUVoA1dgXiMMngIdQg6cGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kGRYZ+1l; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kGRYZ+1l"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4dcf9659603so1240518e0c.2
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Apr 2024 23:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713765938; x=1714370738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YgMqfSk0sb1Wwg0ylywQooAjviRNpVbBkZ3sknbcoY=;
        b=kGRYZ+1lpGrz/McUUVWiOlcQzDx1GZUuRRIIHsA1xGI1C/xZtHUQwrY28Ham850FD7
         TlZNCYnO7XYKHB3rXgGmexIGoBFnVILbdab8tGJ8HIiGZhQlsIGGmk8XUHs/rDWzTl5R
         WBybbnPJ7Q/2qwWzYMBaKhpdXynlqruh1FUDdofYWw/wE8V7XvW/LUAMmvBBoOM6kqiw
         J98GzRRCr67pOav1AKlz/m7Un0TVYKmvJT2DcZUEjZhGsJQx5le7pV8jaE+/EQKryEaz
         868b4qTJXe+eTtULzr1+Cjm5Lp2h9Xj1r0iq8Pn/qP9RFgT/HD+i2n7cS0ui/fZ0bFXb
         CEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713765938; x=1714370738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YgMqfSk0sb1Wwg0ylywQooAjviRNpVbBkZ3sknbcoY=;
        b=uS9rjdEzGZOEqIXck7QmMKbQsBDp/JxbmhKrqF7dRGDm6u6OS1/nqbfWiZ0dneoWyE
         iHnygbCbwAPBhAT/pFM/R52Gx5T0RbGZsCSz8YQ3gfIT5rIp1IlMs+jh3I8FPZ2J2jus
         U21v8xQGMiaCg7SyBy6mX2F1/uhSEFnqWjEBphK4OvsSyZUJZQbYYicUnm022T8DZc7V
         W212Ili7T/7w0Ftb6XJSoFHAHmldMXGj2PqpiLeGUQNC7L7keqKhE32jMdfSN13MHR6O
         Rr/k/0RFPzBLIVJf64FkvLzoMn73zs1Pa5IRr5y1nrDrhKMdrY/DMo0t4YAhWaqYNPYV
         3OOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGTWayAa+VZmMIp+pqEcfZPPLhpIfv9z67iyWFIvOPdI/65n+BZpw3gxeWZlC0Q04EUZ/Sz7yLjibAM2MT9AT6rMQtXLSMHZq1k8/fL00=
X-Gm-Message-State: AOJu0YxTNhQBrMOQbM6jbp0TYDTbhH3HG0AZYMmKi0g2wMHO6RSdQKfw
	VtF+LT9bYG/RKQ2LABcFdZEbtbCVyUPMeUCj6etu7yK5HUu83zrJ4NevUQOO15a7ykbm+HhLvND
	9iob0Tt08I/SYOzwDmcZIBs16Jryyvhwrw5NE
X-Google-Smtp-Source: AGHT+IHz/+ML1NRTkk8bE9PnwDI4ZmxY0v9g1TAYfhDF0l8eDzbSajUDWsp//6e+XjIkWzGWnY3677xPH9ahRkTtHVw=
X-Received: by 2002:a05:6122:134d:b0:4d8:37eb:9562 with SMTP id
 f13-20020a056122134d00b004d837eb9562mr10096241vkp.0.1713765936435; Sun, 21
 Apr 2024 23:05:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419215015.157258-1-aswinunni01@gmail.com> <20240419215015.157258-2-aswinunni01@gmail.com>
In-Reply-To: <20240419215015.157258-2-aswinunni01@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 22 Apr 2024 08:05:25 +0200
Message-ID: <CAH5fLgjLXBgoh5d9K6zQ4jtUo0R-ov_DyoMTaU8f+4xzH52VFA@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: add example for `alias` argument in `module`
 macro documentation
To: Aswin Unnikrishnan <aswinunni01@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 11:50=E2=80=AFPM Aswin Unnikrishnan
<aswinunni01@gmail.com> wrote:
>
> Add example for `alias` argument supported by `module` macro.
> `alias` accepts an array of alternate names for the module as string.
>
> Signed-off-by: Aswin Unnikrishnan <aswinunni01@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
