Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF93C4576
	for <rust-for-linux@vger.kernel.org>; Mon, 11 May 2026 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493537; cv=pass; b=JfhyinUFbxTqQfXwKwgdHovkpb3MFTO7T+7I4fjSxjeICr90IVv8nOXzYH5e/aqDa01rlmGBPO29lCngKtPpI0YXHkfvIyS3SQrpeJpJvo5ycTKT/1xtJWofzEUq4GTpF7mmXK/SF3hpI0k4pBbZ5aOIkqpvtITQQOSu4+cJriw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493537; c=relaxed/simple;
	bh=VgAbfLZ25lu3eN+rVp08IzNGrcqim9qvYCZbACv6kgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tl9uX7GxWmh/dK8+ibVQSzv5a7GcnABaB6+923qlyFUlgLDKLhkxWS3vVQBERuKDuB4DFM60k5J/NAu2Jj05RbVrnozLiuGzFDyeT1huVz51x+2sydPFFqVhSOFMSQgskhtKovPU0fJlzFqRnGhrMGANdeN4n1uY84RVhD8GSFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7openh+; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7openh+"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f13ae64db1so165058eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 11 May 2026 02:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778493535; cv=none;
        d=google.com; s=arc-20240605;
        b=WYor2Y0br7JwgnBpsspGavf/8XdNLRST7PP2Wf/Pyc8ea3zKug5dUsvQcLzCcNmep6
         Wk8pOsxVa23KXKFH+2V/p3Yk3312/eQ6j+RsGsWFgkthgvXBTvmBQFz+Tc4++MiCm79L
         nP8iQAbK/ZNrWDXZ4xw2FkoExfOPtYwXLrQASNF6aTimATkIk4b1CmRj3CzXF3nUBCDo
         bxgChzFyb/mNRO6n1uzamiSJtGScRmUu7gUCnSRTpUEy+Wo2U5Hmy51Fqv1LyXrpbpxd
         faxK2sWKTlW4meLzg888sScAoRobujOXRooUmEac+71gXnW9gOx7C2DzUn8gRrvrZp8p
         OgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VgAbfLZ25lu3eN+rVp08IzNGrcqim9qvYCZbACv6kgU=;
        fh=tb68Vf5hQzjsNnN/XMFeLIQTq+z9zt46fMKpfiiGCl8=;
        b=MA+DF5fPH40TKXJdd2kIas7csleFuvp1MlkIDq34V9WNuh502BCzgpnfTExrruMFZN
         NySGadugEPJDpIAhMy0JSjsV7Gj8PUM+/ZpzmZgLFqyqp6dFfYRHHTum+pzCmPdxB54D
         fQii2n3pNA7utK1POyGveC0QyjHeksu1YqpAkhgrLTvlut8o0KJ13ieFDE7Y9rAXWNJv
         QFxEg6v8dfjrHqfU1HKtP4O/s7DS5F89k5Va60hxWFHV4uh4V6XTubVOMHDZkUaqjeRc
         xHMd3WnLm+bQCyP3eZbXnR+yvNT4/lVe0XVi9TTt+9X0gBZdOZk2fbfugCOZw02q947k
         9KxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778493535; x=1779098335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgAbfLZ25lu3eN+rVp08IzNGrcqim9qvYCZbACv6kgU=;
        b=k7openh+0VBT3UqkowdNM7mmCYaTvdPbkl/soWVS8JyJpvj+vbrWbWrQpdYcpMKSye
         wmZ1ImmJipyqmsBfWSlCmgiXr1AI/lZJg7tRwfCCqirutuSGp9ZEgyfBjkJw23Jbn2Jh
         AHrmz4oLI6A7Tv02hRL198EgRHiTvfYWAN/jC1dcb4tafwFCsy71iDrjXx9LjA+wLrTU
         tRgQIO8UuFKbQxIfb3JSDfhBP+qFiA8snY7d3QOa8Sfua1XRwFYctxWX8BTJ00urBa/0
         mLEiadREJ+K07CYeuYLVP0cmqy2F6Ts8F0iscewWbLI8L8TTr74GDTiC1omsZnFO6O+J
         t8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493535; x=1779098335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VgAbfLZ25lu3eN+rVp08IzNGrcqim9qvYCZbACv6kgU=;
        b=kyHkAgog5BijRDnNGb6ftEBnbn7ZMStvpurwlumcUML+z6RUjDjhDEdjRWIl+hdK2D
         +h0GYRBYVu+DYmvMzHZm/DXFtWkW3hc+8b1DhprZF5T8VVxcF/d/ra+FVq/jvakUPmZj
         eud8AtMb1YKAeXHD8cQ+TsLOZ9CWajZY2GPGaB+iVL8GlGa5us3bXWWarf5GzUYbltmJ
         gwweFqlE186SRH1l3tMTy2i9r6nKMkyj40O+osAQfyHJhsMYr+9IPh4Tg+NZiEDsSFv+
         S9De/Z43aXBL1UKjqq+WzDNJ8OG4p5iWm1BYShF3hKDPBQ49NKm89aHHTefHkMO/vAdn
         x/2g==
