Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C9138E11C
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 23:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781219797; cv=pass; b=Bi5L8+8kvrOmDs4NXKlGq7bk1Is7zP6j/o0aIWTN087GpE7SRReNqs6Iy/AreSjsd+MfX6V+SgsWJsiVOVph7ZDSH25lwF1h4XfpNRKUjMTmo7qH13t4jsCNPalKqsA+wfD9bkhPxN4KArU71UyOKDVYVU17gMZLwJeQv4CT1E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781219797; c=relaxed/simple;
	bh=wHHVl+BbLLYBngkAC42ZBR4jTSXCuXiDXhM872neU9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMwy/gcKmgA29R1V4Ldw8WZbMYzkJOTHgaaxcKII0y9/yhDz4fKyown2MDB5J/eKU6Ge6dCbwNo/pKHe1xIaHNMtNXMLm0XWlHP8Mxg5B/++6ySFYEAXSh/s11VckWELPWBLQU01yvi+o+r4/EWQO806l8fKSr2yt2eDq/6P1H4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XHEoI7Vm; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XHEoI7Vm"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68cb445dd5cso2123a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 16:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781219792; cv=none;
        d=google.com; s=arc-20240605;
        b=Jjt4IaV80747xWmEyZAOch8XdAsDOqoY0omxJE56zBwoxuX+JhfJT5zH1J/kxkVqx/
         SfbRrOxxpLpWin07b2bTB4T0yybNIUikmrnnhVZ/cenOaPiHBSMJdS1r0S13qpuTzjzV
         ZaCTaw3QHS0jTzS4SwUuYhoIKEI0OEmRSVSiGcKGDIbSkr0CzPgw6NsD9pIAoVezp+o3
         SVvVYQFqddCZxRhtw4zTFN/dY9BSZoYmcswNffnUfUh9shCeqqYR42jmCRvacvdDnqVH
         zIg04kGGLicGpyBXqHD3PJuB58dZSg3XzBRxsq/2VBcrjjnEeEedkjqHOL+k/B6UBC6u
         0KEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=25POajwzbnN5vM2mLCasL7nQXReH/UyPk2Hy0UIcrmA=;
        fh=F6oN0CFMVn1g0i13/odIQZXug3xtt/pFrDWTXaKlMaM=;
        b=SNkBHPP7K0Tdg+JVBStjleTYa8AtSJbrbXsiBoayCSrmypKfXM7Vh9+3dFAX7XP665
         xmzNgGhZinXNknQb0skS+xao7e5wxepZw3mIiiOt5BrT+kYlQaN3jsh5yE64soaw/yx9
         xXLBRobNUQRVD/l09EhTS3ZB/xeXAjKVRjGFJu80UzYNH6o6E7kZg2z/a/bP3GQbNor0
         0nEL6ufPJ0d9T4jWHNnazq3Ae7FzxIYjaoiSDUMWWGmsYtOv2QYsAJK0K4r2xs3MaBaC
         z9+Y+myuZGmM2na7HhJAgVAc3jtlwIgPh9oahaIX19ZSbdwNl/P7RipmDOM1dzGu5c6H
         lTaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781219792; x=1781824592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25POajwzbnN5vM2mLCasL7nQXReH/UyPk2Hy0UIcrmA=;
        b=XHEoI7Vml6copQhyjuCHqoD36tsMvRUTNKKgkbNa2XidI0pVd0BSpjOBHxhFHqUqmb
         y29fjVafbQ1DZhn6UPOWq/JpUvItP8jGNhochoOpiH1YP5DmQuUyodbW+cl2FVxzMo9u
         ki2vAP9cBwXC745rl0oTR1Jr06NRMK6Zm1HlExPEGKok+VmyaFFfd5VKHu96lJsOgseT
         vVlCdqFZXy1Enw5IBPXH2oAv2Klg6V+B/1fvpXFADmBh3inc5LaqcOQuI4YR5D2Frida
         EMUB3eQ/wh142gOhgcExRz1OTSaRmbGko+QTm9dAfCraXoTzBz7VGcY6GOwgLKPVdKqF
         3YqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781219792; x=1781824592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=25POajwzbnN5vM2mLCasL7nQXReH/UyPk2Hy0UIcrmA=;
        b=cRl4nIRgU1MW+iFFy5mFvsxQujphdZLFR1qtbCq3qDr28qPF6E7LjqO0dvK9L2CqfO
         LDWCUxIpXc7vYqKdYIEosQRvjgGNbba0L8E6vcfnlgE4fvRkKMGBXc+MdN0Krih7SfrG
         1rQrrCW9IyB3jSi31DXMDjc53F/t/XBisFFO4MHvIAbz4UilUEF+VWHXXUWu1ztUP7CW
         /IB4geZBhRrWGiQrIHC0z7lw36iGNxS04GjluDg3fbzq88ofCj6tlVu2qK4S0tFVyV8g
         ECSVR3NiwK3JTIUURdd2WmJ6kvF6FUu2dEGf+9wvO5j5oAbAgq6a5vqhg2HJH+NNQUgv
         EQvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HYkpVROWhs+oVMea3gEzRaZo2aWoymWNslZvu+Pm8BQGl/N+Fzs0BMIpI1orZ1zSTgtEc28tenELiVfvPDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4zjaWAy+ogxuszr8C6tCx3RA9eD1QaG+1yLS96LQjx4MSCuA5
	PDoTi9RWBaPg41d7fzbaAq0pOl6rxuePOlToWJDoJ6eASFsEBkVKZsgZwPn0oTsFKldYW87HHrU
	Lo852jyxhom0VMfQoq4LBIMtTzrKzbF+HMXFA0mCp
