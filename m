Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95BB208AD
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jan 2024 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wp+avoIG"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4b72c944019so101778e0c.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jan 2024 01:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704361142; x=1704965942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZeiLk6oF+6RO9eHA9R6LEyIeFZ5frTJ0yAyDVtKePE=;
        b=wp+avoIGIIsl6Hu+T9hUxKfrlFGt30bQ72x2L2b9mSc0r34oWBIYr7XGChgEGbTokn
         2qwnge9dHx+YnF5CIFvL5Sz1b2mGv69h7vjdiAviVaexkvCoN43CPytO0qOaxLApApp8
         qGVZOMZQsQ1yuE3FKJlch4IFQ5r1UHjKYXoYjbEm+wvXhjOpriKUxIAcbVSeHEKALhNC
         USLlu20dpCLvpV6256zYc1XFN8qvQ9IjV91kWMj5BbOVWa89EotTOBpmg4p56i5oBWdh
         tOXQa9hgDZlRtzCfMpjjn4LOA4jk/avPqZw93auzbuHtHf/bn6PoR6UaKFwbT65J9loG
         okSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704361142; x=1704965942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZeiLk6oF+6RO9eHA9R6LEyIeFZ5frTJ0yAyDVtKePE=;
        b=u/ne+9sIKr04Ve+AXxraNFtzT2X2klqTHBdumzgYWIH+JqrWs+yCyOiDwaFD970qtZ
         KHCiJbUTjFfFDRK/fr4Yqmau71RHg3Os2mmmSBoT/1PDgMwGulFXOmtPkfhe3ufbQ34q
         apVBBhTq0nGLU42BbkLG+gXtWgqHZMGByHj0VliT3Gvcdv9m9QmImRW60/xl+8jUSaKW
         BDCzZa/6qAXnrXKaT7iU/eE0Iw099UkELKiFkG+mAldWtH0nH1/q3Ca/Enccaf32Z7zI
         8MXcRZVs289T81o2EeNuuHaHsP8R2sOZeolf2iegQafTO+N/1CoJr4Wp1FCuRc2R/SR/
         Dkhw==
X-Gm-Message-State: AOJu0YxA7u+lGkN54PThGBUxjycaLq3gQoFl7ot19XjxtDdD3xcwwmJq
	Ie9shSQyJpop7HN/0It3AhSSKUiZwyzSihYMQRC88gANvffX
X-Google-Smtp-Source: AGHT+IEOMY1Vj/Y9twOHHIiLLD6NFGauZ088jDqR8Tph8uDLopusypVmW0x4+T4q1f/cue82fXMbtTJfocpFsHftdN8=
X-Received: by 2002:a1f:7381:0:b0:4b6:c815:bedd with SMTP id
 o123-20020a1f7381000000b004b6c815beddmr244104vkc.18.1704361142581; Thu, 04
 Jan 2024 01:39:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231215194828.2611213-1-mmaurer@google.com>
In-Reply-To: <20231215194828.2611213-1-mmaurer@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jan 2024 10:38:51 +0100
Message-ID: <CAH5fLgjeCTTbBV500edTNqMqOp=_v_27eULab=e9WBeYjrVeig@mail.gmail.com>
Subject: Re: [PATCH] x86: rust: Disable entry padding with Rust
To: Matthew Maurer <mmaurer@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 8:48=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> rustc-1.73.0 used by Linux does not support entry padding. Mark entry
> padding support as explicitly incompatible with Rust.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
