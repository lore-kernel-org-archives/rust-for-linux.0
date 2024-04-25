Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF29B7F7F5;
	Thu, 25 Apr 2024 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714035779; cv=none; b=UhFqQFvgC/dccbr4NJU6MLyGK6/0+vkIlZMdmSvbqf87wJFdHYUZKKlyBUFmm9Jalp9nZ2JIbWtePRUYxoGbvRnSJ/w2lUt+nov3MQezLQwmtu/YKDfRh66IkFSQwDC503iGJNiVpif9hodoX64+IvZWQHGDvv4j/6JIZ59KyrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714035779; c=relaxed/simple;
	bh=W7mC5WuQrqbjlEo+atEH7kcmysOPPGuDwpb/k2zZ//4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkhGH9A/cpcMMrNHomhTXzDOv1ZCc7vwV1m6rnPxLZlp0THdUH5SfhnDPPz8dK8JKJkPT7cQU/H79ZfjVKdPTRP9UNYRq34EDuEqxDMo8szc5v7eLqzN8OALhwwBTSWVg1ogzUeBV8RFLgqyJ8yHpYSWGXGHPIM2w+ePqCldBjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q66LgEjW; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q66LgEjW"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso596239a12.3;
        Thu, 25 Apr 2024 02:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714035777; x=1714640577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1wjs4SavXGnazssug9F+cXfiFMfy+d6wFHXe7CeUJE=;
        b=Q66LgEjWjHRmQJ1/tMur7q3T4+lm0GAQwNGopFNgusSWDS1dk/RVmBMUBfw0BBe6yQ
         IjxKuvGh+DBsN4frGPKOal8OYZvjT8tswsqZZi1p167nAdvwSdOVNeMzAVhEh1JqNcdx
         KnvpGWrvf6OqBNmYQYsOeiIDo28jUz8s6iJ5gy/x6zrmoTu0mqWKyw5y65VyqT7SYW0C
         ok1D8IS/t6JfHYF4DTeNM5NdtYKYNaVPCw8Epwo1JNt4gQYwJMvBa2x+46risxdK5Rx4
         9R+WO2tAuGdHJKOyo2Gwme0xVYZ9Y0rk/9nSwBTcaPR0muhk9G4g1pISY98FUBOyrSyw
         5SWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714035777; x=1714640577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1wjs4SavXGnazssug9F+cXfiFMfy+d6wFHXe7CeUJE=;
        b=kmix56ZlcDOW4dLn6jBajUBP0emQKAMPIvDzWb2iHSuhEANrykfq5+M/k9uTdBpBXQ
         N7fNi2u203P83KARSKkHuWvlx5PWsytaXa4ddJM5KnWuPSSH3CtZw2TwBw8DPlfOUp8f
         bZR/ukHIDjCqmuqBDYpTPQPnbwzelZ3/N6zbmN/iZhrwNGchRo6yYLvrmxRytoGthV7C
         Jhq2c6cuzgxhuHFUu6UhFXcpBuFvUZ5XmMyVlHaiU/hIUTtX/5/JPeOM7Fjn0r1piewT
         4wZxOcp+vq3NpBlvQqgzCmwpsyW9LbpIqT/32894TUgo9DO51LCa3zNZqXVkpY0LGb+C
         eYfw==
X-Forwarded-Encrypted: i=1; AJvYcCXM+cBzJlGhApMWcZs9uKwJE9P5Ozq2VaI9US3KWGHQlDg6q7vpmZRBn+xhvyxXXQczxXca+rJNEj53MHwZx+RRqWEGteGDK6qaUAyXTr5IzMaMKksv6TTReOj3i3z8eKE+a1a7oHCD4c0=
X-Gm-Message-State: AOJu0Yw3vPM5Y33CfiDwkOwtudz31ccec+dDYkKDCSi2J6Z1EQgIwL3o
	LdYo02xD3WjbtQSfWqBxvSJ1fACsMgJULuse7NtuDRF43mCki4BJVtQfmJ+lqDi++zF1Jsolaq2
	lW/N6xFKKK2Cf9AaJI5dr2hC6+WM=
X-Google-Smtp-Source: AGHT+IG2cmnz6emFDz7lQp2KPETZK7BFwCLTK8VO7MaLGjWuFwq/87lzEtLoInfK6L39CtOjWMtSsiVer6P7L7hXQxE=
X-Received: by 2002:a17:90a:9313:b0:2af:2978:bd59 with SMTP id
 p19-20020a17090a931300b002af2978bd59mr4509955pjo.6.1714035777134; Thu, 25 Apr
 2024 02:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1713875158.git.siyanteng@loongson.cn> <81ab8f4ee8eea1d7a67de0595ec964614c5e2e00.1713875158.git.siyanteng@loongson.cn>
In-Reply-To: <81ab8f4ee8eea1d7a67de0595ec964614c5e2e00.1713875158.git.siyanteng@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 25 Apr 2024 11:01:51 +0200
Message-ID: <CANiq72mdhwadg_PCBkz6fTcYBTr-gHFY9N9JFL2B_uFuMgtzXg@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] docs/zh_CN/rust: Update the translation of
 arch-support to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>
Cc: ojeda@kernel.org, corbet@lwn.net, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 3:07=E2=80=AFPM Yanteng Si <siyanteng@loongson.cn> =
wrote:
>
> +``loongarch``  Maintained        -

We had a recent rendering fix here that you may want to consider:

https://lore.kernel.org/rust-for-linux/20240324010915.3089934-1-tim.chenbw@=
gmail.com/

Thanks for this Yanteng!

Cheers,
Miguel
