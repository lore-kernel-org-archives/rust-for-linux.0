Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D06215B30E
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 17:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706548121; cv=none; b=OLpQksGFWmDqPznJNcHbgAWINe3kNrYOdwwRcVgDhyMCbNO0xRcetWYoAHHBh4qRmUVEUdxoJdL1c8wd4ufZAIlNkxYIt8yhQ0VP1xZWR+lCqdfB/HG/BTOE3Krip51Gjw4ZftBJGJ8tqNnjAU0BFq77YVjuJcsxqZ5feveseD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706548121; c=relaxed/simple;
	bh=UFA2sbZ3Uszgy+yX9T1/72+bJwfqcVAD5CapdxRxgN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0boYOChQdIEGFXKdA4Y2ywBdBr9OAa4EsxC45x1hmQdMcnlok5BeuPY6wmRGdDctqr8OWUHpMFua+CUNVcbB6BPjAFiOu2xzGfjKRrCC8s6w0FqQmDGw/aYqs9Dd7fM9Eit/OqOcgzVYCQNWkfrEn+QSvYQYCBDLrnbQCEOe0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=On+uWy0v; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="On+uWy0v"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4bdc3d5512eso1800656e0c.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 09:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706548118; x=1707152918; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EytCfCt7Mdn+cYY/W3p5gw2x+cwVqNDRPkfT5+zTUNI=;
        b=On+uWy0vOWV6oVVgcSwFa0WMil8Hqocjk50nCrwJRtMSPGPvQ0Mm7NoGZ42WFprNDn
         n6wT3QBFwFFvoGCVwqt0QTEQO33zIyvvYbAt9BmiZrCghYbF0CumaGv9Mbk/fI3/ZNCN
         9IZK2+tavJf4L9tam7xxEWheZ/uvu5SjuqA0s+wCIWy8Vpb5B7GoAddBr2qD8cWPmGa+
         yj/6yYmxfeDTSpuy3Mg0q2zx5kzQSPXS80VgHm4BkMCOM5Z646JAS4nHBmdt9BuwRKFX
         ug5lliiZHy0WALv2FJFgiarlw3CF6i5FClmblQkcs+KvKOaSRZ16M3KHV+ucoxhE3KkF
         RS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548118; x=1707152918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EytCfCt7Mdn+cYY/W3p5gw2x+cwVqNDRPkfT5+zTUNI=;
        b=qkrl6sSM8fg+vGZcD8b4XmtFWjtoC8A3KSv56/GXlb6mTQZeC5Yux5ttnWEU2jxhLB
         89+0VvpraxCzK9YsI+X/YV5y2r4k4/kztkep1LqIZFcyNFpF64Ivy7btFKHzM+H+seSh
         243CMk4NwJDLSGQUcty9zJyFz+bKD5FpH2r4xHeQ0O6Pv4KiizJTRO3EIh+0j3k8XM+/
         JUNkHHCy5xTbw7dzqkbmlh3JfvgH/3/xqi4sXI01HbKx04R1BjzbMP+CsVzojAb4Wq+o
         1doNiVEOLPXAnaiBfrwAbZrpija6lvV3pyX2mjJPscpYNixRN/FSvJfmuGlnm83NFLZH
         Pm8g==
X-Gm-Message-State: AOJu0YwFbwZsJJ+LszyUU0Smbzue0FBChzSsswIBRXU+62U6Fy7Hsten
	NvvjFVMx9uiJ2Ij8lDhELf+egpS3BZBu/a/qswfATybtCCFTMdy4uamRQpHQKT57SlO5lL58LH7
	4itC2FQtxRyfNC6PrjZrzGSTXPUvXVRU60HNl
X-Google-Smtp-Source: AGHT+IF9Cu5QQ8w4oZJwiWiMcHW4RaXyLjrg31UTRbHFnVHAFPnrShgJD92nkJB3pF4cIqhqy+YlGQA7E/cQ25bGa4E=
X-Received: by 2002:a05:6122:1799:b0:4b7:57a4:1238 with SMTP id
 o25-20020a056122179900b004b757a41238mr3247799vkf.14.1706548118338; Mon, 29
 Jan 2024 09:08:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240118-alice-file-v3-0-9694b6f9580c@google.com>
 <20240118-alice-file-v3-9-9694b6f9580c@google.com> <1ac11c65-7024-41c3-a788-cfcad8fb6c55@proton.me>
In-Reply-To: <1ac11c65-7024-41c3-a788-cfcad8fb6c55@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 29 Jan 2024 18:08:27 +0100
Message-ID: <CAH5fLgjMvh65PXdxnkPAtxNH82UDAwtyXmPK+VJPFTtXfiN2JQ@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] rust: file: add abstraction for `poll_table`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Kees Cook <keescook@chromium.org>, Matthew Wilcox <willy@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 11:11=E2=80=AFAM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> On 18.01.24 15:36, Alice Ryhl wrote:
> > +/// Wraps the kernel's `struct poll_table`.
> > +///
> > +/// # Invariants
> > +///
> > +/// This struct contains a valid `struct poll_table`.
> > +///
> > +/// For a `struct poll_table` to be valid, its `_qproc` function must =
follow the safety
> > +/// requirements of `_qproc` functions. It must ensure that when the w=
aiter is removed and a rcu
>
> The first sentence sounds a bit weird, what is meant by `_qproc` function=
s?
> Do you have a link to where that is defined? Or is the whole definition t=
he
> next sentence?

Yeah. Does this wording work better for you?

/// For a `struct poll_table` to be valid, its `_qproc` function must
follow the safety
/// requirements of `_qproc` functions:
///
/// * The `_qproc` function is given permission to enqueue a waiter to
the provided `poll_table`
///   during the call. Once the waiter is removed and an rcu grace
period has passed, it must no
///   longer access the `wait_queue_head`.

Alice