X-Forwarded-Encrypted: i=1; AFNElJ9y4HL513ieukucM/qrNSVQHaZwm6r8NBmKxMQirc32ynOmaMEOfhToimRV9CNsISqxzHGOHCOjlZWvXwyMbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaRJySSAvl+xFTmR3BhxJ81/W5fEL6lQisXHCVPL/szyfl0Ro/
	3HmshafgN7oRView1wHQ3GPKudg3VIqSe9fLpWPdCgk3hOIR3GYZi0jlLeuu8UkBwEj4H7asIaX
	ZYX/mBa+fr3nKU0irxgiEZGait/esuSQ=
X-Gm-Gg: Acq92OHNZPAhxEThhubIHEfqkO6aUkQjSilg1FmUYXFjxNemBAHwnZLTx/bUyk3mjL9
	aj1fx/jVzkRpEowRRpOSDYhuxiS3oPP8wSegCNHWTOzgfXfoWU6pmQCCBJQZZRBMRipScZCpw2I
	Q9SEdFFDM/05DZjCSSCVd2IuIHQk/z9T+WsXbaMpmoovc8ZcNWqr/rrY2XA1GbVbybPeRLGUabS
	Sq7/TLDmGN6//HfQg+jsez+wUNHNocOLTP8vyxi9t/pLCAWNGWA0vQRXEy5feVdaojLuvFLLDEi
	BImOw+AP6Q4RIiBz/7XyX8Tp333wwBECXr3hm0yocfUw954OkSlGp+puz3H5dxxGoxcOMDhihLb
	PdHvu29J5hF0YLM62uGB4GYQoy2WqJSE//w==
X-Received: by 2002:a05:7301:408b:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-2f548ba3636mr4653507eec.1.1778493534947; Mon, 11 May 2026
 02:58:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
 <agGRnHVTLiwobb9W@google.com> <20260511090943.GA1029560@ax162>
In-Reply-To: <20260511090943.GA1029560@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 11 May 2026 11:58:42 +0200
X-Gm-Features: AVHnY4JBwbANAL1JBo2hZTZsbExaBqv3bNbSXroud4wMMH0avITBnenRjEHK_84
Message-ID: <CANiq72nm_3KM4gMnb0x34oJk1+_8XrUz-43zwW58Mr1UHG8qtQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: Do not select HAVE_RUST when KASAN is enabled
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Russell King <linux@armlinux.org.uk>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Christian Schrrefl <chrisi.schrefl@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 11:09=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Sure, I kept it simple for backporting purposes but I don't mind
> breaking out the dependencies into their own symbol, even though it
> feels like that could be done when support for the sanitizer is
> re-enabled, which would truly mirror what you did. No strong opinion
> though, so I will send a v2 after giving some time for other comments.

I think it is fine either way, especially for a fix, but up to the
KASAN/arm maintainers of course.

Thanks for the patch!

If KASAN or arm maintainers want to pick it up:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise I can send it in a fixes PR I will likely need to send later
this cycle, so please let me know!

Cheers,
Miguel
