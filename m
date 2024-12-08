Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5035A381AF
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 21:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733693330; cv=none; b=GeOaz+mbE8Sr3Wo/PO/b7bwrivCUmW1bwIk5tmly+c3c1ek/1EjZ2/0ntYJfyErNWukITSx8+XrH2vETOHseaB1nfVni2PyNYpYSg6JZVYiEv7qEKMkH1/2QiysjFsp2WvaDB+viP0RmfKRSzJOWLiqRC0Ssf8pAQ96KY2403rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733693330; c=relaxed/simple;
	bh=VbprFhfTDX1Glc+UUn8abmNPsCZhmWLVw2Qa8TrzMEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mse6kimbO5magtKwRb8+0Qmvw4DNM0p55XN7QPTsXkv3WtEY2e+l+SWzA2PwpO43oSo8EzQFbvH9sXDxvoeZJSjWjYNN2xcW1jF4Vevo5J+CCllHEejGsZCjd1L1CY4XA+x1Nt05a4mSGPSveBCYgqaWoZBwYpb474wH0243N00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJma+KcK; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJma+KcK"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e9c1e7268eso681057a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 13:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733693328; x=1734298128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbprFhfTDX1Glc+UUn8abmNPsCZhmWLVw2Qa8TrzMEc=;
        b=SJma+KcKZr3FjZb2SYHjdFBrGv9YKbwPD6Hu1U/Z7gtNpXng0fxGaDhTnBQWIPmbbh
         nxf2uyqGlXeWS1ayiwzW8RKzz1cAPi2G7c8UhOcpQWi1S+1BW88EBylPNobMXhoJDcvd
         aJHegjW0s7+mDa3inkKDjBWqzxFe0v0wDfaqI9x0Wd3LXfuAC6LRVl/xMDzDbaru1ajB
         5QVht28eBYtY6XOdKTP5A+8gCJWiLPZr5w3biNybbjzjGXBuYT504OgivO2xExdQsDEy
         HsOGgTNb/Trpytp6TAE5hClAycDtJrJ4N5EY0Iz8IEkzD7g91TNEsWxC8uHbyTjVJHaP
         FEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733693328; x=1734298128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbprFhfTDX1Glc+UUn8abmNPsCZhmWLVw2Qa8TrzMEc=;
        b=Jtb0vvaLLffzOXAS34yal/YtqGnRi/tmHhAagTKBj8t33PwrmksgqWHoZv5rwWJbwv
         t65hNN4+M0ypPsaPfq/fUIgSI7/VuhC0SOOh+ccTNkKI0es0Pep2Z0GHZnhWVrkbG8MD
         FIEC7kR74p+ikUeo067d6tNQuAkEGhazGeP4Koes7M2bVNKkM44oEBGhpzWtfvXfNTcz
         8s9feD/50iKEx7LEUFDS2i6GC25DIuWQdCkW0/XkTh6JWtdiHxU+OUTIQdM59csU9MP2
         Frq56/ke+dwm2If9PC+i9BTOAP927lkc98lvQYBxeE2tkN4weg27hVEWp2OmpE/DEH8I
         eN1w==
X-Forwarded-Encrypted: i=1; AJvYcCUpeUNt6A7atwp+3kp1G8VhCnVnpR99zGmKv9YyfB+n9Ir170+zNqhtx5tM24Y0CFWKYUjeEpb0bhvtGuVRCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynELMiKF050Qb0MjJ8/W1nDuEixSUaDd9bapgFFxHHOKNgZvK7
	yOXSvZZ6HEQlCk6MG2ML3c5RCfXtwPAleu9YL2GGfWRxuoJ+YP66Va+RMZWI24CbU2bKSI6N/aj
	sDsOeEuRLrUjXsa+Gd9Nr7xdfgEo=
X-Gm-Gg: ASbGncvy1cOc79O2VDTzm29cra2wygIbHzvZZS2mXU3DR8ZKn/Gp/vk6NlYyOg2Fnmw
	d5dKMFDM0mixJOJ1+1G34diwoeBVeWic=
X-Google-Smtp-Source: AGHT+IEPeq33F7hIIQOzK5fw7xOdeXHKATIn6UUAkSyLKiv/Mj1oIA+9RCqU52AvE1pCo/VcqMy6q+SuRsAcUmT9CKs=
X-Received: by 2002:a17:90b:1d0b:b0:2ee:35a1:c291 with SMTP id
 98e67ed59e1d1-2ef6a7bf43bmr6454554a91.3.1733693328365; Sun, 08 Dec 2024
 13:28:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241208184834.50212-1-dev.json2@gmail.com> <Z1XvdgQOzx3A4LSf@tardis.local>
 <CAOJvc-bi6ym6ZMAbDSh4H_L6LQXoTs8oNY07SZ1crzXxY9BodQ@mail.gmail.com>
In-Reply-To: <CAOJvc-bi6ym6ZMAbDSh4H_L6LQXoTs8oNY07SZ1crzXxY9BodQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Dec 2024 22:28:36 +0100
Message-ID: <CANiq72kLbusVz56bvfmC_YY=6+CbLxv9SOkMynF84dR5mtdukw@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: add #[must_use] to Lock::try_lock
To: jos <dev.json2@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <alice@ryhl.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 8, 2024 at 8:40=E2=80=AFPM jos <dev.json2@gmail.com> wrote:
>
> How I understand the issue arises when the result of `Lock::try_lock` is =
called and its return value can be ignored, the lock is never acquired, and=
 no guard is created.

I may be misunderstanding what you are trying to say, but the guard is
created, and the lock is acquired.

So the issue is that someone does not keep the guard around, so the
guard is dropped right away and so the critical section is empty.

Cheers,
Miguel
