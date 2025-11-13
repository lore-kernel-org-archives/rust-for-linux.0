Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF922E1747
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 10:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763028384; cv=none; b=a00FWO6rbZjdoYA6tx5E+R/ktgY5CEOFbeju38sl9wK61e0pt9XxPp9RvSYmICuvVzzzMnD5gFP7niMsAViTlpiXh/MYkNpPpEXI2X8/WW6ZUNpPOeYjHRpJz5ZTQAoeKL0Kx7Ju4UHnCRCVMOB8HXyDXyQs0hb1bYRf+Y0F+dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763028384; c=relaxed/simple;
	bh=SakcwQpPdAYlIowM8bt4fPJVk64+hwM+gbniVbgurbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVDWxx/+16nSrIGArsga3n8dHBSLmg3Zv8sZhpeT68r0vq4FhNYjHUt6YKQMRHddvFudIc9d5l1vET0r5qeuzPO5VZrKVWiEUi+4mvh0YogUtGOZ1GJIVWgS9fkfAFnB4dt8lAQbWt5/OH44ykSheKhAvcB66/gWEWBbpWAxEJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqFEINZ8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqFEINZ8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-297f5278e5cso1063635ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 02:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763028382; x=1763633182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SakcwQpPdAYlIowM8bt4fPJVk64+hwM+gbniVbgurbM=;
        b=fqFEINZ8pxCM/l/qaTIk/W4h9lCrRvtY05eTlARe9n8YeXF76ZDxONsdzB5WUrvvyb
         er7MFDzLtH48ZvjeG7cb0tFVd7lsMQEQ0vlEAUAax7Wxw+r1eazChOw3/MU107fZon1p
         TlaLuGm5JFk5nhrm5BsB/Do2n5jNUsc6UhvybU54Mwuj0HfbAwGvUZnu/V4xVeqH381R
         CKAqbwt5Covb6MrGFOQCTF1klSnLY0n+4V7M8BL/H7lVMmwz99yt88sVSsV4gJSyjsbi
         cX8iaL282gitK83aiZM7aBajCNo4AWMyUk5FuEaMONZ09N/qrk9o2rNfn4s2QK/idJHS
         qfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763028382; x=1763633182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SakcwQpPdAYlIowM8bt4fPJVk64+hwM+gbniVbgurbM=;
        b=ftv/vMVGPonzvgyYv2AYksY98o+/SCPM3OjjnVtgX8x26ioQRRPXMXAyFlJl+X9/VX
         sargk4o8vxeWt35/ds0vmr/ayIYReNPM4uGT5lsv05q7OlD3PugcxZ4Nl0eBnlQj3Mst
         WwgMmI0owr4cG2eH2bWdXz+fBi2eCidKbIfGpy0NgKHflm7upHnHwEKtEqICs5rSeKKw
         W+AxbQdiFbCK1JDIvDWIIwT/s7It4vbaO9cOnCtL8j/YxuLnAEhaMVkuZZugq0ZPWQxo
         HevnIp7+5PrlDZ+rIR6GewX2b9HYef5+U8M0VOz7QkWWlTtTkHVcyJ2MP8zTuJFxqPq6
         bu0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+lVotmH7SI+HUAY39yMlX49XskMJzUXgm9Tm+AGYmZtWpCimr56QY6QoWd51nKEeqzluGKhr+bM88m2ZSiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHo4Qcc9tWaxBDAjx41NGFrIOnoqThTy/PCeS26bDJer8WwL1R
	RF+dFAYKhPzVyaPooxS/Cy4d8m/u/+I1ExzoxB2zwUbDBsc0h/LYmBQsuJ5VdeUIwlts0Uj8JMX
	FGSNvHiDiH24K6DlqXwQ3l0GjJTkZ/2s=
X-Gm-Gg: ASbGncuzt7Y0aTdUTPaYxt6hdnnOrAwWBuBNhcgU+brrKv3AEOjkp6GHUePcmxzTWFB
	blDjKVmWwfAk7E+o0Lvnd5G/WsF+IylL4DfdcLc8ksuRczW93dQxdHmSxKcF3KndDQyvBnMD9PG
	af8248YLj6apajNqFLhxoSvHQX+XdERgWIW0tfraK9A9dCU7d+FsEdldl4NSESdLx9iq0CD/gvH
	+gkaobWa8YdgaEQBI4BqJqwVJCIDRxuitTepTF3gZg+gh+SdvYqlFEAwjZ1eWJY9idkCARCLe0r
	9T+M/4rxQ2iveflhfOsRnYAtntaP+le4kmk3phUYhiBJsBcDVvT84u86nHWes8tfsUa5nFYkCvp
	Vk5c=
X-Google-Smtp-Source: AGHT+IEzNxzznt3OW2Dpm9++FAbosIG2V3ygxc5yhp8W2cG7jBB8uRt3p8Uomy8GlIKZfP3CuP+vGZ5FoH34INnliD4=
X-Received: by 2002:a17:902:da4b:b0:298:529b:85d7 with SMTP id
 d9443c01a7336-298529b87d3mr30505505ad.5.1763028382379; Thu, 13 Nov 2025
 02:06:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113-create-workqueue-v2-0-8b45277119bc@google.com> <20251113-create-workqueue-v2-1-8b45277119bc@google.com>
In-Reply-To: <20251113-create-workqueue-v2-1-8b45277119bc@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Nov 2025 11:06:09 +0100
X-Gm-Features: AWmQ_blzoOEHZpUg5855vlqByLe32dk2MkjaHUrqoFKrZBK7qYe0tPspHqrfSKk
Message-ID: <CANiq72k1VqR7P7tY2V_siBQZrNXf_ck5aBkapo6M_6X=1P+nDA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: workqueue: restrict delayed work to global wqs
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 11:01=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> When a workqueue is shut down, delayed work that is pending but not
> scheduled does not get properly cleaned up, so it's not safe to use
> `enqueue_delayed` on a workqueue that might be destroyed. To fix this,
> restricted `enqueue_delayed` to static queues.

Should this have a Fixes and Cc: stable?

Cheers,
Miguel
