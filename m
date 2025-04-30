Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D3C3FBB3
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 15:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025315; cv=none; b=XtjrMG/dDfQTKcJ15aJcukkJ8o4/yHee+ccgcFeVNh2g48DBDdQpBG9Q6xrShmPs3GQIbLOWwgbV1CJKvvo8icc/jRw4d05RlNGsmRUcezFxXxWpX1Sq2Ubo5L6vGZuokyF78Y9AM2vlLMZnrGopvzUE/zkKv0DaKPFUiCgCDDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025315; c=relaxed/simple;
	bh=tWJynBQ8CHhj7jV7Vp3Z6abczzsvOKNiIwGDPUWojtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZduhyPq+Rt7uugW0sZw+p97nazTMPade/GVDtXBEc69FkzLGtSq6BJiGZ7m7G+nmDuHQE9I9nuMng6ukEBTI8A3+kFgMQ23CyFPua0yh0jpc963D+x4E64VVs2/f63QVkB10iCrB+oNtCae2pFHDSIND5HZsJX3Z0DL7yI/eJYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D7EIj/Dl; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D7EIj/Dl"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47666573242so736291cf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 08:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746025312; x=1746630112; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=myx4IoSQ+Cnx4z3pEYIVoj6YP0b0jEzjgN/nOMvSwGk=;
        b=D7EIj/DlOEPQaU/9I+rCEGWIk+d2pIgtAfIXKfmTaO2Aorj4+gvwRm1ISmwk3nDSXY
         8Shi7KZhhRy46+j7zFlucxm5s2ye6JjCznvSfkuX/O4jrcPipKd2EUIpQwEr+dCD91zR
         GkW4KT+s9jiTUzgV6dhc4vxnGkBicGYh8lmoe9MZZ64wgjpg0EBncH1eZ/RNSjzIff0Y
         eMiWSW8LE492bjJKlRKP9tVfjpCc/L3evK6Kr8jDD8MLJD06iNuf85v8gcu2FVTHNVX6
         iBFEBasgacnW6dTdRkJAFxfmlK+tumTf7zOpG+J34X15WVimTq1m1/TCsERP5Dq6MQ+f
         MjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025312; x=1746630112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myx4IoSQ+Cnx4z3pEYIVoj6YP0b0jEzjgN/nOMvSwGk=;
        b=sys0rcLeIAQdhjqkxgpCvg5wYfTue2S7/N0WlBYdbM92HObEctjjkHPmRPiJxeE3jn
         f3+u2h/D0AlUiCPRVYhom+kgWEBQT7pkN5z3k/rTMZYkwL3x6aVtplIBmjQuzIUmccGn
         iLidbELtegiQVCwGwT6l7B8j2sr02bxZYRd523J0/7cwoKJenbzvHsjyf3yAdEwj8fMt
         uTsqlo9OaJ1HyrpXP7GmgxtcrWu7f2aBTeCln1PT3tNJSeQeyh4WbZ4sKORUeXeOrfBJ
         jHwbCuWkmRLjuygU32/lqqYet4g8G9+k10QViEY8xKm3jFPc7qnZANwcqLDZXbd4Iosd
         ViUA==
X-Forwarded-Encrypted: i=1; AJvYcCXJCFFPC+++LfJVXJnQeQbGUyqKHmmmWbwGmm9TU42dUJXKECybiCZ7NP72Iyzn/zxoJcWSCPlQHYEGOBcuog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHN6QTJRNi6/j0xMZ92ZgEtv6lyRPtiBg9Ti0c1KnCtTTMLhbN
	pz+YzDm6J4M1EgOaoUNhlNyGVWP+7dn1ELxLg5p5XuCKpC1rJZfo/C/ygeDhuekncGTZg06AzxS
	zp6Td/G8LDYsv6cglwVNBPfin+7zrshRmnarE
X-Gm-Gg: ASbGncuR/6c/5Dep/lrArvV9YoIjo8LVapOwYD7RoA3e8HNSfH6VYcXMCUcyXGRcLkV
	IcabDa18dSQdjQOrxKtGQ80UdCYLuJDhlvDPv/cwYU/USM12PiVAIBEaoWqbCg5q4HW4BZCNS6o
	yc7c5TIaXhTSDTIYtq5l3ERYgY+/1bH4AES9DY4rQNg4NnSHNpU3XykbHznKkZ1Q==
X-Google-Smtp-Source: AGHT+IFthSFe2kjB8n8MbNeu3ujdvAxwQ4Q05Cnykk/OUNTSbEuM67eRgVTK84hV+al4y7uf41EtE9jWSztCH/k9b7M=
X-Received: by 2002:ac8:5d50:0:b0:477:8577:1532 with SMTP id
 d75a77b69052e-489bb190421mr5243841cf.28.1746025312125; Wed, 30 Apr 2025
 08:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com> <2025043024-disk-rockfish-1c1b@gregkh>
In-Reply-To: <2025043024-disk-rockfish-1c1b@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Apr 2025 08:01:38 -0700
X-Gm-Features: ATxdqUEcjJCwuqAAoSuedh7z9GUsaAp9xUu-gbAYzuwpWuXBj3NTnZhFgxMq7FY
Message-ID: <CAGSQo0040a9efWj8bCr4KiMUXezJJ2HVQVR5aJ90rgrYSjKq1w@mail.gmail.com>
Subject: Re: [PATCH 0/8] rust: DebugFS Bindings
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> And yes, I know why you want to tie debugfs layout to a structure
> layout, it makes one type of debugfs use really easy to write in rust,
> but that's not the common user for what we have today.  Let's address
> the common use first please, save the "builder" pattern stuff for after
> we nail all of that down.
>
> thanks,
>
> greg k-h

I'll remove that API in the next version of the patch series to get
the basics down first, but to give some motivation to what I was
trying to support which *is* done in C today, see qcom-socinfo [1] -
it uses a backing `socinfo_params` struct which is expected to outlive
its whole directory structure.

[1]: https://github.com/torvalds/linux/blob/b6ea1680d0ac0e45157a819c41b46565f4616186/drivers/soc/qcom/socinfo.c#L133-L156
