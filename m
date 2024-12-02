Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB8D1DDC34
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Dec 2024 18:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733164119; cv=none; b=MZJAPhXEntw1GhA6ATfyzZQQ6LD7lnmWviqIHmZvf8qgMkYo7QTAMh8h7H4GyMejss5voQAWhG8n37jQV3oLUlNqDiEsgK3WmuE0qBtXP+/H8ShpZ3ibB5Te/N1H2vwF5CnjRisT6XrjXXW9S3Pqx56jvAaiZeguqg6I6TtOjXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733164119; c=relaxed/simple;
	bh=Hv1hyjWLPTyKqeXm++lG0gxdaqVCmDerWFeed7SdppY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gymdY4AFeywejdeXFRVD/Iv3e/K4/hrA+hO6drbDi/NO6tvM3zoAGxoIVCfwkEY7am51ZjiOc8+r6Je0tadebJF1ttTO/6idZvth3XuYZPjCfLzLs74ggOp+K48vwCvic8M6fOWhPRN/tt0YKIdPkwLqdY7P1CKpRWuTokNE1Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfQKqXaO; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfQKqXaO"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ee7c059b97so465498a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Dec 2024 10:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733164117; x=1733768917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68U0GG57OCIzDXT5ZoBVlvW0lh9ktBXniUvySDJd3uQ=;
        b=GfQKqXaOr8fkSLlkMlFJ6e7UMXMllDQrmmQPW2G7a1lxmdirTt+b5MsSjNFKmdSzPZ
         grD5MCEAS9v0xKrJk+ffGb+XxWaI+rbUuxr1C76ucRGSBD+VvZB0iokd7qWg6a46dIie
         7qFoCjV4brQHRfl7QrHvo+7N5JSF6vOmmkevi7ZSoT/ksE8pHqg4BEQBJEYBZa9ykiIq
         tDkODi8r+rS/XhTvcYxnTfKloKqRFlJFMtSGdVIlg2dcDvHbHie0Hrm8PAEvWdXp2z6r
         s9gD76z7DsmwcuwR8Nmx5ccS6K03egObRwFJhw6D1UW3HNxzaequJUXvn8HQTTBx78UP
         Gubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733164117; x=1733768917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68U0GG57OCIzDXT5ZoBVlvW0lh9ktBXniUvySDJd3uQ=;
        b=OILMX3g2NkLdPvM2O59AbGZBy7N5HfbYrPI604bpzrqpwFAgFOqLSFQODCEX5TuM0n
         pSbbFN0pr8rHvqBkSSjgdrgGSrOvHu9A3exnI1dIQFozA2/BhrwI0KpS5MPU3hzsk1la
         5hIWEV8tBSrvJkq0aHramk91x1VqxaS9SB7bTzMH3jmN57Rig0ITRg5dgQ2auBxYQ6tp
         lHs/wf0AxDqOgp/1S91rf0CSIHvJuulBxiYeAbOive0YRvvZ9BXiN2TYOValWCV1AUKD
         yxxrjVrR+WSHHO1/OkTGGMMlm7TKRNce/+HvinWzu33ezIQMbB2SFG1mj5tl52wFkayb
         +VtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpQimvXOU5u+cQAAug210hWwAGfMo2jqr73lgVhwfabwQ9K1d3AgLoJq+hl+y8TQmEWcLyYhEECyASAT9Y1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPrGPf6QParq77LcSFLHkjFBr7SjfyH0UXoKxpKW3S1SN7eFjx
	ogBti/q/s7mrDLt2k3sJ+/GkliPns97rH2BTejPjhSnXg7ZoqwWO3z3/tPYkG0emh7leF8ZA1mb
	XYsXJLZQE8gzFldSekl0AuTyKhvgumch2v5k=
X-Gm-Gg: ASbGncsbWHVlZWz/DgpHr4Jtx1Un7j+1ojtGU2XhlT+BUGIBAxdckKdHdOUhA89jo3c
	bidfNu2RrHKyZwfVfuHxVFABxmewdM2k=
X-Google-Smtp-Source: AGHT+IHILNeE2iCCpnPlIhP4PCObPouAaf4DDx7230oiaChSuvjlDGlG+ClJiAkXsAR7aHmqjvk97cy02dzmHKRgJJ4=
X-Received: by 2002:a17:90b:1a86:b0:2ea:5e0c:2851 with SMTP id
 98e67ed59e1d1-2ee08daf6admr12471646a91.0.1733164117342; Mon, 02 Dec 2024
 10:28:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202085758.67319-1-bk@alpico.io>
In-Reply-To: <20241202085758.67319-1-bk@alpico.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Dec 2024 19:28:25 +0100
Message-ID: <CANiq72kuNmw5WnGVbiw=UPgcEqKG-Mhj82Ejd4kPgUYbv4kqrw@mail.gmail.com>
Subject: Re: [PATCH] rust: introduce KVec::pop()
To: Bernhard Kauer <bk@alpico.io>
Cc: Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 9:58=E2=80=AFAM Bernhard Kauer <bk@alpico.io> wrote:
>
> Provides a simple stack together with push().
>
> Signed-off-by: Bernhard Kauer <bk@alpico.io>

Thanks for the patch!

> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let mut v =3D KVec::new();
> +    /// v.push(1, GFP_KERNEL)?;
> +    /// v.push(2, GFP_KERNEL)?;
> +    /// assert_eq!(Some(2), v.pop());
> +    /// assert_eq!(Some(1), v.pop());
> +    /// assert_eq!(None, v.pop());
> +    /// assert!(v.is_empty());
> +    /// ```

We could simplify the example using `kvec!`... Though I see other
examples in the file using this pattern, so it is OK for this patch.
Perhaps we could simplify those in another patch series / a "good
first issue" (unless Danilo was following a particular pattern here).

If we want this kind of example, I guess we could perhaps interleave a
push (so that we don't just test adding all and then removing all). Or
we could just go even simpler and do something like `std`'s `pop`
does:

    let mut vec =3D vec![1, 2, 3];
    assert_eq!(vec.pop(), Some(3));
    assert_eq!(vec, [1, 2]);

(To be clear, more examples are good as long as they show/test
something different, so if you have something that would be good to
test, that is great to add!).

> +        // SAFETY:
> +        // - `ptr` is valid because there is at least one entry stored.

For single-liners, you don't need a list (please see other `SAFETY` comment=
s).

You could also ideally mention why that statement is true, e.g. "...
since the length was just checked above".

Thanks!

Cheers,
Miguel
