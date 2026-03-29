Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F3D38553F
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 17:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774805349; cv=pass; b=bjTYA4/1h0TL+JS4qiDRDEpH0l+brankkPlDfzhUVl2FsfK/i35UKKOTrrXX2ru58P7e4jrHSWvhdcYOS+0tBad/dNyWeUY2cIPoxfPzZknH7RdUOEDLX+26PGSyp2nZopt2S13z1xbd3e7znm/2GYMmd9k9+eAVh5/bBR/ehMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774805349; c=relaxed/simple;
	bh=nj04ExAp+LOZ57y/wiSuvoHojHNl2vaJe7nwdcJU18E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njR8PlHN2Ity8/qEuNYT9/RNmmRzOkOg5CP4zOV8ObR+LRdmktYJsFRiz+yD7j1TruU6XAA/wrlNMRS7/l/3kWSkNixlAsAvGcTfKQyu2Vd03YTYy5Xlzqz2Wbu/4s4UBJsfXv+vBYpjVujIZT0EI43OpKUdB16fi3k3tY4G1Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ok2zfLZ+; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ok2zfLZ+"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-128eb45835cso190277c88.1
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 10:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774805346; cv=none;
        d=google.com; s=arc-20240605;
        b=Pjy3F3pbQRgEEgKgMiCXxY3gyPNnLjWPTz43ob9m+ky6120XIrJOh8OXIUG2trHMlu
         yR4yFv6F1jyutY0eF+cmmlG2OfbLLBeqBzEb5MYF4dbxQf7pKZlpkacvZo9Bs+/CbR1Y
         cYZCuoCiNNsYzuzLMLsDRd+pL9JSS6Cgzp64LjxRGIUBEmUYzodkrla+bH1ORKaki8k1
         ghzquy4hVY+bbqoGY7rbnkprDJt3OTzH7lgoEIBEjbKFZiN3KnTeZ5GFbCQA+NntpyFr
         VKBcMzm72uzC6MVcvLE1Qeaiav8kdot3ndEdy9nW8Wb4aBhT/UuVmSjnSSwRHnM1vBPS
         VWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NOJ605SFjSEXYl9n80IgZTiNzayqkvEiQHsLr3M6/+I=;
        fh=bnbpezXOmm0U9dd10b2c+HRFIA9v9d512NhHYTE5Jtg=;
        b=MAEmLxeEwnC86l0ybGiUpjGWwv9eoUEqJx5OUB//vhH4F7SvF/NUJa0XYSHJGX7QRz
         mWh63+GI2dZ3B6Qk+Z3Q3M1Dj8TzEuq9qZth0K97ien0608ipVA2JL9uXmWTYAHpOmci
         5E+KjOkdeWq+YF6ZvmIhXFBSeye38gptw4TN8ZlwXAYMZOrDNN3lTPDkNadPXh1tviBY
         fB5UEpw5QuzmBy9qQ05cw75SiT2ScTp+oriOQ7sMTwhqdqhn7fperRJE5R5zrRYWVR1y
         EcoY/wQ1Bxktev+9GgjYf+Q99u+zYohW97wFF+Jm1gbA9bNnAaBnp1n/U/ZD+dNr5RnJ
         euxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774805346; x=1775410146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOJ605SFjSEXYl9n80IgZTiNzayqkvEiQHsLr3M6/+I=;
        b=ok2zfLZ+yg/RLAT5Z7/lziWKjpyS74AaPffx4nT0JxHvJLytaqH45bDh8O7DIKJBQK
         Jl/dfpGzwHr/iJyjCc6tAVRj/JX7fmU310TU6op3IX7R+gVHPWYe/P6OJJfLKt0Y2WJ9
         ndwK0X2lpeviGCd77NaArH54i9+eskB6wRfm5eFeDvIJ5QEU1Wubf0KViBTHDvzFa9fa
         hhd859jvhirjmgn2cvOcMbayx/WSCbNtkvgkh6yvq0UtffB8j+Z/DkmqdfmiGKt4UhPB
         Oo6CNrwA/bF27oDuZf5BoAlGIuSuI+ALOfIUDNlTX4T03yMtQioH9LlHNrkoYsT8VEIq
         CIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774805346; x=1775410146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NOJ605SFjSEXYl9n80IgZTiNzayqkvEiQHsLr3M6/+I=;
        b=hCnzWVmZHQcA3SHPmwPMoqRMRXqD1t6Vu0ER/zNqht/jd1kl/8iCDx80nUV/g7umhF
         5sXbH1eIZbTlFFSPsT8d13a6nFS1i93gPmsJbJGHbW3U10Mg0rP7P9gtupzz8SzcdTyN
         I06lVeez2ImB1B/w1krQAcrerW8nsoNbUv0ELc/ukCh+mfZA1EK2uTfcepixHgjg+tEU
         QcDbiI+3oFfD78J7qcHjWGAp4iUBzmVjpN8SC3YLbvd5WU6vBCwq1bZUMR4abi0Lvgb2
         KtztenO++NAhq4o5gltW9wUSOJxKeHChQF9ZFTTz4GVQERsRNHPKWKnax3/q3UIwcX0F
         YIuA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ4JVN6nLrtF8aIyTT1yA22iGqWjUUdAUNMm6RWj1GyU4NQAxvUpWQHnZ8qWMfMWVf+oAuH+eQrNzjYxjXLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjFtnZa/JZ7bDTPm2ld08FYxXs6oXOaE9R92csjUNHwvpDnD7p
	kGTFNtzDgpuem8jYEhpHbCNeOkdKHFrBwGaia2FPh/FBljXq8u2VOH1/ywvAQKWBOnGtZq4F30p
	U9RDrUlb2jjYkQUu+5m3Q2siO/pQI26g=
