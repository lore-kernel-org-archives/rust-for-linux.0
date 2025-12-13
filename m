Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F5E2F28F9
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 03:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765594918; cv=none; b=r/FtsPK20oKopVsoUNHPZ6LGf+Kh1qaO06l2o+WdvQb3zIetrgz6ufh5vI6wPBLf/Lb4IoVsXEvbjmk/uIHG4d8sWh+fM2HIrHRgrkgp+zWrKFElutuSjCZn7mGa/so8sQvDs2LmxSAHNQCZzNmyuiFvuJTKzvd01KOPdP7didE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765594918; c=relaxed/simple;
	bh=8DLWEW+6/Plo2HI7utmjs3YcRZsLSZTXnIBVmpLJzjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBbjGPcB5kMWzStYGhpyLqb5J2ESpmc3K3/huD+UryY6nPsZQYu0ZO3ercHrGoQYn0iaMawiRcr5OHjlTvNfmWZHtiSC7Pv3T5AVj+9IE+fSDETgzBKBtOEIXIzlyo17OzkhwB7kVPOBB2aMrqfjhv7EHbE43L+pDv9N6TtlBqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6zHvKjC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6zHvKjC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29f3018dfc3so1636905ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 19:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765594916; x=1766199716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzgFslyRQT3tNKKqy2atflV8jLYXX5INdtLIJCwHm14=;
        b=L6zHvKjC+K4/fkUrng2qqeOUuTnQMH/dEWD0rj5hApTXCOqpYag1PUpuFisOUSZFX5
         +4vwy0Fmqt/RDXIDTJrR3qjPqJhelPdskNPBr7Y/bfSKHPKhHLOwC8kq4aavBrCdoYjB
         5TZzstTw6tU59/jlOigEP17cTWekaXolNF3nWhEk3o0iO8pdnri1GsDZIfIzYYlFbrwd
         rz6lUVULVJS/Yj5NCyhCS+a0vHc0IODZipau4Cj2Cz/pHcuxwO5uArwkVjIvsD5IxItU
         Olgq7OC6eqa/whDq2mFY8t42T++Vdd0bfibJIU16lKTaCrJuR13wYYbxgNtg+1f3qIo1
         ElmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765594916; x=1766199716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzgFslyRQT3tNKKqy2atflV8jLYXX5INdtLIJCwHm14=;
        b=DP6VLdUue6Ds0Kb04RslGPOaIs0L+HHprzNwurL9lggxeaQApW9yOmQYiKwWYla56D
         ffj9NkoNPl7fSNbbgG8sqCEolQBW8OzPUU2RxjovjUYYmSIXf8yZctiuSWFoS2owyioy
         QP0qxDbXtPYidfw1uKXvQoilA764A5cHK5PnImVK1e0hFtnbsaZx89vSTPnZ+jvrQSwv
         ih3G8tUKuYElPFeIIW9QEAfI6/gTpG9RqFYoNzbu+VciwZDM6QvMYmiZ3DGHSYu7W4zD
         4TzF9VOCJlYM5Q8RhyueVNjmdKlqCkUlug7jfV2HDtXOGKxfEBHPJfTD+7GIy/JEtHRN
         aOtg==
X-Forwarded-Encrypted: i=1; AJvYcCUwsYY1QmWXu09ACBLfjWGo6R1hJx6s6p8o1kmK/tvaV4bDcLkDRWC1IT8M8fxY/gkDE/17o/OetIR0Fm1Uog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvkh0deJYMGI3Dc0/fQFuenXEE6AFG/qUlHJFXdi9au9bDd52S
	W0QnzKWFCrMGC8KgXadJ95XoSxRgcpuk9wzcVV5bpLH8IojJ93IdVleOYEb4T/feTqV8UDNdvTu
	Gf1Aj0BXIdU4dZeg1p8t9QEh/BUtNdixYsJN6
X-Gm-Gg: AY/fxX76ZE7ppjZQFde6F5h+DE6aE2aCRmdvOFquJOGf1roA9I5mP4ALlFg+Szz0xGt
	2ppNvCStFXnCCTT5me/BavND+9sZ90QNwAz0x8JpN+dgIGH7rsJqAoPKr7keh49zR+rrIna1Y1R
	DUxE3SfgxAcp6Y4jf+uGu7a6iQO3BUinFID15TzDMdx0Ktsumfm9Mnz298ogDzcywtzSw5tTHRE
	JD87hZYUI5eoayJw8W6sFaomU4GiwolEjhT+wIZ6qW8XbqdA/Tuw9qhJFMKU/ERnxHadyuXI2L4
	0rnGllKf12wx6m4MUWMZDKzvEbgFVkO2PAzGigIxmKVtJzHadDR8pnBw+drGzmeGBgsT1mjz2e1
	mid52aznvAd0=
X-Google-Smtp-Source: AGHT+IGW78XZa5/2VDasceTMSE4VJJ7rKpipV8SujJ9QH9yIekKh3vbj9WOZbrMAK8t7nis05J8ZIlLBOBVS5rirk3w=
X-Received: by 2002:a05:693c:631b:b0:2ab:ca55:893e with SMTP id
 5a478bee46e88-2ac3011164dmr1476279eec.5.1765594916477; Fri, 12 Dec 2025
 19:01:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <x2HszWYqUaRfzLW8I1wOegJRSBRXVUzqafU9O_QLG1E-OjqkyUPQKn-jM9dzhvsgMW_M0NGXvrgEkN0p9mV7ww==@protonmail.internalid>
 <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com> <5fbecf9c-b8bc-4027-ae30-d7c49212bc56@kernel.org>
In-Reply-To: <5fbecf9c-b8bc-4027-ae30-d7c49212bc56@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Dec 2025 04:01:44 +0100
X-Gm-Features: AQt7F2pGWEkoftLbj3HdIPSVKdW9IS-cMV1GM6-4S0dD63vv_8Sj36l-zgYUNRM
Message-ID: <CANiq72=Dtss4xkYYZ0Abkx3=WWqPwbQsFbJA8HG-MLggXcM7aQ@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 3:50=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> One thing I notice is that, in C we alphabetise the includes.
>
> What is the normative coding standard for rust stuff I'm not sure. Is
> there any technical reason not to do the same as C includes alphabetising=
 ?
>
> You appear to sort these kernel:: use statements earlier on in the patch.

They should be sorted, yeah (`rustfmt` takes care of that
automatically). In addition, recently we define the style for imports
(even if not all code follows it yet) -- please see:

    https://docs.kernel.org/rust/coding-guidelines.html#imports

Thanks for taking a look, and I hope that clarifies.

Cheers,
Miguel
