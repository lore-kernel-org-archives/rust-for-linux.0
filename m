Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED72224FE
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jan 2024 14:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DxOtbUNN"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7cdb24b3ac3so120948241.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jan 2024 06:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704377853; x=1704982653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giLoYiBuCJluqiJ7Duk1l5c9a+I6JQIaND7ild3LKSE=;
        b=DxOtbUNN23LHRxMwsp+MWzHZ3AYFsf2oqqxoROjFri+6hjipMn3pmAcusDpfP2VKdz
         RYNoiKhcm3BPP9LjY9fAPi/YocEf26THJG2amYRvUAtIEVBh2AC5s4K4MhQoHJfe5UHC
         PsFZCsxy7DWX/s69wBUaNpyXDgB9zO1D6BkYDs9nD0/pJTbReuHk9Lvtf+uYXoOqcXQ0
         nALgk6P+ZW8/Qk2F00eNDKDD4mRp8MBNr4ORcERWfMXbVA2CV4eR4A6DHZYJ6LBHVcce
         H0k8BD/9kg1hHccR1/80UpBGnrEk5uQKzaZkrP6B0Tnt3dZ1S+SZPVprYmyMWrV7rq6W
         z53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704377853; x=1704982653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=giLoYiBuCJluqiJ7Duk1l5c9a+I6JQIaND7ild3LKSE=;
        b=WYEqDgNFQQPNAlX1ba2nBxuQA3VAW+JPs+e3Ijore7O8TTJIi89KHGhoHya55Zecjm
         EkYayG6aZrAabeV6TKeTl15Sn6trSfA+kad8RtvZNoCS90ihdr9dm+PGZ+A4xjj1T8wQ
         uaxSDWFK0X2KHP8lvy8jP7DU0ee9M76MlU7E8D7k0mX6aWbHrKTb1p+HimD2SyhJn26D
         4bAj81kaRfcrpCm2GIWlB3KE4QL0QodBDNJb1YZgVsvodJ2BkbG1DfGC1s0Kh8WWXMJx
         XXHTHaNA9jgepMoTStf7d8/eqokcG+oceM84nWkIULyP9xclfOcICuqmkqDzSAMLE18Y
         1tqQ==
X-Gm-Message-State: AOJu0YyDr1E7DgKzFeUjpMH2ufv7gUrK5trplixc7hmDo4a5fm3GSb9R
	VwJgEQgEF7EQPZPUwR4CJbOR4Ntram/1TRzRPZzcolu1mcEa
X-Google-Smtp-Source: AGHT+IGGmXT5NwaRXznAvd/khpPo+30lICXph7Zp7dFvuoRHIJ8Z66QH5RcDJIO3wncQMw04tfWxFlWfMufxu9XEDlI=
X-Received: by 2002:a05:6122:a01:b0:4b7:3eee:3a4a with SMTP id
 1-20020a0561220a0100b004b73eee3a4amr347951vkn.28.1704377853494; Thu, 04 Jan
 2024 06:17:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104-rb-new-condvar-methods-v3-0-70b514fcbe52@google.com>
In-Reply-To: <20240104-rb-new-condvar-methods-v3-0-70b514fcbe52@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jan 2024 15:17:22 +0100
Message-ID: <CAH5fLggzw8K-MDaYPDULL1My4HooYwiZ+18aC6+RxYvL+XyPEA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Additional CondVar methods needed by Rust Binder
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Tiago Lam <tiagolam@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: Martin Rodriguez Reboredo <yakoyoku@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 3:03=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
> This patchset is based on top of Boqun's patch [3] that renames the
> existing wait methods to follow the C convention of using the
> _interruptable suffix.

I forgot to update this part. It's actually based on top of rust-next
(which has patch [3]).
