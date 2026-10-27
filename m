Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793120966;
	b=ZlhrlXW4AIlGsUtJ1im+suDwUDDGmeZ3EgwQqUjyNlohknZaZSBmTs7xk6xj6PwZw+LX
	 EF0pGyOSUzT1FTIdvc/ZBTpg7Sl5YGOT10/iuPYMnPLeck7mg3fcb6TupLOa7VIwCWz7H
	 PpPjJHUPzsjdcoA6XdzAxHOd17+9vDvKCOITeB35Njg665qzpsbenfOM845Al3zk5MmZe
	 YabH/1mamNTtRo0i/tqGpiJZxqgSpAeDEw8/UZtmQJsM+EFyCYmUKjQIV3XDwHlwEGGt9
	 D5h/wxJL+214PiTnN0CcKuqcZ0vqv8jnfTITPfbvRt/tR2IzvQqAIJ+dVycUDo5JVnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=te7+uZN2QkD8nk5NHPCvRLXnUD64mzCV6/WajInfo8k=;
	b=0fnVbT6cMBR2RqtKljs4sz6OjiZhXfX5DaTbNbTKLQcYzQ1SZqPzwvqZNw6YN3HgAJyx
	 iJsSTVAJe+38SfWZeawn1rfD6dVvVo4miKYlMXMg1VIdNNSS++OTdQvCR6LJLEfabRAMG
	 Hb/YhG4kXX3zing5YRy3wBw5t14OSqsuKu/CL1tWCOceAJyIRwe7ExBOQflS8NjX21tlu
	 5WZ9P/6iIk5YI0K1vYqggAkVhRqfeRxbWN1By7AXTj7LTL+PnvcR0r9bjHdRqa8o8ZkM+
	 djIX8i/+5tSve0kL5rwE0ltYkAEpPNriRIqdcmpxzTR9NasnHpBaeNXV6ojQadfulHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MqoKYkhP;
	arc=fail smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB984606A31A
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 17:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB984606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MqoKYkhP
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-313bab9cfe7so12276eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 10:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793120965; cv=none;
        d=google.com; s=arc-20260327;
        b=o4O9rnXdGyKcgEsyLsZ3H29OpGVDBsUxafKZ5u2NBUm+WeTuUH1cB+tYsaBuXENiho
         pbAbiuNQ1WwDKNXsdRWt1MbjKo7PtCzXv4Q8N/ZMiK9cRR8B4WquvnTgPUrcN06RMN2N
         6t/ez1T0+V095IM+cJN3UQnTTj5oXcFL3y1wTMOGe0JKbudvU8wilBgAOktRcI1Y8gu4
         8UTdV2Zf8DVRdzOwV926j8sqt9SpnGGFk/4r3pV0j2e2y3D7oWJSXCW7hTugdNTQZRoW
         2AbfmhzFDpVsmG82NTSUMhdafH9c37xUQ+p8/wqTeL9j6Rz5rJNEYWYKBRfcdhgzqABP
         6Z1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=te7+uZN2QkD8nk5NHPCvRLXnUD64mzCV6/WajInfo8k=;
        fh=wzYqyCJhSP6MPHBQdwljgH6GRsJSCBRIUbVO5d6iRcg=;
        b=WPZNPg/ig/Tg0P8+kGLAYTC/ghI8xeJOq0BM+niYZa7IfKqz7TJMD8c431IezCDhds
         9Y24KNK69VlLZ5YZxW6oQRkKtGKwbnP7o1JzTvI6n8+DNHFPo2JJdcC5AI4CazGwtckG
         4IyaCnYhMDvOp1OqpjIzXQEnDOi4pfB4psOojdnlw4YWzT83GQQ0SDSVIwigS5auIVGb
         NnhK8yoSrHlJa4bk7E5h8F3uSHYu/gNQajj41lPENEaQw+bOYsUJwr4wOlZlocPGmbD4
         0sj+9OO8Y+x36z4BaPAqyM+cJK2WamWDaOnsb9ioD3n6SCR4ED5aHQAjXQDpkLnOLgEa
         D9bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793120965; x=1793725765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=te7+uZN2QkD8nk5NHPCvRLXnUD64mzCV6/WajInfo8k=;
        b=MqoKYkhPxinnWU0rxiVQOQIW2xdnLJUYOk/ZRub1C+GHV7g3MDgeO36xzGgv7zV0pU
         b7Q5Qd4T6P4QzQDWxqMDT2E4vSB1Ta2AT4vyvV1W/SJjCa/I908j3i58wt4B7gA9owyE
         9FD0Vttj3KKr416fqs4ExXmIutqEMMvdS3FVh9CsUN01w9w2ZbUNXISwvFTGHY2NwJr8
         i/oo60Obz+7f/NV/ussWc0mzJobz4krgT1zVk8FX8wemuSyiQyuANn/afGbcNeZ1N8XD
         WWKH1SX1jfedntfB+WOQis7PzeNakgQ+G22IsTyut5xTYR0Y9WEiQfV0RFdLoac6YVHY
         D5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793120965; x=1793725765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=te7+uZN2QkD8nk5NHPCvRLXnUD64mzCV6/WajInfo8k=;
        b=vsdPe1ajeV6sgXg/2YLyue4IT+GA+F6N2MzbdDHPTymeqgvQJz9SqOEL7oXlGilP9y
         jfFjuHUmbI7W/x+HUr1YaahtzVxlJHXQ+v6HCmAakLs9vdS4JiE64A6Wcdps44TblELW
         TBnbYXuzDvrj7P74JU0AGcFf0zGbXT+LopzPqMV++USUdQhBPqyIMlG8CszycpBX0lEY
         /iBYhv6SYLymFNay5Qa499TF9wgpSwxxALylFXeZYvqz8v76Fk6EnpVUBVPzZrBDqG1x
         ArfFVd2PWt9m9KnZaJ6y6ObazN8JByehZvI4E5ijp0UtHfpnM7e6fhyfanVm3pBAQBMC
         LPDw==