X-Gm-Gg: Acq92OGln/7wOw+mYYGaaY3UvpkqSWH8FmNF1gVGG4kq5yztVTWDPH1nRb9hAMiNXrW
	doN9Rw/TbeOojlUhzm591YNm5/QNvUsgei4zZ/FLm/DbJXWJitmy7bbvdN1Kr7/zgRUJtAt5m44
	0TDNwkpHV6h/Rml+D2lJUQ0I49bUNBlA9W4K489hh5g4uz2W7JAp5OmMYn9rNf8R3t+LmauSWtu
	owJ/c6pk9QmL4XWttlmbgDYTIWrEN7JYLHiwzdP0mfPh0HX58vuw9DPCyTQrCBFSCEyNNhRt+ud
	tA1Kuu+KiOIfHOI7N7rdF78mgkrvFPcJr2ATOZiy4BsG/Og=
X-Received: by 2002:a05:6402:a15c:b0:691:9d2b:b856 with SMTP id
 4fb4d7f45d1cf-6935dba2a1bmr18776a12.2.1781219792134; Thu, 11 Jun 2026
 16:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com> <20260609-binder-noderefs-spin-v2-4-eafde2ff376c@google.com>
In-Reply-To: <20260609-binder-noderefs-spin-v2-4-eafde2ff376c@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 11 Jun 2026 16:16:20 -0700
X-Gm-Features: AVVi8Cf1gV7f3IRzotmgoIo_b5VvRQd6dsIZeDY8LGxWOq4gIn_zZHhFjSflfTI
Message-ID: <CAGSQo00DwzXMkSsgrU35_JbuLen9e0sdJgo_tS-oNp4YkL_bKw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] rust_binder: keep NodeDeath in NodeRefInfo during
 process cleanup
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 2:45=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> By keeping the NodeDeath inside the NodeRefInfo structure during process
> cleanup, we avoid running its destructor under the node_refs lock. It is
> still dropped shortly thereafter when the entire rbtree holding the
> NodeRefInfo objects is dropped, but that occurs outside of the lock.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/process.rs | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>

Reviewed-by: Matthew Maurer <mmaurer@google.com>
