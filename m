Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515FE17A314
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 16:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742227440; cv=none; b=LQ6UeBKdkDsqVxnni+3caSuvJW7Q3U3vGWM6my1WxV+TeZMSRryoEmrNdF399j4lTxfDJgw9KI82KSxxxwudc0M9bxgMaxlheRJF+Xe4KMO7w0ODUyu/a5qV+l4oRV+xBsJimsPr9gyG2SMw16P4OpT4S6Q6pJhTTkNDSsUYaYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742227440; c=relaxed/simple;
	bh=a6sGXaD3hXREHvYt4KjDd7v3l3lh/bdNC3gAibCLMvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdzVMHi1nlSQ5XPv0Gnb6SkDsG2xmD+LfzhLilTrF+A1Diu1Aq5FGUd5PBU07em42yOyQPE1ZGsNdQax/GQQlVa/KuL8mLTKRMwiEf6lT+w+ixtH2OCZHq7AHlR5+veROGC5ywfFslxF7XH90vAdam2sah4jdLI7MhGZCv1kdNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSj3jXNt; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSj3jXNt"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-216513f8104so10053005ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 09:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742227438; x=1742832238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLHbmTl6Z2h2hNc2aOXjcxBQ9Vz2CPOpm/cFeldVGvs=;
        b=hSj3jXNt0gFZsYYeCorvUlQS27FTf506KugKJZe6jajcbDgiTe8l6qmpJB07Dla5rX
         3hp7xmldPaiaE8M0TSQNXU8qf+l9QK2fogxMSDKzHim8b3T7rTYbneh3E/mz/IFN81Y/
         W2e6vqjPLF1UtJp3j2ERWlWQmWHsNHGTLtm/iXZZbOkSw6X21MHFqRiE/D+M3qBfCNIQ
         L3DbpqYDo0uTfg6xgawy3AQde/znCkGFNTi1blc6msBJQrEHS+Dw6TEUxoIjObAIuKZQ
         02VT3Sq2dDmNPg8LWAh4RrrG4Pl0dVpBL19J5W5knVGdlofaRxnIN2fgUY5k2aMri/uY
         i0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227438; x=1742832238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLHbmTl6Z2h2hNc2aOXjcxBQ9Vz2CPOpm/cFeldVGvs=;
        b=XzjeLnMu4jGnEupppa1BS3FGZx3bsgc27ARWjW94fKBj6LPbIUzFKomWw/okO5j+um
         lDWDlydUXQWyeKYIA0u/Ntih991HIZcFipuNaOuWopL4eh9Oe2wMTSD3aqdHGkvCSCA6
         A9BspAM9ULHV1Ea5qK7mFmt9zNXA/xsYCXgB+Qec8PICzBj5kRRGS+s2E/wI3K7tI1/j
         grMLRjnJujk5jgaja9Irhv8RGxuDQkybjx58tAKIGA3d16KOR3IXp619MUAWXQ2Yfz5A
         VFG4dz7z5V21ZgZPxjWZY5A97SfsQLfFEycQK8gyrv8FGsC6hh6XGVVpSohdhX64IaqR
         I5aA==
X-Forwarded-Encrypted: i=1; AJvYcCXg8pS9lahgaM+KWCHphY3wB8PGJz6jEO0SDUDjTG2kUgs1q/tiO63dIKEd34RNYu5fTGXNGu+TjMYVmxEZzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Iw4TpvjIdgKBRfFnw4GMLrIRWlaHF3BqjFzZ9HY9Gl/Epwba
	rmORPEgc/IUyy17QyjJqR53M2NRsnWI5gAKamLTf46vyiY23I3wLS3qq3yolgFB0/EQ5UlZ0xfM
	M21upHfVqtrCwQrWmR/8iW8GJ3Zw=
X-Gm-Gg: ASbGnct5uBN3Drf6Mvc2PCdSfnwh28Dk46F7OrB0CeUjKunetLMhlqK2/93BbnOluS6
	N4GIZb0RQ6WWCXqV26glEatvTMUdbpanlbHrIJayowWlZiLDn2op83HcYrvlCfHx4ZUn2/73VL0
	W5FTQnrlvLeHwrBKXS0S2KUbxmyw==
X-Google-Smtp-Source: AGHT+IFtIo2zqstgnH4Nj7j0rm9AcF3RvzwIGPreCoQ8fVKd6cilbS717XbMNHaB0e1D9vHc1tKPr1v+FL/zH6x7yxo=
X-Received: by 2002:a17:903:2284:b0:224:1579:b347 with SMTP id
 d9443c01a7336-225e0aa6fc4mr56844355ad.7.1742227438391; Mon, 17 Mar 2025
 09:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z9XIk3WpzruUfh6O@pollux> <Z9bLtgJa3PNB0bkf@pollux>
 <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com>
 <Z9bWODCNNEq3xI51@pollux> <D8HVI9K91JWV.NHOPVELH5JE5@proton.me>
 <Z9cfkKTVKtc3imyK@pollux> <Z9ch0fgUI-V-rlGr@pollux> <D8IG67RM4H53.2K2AW01FZLWJM@proton.me>
 <Z9gDt9JbqvoTFORV@pollux> <D8IMOAKHKYGP.32PTT2W55UH6L@proton.me> <Z9hGcClQXpEYUYZp@cassiopeiae>
In-Reply-To: <Z9hGcClQXpEYUYZp@cassiopeiae>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Mar 2025 17:03:46 +0100
X-Gm-Features: AQ5f1JopCBBNsSQLLPVMYpyGJje4lvL7P_XzswuBytc7QDaFZC5Sv99bioTZXps
Message-ID: <CANiq72m0jJfwBb0Sr7P8NZN30Q8FQYwn6QteQ0QbPuBW9Qj62g@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, Tamir Duberstein <tamird@gmail.com>, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 4:57=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Oh, I see where the misunderstanding might lie.
>
> Let's take a look at FileDescriptorReservation::fd_install(). My proposal=
 is to
> have something like:
>
>         // SANITY: `fd_install` consumed file descriptor
>         core::mem::forget(self);
>         // SANITY: `fd_install` consumed file reference
>         core::mem::forget(file);
>
> Where we have e.g. clippy to complain if there is no "SANITY" (or whateve=
r we
> call it) comment for mem::forget().
>
> I'm not proposing a SAFETY comment.

Clippy could "easily" do that, but if we are to do something like
that, then I would want to the ability to mark which ones need extra
comments in the signature/item (e.g. as an attribute) , i.e. instead
of in a global list somewhere like `.clippy.toml`.

It is also related to the "colored `unsafe`" idea we discussed very
early, but without extra blocks on the call, just a comment.

Cheers,
Miguel