X-Forwarded-Encrypted: i=1; AKwUvBymr5X2H4ixR1OxpntdVeUAF2S/pdQr5dLfJqGpNuOMkQ1Isf7biNh6RoMTwTP2DZS7VHvpadPJP78xDmpgtA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJvrS6cHFLjrm3OiQJ0LnfY2Ih7rbJFoWJTZoCfdfAo0J5gy+p7
	kjzskNUKaFJeRNhy7F2vZ57yU9J4chzpbyCrJrJdeAydr9WOO091+GiKdDj0vQFi9SwM9lGCcrA
	QolrIP5MLXDNLFxKzn4DSejnuH1QGkFg=
X-Gm-Gg: AYBFou0Pi0yY65Gu3R1arr4+X5ntClTNHheNpRRpVsnyVJRljC61zAxicsESLI7MEnk
	wU+vJ85jC9ln4RRtllaGJLpw6/g8Q33burt3ISk5pu2HIJQjtQj/1eqwpv0ZGVPcIDKWV3uxjzk
	qGj9HZMwGa2S5nIHzuzQpzHgSmTFgkNWenFKs59r+zCYJjYfGVVHh75cavbe4FYXL6ks9tXqJix
	nBJ18gIVXyHmlimt6Yb7w1E5uh9u4jHeglpWSQi13MlSfRswNEdiXStmjzU/xMsvTqaHMDKbDKc
	zWrZH69D1nGPwUHiP9khD/g4jqlwnCHuBQ5sdbVVdCSmrIV7CryiE835+gtThP3NiGvpUb0YVDY
	28AIDUmTl7yNljQV/wj/rQg416SZ7oHxQKNJeGW0+Me0XZ9nW3S2XaJ4eCTpDDd08XNNZFIKafK
	N/rklWKC8KynUSt9lB2ampHG8cDOYEo7LR9O25Qc08PLr36XtVNNjBb2/a/hIfumRp8swbnbmRQ
	HhsuGEO0TzNPuqUt5hKv1s9jLm543PF7oa8
X-Received: by 2002:a05:693c:6392:10b0:35f:ea17:d171 with SMTP id
 5a478bee46e88-36a1ffbd5d7mr237613eec.2.1793120964600; Tue, 27 Oct 2026
 10:09:24 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018163719.81691-1-ojeda@kernel.org> <4600d9d2-9369-4d9e-afe3-b21aa5f0cb2f@oss.qualcomm.com>
 <atW5adUhMhOhjbyh@vireshk-B250M-D3H>
In-Reply-To: <atW5adUhMhOhjbyh@vireshk-B250M-D3H>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Oct 2026 18:09:11 +0100
X-Gm-Features: AclHuK_9imwtkjqF5Ms9356_ENKgDBIHYMMCKtsJ66MmiTSw1XdVs4AdT2mg6B0
Message-ID: <CANiq72m1Mn8wTCWCzRawV_OUSm5L7BH6s6gcN-gQE43jQfx5aw@mail.gmail.com>
Subject: Re: [PATCH] rust: cpufreq: fix `undocumented_unsafe_blocks` in `PolicyCpu::from_cpu()`
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 8:32=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> I agree.

I think this is not in -next yet -- if it helps, I am happy to take
this into `rust-fixes` (with the two statements):

    // SAFETY: It is safe to call `cpufreq_cpu_get` for any valid CPU.
    let ptr =3D unsafe { bindings::cpufreq_cpu_get(u32::from(cpu)) };
    let ptr =3D NonNull::new(ptr).ok_or(ENODEV)?;

Cheers,
Miguel
