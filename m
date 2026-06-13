Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF290374A04
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Jun 2026 10:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781345146; cv=pass; b=E+J1Eu6KypEjzIIm0DdpbaaiC8j1hKT4jZPz+TSns0WMGuKcTpYcx4U4EApQz7iuUgP7DpDwGwKkd/r8dQtMfLyt5l5/E57mHOAFyY/VJATVQ+9ImI/Cr89OrMu7hDJoXCAAKITokwJob0Bj5CIe0Q2oVWb50PIhiO8ZbWzHqe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781345146; c=relaxed/simple;
	bh=a9H86iIlJln7zNImJOs7H3Twwdm5fUP3s4vZPkvhH/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHJjf3J1+hnfBOzV0YwacxmdmGB4X1Zmya8zQpatvEg9RByw0RIEcx3rH2DSxUtsuJT8FwD4XKrCecgX7WNH+Gk+kZmgZ2P95vuz32r9d8OuwEM151X80W2kSLpS80Ta8lF6lnhfrl0zR5iMPlqhiBGa8q/Lf0+hNCM7KYogx6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0YJjDzn; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0YJjDzn"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304cf9a02f9so119160eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Jun 2026 03:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781345144; cv=none;
        d=google.com; s=arc-20240605;
        b=gfe3Dp5Fr8sv7SDXdA/1/TGiJZCVCtBzUT6ddiLh+DvuGjaot3m52YmoDIDWmfw8Dd
         1s8xldafxQkCfasiiF5kAd2PEPGvoUNvT9zlrdflOgkznu566Yi/LKTqBdNscfVY7Jwp
         3H1oxRLB+kq7rHAqxi351IgXHn/hU+wrOZGiLrxZnMI/Vrr/yudvkhl99zLRJpTvZWxr
         uXeFWR/OS/ylWWRdk+LdkUFmpfM6/PNsZ4s+Jf588vtIWDrr/SwNRTb71wZxMKniQwKm
         tjhrkGBIVuBHbvU9UqowOWwUOHAyIg1CoIGakcwM2SMY0s9rfDygzBWAbWBn7qVU0ns/
         v20g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CBjNOSpJlw+yD+1WI2YpvIUWPKEOoXhGnrq65FYW9Fw=;
        fh=Aj30cswJQMOE3cOUUxo1w5lI0rqiP5KkfFnHHmTrOwU=;
        b=iN53xSMt676S2GY+6oCMvD/Aw9V0VCcIYNSirn28S1NYbCjds65eHb+FzjgNsC9zBd
         JP9yNXdiS3jUI57+DZOYUSPaDQYXP5fCo5n9J5Minfm6zd4HfJciZq20R798FtgsujAl
         KxsdXtNzn63490+dVjn5JPkfNgeEcE2ehZqFQJfb9MqHOzZI3mUL7mzYuHUHqtcbVjnO
         tXBfU29JvFIPWk4HPGguNRwYp9bY0XOYxQKcYQDoNKnilO9bYsByAe3kzPPi96WVetLM
         ALztxHtF3NidRp1oa2d+qYKOnlXCwtdDlxEGIpfY3Vg/9awigkTYAc1uLIxyJTvSqaup
         yIxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781345144; x=1781949944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBjNOSpJlw+yD+1WI2YpvIUWPKEOoXhGnrq65FYW9Fw=;
        b=P0YJjDzngWKHGVmAdWfeK5gk2LSS4Sb+MoggD5JFI5PxPJMSE+wmx9y1q+eyR6dR12
         YjjeqDv4qCXpbEN3OxT43PVmBlkEu8QqEA5xZ+o4wmdCy0IIgQlMAPsTjWT6XIvt2au6
         1natKfkTWi6kKIE/wryypLgFMR0byhp3s16KQdo5QePFX56JwhPJJYyUVCPXtVxjXbw6
         9EiNYmJAWc9mSfltX+YMlew7FyoDUIkvEJ6j0+Aol5U0ddBTOPkrDIZs6t1XzgK8Q6+e
         Rd2Du8tqyCYH5kGpnu1XZLgPiF7nMPedGroRy9UodSIfog+PBDz2iL8wvYcrGkT2eiFV
         9NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781345144; x=1781949944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CBjNOSpJlw+yD+1WI2YpvIUWPKEOoXhGnrq65FYW9Fw=;
        b=auYqu1kB/mtsIn0g5z8FSRsOwlM0fFA52FjDBHueVzsDq2WIn4vHlxwbZIHwmUXtse
         uxYbYTSjm5zPcE3kPPj49x/pTMRSz+u61eH58+qxIQER9pSqVLuUHoMEbhp7ahRk5Jyu
         LDqkkDwRmGAGxPhv7USmzSZLWC8F197TyLKb4DQ8wml2HmP1hGHc++u2leaFMYNX42X2
         zoslcQL6ivUI5HlHDyart22FD1tCQJD1HtJLZZPKHYQBjROorUHS59Ok8r3RN9Wrxue6
         uO7mYuftpqTlqeLICldg9nwUux2ArmXpwOvxaX54Uc2c8nANcFnEgITTxOmWvnY7vDSW
         xhaA==
