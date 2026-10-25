Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792939020;
	b=t0ZjP8xK6GnVro6aRTshW0wW5Ni3skZOBJuMWmzWGkReF8csSw/F2FOcD6TDP/lA1Qxb
	 pkKR916TtIEj6PKkvOBOHU3VsOHabdcLljt4qcOMnhAjHgGHhTIS2N0d5jnjMqlZNRiG6
	 4w25Ug2CCVtKbVc+NdHIryUK0Jc/bqKKPnJW6+/VuetuI/nkB3lit6XD28aOYQTZQGZod
	 hQB5AZc8dHdqKg2LqWwzG6lrOYM/oFV9yyEbrbzG2mg7+6h95DCosWi5o5vNYcedVxhhz
	 y1goRJwNrQT75TlVgM06WUV3KVhdakIl2a5NA3jyzAZB0wN+fDJ1qPWqx94JeRWdhbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792939020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7t8wKfK1o19+DWGwoFNHE4Tp8X9jgaWEQ6IOGtgFgAo=;
	b=pJ+s0b0eZsnL4juQU5xwh61RcuvXOVXkHTViD8PxInP0cXOFD2lDgNvqV/kkNlXy5dvr
	 cgZ/htD8+eT/vMj4iIfuMI7P4wpeT/ijYtG+wKObdM+/VyRaP76vYtI1lIRyt+6LgrjWS
	 qJ/xuS6+thEMIINFGpHSqiNCbvI+F6g/YbYsWQrnHY2BCuQjGVE8MMSvmFlV9IjELELW/
	 A4BEfA/i5lbkd5UavM+/0unFCgzjSFj3DR8vnJX7StOQBm5JrRoy+Xpa5ZcoGa9nHx5/2
	 pW0zw3gRfH3PMFaUwxAtVxQoPpAn2SHTgWDII2NNreDDY1qYlInyMfrkNEJaJ3S3FJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KCyPtJde;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC475606A31E
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Oct 2026 14:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC475606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KCyPtJde
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-355724d032fso280655eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Oct 2026 07:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792939019; cv=none;
        d=google.com; s=arc-20260327;
        b=Om6rZf1skV5TPBaFdp6fsZiEUg4b1o7/5qB81dPja7oAiGCFIOT1TV85NtR12inyuC
         UNVYjNz9LV0xeJfInklArP8Fjq21+x2dbUQusw1m2A+C1+D6ZhIig2SCFMyRODWANIvC
         FQmpPf5ATmeQL+ScByyyAWLDixnNPickOjHOOfC0xjp1P9q3wagY90QoSnrJU4mJ5kEQ
         wVHPJPqsgRRN+JILiRRuglICCvMdSgX10oUGmdPsIMTXOu86+1UCVkFN+Gf953zKusr/
         R0NNd45oMhe97w9PeI6VqjCm1tZamd4AuCx1smmsn4oh/AJ1kJK40NhOKHtgR5MggV40
         YevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7t8wKfK1o19+DWGwoFNHE4Tp8X9jgaWEQ6IOGtgFgAo=;
        fh=NtQDMeAZ8GDosQO7DpA9VZTr4yG2BK+gzY7dMwAaICw=;
        b=Tj4o76/LIq6qMF3+vIVhYLTZDjeYhnFvF0BZY3c/mVtCGl7thdxdwSjC1pwPHCOxRW
         2DWgwOzM6oqITHUje6S7c5I5mPOUMbzHgpsXI4rwIS74VfLfwbTT54KzqrqnJyCluQ1D
         inmFq00M/qkjMoDcr+gKM6zf8nHApv/g8shqnlbWwLykGCOAu5oVA+Auhnozi0t8A1p8
         3x9BEi5oTJQ4iwBjskcjVtQJbXbh+8EDOiaDCiW3/UfBUPKO3GLhEWpjNRzXad/P/ayK
         aXYVs/xinKILeevZkM2BhKs0Zzp2tbrKRG7AEfDW3FF7HB9cVz5eQgyEVr48sCzNyIyx
         ln7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792939019; x=1793543819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7t8wKfK1o19+DWGwoFNHE4Tp8X9jgaWEQ6IOGtgFgAo=;
        b=KCyPtJdeW6FFq/pYmI8qmk4pj0VceGk0r3sATQ3CcnpAtkjG8ITVjusSlrvBV4VqES
         IM1+qSXj+dHI6V1jDYppDud6J/VcAd+uAoH7I9I6BBoM2so7x1O98hO4JhdVdu/qBCS8
         wfV37nOpNvshZGcc/wZzNsn8JQC0LDZodzWH1BDrFBbNWGYTis5D8P79Bet7dJ8IRzLA
         vB1Iklms0Ov6IsB1ZlIiz7955IA3B9Vsbfh/ZASCowJCJ97G9Jl8QisCLuSLhOS0ltkv
         W5Vylk2TW8Y7KBqJxkQ2yid6iLmnqxMCFMiw8n3sOJIX7JbNPmxiaNW3EJcX0rXvi4Rl
         9jnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792939019; x=1793543819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7t8wKfK1o19+DWGwoFNHE4Tp8X9jgaWEQ6IOGtgFgAo=;
        b=EcZRo1uyMYCf7/h4/vRlG0X13Zpfg9bbPMFaaj0eT0y7CUEXSccKu5Sqer5T9YHYrx
         uoxT+ocPC8oFKYIDHyPe9ROXP1JG0owJtZ2haEFElpoVPcKgTXNVouHXekLl32gmeQHw
         ojNkMNFPQOBqWa2VHH4fVV8cjDEl9wYkG0/60N/MDdXEdy9yJGba/VspeQgNeECK9zAm
         UGqdrgEeRDva5+nmuC1vMDRU+rLyPEwMxPLkm1yd/ara80kss6xtbHAjjQWgxadWvacX
         TYB7Xk3M4D9KWIJZIzLM0gfnlle/nIYOdadR/1GDeZlrAlLAI1ZYvCnN+PXmsrNmc2wN
         t8Ww==
