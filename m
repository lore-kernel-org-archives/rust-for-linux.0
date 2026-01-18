Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD432C3277
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 19:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768765436; cv=pass; b=dyQ3aEoWGQyMARIYNRg+7RhwEkJuoy+7ITkz3sNFKjkVqsvvJ/2fuVTEhWWC/w55ANMOLGGwz9t9k5pqnpm11FAMasnY8VtYDdpb8pdQ5xdFkExQfSZXXlVHEAp2ZW8U6eLGUNT32nrdngFGHF3MDcldDcNio2jGDmdH+SvRbwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768765436; c=relaxed/simple;
	bh=e3G8J/4wbwkqXUnryw212s4nx2eTBoC+g5I0QkBreT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epiFME7MyWCrmfnGlF7Lv20TLiXtRKDtPnVv2Vq48McMPjjDXsBxlPeeHQ3UDP4YqohA2Dv3Yy65L6AULXqSiUgCh2AisYIOWaox3yJRN+XhbtaflMnoZ5/c8u9yNYVvWbNXCOoe+G8nKUqTWHsUgDVR6/HgfOzgF3iKJARHn/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8upWwPc; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8upWwPc"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ae5283dae8so231594eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 11:43:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768765435; cv=none;
        d=google.com; s=arc-20240605;
        b=T0p3Pz7jv8Zh3Y7UFQQwmLpqgxkITiVsjjDpviWYly/3d2dm1ZOdkcGVoBB4+vhvRL
         bxrHfSjxEP967Wh9b1QFpMGJ8trDbfoM/JNOaR4X5Lc+oxoH+9IEOhBWqd21OIWpT5X1
         FuopU5ZIDbZogvClmZi2LhsGde+0L+Ad8bsoaIX4RLtGgp8oYplA/Wft8oZY0VR4SXt7
         5HLY+GfeobXfnrtw8XwnNgdh9f0aPmL8gyXhbpgPCTiNpYT7hQdN7JtoHaF3U0wXuDQe
         LQb3QW2Nk0icIs1TBSV9UeoXjGn/SCqAxWjG6431aWeGcWQmkmzmWhe5Bi20BvprSdkA
         bKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e3G8J/4wbwkqXUnryw212s4nx2eTBoC+g5I0QkBreT8=;
        fh=FoZuIyW3ktaEAR32Z8T0e+IGkyPfcCx4b8ZJXSdSXWU=;
        b=CmIUKskjD4/CvJI6yg46VFcSSHnSmBhUDckmTOvXh5hwu5wbHdWKOeAcrAC/ASulMJ
         ePjIpOLRGutyCd9oLhhpqkl64rhP3cBUS+QeikLuSIzOrFrvZ7M6LNlr9hCPVR7c/5Ke
         wtHczHfVy/i5WEd6GiacnX9sZhSh6CPPB95Kf+w3nkYKQfSAD17RVfatW/UeW42oAimf
         +oX3QpLMflJ9/DFl92ZmjV+e/59wEVZ9ICwe7VGnW41HQ7mlpjEXyPb9Co27bdEm7m6P
         IybhZQxhPKPjWiHKGEvBNSbjroxWSu6QzDQUhZENv+8pRMcXCxm4PKSFWLekAF97IHym
         bvEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768765435; x=1769370235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3G8J/4wbwkqXUnryw212s4nx2eTBoC+g5I0QkBreT8=;
        b=H8upWwPclgp6lsxCiF/5fI0xLEpPYFdQSJLwIeNgQnuChv9yCsCs611aQzYVoVf75E
         Yyw9Dcdm3CQV3WWUu6VEZE3vJl0hM3nYjU0mTLaTaJ2cXk9HsKSyEKECZeGdOREa6h2+
         QVwWuX1jM9wi9Qtp6EeQe0pFOc+zdnHu3imkG6dxF2mPF3IO22ICSnbevMnzjVYj747a
         An4EERt7M8/PtK1YqEwzqKxeW2cbVJHCcthC/uT7R8wMnXiQ+pot4Bk1nG4zBkxPuyKY
         X7lWcYY8xQ0/vZuiGCJ0OB+SoOQYqFjXGuy+IhkJht7s9UOz47FwAo8VhO5E7bCcxtn8
         OVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768765435; x=1769370235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e3G8J/4wbwkqXUnryw212s4nx2eTBoC+g5I0QkBreT8=;
        b=R7AzUBHEDjerdmodFm1PGn6xMVG8pDMmMCQ43uqZmAoZ3mlv/ZeCCMHnUBx3sgU1yp
         h/nx68vdwMsjM9mzIhV2Eqb4MWSNhmRemjsD8Zc77NdU+BsBk+dm+NmzFA4/cdapMho1
         1uQOqmQJoWQvJvxgypKbfReCOc88hykmQMEPp01GPL/ZeoV+f2OHL6XdFeRPa6Un7n7K
         bUwtYfU8121WsjY3AJ768mLuqeoOU1YcAAu7TWz7LARL+/lVmSs09AHtj4NP/hz8gIVs
         DkPVskaY1VQUH8LucNtFg8hV7uVnckx0TxqW5hBc9VBYePVh/mc3mlTb85Kr9eoczJQg
         Ck6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+20EcJb8u+K87UoE1dHdu0oM9/g28qm1rdFfegyCx8Yo+tcwp5A1lueFhZ8wFE/XVTSKo6YWEN9wMgC+OoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCXZiCl+zbeSRozo+ct3B4SS2Qox4kEZ3Lfztd6W8s7Nj5etGh
	Sb5TdP/R/15QEy6PrsvcJwihUysPT4SFHx9u5JheFIaBO/3TyaxmsgcFCnZl4xVVcTBoSeAFNDE
	QCEaY1/Iftq+7/A2vp5tWTU8Anvf6iVg=
