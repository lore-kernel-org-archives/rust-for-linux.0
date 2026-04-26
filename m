Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631C919CCF5
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777210259; cv=pass; b=e/zpGFoym2g6H9VK/mevwJVLavQRYLu1fDO8gIlSVVyylI0QdQA0VFY644m9R03ToJdqmQm/jcW70dk6BUL04NYS0ptrVtNnFuyPlsp5kNr0rNRUKIx5D8mRKd4mRqERQBOANh/oRtW3AYa83ICpBHRAe2+HLis9WgMKI7OQumg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777210259; c=relaxed/simple;
	bh=cJXGj63MEyCfqqwOxEXy8J3gwEUh1+Qon8MkHQWN0OQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKqKRUyRCfIfisMkXKKEJjRZuPjZcHwQSIwp9RjDEnHR4n7pP2hjf8oDmrKJwNzw0Aqn9E/4Z23/O7uDlqJ1gBr9WFzMKlB6bgf/LFaSz1+cHn4mqrBC2AEchBDNlvsBXpbBHF5yLonFaaI9f33ubLdgqex0FRLd0U8GHKeh2Ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOHQ+lN8; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOHQ+lN8"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2bda3b4318dso1146870eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 06:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777210257; cv=none;
        d=google.com; s=arc-20240605;
        b=hzuag8qk3iSJb0CDPnW1GebObUKorsvKxHJCIdPOEEFyj+jP5D2Ekh+qR2HCq5TDwp
         n1tF3LBKYdJc7hx3jKMnVZwS/WNPmi6cZkJWuhHjTu3zsw1nDt9vr5UZILNN/OvAV8zs
         jlYBL3HQAs8bLye9rLCE1g0LpOoECT28KsD38iZr3449xNVyiqS/wQ3RI3THncziLjo0
         ly/feWhxnkxjVDfmvRUfjiH6e0WsCCDueaISdyvWoT0dJOMUshu/BVDPyM2WzzxkcNOb
         9rRydxI8pMVdRvHYOKN26ZgSjNUVudNUB/0ZTAi5C2pxSn3FLKH4WEl2jsyyDcoHgJTE
         jeAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cJXGj63MEyCfqqwOxEXy8J3gwEUh1+Qon8MkHQWN0OQ=;
        fh=tqkz5CKvEJYLo5JHlvVXju6at/3A+3jwQeKMhZO0UwU=;
        b=EEIkuR0iw+mkQFXdi+yyfjZ8+FHp2Lj1vsTodAkmoiKzVJNdms7+qYd2S4l+J+UWCh
         gPZ2il+rxvQj0GGW369lYvtf7k4IB6Kuab03fE8ciyuK4aNJLd2ln/J5x8VWPo2Bqfaj
         86POzev5eCJ7G0EUUr86yXnGQBtIGqZzby/7/GB6BPv8V+bdLtMOgeJgSCvavkMF3MFs
         a22rltMB6d1bvY0M0Bl0xXmEu8znkdj8i95/hRlrVpRDDNZBe3ywoJrmaUTZiJH3+4FN
         0UYfeuDRMFv4ajiViDLetrp8UU/hlFd+2HcKP8SDucZDrmL0IfRn1MnyYYEpj1NTafFg
         t3ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777210257; x=1777815057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJXGj63MEyCfqqwOxEXy8J3gwEUh1+Qon8MkHQWN0OQ=;
        b=iOHQ+lN8qjdfiXPO+i0HBOhOLacWU0vjgxHTq2lM/7hDtJKyvJi954Pbd06VPMoVBp
         inWNUIgyFM5w52jIbkieQi+3Xltd4X/9lP4j6tsP5aNGRQmvc4rR3BA53iFKC0ksXAc5
         oDSWEuDY1lt+Ar8SmOw4B47ldiZ7EUMVn1DyT/Pf6l2kP7ycKOUctmiay/bcmnwkzGAz
         1ZvObZc29KSdxfEeA62wB4sHG98GJ06YPB2n7oKcuMKSlkhp24POnvU2Ve/Jwlbky5sp
         A9FYpVIDLBdwFb+/daHyd4vOaZtnTYlyeB+JgGgOv9d+NFrnMrLNwVJtlU+J4EoGYuDy
         icmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777210257; x=1777815057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cJXGj63MEyCfqqwOxEXy8J3gwEUh1+Qon8MkHQWN0OQ=;
        b=rbfJu4YeV6IpkqwTTFoaA41TnSag0jTb5bXi64Gjg6ufe0WlFvOkoZ3yBDTUZVVSXV
         g1KLqhCpSEBKshmpHgGYSttUe7BdPPSprcbfBwu+ZwNgDN9Vg2ATG8b1e9tiCo8r+Td5
         nWosOAfgCfOf2sIoUeP97IlbX9h8gY1ZLrzLHmC6n0DUstQxBvHZrUPM/4ADiCgmHON5
         P5LyBTPcyo19uZPb0g8dbH4xbdXa8qri0DLFOYOvKiEzgZXoayDy6BQduWtDQ1AvUFDk
         ymllbGCvk2vR2mo2S9i0Q4j69qi2e7s+428KuDdHB52uF4lRqkx8A+FbAsCpMfrs9Gh6
         yojA==
