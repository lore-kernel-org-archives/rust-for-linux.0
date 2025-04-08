Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F662C9A
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Apr 2025 19:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141707; cv=none; b=u74qn1xF3l1HjELRBHGcGFmDDilTP+j5gxsDOp5Sn16bjjLCXrr/L21HuTOGzwJpjH4kIDzl1IKQ3a5HCcWS70QFTrDZ3mzK5mVNEsd2Qqz+FggrTpBwbpP3hCLjXfS7BEsYq6wAPodzeD7m05V1JVx8tgORwn93Km5kkWmskCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141707; c=relaxed/simple;
	bh=VurtECHsnZruoUVJxyhASgqh7rMzh4Gm9NEic5H9plk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHVZ72rxE+3qp2FqLVtrvfj7u9+ontY6HMAou3deBMEp8oxpBnRg33Tzn7A0wRqor73Uu7zG/je7B+pVHBqpMslOZPmCVtcG7Tv7vUvp5sZaHErkgW9hw/wc7ufzhodk1vSHafM67Ix6waU2qUN9EyW+yAcEixBs10GhAkf5QB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feKXAOWI; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feKXAOWI"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff5544af03so1615751a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Apr 2025 12:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744141705; x=1744746505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VurtECHsnZruoUVJxyhASgqh7rMzh4Gm9NEic5H9plk=;
        b=feKXAOWI6VRwu7VOB967rL4M2uEOOOovyjg3+FLmV6B0hDUHPCeC19OtieY+nFoWE9
         C5olFFQMpQ9J0c1Wr1IhXUEi4reaVjPvtRtzeC3/OavOkY8BgWm/peIeHQvNETWitLnI
         M1i6vvyaXWTvahhC/uMr4/OlB/rJhnJFWD1hDxRXErcWHmAuB6Yhg4yg7nBgJFFiUZBe
         rvMhHPlga3xqwIw+7DBX3x4d32oWvD+XyUAkUMmpdeztjrUCKo2o4AN6quP2JHagXrla
         F16E0AkTIXSjGjj05zmYZUgOjaenIqEEbmDrh/U7WAjtRAU0/5pVmm/c33Cul4tUmY9k
         +sYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141705; x=1744746505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VurtECHsnZruoUVJxyhASgqh7rMzh4Gm9NEic5H9plk=;
        b=sV1oXzC6gwxmnD++0wmrvM2RZpejAO3TUaKk1wNkBSxxkComsCu9ASeTDMpSY3PfAd
         2ivRUCxJKI2SA/Z1GRml6dl7YFPlHM1BMqChZrWSS7uftItQHhwApxW6pSNvyIP6DHHa
         Q8u8bQHcuEFib3iCsZ3VbVHE7BkCbu/efLFCgalj1udU4pLDRFIR/2EjkjuACUugAkRZ
         fTuTDxO9pAJbFY/UKWsj4Cb0GKOS5LbPalquUr3helkWNybMi0Xd1dLNudl9k3sYPACS
         V06tcJCcYkNBOYFvT4RHDQagMQKMzhlBmOqjIOq8KY/9VGy9oCPLOG8W2KRKyfnxF8DS
         KMiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX83cFvw9JtUKHqKM4FgJUPoNFKmj1yJJ+R1oHK981TqZ+8LW7kygrfSxrINe2kqBUUMEaeQPVqaT/0gcJytg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Ys+XFOUUbuNlAaWYDVmwbPRn7JXo+08CHqIVIpGiJ7hni0UL
	MeXIncv7PrQu9R5eRMNSxoXBw44CVMgwXmaD66OnyjmICx3PdbANF0EUx7K/Gj/V/uBw77K41TF
	DsYaBSYXLsnoXEIk/dCIGVlAWiZY=
X-Gm-Gg: ASbGncsjd4pXb10L1qwmkKPKeBXqiNLVLMeIT6gUp04MrWGmOF18+17wPu1gtJp0L5S
	3KCYccpmzp63oPoyr+A/aFXN1+0bKx+FPhUDNlJ/lTXxi8ZA0/k8GuZTjaGyRxlVwiIBbrxWjD3
	wBMGR+H9LY0zXvxOBkm4ccMXaMZA==
X-Google-Smtp-Source: AGHT+IE96GVonEmXqhdIuI50YRMDV9ID1JdeKg3YWOldIRFDY47sCguHZr5RH4zRP5xKM1+wkjuASz4Fcpa8uBJAsy0=
X-Received: by 2002:a17:90b:4d06:b0:2ff:4be6:c5e2 with SMTP id
 98e67ed59e1d1-306dbc39463mr205895a91.7.1744141705353; Tue, 08 Apr 2025
 12:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407201755.649153-1-benno.lossin@proton.me>
In-Reply-To: <20250407201755.649153-1-benno.lossin@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Apr 2025 21:48:13 +0200
X-Gm-Features: ATxdqUFw7NgtN8wjRh_w3fN8zJGcRcyzh0xqeovNEGseEdguGVjm2IPZNfBtT7c
Message-ID: <CANiq72kmf0-8jr--F6WNYUju8Zhz1non=nvz3Vzx1YTw=nvijg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pin-init fixes
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 10:18=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> Sync from the upstream repository [1]. This is the first time I used my
> sync script to port the patches, so if you see any issues, please let me
> know. You can find the commits in my repo [2].
>
> Just two small patches fixing one issue that got overlooked, since it
> was fixed at the same time the series got merged. And the other fixes a
> markdown papercut that I found during review of the previous fix.

Applied to `rust-fixes` -- thanks!

Cheers,
Miguel