X-Gm-Gg: AY/fxX4qfPFHrsDWrF6p/NP7F0okoskra0tfZTl6TMedHUWfQwQiKaXuZIhrM/ewumO
	LzABZaLOwkD3XcLrnub8Mr0JfqITcfPWfoL2XzFMX6TntrL+ArGVoeJG9SB4h9FFj6DJ9vicL73
	Gcj4iPzuktiOVzriBxfuxJZS1N/yxEqK4/m1+fQ3BxGAnQm/OVpFUtx6lMgXlsfXPDbR2VzqAPW
	pMuunRJyY79jg5lmKAy7yvKNWrx3Ug/IQQw41YPzbZzWpgfeegzeCoL0KohNOXJFxdiY605TE25
	vynzaHNjAMHjBxiknN8y7gdsggGeEnREqkuR4BHRmoW3kHXXjwbJ2jA0I+eF3PUiZ2XguHTk94g
	Q/DLipUnzPWw5
X-Received: by 2002:a05:7300:dc85:b0:2ac:2b5b:a567 with SMTP id
 5a478bee46e88-2b6b410771dmr4279370eec.6.1768765434673; Sun, 18 Jan 2026
 11:43:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-rust-analyzer-quote-edition-v1-1-d492f880dde4@gmail.com>
In-Reply-To: <20260115-rust-analyzer-quote-edition-v1-1-d492f880dde4@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 20:43:40 +0100
X-Gm-Features: AZwV_QjZk_9YtznfTCey-RXkh3WYDmPTS9h3r4surWaCKg99-z43o3Xci0nrFX8
Message-ID: <CANiq72kE3ykhegHy+61cgi-zFz3Bd_ebZTU+Yz-unnVjNKZ0ug@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: compile quote with
 correct edition
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 5:46=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> Our copy of the quote crate uses edition 2018, thus generate the correct
> rust-analyzer configuration for it.
>
> Fixes: 88de91cc1ce7 ("rust: quote: enable support in kbuild")
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
