Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6522420C
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jan 2024 09:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NHI3SJE3"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7cc7bae27b5so566710241.2
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jan 2024 01:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704447895; x=1705052695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFpseWSlXa6VJ8x1Bw84TJ22oa6aTo4EtNJAEkzn/5k=;
        b=NHI3SJE32/yf9P1jX0pK04v0UXnSp5H5/4Kp0l/CbEQyHc/RYN77xBfVeaZXIggzx3
         4XEvwzy7pJAWlBiBJwQUVRQvl5VlMZAaJYmbo63qRh2QNsyvvTLOdZoXHtPPhX0rtlym
         bz6lUg7FfaQ4aGe6Cm48jZME8OORoFo52QY7WRqaAjOH/adnyLqlVvZxy5DHXPLC3Sgg
         8X3+FnVBcZlkweY26MoQ0GNbxaajtSe9cIo/EvWRIXPTGY8xz+0LMPbNGinBPjkmRSVR
         +U52U7xnsPUSfymXL/eRecpCGbDmkrzpPCRlhdU5aA5hNxJICbVrf6eTwFV8GsV30Q+V
         IgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704447895; x=1705052695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFpseWSlXa6VJ8x1Bw84TJ22oa6aTo4EtNJAEkzn/5k=;
        b=EDcWenFmgLVkpvtrubS2o51tWILqQh5XTT80OOTocV/7KvlImoSPQhVYbOAOoHZGX0
         4LGVnVnHfixIpH2h9YNrNUfwt+0Y4IwV9xQ9WhfQV6YEHcE5WICZHNRAe58ubfDRRNAY
         bYj2K0w240WXGfvIgX4IEYkIakjfcPnMQAz4NBcUSc5Mwwvb7U/77od0VYW0WKDjPfW5
         bjSwe0lsrCHBU+rmmDIdfN+Wyl1Pts5rEF9JU0znZ9kY/s+gPf/p1hKxY/vlpbojCz6v
         jlqrLg6fptRh4er0LdRDGQs75SZIp/Zy4eQaX7RKLocUIpFUC6PdG7O8ryyTidVVR/dt
         KxBA==
X-Gm-Message-State: AOJu0YxOsG+xAl8wOiniVdMPg4psenbKv3I4iExkMJP8FJhtR/HYjrbp
	juQx5PLn+mlKh3oGaN1dc53pcBKjc7smIUrGu4W2RHoniq2W
X-Google-Smtp-Source: AGHT+IH4FqpMAlNwGaCvWINiNBl7iVD5T08hKuClAAWaczaKj/nZDT0JQx8gWAWE1GGQR/8rwUprdx9cH4a66mdDW1k=
X-Received: by 2002:a05:6102:440f:b0:467:bacf:5a6e with SMTP id
 df15-20020a056102440f00b00467bacf5a6emr54778vsb.20.1704447895692; Fri, 05 Jan
 2024 01:44:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104-rb-new-condvar-methods-v3-0-70b514fcbe52@google.com>
 <20240104-rb-new-condvar-methods-v3-4-70b514fcbe52@google.com> <ZZc1ZcgzdRHtipr0@boqun-archlinux>
In-Reply-To: <ZZc1ZcgzdRHtipr0@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 5 Jan 2024 10:44:44 +0100
Message-ID: <CAH5fLggfvRrCLOEmkAhSuEsyZdXpwb6KkvosvfOjFcw=BSvyEQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: sync: update integer types in CondVar
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Tiago Lam <tiagolam@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 11:48=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Thu, Jan 04, 2024 at 02:02:44PM +0000, Alice Ryhl wrote:
> [...]
> > -use core::ffi::c_long;
> > +use core::ffi::{c_int, c_long, c_uint};
>
> core::ffi::c_uint is not needed here. And
>
>         use core::ptr;
>
> is missing (for the `ptr::mut_null()` below)

Oops, looks like I messed up this patch. Sorry about that.