X-Forwarded-Encrypted: i=1; AFNElJ8T5kCHadUdg/CBLrUJhDcEJXwDCyb5ngAaY3cCJHlPykO3gLAGKZyZTApamZsB7cTBgTkvPc9nH1vSVYbizg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZh7b2npWI5SVi75kOTn9woI1CSd/vAd2YXyjZ34rCpQxi+WeU
	97LRiOPXMjPocgqd1L8G/krPg/ih3C67iJWxVaPSazh0vot2QnzVZ9JQ7/ux9GQQ+X9/+5Wz/rE
	/WnDXSUTDdkF9JxNSUmuM7ML9+JMP9dg=
X-Gm-Gg: Acq92OH7D7gilGdxJGgdoMaSgQZjmvZosNX5JXJkr35mt1vC6syLkhdvZFnQ6xhNBGc
	vwpFaRsrB0LJPZrZwfjzYTFklH4pHawtBL7X3pV9O3Qx5fqO9DDDBjaLMIO60R5HW7ugAWmBDQB
	J5gNv0XOS3HUOJYfzM6AB+Sw5ep4+rCKeEEsNV1wVUAzQcSeYdCAN5mnutowp3oMvbT18dvuKRw
	F7ocelUDJV9f41ABsDJMlKcRPDuI7G9AaKf6CLh0osS9tBa77zik+Z2sQSyeG3+WZWnrNdZiSua
	l/wKl4vLvQSxBEpjWTNUfJUO2WZFnV8DgBkGUnVir843li5qN96336TKJARNycWs3+zyuAQaZrN
	udNkW8SYCNxGHha+wAIZ54jU=
X-Received: by 2002:a05:7300:641a:b0:304:e327:aef8 with SMTP id
 5a478bee46e88-3081ff62e8fmr1477519eec.2.1781345143929; Sat, 13 Jun 2026
 03:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-io_projection-v4-0-1f7224b02dcb@garyguo.net> <20260611-io_projection-v4-1-1f7224b02dcb@garyguo.net>
In-Reply-To: <20260611-io_projection-v4-1-1f7224b02dcb@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Jun 2026 12:05:30 +0200
X-Gm-Features: AVVi8Ce5ZWN0tgHXx4wgAxeDGhIDTq9KOdKjeJ9s14OzuckvDKwA8hSyjUXURv0
Message-ID: <CANiq72mLqrcdZEAGM1wJ6OE7yUxzDT4dRsYjO91kPzoB5h6mfw@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] rust: io: add dynamically-sized `Region` type
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> +    /// Create a raw mutable pointer from given base address and size.
> +    ///
> +    /// The alignment of `base` is checked, and `size` is checked agains=
t the minimum size specified
> +    /// via const generics.
> +    #[inline]
> +    pub fn ptr_try_from_raw_parts_mut(base: *mut u8, size: usize) -> Res=
ult<*mut Self> {
> +        if size < SIZE || base.align_offset(4) !=3D 0 || !size.is_multip=
le_of(4) {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(Self::ptr_from_raw_parts_mut(base, size))
> +    }

Hmm... I wonder if, at least for the `try_` one, we should have `//
INVARIANT:` on top of the `Ok`, since we at least checked that part.

> +// Stable since Rust 1.87.0.
> +#![feature(unsigned_is_multiple_of)]

It indeed appears available without changes since Rust 1.82.0 <=3D MSRV.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I think Danilo asked for the Acked-by back in the first version but
you dropped it since the patch changed, so here it is again :)

Thanks!

Cheers,
Miguel