X-Gm-Gg: ATEYQzzmtYqqlPXKqYiTwmo+izJKZnELbDGF2RBxHZcKIZ8wIUXfqC00HvYsntecjjr
	pVQt0tWISEEl0DseNgmQ4NQmNO1TxUt4WGQ3Y+beAI+zgyKzfvSMeGn2LVB17RIkgChC/rDOPKp
	3aikWX8yNLfaUeegNTRrJ85hEI4XkCtguwpyMNBnuiEHSP4gIyAEgD3pND80tc+1he4Bla4VykP
	tAufLcVKZNVYJNfBKdDXV1JmUtXuvEukR88R7zM1auy6v97K21Qn/CJKN/ndc9VTR6LXDSc2Yzk
	fjN2B4EcBN0wu+AwKXJ7EH+MG+/272RkCMwmX3h5KGqnI2MF5NH/u7096sb2c3roDA0uyVydw5o
	wSnT/aWJNWz1UoTG6mqteHcI=
X-Received: by 2002:a05:7301:129b:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2c185f0b8a2mr2342401eec.7.1774805346221; Sun, 29 Mar 2026
 10:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org>
In-Reply-To: <20260319121653.2975748-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Mar 2026 19:28:53 +0200
X-Gm-Features: AQROBzCrD8zNMw_3RD2AzseMw7KTb14jpongb8nmyLf0FNXB1ThPQXwFU6Sas0o
Message-ID: <CANiq72n=D=NXKjmzauULH6Kv4b4ooUgbbRWxobthwUFLgpAJrQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] add `const_assert!` macro and rework documentation
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yury Norov <ynorov@nvidia.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 1:17=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
>   rust: move `static_assert` into `build_assert`
>   rust: add `const_assert!` macro
>   rust: rework `build_assert!` documentation

Applied (these three only, for now) to `rust-next` -- thanks everyone!

    [ Used kernel vertical style. - Miguel ]

    [ Rebased. Fixed period typo. - Miguel ]

    [ Added periods on comments. - Miguel ]

Cheers,
Miguel