X-Forwarded-Encrypted: i=1; AFNElJ8Txr6MmHSEpwNfmKGOsmFyf4TQCtNiyMa1g5igZfJeR86AeoVKCMnR6uALsDq4yYE9TfuRkf7SnYVDzHxsZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeNguN+MxijxP5KXd7B4Rkq5MRFnWkrp9YYMgXlLq5+vk+WhTG
	aI8P5ZhrZFybLBXr1yp909h4gNA07lOyyaQ163UYFqVJ3Jsm60wg8SVY41k1fUkR8VtetYWSnku
	KME3hM6fNanns6f6YqvOxpDYDE0O3XHk=
X-Gm-Gg: AeBDiesI8EjxVS/3jAkHynd2UmSoSiVGFoLhdcsBoe25hRnNkoRlnDgIOjH7EixgxE/
	NHoY9dL+6bxlARIIDgRTKrVtCeUhf4fLqUwHtoPQUFNDsc8en6I/5zQCIBgoj/VFWruyKALg/Pp
	WO2leZKkFvJjpVAkQpowZWN3P57f8vql14qmoElcr8AnoneT6nqmWIOftbngdKXtwhahtwdG9ln
	+UyRbLCOL6D72bOVhCrzxh61BcLBbDVRBEJNFhPA2dtC4x8ttzMHb++uHuRzF4egwD04fYB/Cjp
	j5bq1AhGVr2Pab+jA9KiqAKKzC+vjvwKetTGh2UCIYdZUiVS5zUB4Rd4papbzaYfukgEcde8LLI
	zCS5zRquhyIkpOkBKfDCelvWeNu9x8rOB/Q==
X-Received: by 2002:a05:7301:1984:b0:2d9:94b4:a1bc with SMTP id
 5a478bee46e88-2e479517ab5mr8193241eec.8.1777210257423; Sun, 26 Apr 2026
 06:30:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422-nova-unload-v3-0-1d2c81bd3ced@nvidia.com> <20260422-nova-unload-v3-1-1d2c81bd3ced@nvidia.com>
In-Reply-To: <20260422-nova-unload-v3-1-1d2c81bd3ced@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Apr 2026 15:30:44 +0200
X-Gm-Features: AVHnY4LsUneK3YH3oukvOXnA8etUJn6NPCzTeboNDm_V89hbH9h5xFq9uiWnoW4
Message-ID: <CANiq72=7u5O_58b6cnCwGz=j0D1tmf5+9Ntv1mkJZpACWXQpFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] rust: add warn_on_err macro
To: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 3:41=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> While we already have the `warn_on` macro, a common usage pattern in
> Rust is to check whether a `Result` is an error. Add a helper macro that
> allows this.
>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

I saw the discussion with Gary in v2 -- not sure if you are still
putting this in. If so, and assuming Gary is OK with it, I guess it is
fine as-is for now, but we should probably create at least a (good
first?) issue:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Not sure about Sashiko's report -- it may be nice to make the macro
more transparent, even if it would be rare to use it with expressions
where it would matter.

Thanks!

Cheers,
Miguel
