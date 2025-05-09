Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B674826FDB5
	for <rust-for-linux@vger.kernel.org>; Fri,  9 May 2025 12:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746795382; cv=none; b=s1XTNIvT+dUHYg5XEWjbjRLDruXUde/MyR0+mDtwHDh/o4jbfUYdcB3ODhPh/bjr7IbZZMCw7BHoNL59vv3NGhj4cZO893wpgUBKnKxjleq4aXc29dDxp5gC8ks73VWak8KOlzZCPTkzZpFOqsvQH76luLj3q7FOtHPmn+3Otk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746795382; c=relaxed/simple;
	bh=IhVt1QCCLBwbJW2kxZXLV7OpWziutg/GuXr0dlismgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=noh2WtPvVSnUyQ2pB7RO/zN1xzkt0/nEcwBiJD3imTy9HfeV5SIaUhQvPwpVLtJCdoH/zvymoCdcUyPiKuZY0NOtdYoDtrDuLd2zRbcpDTTOwJ3/UiCjpwaCAaiz07x90xrwHv+jleoIQcxVmBglJKvu1FAXVmKFHkY107EYu1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XkdnqvVR; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XkdnqvVR"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b170c99aa49so1373871a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 May 2025 05:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746795380; x=1747400180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhVt1QCCLBwbJW2kxZXLV7OpWziutg/GuXr0dlismgA=;
        b=XkdnqvVREQFwYARIPlsNWzmRqfq/CVgU1MRPn1nWFRMnZbc7zVBb5FZBH2+hn4wh4d
         3ToUF9/BtS16SvbHx/n4sX7JhX+t6kemnyDg8S6c4VkHQwPmiDefKezDgOzJg8Yf2GTD
         KWw4bXcFTY3Hf33rPsCSWc3YeY43UtlBOHca5spDMq8ftDZI3S1EOweJu4mEytUGZKlZ
         9JixGlHk4tMISp7gJwgu6824doRj5qk9YqBPIAhFq0rtu0GOgdcMjMTKRhPvMdUnRVw1
         6r5gYWfvF8Ao7CqljDdEvaOyB0A+BEbL6u/6OoChubYjuS7aiG68PiFcCubOrEy9zabI
         kKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746795380; x=1747400180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhVt1QCCLBwbJW2kxZXLV7OpWziutg/GuXr0dlismgA=;
        b=GXn/A5VmoB1hDiqGva9XEkvWHhPIJ9mhou9XCZrg3ID1YhPyp7zBvj8Bb2SuU+a4RQ
         bbhMq4AJMkIwN8LLYugXVjapRaVnud5Fb+UmxiqpnSK/aHvk/RGdFfLzc7MgsjKWPZVk
         ir34DLiOERx/QsIeE7Y+DBUZ1xa7z41veNBDwR+P27FhzhOBY9WAWvUvtsSC/axDw3GY
         1Yp+T+MOVZIC9AvUqBJI7c+s9Ehc4gayBr3o3Ey+mC7Ks1emHSvh0arr9UTyIOHTtXnH
         XoGzIG1HjUnWpBteigOZOF+zJNbrFGbGygLmL0naH8SORlbC2rNvK6bDhCY6aeYmI8ur
         f3cw==
X-Forwarded-Encrypted: i=1; AJvYcCUDBdVFTavDRwzw3IfvuG2Cki6Ek6uR99j+jXrhYK3l961x2817GZHvbDFBRQKMDSjU8ro5J8UWiR8F67OIcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBy2ut1Ih6kXy6QFCwibGZxVJ879pgG3xZyfi1uFL0AzKDApB7
	ouO6Ewvp/5VyDvFaiWAfRi4s4vIqNVMGHNxyXfW/z3sP7JNIGWo71IQl4jWfoEU9VwNMyUjwByG
	4MijDruPxle1Ec54tmSb3EkuHQbeqjNu6IJ6V
X-Gm-Gg: ASbGnctwKh+EHNZXI3MjxSrqzcJTy6xVQPT32PvFHQHzvHlqQq1vA5C8Rnzta5NsJxW
	03gPS/7bBqGUCRw9CRfRveiRi3qlqQjiKkm5LVs/+vEt0+hyhtVBFYVGeAWk5l2XqbZ9w+gQZhR
	9GKJvgRZrTuIpgo7ge7GDC+z0Fc1foOyV13qNYLXIEAt19ISTnHAc=
X-Google-Smtp-Source: AGHT+IEF3voQQuq3aFOECMAygtEf3hwl6YY0yhW1fQO8wOseEwkI/Dd+gAS06Wo/TKctdBMdVYmR1NU47eAo9Xfgt0M=
X-Received: by 2002:a17:903:182:b0:22e:6cc6:cf77 with SMTP id
 d9443c01a7336-22fc91cec2bmr56558115ad.53.1746795379720; Fri, 09 May 2025
 05:56:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com> <20250505-debugfs-rust-v5-2-3e93ce7bb76e@google.com>
In-Reply-To: <20250505-debugfs-rust-v5-2-3e93ce7bb76e@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 9 May 2025 14:56:05 +0200
X-Gm-Features: AX0GCFsiweMfJW577uoe_PGY4lTxO5mFT6enSbv3HTbSwAWbXXWKv-S99GFfYLs
Message-ID: <CAH5fLggovWEOctW2rYnAszSzpUMCammvH2+8-sQ0eypEbhSa3A@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] rust: debugfs: Bind file creation for long-lived Display
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 1:51=E2=80=AFAM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> Allows creation of files for references that live forever and lack
> metadata through the `Display` implementation.
>
> The reference must live forever because we do not have a maximum
> lifetime for the file we are creating.
>
> The `Display` implementation is used because `seq_printf` needs to route
> through `%pA`, which in turn routes through Arguments. A more generic
> API is provided later in the series, implemented in terms of this one.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

I believe it should be possible to bind owned data to a `File` using a
signature like this:

fn create_file<T>(&self, name: &CStr, data: impl PinInit<T>) -> impl
PinInit<FileWithData<T>>
