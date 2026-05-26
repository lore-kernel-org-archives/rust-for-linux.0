Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A19352C52
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 19:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779823315; cv=pass; b=uIOdBhNtiRlkFZx5LpNtiQgj4N+p5z7NMipZOzudAk8PIo/f8IPd8WnhyCeSc63BqpOp5hmkaQN8qF5KNyWAIBa0+6EI2SfRiRJPsF/BI1kDK94Abshkgn5Cx0uR7AMjhqTh6yLFXYK+x/aZjfTEtbKHdpRxkiGpQSHLLce5Mz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779823315; c=relaxed/simple;
	bh=XzY9w49NAkti3rReDkffdFun16jS2EzXpwJYfyJka2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APqGz5qbkIhoygYkQdHRLqnSQQGHh03cpwJOvSUFRMh8A3UrGTVeb0ueJvilWKpr/69sqdw8qU4HP2uq1aiqO4wjiBjbRkTnuN2A0Iss7dCks0caOa76+jXF70aPAPL2bh2YsMZmMX/jFYuoIX5+rSX8gxCr6YDgpW4/Fl5NtTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3lCXTFJ; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3lCXTFJ"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bda3b4318dso1108816eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 12:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779823313; cv=none;
        d=google.com; s=arc-20240605;
        b=PFpA5UujyctT59Ak2u3xc5YhmRORNPOcgOxstariQ+ExzhEfBhptnepROvE7pi7Wej
         3DGfOvTJk+TyVKWrOAd2YesKEob9EVnsSLldaXkooLygsJ0WFqm5AwN+NxJ6Nu/k79kh
         ZNygIx8317Zukky1XzQ9fPNGXabdMfduVYzz+uxMA1zAcycixE1ZKQjZ27Vi1lvi+5dy
         DsRp9gFGwzQjKIrABzL2KOWHFk9hsdmx56xxX81Tovo3QxdlHPBfmnhw/54j5ESyXf60
         2I1ZSE+trl1oT8Z5gLTsczn48LJYhZblS+0Mwgo1DK9ZdUzdsAmhXc1CE57zYrIPYUH1
         Td4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XzY9w49NAkti3rReDkffdFun16jS2EzXpwJYfyJka2A=;
        fh=Myx6FRBmjSxrJxEdixMhy6Yro9nuilesioV8zsEB8Kk=;
        b=SvQCpzhhJB5VuXkfHJowRVQCfUeofK2fvLgfUCF83MdD4kphf2ZwwgFfWyuKfapy1v
         xKPn8484h62yWVXt1FEIfxZ+x+luopwsDNoT/KcOoshZBHTe7D8yEN+58QXNw/YC8HBu
         VubnmZ+kkkIsGNSeR6G4z4axMSB5zMzYoRqqMa2hhTGKG8Pn9w7iSAb2hezcpCpN9cR9
         yC75LtcYiXcCJs1sx6zWmepbMkYMU2sjI3eWYkjkx0K2a6T0riiqhIVpalpVIqkYg7qT
         KW9ex/eLnm55KsfqyWz4T30SV2bavYJGrto/vX59yGVT4wKpOE/Q1mqu2fNJq7KZ+/Et
         zN4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779823313; x=1780428113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzY9w49NAkti3rReDkffdFun16jS2EzXpwJYfyJka2A=;
        b=o3lCXTFJDy3K3kac+7C8P58DE0Sk2iIyPmw7E+IYUny73xT5VpeADXrMPFljAMjOge
         J8V1ZMcdF9p1A/8Mq/jBTs14ePRjJgRS9awKBgkkfYsz3lqg0KcZhCtdh44Hk5tLpGB/
         S9JdGP+3kd+Qgx+j24gqOD5/1inVry76pZBOP1i92cWm1xM/LhUR0hjmTwwiXlqOsOju
         XgBikehFTPKqDuiERog0efe/wqBr0rp3ZA1pYuH85V3xahPosJdOU52QNx0As0odbZ34
         3dIS1PAWdeYpWOFWVjqNzLccdyGtZbpD7kb1LX3JXtXq2EPeGdB8GBPZQaRNafxLWIRZ
         5ArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779823313; x=1780428113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XzY9w49NAkti3rReDkffdFun16jS2EzXpwJYfyJka2A=;
        b=f33U1eVjo6qApJ/+rwOcbPwbC603rLJHtneZXt1kAyMgT9/VkZnCelnuwdFMtg+K2z
         4+nXTfyngnEJ1UjBt4gq8L8Q65Ob75SQIO4dCoy2aVgd17TT/5UFC66R+M1eTI0wksg1
         KYPgqwakWEnHgAW7zjo1D8RDxtvOkgQT/K2WnKm++BwQpiTmgHA5WhHaTqKSVgUY5kuh
         vILNeznnYmsK7qge/O0QZKaPkTQc7cupYfAmlUp+fgEIQOwaQ8RK0mBwQGrZL0zMChOy
         7HAkovBxa8GhP5f2LqxMLovCXkBi5RN9KEBn6QMl3nHEwmJ6Xd4sEMvgL2d+maqtoxpg
         Iqvw==
