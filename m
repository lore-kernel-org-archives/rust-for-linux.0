Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DCA1DC98C
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 09:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737020716; cv=none; b=Oetbxd56drp0sqMfEEdiC59HAwTeQbmx5YfHfmS24X41iR1gZcI5t16XRigCuGwPyqjaKXAwLlNcYOJbRZ7xjq6yU0ntt5QKFveDP6AFtaKgrTfUIi9UZ5SVmOUKyy5zlWXhn5Ba3TOl8cetfTSa42l/21uRsGSFe5K8IZssV0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737020716; c=relaxed/simple;
	bh=SL6zWPg7b13eNNbqzfJiEUxNOGH87kbqXmMqxrNyzZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qts2JMfnsxVpD4EFyAi41t9t6Bf/MDnpKz4l/M4a2+LcUJCmzuCvdkA46fcOcbwJtYn+yQKu8SVTrJe31GAit7rU+EMl9+bM5wPILX88a96RVXQ5ZiqUT5DkqHZiCyeU4bTXBn/pxkxz2ohuOiBhHYDPTOxUl5sGS8bI/tTnspM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UUYJkrB1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UUYJkrB1"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38a8b35e168so469405f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 01:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737020713; x=1737625513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G97hjMfDtUXj+Is0oUFrqTtwBK3UMNwO8cqTTqcsyh8=;
        b=UUYJkrB1mawCcaNGcpqxeOBj7pe564ermYi41DCx0dppMlg6yzWv02OQ6GkDf+XdAr
         aYmmSELOPZ0Zjueg7QDnx6SaoP7iNXVxp5JSDZeavwvrWVEhzdG9p20XI3rxXUGx9zRj
         mKvr8GgqvlQX3F1OMV8RAqRWSoAL4kOz3FJEDX61BaXZ4Z/w4sL8p2VTOAZELXfqW8Bo
         xzlYoXjKs9IMA/r0lMhAE+3MPFU1/j17iLrUcdnagIEIVTyiKt26B68NGb0RsVyFy3Ur
         v0UAVFamK56XQefUT61hiEM9KZbbW7eZ4qIfw3r7bXimPGn7NBPQyTK7dJk34qLmPiDd
         l3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737020713; x=1737625513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G97hjMfDtUXj+Is0oUFrqTtwBK3UMNwO8cqTTqcsyh8=;
        b=MjImVBYMDwBPk5EMCUeOQcNOOM7xhzHR5g72Dfn0zGXhRJ5fdcryKoSKHqaVuzcWYT
         RSlEqW336a2oSIEbyRmZvHfo387K1iz8d0GfB3ZDBixNvHpYiZ19Wdc5GdoNuZj0glQZ
         Hf9YwyzO3EWJadg3ZbNvtMW7hBgLfNvFXCo6A++KVzrvUjnpOySvTpJ8V/Jt1XH5MG3U
         y/r4WATz5jPiW4s5X0D3ZKZI0Qvx9NzQfBPiaHswCKlYOgz2x7SGvV4SFlFZ9+x5wVem
         ooAvuju4lUfuDQGqU3gRAp/rUBjCmq7lqCx/p2HshGCMINjq0LWjPNREGjYY65UFDvmv
         eNZA==
X-Forwarded-Encrypted: i=1; AJvYcCVJJM5BlQ9fgC9KXNNL2zsIg89Pl9Dn2RqBiZAHygh+tsYMrU2wo9e3ZVsg5unKU4laYGqyyxSp/3Tz30nMhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylWKUDWDHTb6Vglqs2/sKK6I49uKt7AXW4jltDCIQOqY2wYcuG
	dUlQhtsbcUKLoAGXewh5vkrfHlkgwWa39Fc82zdNy+3kyTVe+n1SLjzQ0cYEs/oZgaKNzGmxBW7
	gm/WMXMetsWYrk7EjZFPeFiI/jvr3L2KW89HD
X-Gm-Gg: ASbGnctBAtbXlQsX/pT+zJthFsTQGndsr6oTqEGyT3jtkXyvW8MNPk1aeBaRlj/P9Bw
	ID5d//+a+zd5tFxEgt3ZQK8NZ+oEVEPv9yq1Y1VlyJyQ/30/4zsaYE+9Sl9iu6fTFrzQ=
X-Google-Smtp-Source: AGHT+IHyJ8nvs2yvNcmDYbDwEp1qMKTZrUw/yqDAC3Hebhph+3mCuJ7v/Xmj4uOyJRH25eESP+IdpuvrTHkRcNm9laQ=
X-Received: by 2002:a05:6000:184f:b0:38a:a117:3dbe with SMTP id
 ffacd0b85a97d-38bec507323mr1823023f8f.21.1737020712688; Thu, 16 Jan 2025
 01:45:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116044100.80679-1-fujita.tomonori@gmail.com> <20250116044100.80679-7-fujita.tomonori@gmail.com>
In-Reply-To: <20250116044100.80679-7-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 16 Jan 2025 10:45:00 +0100
X-Gm-Features: AbW1kvYdQi8ZJtKAP6jrR98YMJn2YEu4b49Q0-p39jnMzgaoN3yho_fE7k21c3M
Message-ID: <CAH5fLgjoAzv1Q0w+ifgYZ-YttHMiJ9GV95aEumLw4LeFoHOcyg@mail.gmail.com>
Subject: Re: [PATCH v8 6/7] rust: Add read_poll_timeout functions
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, anna-maria@linutronix.de, 
	frederic@kernel.org, tglx@linutronix.de, arnd@arndb.de, jstultz@google.com, 
	sboyd@kernel.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 5:43=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add read_poll_timeout functions which poll periodically until a
> condition is met or a timeout is reached.
>
> C's read_poll_timeout (include/linux/iopoll.h) is a complicated macro
> and a simple wrapper for Rust doesn't work. So this implements the
> same functionality in Rust.
>
> The C version uses usleep_range() while the Rust version uses
> fsleep(), which uses the best sleep method so it works with spans that
> usleep_range() doesn't work nicely with.
>
> Unlike the C version, __might_sleep() is used instead of might_sleep()
> to show proper debug info; the file name and line
> number. might_resched() could be added to match what the C version
> does but this function works without it.
>
> The sleep_before_read argument isn't supported since there is no user
> for now. It's rarely used in the C version.
>
> core::panic::Location::file() doesn't provide a null-terminated string
> so add __might_sleep_precision() helper function, which takes a
> pointer to a string with its length.
>
> read_poll_timeout() can only be used in a nonatomic context. This
> requirement is not checked by these abstractions, but it is intended
> that klint [1] or a similar tool will be used to check it in the
> future.
>
> Link: https://rust-for-linux.com/klint [1]
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

[...]

> +void __might_sleep(const char *file, int line)
> +{
> +       long len =3D strlen(file);
> +
> +       __might_sleep_precision(file, len, line);
>  }
>  EXPORT_SYMBOL(__might_sleep);

I think these strlen() calls could be pretty expensive. You run them
every time might_sleep() runs even if the check does not fail.

How about changing __might_resched_precision() to accept a length of
-1 for nul-terminated strings, and having it compute the length with
strlen only *if* we know that we actually need the length?

if (len < 0) len =3D strlen(file);
pr_err("BUG: sleeping function called from invalid context at %.*s:%d\n",
       len, file, line);

Another option might be to compile the lengths at compile-time by
having the macros use sizeof on __FILE__, but that sounds more tricky
to get right.

Alice
