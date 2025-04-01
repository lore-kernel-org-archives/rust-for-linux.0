Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1810419ADB0
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Apr 2025 14:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516495; cv=none; b=uIqcV8z9kBNWPh6g5BZ0jFIgSCaWUq2Q9HJNhxhlqlLCLGp8sk27erV1x8ULG3AiWUiBzUH9JYzASwSJAWQ8cdEoe9jLWababzsC1gAy29ciOcUT0vb/Np2mWK4VUdCdH75RwE4lyvVwKyYSRsPr0pWSMMsAMd9Cay4mMQN8l4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516495; c=relaxed/simple;
	bh=p5XOTDCwvIgK+f3k//USoxx2pq+cEvMy4idQOYeZW+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbBPEx/x6eLdYhAILDlT+k21e25aqDsROBwQpheTO+JhJI5DjPvwkEgNyZxmFajuWHY28ITWHaDTMAT6TYEq7JRXMk3Cxr3Qrnq7MyUEJNBH4nF6s2ADr3bdyZvZYfwAioSqhuKIXH0+OquW8s5qt+0GBXlrkKV7+JQrDnZ086s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqNR0fnD; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqNR0fnD"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301a6347494so1341764a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Apr 2025 07:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743516493; x=1744121293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5XOTDCwvIgK+f3k//USoxx2pq+cEvMy4idQOYeZW+Y=;
        b=UqNR0fnDnNAHZ1vT9SL96Qeuv1OxLk0bdyalY9uPlV9vK3lf7RM2j9yN1xCDKrbUzG
         p+dLWTpuw4MLFU5GoXp1dwA60qjYD3NI5g8LpcF8qNsGpsd1GagjQSKoGi1UJKBZlVZf
         TX0T7bvuCQsm7vLkaKvt/YNu4xVAVasZyLlCU+mMRWgW9hmlYYXffsSxKhSWxcLwbkfB
         BgCgzmB5n4rnZiNyD3DOlMFE76labNDDVx9NrWf5dt0C2bYeQmoVUCnh+tWSUTZfWF44
         OlG8KUQux6bsvSK/kSVNf2Kw0+9PRAMQb4atbnLaxr9Vwzi0OqwGZ20250N7LBdH76Tf
         5lCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743516493; x=1744121293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5XOTDCwvIgK+f3k//USoxx2pq+cEvMy4idQOYeZW+Y=;
        b=jpJZNykMSZkL03zN8WzjnfbjePCC/6s9sZmhcF0P2v53lfIGDH13Vokn9yIrfUb+OI
         MAc20QXnBwPlzu5002D5PYP262p7+nn85BQsNC5dyvOtz9KVkhEJFjheE4lQIF+tWyBY
         bZwpst93d7AEEX18a0GUlLlJSDqYmWqFIAGUvu4vIajUAbelVsFXMk11m4j5eDHrWyOD
         80TH6xC85wlmOdw4ntrpUdLP4V91oActQ/7q3vo32CJgXDllJJNgM63k5DFrHQQK6iJ+
         R41Ho+wTRksFrM8MrTf/tg1EywSe3Y9hjCqTNRYg288cPL5RtkRenPjGk36DwgNzSXAH
         1CMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWVyw4t8BsW+daVIeUpRaWLW+/7o+yCZQRemuXdYm5+I5FP2daiMs2+MFLxCrALuxOhG2HKSu4cMmbQoAMcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7V3NT1jH0ees04rNTb6zdzr51FYiI+OFdY7btbZqg5Ba6GtFg
	MRK0dVb5VL42TUy2kz6bq9nFTlJ6ui2yyLnclXERKAAnJntmr88U1oX36clv33C55pr4r+NIcKo
	3c2LKfKQmrpoYaBOzMUooTr8bNm4=
X-Gm-Gg: ASbGncsq/3O63D3o9Q9vgfeP3Qiez90+yxZk5P8o5rwNvPoQCYHl3HWbJ2OsLJD8g6b
	atkukaoMGgnj632p2o+oIdKnzGWOhJQ9q9TWywn+uVc0NlS7klG21C7Z/I1a/gJY0P3lfqn77Bs
	M/SHUiq9bfi7XFfKSU9zHCHzKDx+1QqHulgOC2
X-Google-Smtp-Source: AGHT+IFTB6EAqMZCScuvgONegUq8pnxSdidQ2+xtKv0H590kzRQ0yGx6TVSdxTZJq3RGy3cmsMrVQavLU7ey0D8Q1lQ=
X-Received: by 2002:a17:90b:4d05:b0:2fe:7f51:d2ec with SMTP id
 98e67ed59e1d1-30562d0a156mr1092793a91.0.1743516493268; Tue, 01 Apr 2025
 07:08:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D8S8C5W0FCVD.1LH1E86H6PXZD@proton.me> <20250331170118.1376899-1-igor.korotin@yahoo.com>
 <CANiq72ngOZs8idtvxP05k1TK8kcM+Yd7ztSuq1PaAoHHBEQBhQ@mail.gmail.com>
 <44928637.255825.1743501279791@mail.yahoo.com> <CANiq72nZsGcDCdE6ddxLg0daLnfuyKWkXzkb+j1PGL0kun+zgg@mail.gmail.com>
 <0ecc8ec6-eb5d-4589-b3d6-bbddcf75ae91@yahoo.com>
In-Reply-To: <0ecc8ec6-eb5d-4589-b3d6-bbddcf75ae91@yahoo.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Apr 2025 16:07:57 +0200
X-Gm-Features: AQ5f1JojtZohivMkp7Wvwf4hiuka3irUWV88eGNHHd3_oTvHvVSJfEihA0KiJLQ
Message-ID: <CANiq72kGT619QzMRBWL-4_irLAdi8hZ631tskGW2o0MP750FTg@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: quick-start: update Ubuntu instructions
To: Igor Korotin <igor.korotin@yahoo.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 3:38=E2=80=AFPM Igor Korotin <igor.korotin@yahoo.com=
> wrote:
>
> Though `bindgen` might not use rust compiler, nonetheless bindgen-0.65
> deb package requires rustc in its dependencies:

That is not the case for their `bindgen` package (i.e. non-versioned),
so I don't know why they do that.

Cheers,
Miguel
