Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7490D2D7DE2
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 18:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771526305; cv=pass; b=MWDxFt7zgae/q9Dl5EC7HleEls5ZGFJ6duvQsC0qq3F8ujpPmWK0Y1IjTBNLX06h6oCyizidkxzJVfzTIKDcVCwqxWtWqkuQaEb50wnnx51Fgf2kakThRXQwqiijudO9Et0E1ZPRkhfV4FP7xyhRijaABbxJSCGrAx876F0srFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771526305; c=relaxed/simple;
	bh=2/99nRZ95IjeVc75LvwCdBJOe5YtV3DPyqkMVVh+UtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=giHT7E6kKC+jgCkBl/jPtvy/JUlTp/NHx3B4oALNfXpa+TlfpPFsVIJJ7vWcRC673LXO7sBtBkSXQrWGC5HTBHrcyaEIEJvr6pOoxXCVOlymxqst7XZ+fuFcoTl76nwwPIIrHA7vGu95OAay+fqOFRWxZHt18U85Y1QVh6hT31s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRqbtig4; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRqbtig4"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ba85f77203so23285eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 10:38:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771526303; cv=none;
        d=google.com; s=arc-20240605;
        b=GNZ9IdSWc4Aag2TRTKqVhyZ8ifqdhoFJhB8KoScQ0Zu8OlitMLf1RB5PZ6XUB+Y1Pl
         09pnZabK5ezkYpg2c9YVAjGWhHkk+C/XcD5Nqc5xiR0U4p+zGTXp+MtICWk6zXBgRud7
         A29iRz7AMTyYrOSev0+FW5SauXsbKjtIMqJElHuigToJ64INABLUVkmANqC6YVj7ZORP
         gNnqSlhNC8VlOptyGglJk/LM8pc4ZkC24lhWK6B9KfH3F1MILP/91TTyqw26YutvE9Cz
         aY7vmWGphuHbdex7JiLgmXv4GM+b/lcO6Iig1nNntUlON9u/DxwXmavgKJFnPkmlzoSZ
         3qAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2/99nRZ95IjeVc75LvwCdBJOe5YtV3DPyqkMVVh+UtY=;
        fh=JpDcY4rDkemSFp0nVB+5mjeW38p/OQB5rmjJB4tSb4w=;
        b=MYrKE6EJeChnM732ghRQlAS3QqgB1jvUYxa+uKlg01UGOcsseHptCWf9bIVXdbDALI
         u4STADkCK0zwFihwZHpZdnKDdwYsPXoZxqGiVYsYOdAFcsSo5EbEkLz1SoZaqC4zHkET
         PE0aWnfyXWCAfJtlC1xhYahS8cfQ+cEQu3c+De5pCaFG8T8W92c6zh1KWcOPXQ5xuDYr
         bcOQOJk6qrRb9FEDIZzRMPP54yyvU0q9mI94genxAZk1DJMhPJDO8K4AmxnLA6h6M/n/
         2zoMezw1pyCMLm7KGziGqPGnaBfacqTM7NZ+VCDhYNQUeSCvUYrYHIXpv/GJQLWpVUu0
         wiOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771526303; x=1772131103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/99nRZ95IjeVc75LvwCdBJOe5YtV3DPyqkMVVh+UtY=;
        b=lRqbtig41lHNrdbdBaUzZ43Rf+XA7ck53+91rFcddvC7d7m4MQnvMAQH8I9lIa3hfA
         0+jM/du7tjIVdNBpjrta0aPS7E+tT6hsZy96gQSvrhiFgGk1omIxTYF1TBxG6J+rQTEL
         aewzulx95IxcTRZw7ZNwXYQcvl3BU6bjlHe0czftQDYZDiSvbinWiDiqR0LBLaCUmbM6
         ilkfNglEYwxl4ZREpFYPvVjf8pT2NQrPzGR8KVLQzz3/4o1kLjgNNPDUSa5s2ixs5NoD
         Ohi+i6ox491Upf9pZBDIPH+ImXvbc37J6QndA5rDYhJq+vxtU1HQGuEh4irNpFn+yq+3
         twsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771526303; x=1772131103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/99nRZ95IjeVc75LvwCdBJOe5YtV3DPyqkMVVh+UtY=;
        b=OKur+JuyM/CMqGN8D7KbgmPj/zZVIuGwkKO8FnIOkRsnGEuWwywku4FguEmA9/tuEt
         I6W0nrG7T1A/+arfzsP3tGUU/hpP+hSU8vhgqIodayGAWYzta9Djh9XdSzQtHJ7XTrtq
         AapnRAgL+RCFnRrbqVNxsJ0edNZxLqdkX2J/AYVrpfHsrDa/me5QP7/gpkb68WbEOhSj
         HpsPIC8JFfduOtv+4BRTK12ba2OJ2rmR+9oVY1SFySf2mXp7oNld06t8Ckgvcy9ZrqBm
         XRr045D6dweT4DigqsjMYM3WeM9cslxghp9Uh79PpZylO0VR+RC0qkG4xuFxRiVZip2K
         07iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhx53hFNB0gJSA0LmLt/D849Qi9ta53uSgTXHl7W4qnHBq7DmuXnyTeXnBDSAtItBvh1/2ncScIpH9lfPscA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhgvn7kx08pJFiLlSkWaU4+3RMRsw47UKAT5qR+Pv8j5PATccl
	CREbGYymwKs4ruIT3NLvWnoc3Qa67Eq/SHfc2vZ/S2qkfBC9nwfkXL/pCuQOKuGS9fimY35M4js
	bXoQbHnmULHsEEAP2GJohA3j9sYWXuS8=
