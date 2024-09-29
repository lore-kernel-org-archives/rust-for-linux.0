Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67471F951
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 04:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727583490; cv=none; b=sKjwdmSDV+HVXKITeDwWn/9Dk3UxOWkxbC8riBeKxjFT9Hoi6giqkXAfM/N9NzsM8beTYm03N2hpvENhvdps1cKM6kK2wKVpx9WyHlpMxY5Nph4KiKTjBH0wODy4D8mg5GbFSuHq7CHvaKzEQkYA0oO8jvJaoC6A3GW5qUGlW6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727583490; c=relaxed/simple;
	bh=FMIGLf+Y9vF5aJ2DZoLFX9IXpQMyVobrCuEt6UgGFo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVELidh6eaxOwE+Y8DCHKqfElZROMSB3xwq94vBPY+aP1LECIfmKyFxkdVG7crYEBkQjrjcTIigJXo/eHW0Mjv73rKFdBKhF/DBzEO2JBMtqt/KKyUqyTCfXSircisSNGBJ4r3/0vr1Y1J/Y59WatdYK84/MUqVWYzS9zTpM7MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=Rw0OsT8G; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Rw0OsT8G"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6db4b602e38so27235947b3.1
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Sep 2024 21:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727583488; x=1728188288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+m8AqonS+5wkQ0t+OwfdrCfKeL0zOxEqCmb5hKElDc=;
        b=Rw0OsT8GmZYYqglm8P6Wz0ymY7A3YaSe7gpCXqTFLQdNPh20uWauc1AHlHBFBynH92
         DWV/MncdSIawdGrMeu4Il44XZ3PnHGKA5i8foNYHn/hm5fLW19tCa5UZDjuMDU7LeD1s
         KndlFC7krm0ILQFQ1oDojEcz5c82R3eVCtvOCo2Vri7ZyOfFNZQLbysHBLom8qAXol0J
         QcFm4nQJxMWlVABexneUxCswrm70C3+WQSS8tSMPOviF/CpstRxRXztdu6ZA1IowibJT
         AylNUrb48/I9uvx1sYsdiG1FSF0dU1aj+QyEj6RcTq9eY0LK5qsKhrLrlik5fXrfosKX
         yB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727583488; x=1728188288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+m8AqonS+5wkQ0t+OwfdrCfKeL0zOxEqCmb5hKElDc=;
        b=OEobzywnwndUuJpYdfhpOhbVzTkdXpuAnmq9DD8CFXuLKGImGT7kZIgIM6whKpjoVw
         e3cWx3I084x4DAreKSvOKGlY4x0oqkEZIEp/zVxvnGd3IjLVvfm+Xh7XAjNqc05wZhfZ
         Bfg/PLBNQOCM+pKdO99DumhYpdHGXUmmymFwgce1yfH1w1tPfeA+0aLMAevjmJ23fUBD
         Op5POLUxNH9n7xzXD4vDDBR95MEvUfaWXRKbKswuBY5l8wtZ6t1qMhKzZmuY9Nzwatk8
         kB37M9gxtDxjBdrPHrfc4ZOirGhzQ1ZHTicdvzC/jZguNiYSaT5AeqD8zbhnGOvX5h2a
         eE4g==
X-Forwarded-Encrypted: i=1; AJvYcCXq8SoSNYUG+uiUK9YRoE6L/GS7wm/NCcsgMQ1mSmL1T/wR/PJyUDYYZFg2KW35Wo1RhDVYBtpe82fKYocDnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyywBz/L7MFzH6dKydTHjCih6rmFbIurjCpbHSA41WGI6TvJBKv
	Xxbf700Zp+xW/CbgMOwEWO0za4IZnhCS3mcNvzVW3CCp8QEjB3mSnNGhCEZ/VtNREPUnWkqwGjb
	umXWIb0HU+ChNcsVQad0KZVhDNGE9x1ZUqQCYaA==
X-Google-Smtp-Source: AGHT+IHG+ttejnUk0zyaZpRqlfVcERFzFnZe28OrhK/N94BnvFQjUgcmlw1DztcdaSHGiLlQpGJBubePZGpNHYH6Hi0=
X-Received: by 2002:a05:690c:39a:b0:6be:92c7:a27e with SMTP id
 00721157ae682-6e2475e2d1emr59019207b3.28.1727583487761; Sat, 28 Sep 2024
 21:18:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-2-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-2-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 00:17:56 -0400
Message-ID: <CALNs47sLuQU3=kT_eMi_kR1_Ak-75P1S+-G5sewop8J396EmoQ@mail.gmail.com>
Subject: Re: [PATCH 01/19] rust: workqueue: remove unneeded ``#[allow(clippy::new_ret_no_self)]`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:44=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Perform the same clean commit b2516f7af9d2 ("rust: kernel: remove
> `#[allow(clippy::new_ret_no_self)]`") did for a case that appeared in
> workqueue in parallel in commit 7324b88975c5 ("rust: workqueue: add
> helper for defining work_struct fields"):
>
>     Clippy triggered a false positive on its `new_ret_no_self` lint
>     when using the `pin_init!` macro. Since Rust 1.67.0, that does
>     not happen anymore, since Clippy learnt to not warn about
>     `-> impl Trait<Self>` [1][2].
>
>     The kernel nowadays uses Rust 1.72.1, thus remove the `#[allow]`.
>
>     Link: https://github.com/rust-lang/rust-clippy/issues/7344 [1]
>     Link: https://github.com/rust-lang/rust-clippy/pull/9733 [2]
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
