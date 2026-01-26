Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006702DECB1
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 16:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444098; cv=pass; b=cWZ4vLWvah7h6BY0PH6bLGWWNnsierwzL4Vcd/HCq9p6hTRhD8ROLp4OIkX9Rrt9ZCreOeY9nXe0j/cQyf/udkcEYypnjcmeY3zOaZlF+XtyloeaSrmMQ/iPsL+i/mY9F9U5Ech9jxDSvGbVn8Nd0IZmJ28uFYb7B6ffB6vf27M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444098; c=relaxed/simple;
	bh=b3m3/VVdwm1L5JwvxjexOIEy5wN31isjno52EUeePNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eu4jkSbkPBRf0bZIDYCeWCWKHXl0l/p76XZosAX+r6lifB+X3faA6qc80ERgAt4+ghj9B/FI3/UjJ1txBuvGyMg3o2/LEvenHhWRlh8QqniEaGYbw8ssEuAg8tnJDCMdrJPogF+ernG8ydC7mS+0eT1w2PYmw9kRQcCVJiSejQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=280F4xTc; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="280F4xTc"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-432d2670932so4336206f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 08:14:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769444095; cv=none;
        d=google.com; s=arc-20240605;
        b=MXsaBewoqdntMkeqb4AKX8gzts5w65BOadHqyAzwXEhLwSoJrfNRPo9h9Dftc99Oci
         I7YM8k6wTS9HGAc7H8+z7ES14TVPmon1eXHXjpW2fwTM22QCfXiIDqcmsbHw2ihqjZ2I
         1HEFuhK7UAAiHX/P0y/PQ1APtS3eKyMYgdGrMSUZl/awnSQN3GK+BZWr6Arrl0zCbOwe
         Ip9ea0D5LsDUhRWPIXVMXH7Dc+NeHgIerx2JJxECiuEPLraWSPgL5Y0ABvuIiv9xvX2w
         AyAyiotmpTPN6h8BenxHtcUYdONcLJfKquvrAg+lEGOqEHxcpY2nfPIq+KaEyQgCEeA2
         E8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b3m3/VVdwm1L5JwvxjexOIEy5wN31isjno52EUeePNw=;
        fh=+ljtNDonbQ6xt+8HuL0YQGlNdPYso0fKbFYLVrW6Hqo=;
        b=LiChFN1OVgGzjdPsvJ8RLBxOELvg0w7UGPpSDv7qvKdRJDZbPTLHkT4qvnGG8ECfpj
         JXTA5g6722IloaM+UUl9vrjj2fAptM1s5xDspFuAUxEyvDlHkTSZdfvp4Anf9OzrLuZB
         f+4V2zESkMFhtCrAhmXbCYRhvtpIPtvOxQJN79CXLepusyJW8Xss/lazMfy3JtoIn1Nf
         FdfyRa9r4d5FAeM27KseEnFQTR0UWf+mTZlX+5bDFh69Q7cRPyhvV+ObhbwiYtDgW9uo
         3Men5SXIREh7M7fY48FXYlhyITec+9BsEaGte/fMzD4HDlVmV5FkF68cDklcGAObZPqR
         Pjyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769444095; x=1770048895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3m3/VVdwm1L5JwvxjexOIEy5wN31isjno52EUeePNw=;
        b=280F4xTcTA5p7vg5B5/a3tkfZPvH27OboATow6174PXCIko+LqdKpnRfDP8XHBnAUe
         ArRkDkQB1pGbSc8tIMGhDbZWZyUw2bads/RiqeCEpgkQELOYoDdDEYVVlF97swjgQcYM
         iyDfImGYsVwTEsDdDplBx78x2U7PyZ6fmHemHUDjligMpvVATecJRJW0H5G4tuPF/O7r
         4H7mqfbxziXX56rlp1VkMWMGv/cbhiC5GQRZdwdacQFE0GXHx+psu0RRWLwWv3TVbjsJ
         b0GMKSE+mOs9F+xV48ThsTRbQNlZUxif5RrYPdXAjFCEFQ77ovtfJiY8VDZSBqslU2JZ
         D4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444095; x=1770048895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3m3/VVdwm1L5JwvxjexOIEy5wN31isjno52EUeePNw=;
        b=HVRTOXOcr+VlFxlkjVwVclfse6qwyqZXnQ4xNmaCDmOnWF50dhp+W2DV98Nmo0kEWM
         UFWALGb2haoMo/6Fs/ORVjNaMqkUXCyM6nVdvIJiHnbJVbQm4m8uUGqfdAzQ9MveFzKF
         V8ag6+Hqs82breqgZiU5xNf3c9EUUBRQmH2TQurX8gjE/bkJ6KDCf3f739LSweZ0KwCD
         xFtXSVpPtxqAoQGteZRzD7G0LzGVXLPpCxOsljs98PaCY3Mbb9vOEPLiUGXUwuwRIG4A
         WCgCY6H7l05b4/TxYrqLoDWY3aknLA6+tJp26ATGb+bCOEkREQNaHHGRakMX5V3tLQyO
         kbcg==
