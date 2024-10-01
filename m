Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538591BD034;
	Tue,  1 Oct 2024 22:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727823489; cv=none; b=fNT1kEzyWP5R1CUy+cGvkyPmau+jqzhmPqNuusrVVBXbu5SHQfSRfs0TcmD5R2QYfuqoQfLl+Pkm5jL+SLkDyUCumX9aM0UVH75tcsp1MBQfEqcfUJ5yjBfVhjjRv81bw8wshsWDHRUctuDpSm0FkRihTNzGj4HZRQvrJ9nHGCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727823489; c=relaxed/simple;
	bh=gKdfRPlSrJlCD10z8vbnramphRXFX4St9Ki+/BxUTJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJ9f49o8/4owzRHr5vwKNd1QLozrc/JJY21BPSYdcVperyYgRxN9ovw8YLXAkJjqWVbk/R8gzQQw/+eFhIxej3Ul6uHppbfH49LgjntEBieJRZRNodJJJPBZPKDsmsOiSPfLVyqASM6LqGXxiS1qzpVIBZBoJfYwdJE0PDP9LCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/dngpxn; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/dngpxn"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7e6bac92bf6so481993a12.3;
        Tue, 01 Oct 2024 15:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727823487; x=1728428287; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxOJd0I4h4b+UzJX3d0MuLe9Klhma3R+qbWMyUX7ZvY=;
        b=J/dngpxnzHiul4fNARlQiU5VVQ/9KnuDAarz/lHau6W/NAmBHBfHZ+ShLSQJpaKfuC
         eAjcQly/eLn22VCDF46dOYmCn0TiNlz9Bx6ZnKMMx9AawBLhsVqGRSfgWsT1O5NUstel
         XUXd0y8X+TdccuXB2KrFS8nkMokzWTm4zhK0KLclfjK1WtGeNmajjvf83Y7ZEHuBe7BK
         O6ETfvKfThrE11Nne4PoDN3dqd0lvwFf5TfC26XthQhNPXFUZ1DLprFHVFS6mJR9I7AN
         IBerlyCTt9POYCZdGMeV8bC01vflj48NSOW/2hnZBguRrD9sAGRCla4sAI4MS7yEC7bB
         pnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727823487; x=1728428287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxOJd0I4h4b+UzJX3d0MuLe9Klhma3R+qbWMyUX7ZvY=;
        b=HMk0NxqhrSJXEbw20Q+Qql+VVM0B+/lFgDaxuCUGnV1X/L4pCdzCV6s0fZehN3dMyw
         t+DYKSoAxtTFZTw7DRSiuTdBmrnqQem8I/0y36ehHkQPXOytHr7/PdGbYGTRrPOFQ8tS
         /03e14nNdjfyze6yZ/FViiR2Q7iUj7esXXIVWXl5ayap5Mrcd4dxqbCbJOtjbiP5UI7N
         bnnSzrL1+D5EP90qd3lAtBUa2oL1hS1PNaNxAuLUCv0cAZL52q4ZH/syFo0/kxpLLz24
         CC6p4oDQvlm8vbcioUHQsYqJmoY2tI9Ghr3/9W7/f6nw/RlZRQMeZPwN8q61+q1r31PK
         fjdg==
X-Forwarded-Encrypted: i=1; AJvYcCW0aKludVX+qhyPT/yiS2nd/irLR6Ane27sunr2xqEuhHeaWnEnfzJphgdZsEWQsE5T4paMJp/fNwaq/h0ZP68=@vger.kernel.org, AJvYcCWVsgsoHn4Il5aYlWa4OdnFea7VWmGm7YDRgrKVRPzYNXRyqxpea2o99iL6/XkluMxmxO7cU0F5BBSZVMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGy8ELmywh5sVm5v4H/AZC5sc6WLfNE5Kc0B3LkkE/w71Cy/JR
	r2dVQvmDCjSGqr41QPG/4FoNlrqV73aYUJQH9Z8oya7xuER9exyPpKg5EjeJ6/4zYGGeQcs2nEq
	A8KZrIQD+DNiBzgizVKmRZaE9Zwo=
X-Google-Smtp-Source: AGHT+IFM8WQCc/z8YFWexI6jJWr0WeCJdbl6DhRc9teF99WQLCqqhCcoHjefIKG4GJMiJMXgVx40QSK5qTZoGSM95uw=
X-Received: by 2002:a05:6a00:808:b0:71c:5e1b:6871 with SMTP id
 d2e1a72fcca58-71dc5d896e5mr791856b3a.6.1727823487480; Tue, 01 Oct 2024
 15:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918212052.8790-1-nells@linux.microsoft.com>
In-Reply-To: <20240918212052.8790-1-nells@linux.microsoft.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Oct 2024 00:57:55 +0200
Message-ID: <CANiq72n25iBCJtDV=XD2q5AEg4Awh9hyeKM0YwbeE0pv0H2hLA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: types: Add examples for the `Either` type
To: Nell Shamrell-Harrington <nells@linux.microsoft.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	tmgross@umich.edu, linux@obei.io, kernel@valentinobst.de, 
	kent.overstreet@gmail.com, matthew.d.roper@intel.com, 
	kartikprajapati987@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 11:21=E2=80=AFPM Nell Shamrell-Harrington
<nells@linux.microsoft.com> wrote:
>
> Add examples for the `Either` type
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Nell Shamrell-Harrington <nells@linux.microsoft.com>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>

Applied to `rust-next` -- thanks everyone!

    [ Reworded slightly. - Miguel ]

It could be nice to have `assert_eq!`s too, like in some standard
library examples and/or a "real-life" example like Wedson's (I created
a "good first issue" for that:
https://github.com/Rust-for-Linux/linux/issues/1122), but we can add
that later.

Cheers,
Miguel
