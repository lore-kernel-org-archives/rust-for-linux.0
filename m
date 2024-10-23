Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEA91AAE06
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 11:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729683613; cv=none; b=r918Kdz4Y2sLAeeqXkf67fEj1TIX4TsHqAnNyEAXn8WzIoyAQaSsCQF55pZso9dGiZL+OP621ViMLLDOYxZ2rwxpqy9DlxGNRNgOkGxxwwxoFDcIi8IjSB6UUPdnBIp1u9rUukWJTUhJwL7t0MtklBEj46foAsfnRNwAyhT3bx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729683613; c=relaxed/simple;
	bh=xl2DZrBDAwHAwD7yDt+ObJBK8xoU3J7UOJJvL65VD9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggS7Zi+GsyooSzJRx0dugXSwzo4kPOhjlkstGjdJVj6HiuiirgaYRKLXiE8aF75HStRvck7OsW85gos0mFx9PzGfr36lKigktfYoPvKD6vVNrLxsbWpISSIJo32ELETxigFnchqHp30W4jzmHq3ao2JKAmPPzbPXvjXhht8l2jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Jhrbdae; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Jhrbdae"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-431616c23b5so5577785e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 04:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729683609; x=1730288409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clO3ASdctIUJD5++Y7CTlIkog8RbQEY5Gg3bJn77ybg=;
        b=2JhrbdaeNohkzmtJy1hok7Ec3sk9VQ81e46CdVfB2ViC1nSKZjzJItEGCMPhsCM7pH
         xsRQgd60bYpbz5fOMxsTd2tqVqwh4HjBlNH0OXrLYDR7vq3rRNwgFN5HUjECekJNwJ/+
         ltuA2jIn/ZbX51yetDX6sfKt7K8u3XgYgjMGGm0Oqb0uA/T1gUurS/xHuv0OMp1krnV5
         Y451qh6zTQ1glp2xOuOlc10zLH5q2i0S/8fGGr5wbh/6FPOaMQJ6syqcSSqk1f5NT/Vk
         0o6COy3qazx1rv1q5/NVmI34J8FIH3Bn/osCcafCfMzaLotZHzfIg5iQghn/2Km3d3vb
         O5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729683609; x=1730288409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clO3ASdctIUJD5++Y7CTlIkog8RbQEY5Gg3bJn77ybg=;
        b=ryx1QO/8rgOLT35girb0+Y8/Pz8Z/Le5U4GOrCmzm3fiJBCBQMufsJxZZY9idMS9+2
         99GTtyXNCTo7xGqNu/dubT3BwiAjgpGkIYjEFDHX9iD9m4a8vJN39TmqgtF6Cqzyd8TV
         MX0i5VihRLswtbIBDkLWr5lKK0ExFpiC33wDyHDmjJ6s1g/O+nzwIcJqimv4Zswv18fI
         4X1u6eG6wkiLrTpQwbCqUYKjsV+dP4nKBiGcfnn7xSULfMo1/njlGtB78g1bxYKs+G/C
         BNOrjhW+YV7PtRn6/rExHnZL/0DIZ8CThZXib7IR4mIhzSLIGyL9njRBAhs4MXn748Xe
         Xr+g==
X-Gm-Message-State: AOJu0YyaAH5GqYAdLfMYIV6855gaD93uOeLYNagYFoylzg3VSG6g2BBT
	abtRYngZqFqX3bCCRUOvxd3IHp0PUtjqHr6nLy5UIMoZ35927PUt5OaC+9a7+rc1RI3z5i3PgnC
	wy/H412cGh51OmKNlTEsBOI/jf5jNXBbM35Pw
X-Google-Smtp-Source: AGHT+IGWgw759kiGD66grzT26Z696gsA71jAmXE/eLn7Ey94LzdBGl3UV7M8+V5TtxEuYd1NAA9FNJeDVteYPGuXGco=
X-Received: by 2002:a05:600c:354f:b0:431:57cf:f13d with SMTP id
 5b1f17b1804b1-43184337402mr14563655e9.3.1729683609114; Wed, 23 Oct 2024
 04:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023113309.1724992-1-abdiel.janulgue@gmail.com> <20241023113309.1724992-2-abdiel.janulgue@gmail.com>
In-Reply-To: <20241023113309.1724992-2-abdiel.janulgue@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Oct 2024 13:39:55 +0200
Message-ID: <CAH5fLgj7zYc6jg3vyqKNc85vkAvfgD1yqrUWj2-NcyR3kDPCbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: error: Add EOVERFLOW
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, a.hindborg@kernel.org, 
	linux-kernel@vger.kernel.org, dakr@redhat.com, airlied@redhat.com, 
	miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 1:34=E2=80=AFPM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
> Trivial addition for missing EOVERFLOW error.
>
> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> ---
>  rust/kernel/error.rs | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 7cd3bbab52f2..92bfdaaedb02 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -63,6 +63,7 @@ macro_rules! declare_err {
>      declare_err!(EPIPE, "Broken pipe.");
>      declare_err!(EDOM, "Math argument out of domain of func.");
>      declare_err!(ERANGE, "Math result not representable.");
> +    declare_err!(EOVERFLOW, "Value too large for defined data type.");
>      declare_err!(ERESTARTSYS, "Restart the system call.");
>      declare_err!(ERESTARTNOINTR, "System call was interrupted by a signa=
l and will be restarted.");
>      declare_err!(ERESTARTNOHAND, "Restart if no handler.");

The commit message should explain why you're adding it. What will you
use it for?

Alice
