Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED381E0E10
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Jan 2025 11:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738237900; cv=none; b=VOBTdusBplUc5OMEiN/lfByjLKVp4FKGKFFcN0UoawXz3ohEAA8Q6YpcM9mebXxxPYkfAUbx9V0aK/cA+NlPjWNmtqhauYGgStIS4XX/mKZerNTJyEypmHFmUDvgZzt1BONf7SmvNZeJerpDkGRv/JqHYvcoj0brr9FG6vFPwu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738237900; c=relaxed/simple;
	bh=kGp2+R8eNNhmvEcrIQ7enrgR9LeawhDbjVgF/jZ7XEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXz5Ae/EURIToAvcEu4tyYauMBzIXDElS+4sXd/tBF/O6i7wOIIoI/ofSAuSZlpEsNrERQA20oXzo22GiPHgph0L9CBpx8/FyUXrvIMwaa1LcNWkq5uzBggdYEGfbIOnyH2/kB/r5DqUIbwav0tBDgLTYn+V5rDcQBHdalMsvCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0KyyF2ZT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0KyyF2ZT"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385eed29d17so336590f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Jan 2025 03:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738237896; x=1738842696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGp2+R8eNNhmvEcrIQ7enrgR9LeawhDbjVgF/jZ7XEA=;
        b=0KyyF2ZTXtAliCYtKppP1UDT1DstkB9PA/ygWeChsBSCiAhfaYBx4Il0htF+se9BS8
         iRGuOkSBAXRGUtDJuOvNa9qg79TcqrAIlfnhz/XK7/3sJCle1D4b1V+YCvOzwJpFI/MN
         nd1IiguCrJ0FYlpv9nCPYY+k+QMACHmyn5ElOBpe+Crhyfdx6YR291np4pS0uW9f4utF
         qCRuIMwIhYeScQgyKznx9ZkIQhhxN/+J866DCKQOxyxbIm+b7zb9WQBm4UQ8EXJi5maZ
         iUxopc8drWhzLONtbcIKNH+llSLtH5EnbRdujCHgV2NcXIdtF0C7xPz579JEJQvNwPtw
         Tymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738237896; x=1738842696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGp2+R8eNNhmvEcrIQ7enrgR9LeawhDbjVgF/jZ7XEA=;
        b=PQgQ3P3vaivF6aPlDYFI+/j9Rp+jSwJMaXonQcAmNksCx2C0lIn4oR87MfJ9Kp+iSK
         kOkQAmE8kYNMXERIDKcrPZ5bbPD2VkWOvQfPdWhsNOauBH+jdux0RW+T80XLnZOC2/xk
         gHC8clXPA1caKZlw0MefTAh6aTV6d4s7FNOeO1odrYW3msikBIm9ZLoIWkkuxfIQ9mwf
         KrT+bgZuB/t90yFKleeJzVKXqHo9hspFGQ8XhhU1fbHYQLcV9IQM+HvLr8ptb0707MFf
         BoBgbD81SwgY2VyoBgVz2fSR6JZUbLMAk2i1sFOA7KNACZdw8F+UaNsObmaFfWZvw8bo
         2/sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVOLkaSoTzCQUqZEjGeq5V80JHUl9buyh/pDlxTO5WniANY5zwoBIz1tnN8tHEz0UHcvdh0HBLHWvcDxs72g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDgy0+oY6GBJNK1mbROSHDuxxz7uYQlHMXi+GVcIAUnfoUGW9r
	SIkGstCCxWFQvPmr2XOWuBh5lEWHCz8ylUm9ggM8NhlgPQE/BacflzPdT9ce8L9KiP6HAeRm49f
	0WfbSamd38pY5Hd80nqUADkR4eaoJTT45C90D
X-Gm-Gg: ASbGncuc9pJuNV9UwsTpWpH2HeFDK/NN0WMQ13DmcJ/eFhmBZYT3bZwIhSqJJqTxT8F
	iTA7ri/y95PMlTCRRA4va+TadYAEoo6Fs0AsV7v7UKtNm4UWkpcp6YKoGpFRLVJJL+jzOcXCmYx
	NihsjBWDyBHyFH/IZLkWbskOVs+Ag=
X-Google-Smtp-Source: AGHT+IGvhsMDfSw2waYNiEI+BbQj09q1Fmdbt3AaOePv6Ibw4RBOxEFXo20jAmJyvPKbzZHhQGA6ztql9g5ekL72F2A=
X-Received: by 2002:a5d:6d0b:0:b0:38a:8647:3dac with SMTP id
 ffacd0b85a97d-38c520940bcmr5783375f8f.34.1738237896495; Thu, 30 Jan 2025
 03:51:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122131812.466080-1-anisse@astier.eu> <20250122133952.501055-1-anisse@astier.eu>
In-Reply-To: <20250122133952.501055-1-anisse@astier.eu>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 30 Jan 2025 12:51:24 +0100
X-Gm-Features: AWEUYZl8PktkmFWhIXon5Mf7gRkSIqN3HjonYckcGOQRDHSq3NA66Ohjeks3P0k
Message-ID: <CAH5fLggCtpLJhh7eD+kaM-e54=wCHFVJU9drmZuZ=kaKvzEQ6g@mail.gmail.com>
Subject: Re: [PATCH v2] rust: macros: enable use of hyphens in module names
To: Anisse Astier <anisse@astier.eu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 2:39=E2=80=AFPM Anisse Astier <anisse@astier.eu> wr=
ote:
>
> Some modules might need naming that contains hyphens "-" to match the
> auto-probing by name in the platform devices that comes from the device
> tree.
>
> But rust identifiers cannot contain hyphens, so replace the module name
> by an underscore anywhere we'd use it as an identifier.
>
> Signed-off-by: Anisse Astier <anisse@astier.eu>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
