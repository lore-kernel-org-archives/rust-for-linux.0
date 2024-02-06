Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE9A56B61
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 02:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707185912; cv=none; b=u2mkBlAK6NtrQNLFqjyi991tiMaRwyBGftYmt0J6Nr94opt+9bbsuni9n3S/OfRToRfYvDtI1ZMw8oe28UE3q66u7ON11yBU8QDG4w2hMDUchrBVKpQ+xjJb07lI1cZJzqsxAgM6jPr3t2tvL6hqs7dSktNQ1ABzkwS4QJ78IW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707185912; c=relaxed/simple;
	bh=gZkw2d6GEVsCKvdSDVLYHTC96kmhi9x5abFW4GTX54w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8JODsBpQdVikeMUfh1XlsP6mZXw46Wnxk62S2g/XVbHwgu4IFZdF2cezA2+ecWBCOmGl/rJYIH2zS9JU/z1WGS8lkyUrvPTZF4+qKLVA9MpvPD7C5STZcqiynE4hXSuKTmElCnOL40Gal1z7imwTQD+eE+JsonR1j9UOFLSHUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=DEYBXZwN; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="DEYBXZwN"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-604055e48a3so52811047b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 18:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707185910; x=1707790710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZkw2d6GEVsCKvdSDVLYHTC96kmhi9x5abFW4GTX54w=;
        b=DEYBXZwNmfJ7lMCZ7Uu1FQPNRue751FezuY1O97slzyj3kLCRwSOS7FAWwx4cluFIC
         keL25Fchygu0p6oiT4YFQ6eAUsHJ4Cv6LHA+ADhbfaSf6Gl3YfIDOgv91bYTLE18lDXj
         AnFHBi/EtzitM/BRfXHQH30PYlBiv89O0Lgh0nGeQKQzVAjIfdS8rQGZrKUYzYIxMBU/
         W3xKCn1cvX/hbQ91ilPRgaeta+HCIrzfzQQWrS0N2gRGD6qFy03R3N1ZfiJ/0fsVmDRW
         7xrIARYrREbZYd3arC0x99GtxCFTJ7EeRXzWE0QKIS6obVwQ0sGlPJnMG/CZRnxYrjch
         hcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707185910; x=1707790710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZkw2d6GEVsCKvdSDVLYHTC96kmhi9x5abFW4GTX54w=;
        b=fF9m+eYA2s8QYR4JFue7PeCMETDtYmP9aWmk7slO0XiTyQ4W0jgk9fvZRCQ0RL8dEL
         7XOpMeRqeT/NX5LeZ02376AlRGv3g40YBLha23ifdHUT0orAgd+0sE21DRNBo5+5GCiY
         cIw+/5jYZrK6tby+8DSrA/sejAY/xi0rFIWC9GXfuX6FZ6fnigko8SKA59PWV38hCcu+
         CCqvLuBIFVItBDT7d3PQfnkmykM6FZY4WhM52jmPWzQf/B21hyDLM+OWAf0NbbZfyMck
         IqYIUGw1iYHEgVeqCtWsfpkoTfSbDybrnXAMmrWoxnWNOmVUBWloUa+IFP7IxsF05naR
         QLGg==
X-Gm-Message-State: AOJu0YzF7E6g462YaGBZxvaRy44GjweXFBScR4ZjRjCJp/RniaEQKI41
	7NT9L8MjSf9aoxbSyucWDTFSV8F20svgbv82ZyxYXrteUb25uIp72GuZgYmsDx0wbUWSEuMO0dP
	Xu/xcVOTXtZ3I0WlSeKn8jCukt/IxkFQgS2LGtg==
X-Google-Smtp-Source: AGHT+IFZqDHvvmCo/0VYZMxcZsnzywrmE/o8Pirfqy6QTFEOvP66oRP6OMJ9bMGs8gYJXJdFmWKwyb76YELKJy3YiO0=
X-Received: by 2002:a81:aa46:0:b0:5f4:a5ab:4105 with SMTP id
 z6-20020a81aa46000000b005f4a5ab4105mr373824ywk.8.1707185909958; Mon, 05 Feb
 2024 18:18:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202-alice-file-v4-0-fc9c2080663b@google.com> <20240202-alice-file-v4-2-fc9c2080663b@google.com>
In-Reply-To: <20240202-alice-file-v4-2-fc9c2080663b@google.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 5 Feb 2024 21:18:18 -0500
Message-ID: <CALNs47vEo1ghfrCZh0=XB2u2vkRAoTAqp=FLpJLb3BEw63FEMw@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] rust: task: add `Task::current_raw`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Kees Cook <keescook@chromium.org>, Matthew Wilcox <willy@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 5:56=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Introduces a safe function for getting a raw pointer to the current
> task.
>
> When writing bindings that need to access the current task, it is often
> more convenient to call a method that directly returns a raw pointer
> than to use the existing `Task::current` method. However, the only way
> to do that is `bindings::get_current()` which is unsafe since it calls
> into C. By introducing `Task::current_raw()`, it becomes possible to
> obtain a pointer to the current task without using unsafe.
>
> Link: https://lore.kernel.org/all/CAH5fLgjT48X-zYtidv31mox3C4_Ogoo_2cBOCm=
X0Ang3tAgGHA@mail.gmail.com/
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Reviewed-by: Trevor Gross <tmgross@umich.edu>