X-Gm-Gg: AZuq6aKuN0smeHkL6PtrRX+czm3FszNxkJhNFfym44U3O6gqmDj1SfmUJPbSQyx6LtZ
	wBlT5eV5EHd47856JdHeaD8XbdIevW5kfRGRRjPvVvc1/Y+jikC8m+hv68nQKrgTN4uVMU7vx88
	evsguDHObBmNDafD0QI+6cSDP1bZtnuukSRl+5vvNmUoPZ3AuQ8YAfaAZbOULBgplx118tLzMdx
	rhZcCHVQ/+gdNvoGAVuQNN5diF0d094DIg04mV3vKxDtIX04fpQRoTD9C85ol+3WTRLRmN2NDiW
	gVlarEbVIrkINWVGhRjTYeE1jEgqiG3/iO6VOI4T6HcywMZO/pnaE/VGyDBldZ45bSgc77h4VV/
	MR+DK/byADLbIS1uak9/mdng7
X-Received: by 2002:a05:7301:9f12:b0:2b7:ff3a:af82 with SMTP id
 5a478bee46e88-2bab9fdaf9emr5325750eec.1.1771526303423; Thu, 19 Feb 2026
 10:38:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com> <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com> <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org> <6a2b1bbe-7a36-4162-9110-a00eed69f156@nvidia.com>
In-Reply-To: <6a2b1bbe-7a36-4162-9110-a00eed69f156@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 19:38:09 +0100
X-Gm-Features: AaiRm53j9rn-ZQL0hiiQAUk0BjVlxqB7i8xeJadkWVN54mZayvqJi7_JF18SlVU
Message-ID: <CANiq72=2Hx9QYbdFee7FZzF2tt9dzAOs7A+xe=tAXZi3_o2DCg@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Dave Airlie <airlied@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Nikola Djukic <ndjukic@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 7:07=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Yeah, this is a good idea. I am Ok with that. Alex/Miguel, you're Ok with=
 this too?
>
> If all in agreement, I can make this change for next revision.

It would be very good to get you guys (and NVIDIA) more involved in
general, so thank you! :) -- (and Danilo for proposing it)

Do you want that I set up a branch for that like `rust-ffi`? It is
usually what we are doing lately for things like this, and slowly
splitting things into more pieces. I see you both have already sent in
the past a few GIT PULLs etc., so possibly this is not that
interesting for you, but we can still do it.

Cheers,
Miguel
