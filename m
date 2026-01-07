Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B540023717F
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 21:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821930; cv=none; b=KwRkzKBJn9B4BTR6IOQ+FIXpMPcgXAilfEMgZ90tfQgeLxeWCzrK8vESoPxnJ0/Zn1sU8qqK7rgtnWlb4FWWlhVOpQHU4bISHewDZjb8+CxNe5EbSnFxNb7VxdXLqXGdwkkIOe7KuF+qRM82PN8D+BZP840yCNWk9vp8iAKOcKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821930; c=relaxed/simple;
	bh=XxsDtbSQYiQJXDMFyZez+Sc6Oi432EHAtfQx6sVObK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gemyIygTI4CqeR62qGwaVxPq5g3jN8xo9m25SDNcu7hlWNuyN9rkK/E3H4FE+s5Gld7fyeQkZev9rX1173cA1mMjiMKQoG2DTRkDLl9gZsV6rDDFVCFhi4DbbMyx8z+y8a02o7NRMjmPbtHVflNfB8NIIYo9zbHxN0jrLgQjIE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUvcLhUd; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUvcLhUd"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-121b937a5bcso185061c88.1
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 13:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767821928; x=1768426728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxsDtbSQYiQJXDMFyZez+Sc6Oi432EHAtfQx6sVObK0=;
        b=LUvcLhUdtxjlvehl14QpjMGX+kD4cA4HZ/ghFH6R8p31pO4+qaIyfCPS5I/QUTq9Jr
         c5G0mBByPWhkMEBTKsx6sQ3ea0w4qPUSRuuE4VsHP4iO0wSzcKvokwfTqvm5VcEB12TK
         j6JqMMIOu09VYrVF1UQxJZR27TTKfV6eBvycEw6boDN+w72XBqGwe/4NS/x3dG41PDPo
         iXRez5BCM86P4x3zXHLT7BpLZI59kdyFRirkWc4U+LPnx+gu5P34s4JZpZZU7cyN3la/
         Vc8+616MJkvSZuOlH3Oi3v41bWl9ITEOfFES2LoAC2MPeYcV6cqRyXWJc1HcnbGIRDFa
         h69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767821928; x=1768426728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XxsDtbSQYiQJXDMFyZez+Sc6Oi432EHAtfQx6sVObK0=;
        b=sBaOh1DdslckX7xv8AcA3GiITMG1qt5fW2TxT9DILu1vaXLO9hFVu0Fe8hKgX4dOzN
         W483n7WBGohlNS+o3GFrOvacqb9uKPSsec7F4hLtZypQIV2dTI3/3DzR7SOIkzJHA7U5
         ZUIXichp/Y0z4DQAd8Aj8eL4h4UexFpavCjeZ6iEvyFSuOqK2tL7xqdxp191crfualQ1
         yHQK4hXeajjqR5p8PgH+KHOwMI77J2E26yjTETAcSgVKQlGrSbzwuhPRLCaWSiWwhgWx
         2C/uHXwM6AUjaAdUIkWzgqxrTT6p+KPWVdYcMKjVMOcVnSpw7V+/ZyIX9igiMxZChc90
         7Gww==
X-Forwarded-Encrypted: i=1; AJvYcCUUrdA3aoDTk6qZ9o3ZLP59gPOYSaW2L/xnOA3pDMH1SgbDB1N7fVdl/4gn6NrrKCKaJd6EyEzO7roD60ewyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx92UcgBtQHJ+we/AGfK+7PpNtOdaLo2woHS1zOENzzFuIj+Za1
	B2omUxwbIgHksnKMwBQG8gIcDvaOvBx+tNkVQP7EBqqYYMYH+i8XCqaP3czphYUonPkJLuN8iv5
	1zsHVvGHRaTB5HZTot+6XX4tWhCuI2W8=
X-Gm-Gg: AY/fxX71DB+uuF9+SvTT6AVTzN06fvzvZLFaR5EBv16R/m+CCQG6Lu+Vdg1YAMaxLYj
	aPRDTvxc72KX6j53gaWO/86U3UKW1U1x7iiuo0liG8VLVZaalgnydYyY7tgOXxm5YwGHGio9u+Y
	SgQSzlFBiEy9oiGfxNMKrbrdaQ4GxSxR/fkm99piReYQSTbzSpC57T3+zU7vD0NqkjCOi/KvOZp
	oyNmJUYsSAfuryGLYY+ALwaLRkJP2wJMmiVChTX+F23BllajJwPO22kL/+jRfoS0MlR5PSxy8MG
	xHEE21eH2EkUFBTZX2i2IfS0my1itfyGZJ2dKKeq2WIoc1wLSnYJc4a2nJ36pKtVj0zT7kHepXt
	Yz58cKKZU2eFszLGxYCwXo3g=
X-Google-Smtp-Source: AGHT+IHtBEIL+UsU7uexgy8DQZrzkemf+IH8ilgSCYmrNFlcTrglMK9E0aREMz2jqxDT/rZLMZWaLSnYgPWJXzvgNcA=
X-Received: by 2002:a05:7300:dd0c:b0:2ae:598e:abea with SMTP id
 5a478bee46e88-2b17d30fd2fmr1157070eec.5.1767821927536; Wed, 07 Jan 2026
 13:38:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204033849.23480-1-yu.whisper.personal@gmail.com>
In-Reply-To: <20251204033849.23480-1-yu.whisper.personal@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 22:38:35 +0100
X-Gm-Features: AQt7F2qBw69A_eFABjj43IZVcAH7pwQqUc_pIgVz1wrSlmek5pG9Mm4D6zgRUeM
Message-ID: <CANiq72kQ4BPG+0b4aV4dEucv3K+45civWN7iRwX+qpON0TGSxQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: num: bounded: mark __new as unsafe
To: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 4:39=E2=80=AFAM Hsiu Che Yu
<yu.whisper.personal@gmail.com> wrote:
>
> The `Bounded::__new()` constructor relies on the caller to ensure the
> value can be represented within N bits. Failing to uphold this
> requirement breaks the type invariant. Mark it as unsafe and document
> this requirement in a Safety section to make the contract explicit.
>
> Update all call sites to use unsafe blocks and change their comments
> from `INVARIANT:` to `SAFETY:`, as they are now justifying unsafe
> operations rather than establishing type invariants.
>
> Fixes: 01e345e82ec3a ("rust: num: add Bounded integer wrapping type")
> Link: https://lore.kernel.org/all/aS1qC_ol2XEpZ44b@google.com/
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1211
> Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>

Applied to `rust-fixes` -- thanks everyone!

We can do the cleanups I mentioned on top later, but let's get this part do=
ne.

Cheers,
Miguel