X-Forwarded-Encrypted: i=1; AFNElJ/uvOb2moE9uYOWxc0wJhfVZ9CXP6T9zenlxTbb980wkdSbrMTRlpTUi9hp8Z7JH7uf2AxWkIUoSaRGeYMVmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWigWYnBKc2skvZWxYM8daHRdQUY09mE1sJWgIkS4hBJu9rnOq
	o55FtROOkM/fTAc39DK+LYDoGanUHstrSAVkBlzKRULSK0rhra4Rao6GIU9Afs9H1H9uGr3q6Wh
	ZC195vz62Y0BMkSDpM3kMHf/rZKX2sfY=
X-Gm-Gg: Acq92OG5dM/G1Qxow/zhMVcnOsAhq8eCFb3mXJ+MxP3gEN6T1y1rfUnLElKj3JnrbZ4
	ucfD41VjA1jh2lfM6Kjlz58xzIBtM7QUIdXjIzxS4sSZKxsccSfbBp0MpFYkhDKTbr/OLqZ2SOW
	o1oHB0rMDdUdnIVJFAeq/DHjZp6vafs3Dw7Wc4Q1rTxpQVG1wm8mFLeiSSZdCCGKVVnb7BO+RZ7
	mERFYVJkMUCPHIL2LyasQQFV2ccMHlLGpGyiy69E8RvzYgYibHhSSSxKsppZ9e4f2DbcNjOj435
	aXHWau7fldiPo/dZr2yS3FixDJFkblNH4TDI9nCwj6jSioa/+UBpfgRxS7hgejpaQksounB9HvY
	PJpPo041TTMNx69Bxl1IRfglvYIP7pbYuhw==
X-Received: by 2002:a05:7301:168e:b0:2f3:c1a6:361f with SMTP id
 5a478bee46e88-30448f3c004mr4440879eec.2.1779823312502; Tue, 26 May 2026
 12:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
 <20260522-binder-strict-provenance-v1-2-3d6e9406e864@kernel.org>
 <ahWTBbLpYEDlPTr2@google.com> <CAJ-ks9kdwuO=wmjmfhHMOOSG6cuEs7hnVVActxP5DSHTRFfX7A@mail.gmail.com>
 <CAH5fLggtyjE8utcGfESCGKPTyqpdbPsKCvpJX6x1yBKUYywW5A@mail.gmail.com>
 <CAJ-ks9=8GSw4sZxy_Vm8VW5j8n02yxr6eDSX3TA7VrnBo5pCDg@mail.gmail.com>
 <CAH5fLgibt_BQmOtkfEfo1=48zUeoWBJ-=u5gzw_a3X6Q7=aUSA@mail.gmail.com>
 <CAJ-ks9=Mzqff50B3EtJdeDNAULO_tOkdYWW+OsCNXtfasqpdoA@mail.gmail.com>
 <CANiq72mvV7Q27CG5Zf4bB3mQPSvTRquTKw5P4N4fjrYKddYF+Q@mail.gmail.com> <CAJ-ks9kUbL9gxVrsJGKPy+VKDQHgYLQdAz0UL-q85FVjw9hUGA@mail.gmail.com>
In-Reply-To: <CAJ-ks9kUbL9gxVrsJGKPy+VKDQHgYLQdAz0UL-q85FVjw9hUGA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 21:21:38 +0200
X-Gm-Features: AVHnY4Jk1gxDDS5C-aM7udznmJAWe_WnDgv1OTpJvv3IpQToKR_WJGMLdNJTbPo
Message-ID: <CANiq72mp7DEVkRVykvKCOVdrbSz2Wf-B=4sWg5676TGMXjBj+w@mail.gmail.com>
Subject: Re: [PATCH 2/6] rust: binder: transmute transaction data
To: Tamir Duberstein <tamird@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 8:01=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> It is possible to do these conversions through pointer casts that
> avoid `as` so we don't need a function with an `#[allow]`. The
> greppable function you're after here is basically
> https://github.com/rust-lang/project-safe-transmute.

If you mean with the usual combination of `cast*`, `from*` etc. like
we did for others, then that sounds fine.

Regarding Project Safe Transmute, what I have been told last time I
asked about it is that it will take a while for that to come to
fruition... (but we do want it, and meanwhile we will get whatever
`zerocopy` can give us :)

Cheers,
Miguel