X-Forwarded-Encrypted: i=1; AJvYcCWheF0d2zeujfmQhaKB6RUsvdZk3K/58MTnSya0GffeE473ahhxrDAjDednxxiW2hgHObPKRHciFTbDyDzZuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxMrkzRQzbFrO3pb/9yRb0WO+ZWoD6tG4HZGmeGmUnkPihAi8q
	iOYYJrUXPEaMvnOz7fVNkMR/9PCYtlYL3C93/dBulYsMRYJ3mJ61gncdY9jYMRH7i+HopzYD4T8
	kizd+gTPmdHamaoP9zE4g9+85gA1/KgyZq7QVHWZw
X-Gm-Gg: AZuq6aIziGNeMZ2KoNh/GjoTBLk//sTceTXoXQocb3LzxKswVdJ+rJrxUMZ2KwnMBz5
	cbWJeW8V48sJM20C4VX+P4QU8ghS56fG7CUMvWXoR7iL63I8IAPtwld6qcRsPmnnq6rOAmdV7z6
	M8jVcj/q4WDQMIbjwcP5lo3YMj3UPZ4TTYYXABUHEmiNFQz4dFPvJImm3PXT8UqvgUknRAfVS+w
	xthbMBNtlxkQz+pXAF0OkqQ3mjysj3NylXDkbqrJLdMxTW6cJ/35IKayO2HSeXh7+YbJyBoEjpP
	o3p/FBFKbzc0RUcdLx3qZhTgvw==
X-Received: by 2002:a5d:5d0a:0:b0:42f:b690:6788 with SMTP id
 ffacd0b85a97d-435ca0e2909mr7711789f8f.10.1769444095193; Mon, 26 Jan 2026
 08:14:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-zeroable-ffi-v1-0-0ef101d1ed85@google.com>
 <DFYJRWUHCOMQ.3L6ZVLOJTNDNO@garyguo.net> <aXdrUsrKVmzpBVd8@google.com>
 <DFYNFSOP2UVY.27KHATUQMCXHQ@kernel.org> <DFYNILJPAYJE.3CFM49W80ED4O@garyguo.net>
In-Reply-To: <DFYNILJPAYJE.3CFM49W80ED4O@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 26 Jan 2026 17:14:43 +0100
X-Gm-Features: AZwV_Qhm51ZvNtcAl24ity6Z1oGdEZsigYZ9qHzy-oChasQeMJ3ey0HJ1RLeuNE
Message-ID: <CAH5fLggAfRkjSmYuYAZioXn3OP31Fwr=VGd2znnaHQvPL3tKHg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Re-export Zeroable and zeroed() from ffi module
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Len Brown <lenb@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 5:11=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Mon Jan 26, 2026 at 4:08 PM GMT, Benno Lossin wrote:
> > On Mon Jan 26, 2026 at 2:25 PM CET, Alice Ryhl wrote:
> >> On Mon, Jan 26, 2026 at 01:15:53PM +0000, Gary Guo wrote:
> >>> On Mon Jan 26, 2026 at 1:05 PM GMT, Alice Ryhl wrote:
> >>> > Currently, the Zeroable trait is defined by pin-init because pin-in=
it
> >>> > happens to use the trait. However, zeroed types are useful for many
> >>> > purposes other than pin-init. Also, we wish to implement Zeroable f=
or
> >>> > types generated by bindgen. For both of these reasons, re-export
> >>> > Zeroable from the ffi crate, which is a already dependency of the c=
rates
> >>> > with bindgen output.
> >>>
> >>> I don't see a benefit of re-exporting these from the `ffi` crate? Esp=
ecially
> >>> that we re-export `ffi` crate from kernel crate anyway, and `Zeroable=
` is
> >>> already in the kernel prelude.
> >>>
> >>> We already derive `Zeroable` for bindgen via `MaybeZeroable` derive i=
n
> >>> rust/bindgen_parameters.
> >>
> >> I can't find the convo now, but this change is on my list from when we
> >> discussed also implementing FromBytes / IntoBytes for the bindings
> >> types. To do that, we need to move our FromBytes / IntoBytes traits
> >> somewhere that bindings/uapi can access, and we agreed that the ffi
> >> crate was a good place for it.
> >>
> >> And then for consistency, also reexport Zeroable from the same locatio=
n.
> >
> > I think you also mentioned at some point that using `pin_init` from
> > `bindings` seemed strange and also using the `pin_init::zeroed()`
> > function also doesn't fit, since it doesn't have to do with pinned
> > initialization.
>
> Shouldn't it be that a crate that implements Zeroable / FromBytes / IntoB=
ytes
> and then pin_init becoming an user of that crate, then?

The Zeroable trait has to be in pin-init because it's also outside the
kernel. You *could* add yet another crate just for this and let
pin-init depend on it, but just putting it in the existing ffi seems
reasonable to me, and ffi is not a bad name for the owner of those
traits anyway.

Though I guess if we add zerocopy, that concern goes away.

Alice