X-Forwarded-Encrypted: i=1; AKwUvByGmP6qdmDQ9OBo6RWjj6gU1fhqsqTguK/aJuSHbuppXfwIt/dmRPSb+rn6Jiar5JhK8D60NhbQ4mnBrGpQhQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJjmALgNDoxPBRhWGFgSi/D5p1JG3uLT7aOXAGaoKNgLUMMHbRn
	GF5/JpEa09NdyjNNKeXlBRQdURkxxQ2T59WnJIggfXtn/el+VMRGYM3bkNH1R9wpqYsiTbSG/YW
	NBjwWUB7pdm2ecefcyRrpXzTJi74oWSk=
X-Gm-Gg: AYBFou2IE3YNXfhLtgKlRL5H+19HtByHUHQ3Zuk4WFymWQjeYPk6aLF3Ah3cFpXEm0m
	OMV4QMZpwDq1nXJ3J0IVaWhJYB+iDF9d9hJg0WWuFtx5O+RyecaM0adRVVifua50jS7CNR7K2JR
	K4avlXL6AYrX2QbmVlFPODzdKdZL6oFJVj3rPqdYs/Tg/tB4SkpiylzpYBO4QCLTeM3iBXDXW2+
	H4dHaIHnP0SA1i32CQv5uzRSyejicVsjM/eJyj3CTUR0v1bTh1j8PJnOHrIcJwhsviFs+sDnziz
	esCXq4G+LGfBbn1msyFQ8t5ed5c/SIWag+HLxU9quNUd2tkNZ04+CqBfI0l6dsGTr0vaHSWitUl
	mY1BojdStS2HjqFc+EayWGjC75Lhxy1nyqoP8lSTeOe4+6BwVqvGB46vVZUqhDIBT/UV37yf912
	0qXzxO/wvgPHZkUwC+r0EMcYsDKATzS3ViYbfpII4n8XO4PUDOdyqtNCqmKx/RJw9C/1BIcDA5G
	Mw+HkjKgWvqNzPdXD73eGLxq02U6tNUe1IT
X-Received: by 2002:a05:7301:19c:b0:368:1f8c:5f23 with SMTP id
 5a478bee46e88-369e821311amr10193874eec.0.1792939018761; Sun, 25 Oct 2026
 07:36:58 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025114304.16730-1-sagartaunk@proton.me>
In-Reply-To: <20261025114304.16730-1-sagartaunk@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Oct 2026 15:36:46 +0100
X-Gm-Features: AclHuK_uTRohvpAYfcxxJcFSohBs9I7tNrP1XAzPP9scTKatqkb4tVmZ6FhHCQ4
Message-ID: <CANiq72kC=+EKHXgH2V1mCw2JYP-9DYGt9ohQ+0q-5_dzB-h77Q@mail.gmail.com>
Subject: Re: [PATCH v3] rust: workqueue: fix SAFETY comment incorrectly
 referencing `Arc`
To: Sagar Taunk <sagartaunk@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Tejun Heo <tj@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 12:43=E2=80=AFPM Sagar Taunk <sagartaunk@proton.me>=
 wrote:
>
> I originally sent this patch in April but it was not merged because I mes=
sed up on
> the tags. I remembered that I failed to follow up on this while trying to=
 read this module.

I don't think it was because of that, no worries :)

I guess we can take it via `rust-next` unless workqueue wants to apply it.

Thanks for sending v3!

Cheers,
Miguel
