Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40F21527B4
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 14:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761490171; cv=none; b=mJTSoDJsx9M93bNnVBmxOGqkdpwJHBPNw7rzXRTkcV2aOocQ3NyEGVod+7lbBk6mM0Oogy8FhkbwlhsrDGr0cQtH64KIP4rZC/87KDM0PhIVdqDTuhUEguV0VluLQfZqcz1GQ+E+5MYrQEkSwcaYDwI+kzkCDXZ4zfEzXTT/qkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761490171; c=relaxed/simple;
	bh=acZ4e+1KY6LceXz3Koq9xdo6+VSQuOj1Oijaluceq6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M0QD3nfjiXF4rRWb39lL6rkiKRlFQibZ4noXnzHACic15hNtI9dyOmJ9PdWWq0FE8D1MHqyUo1zj4KrCYwjht4nIfBJ1krBhzFK85CCHRMHyToYdIs9rYZWh1NiJgBdTd3pHjGroM+ea5SXApAs+Hjszi/vCk/HxHweKRH5d0cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQK1HyZB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQK1HyZB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-26987b80720so6589965ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761490169; x=1762094969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lb6ES41tqXu+5foRoOY9F6w8rssbd1JAOpMDC5HrpGE=;
        b=RQK1HyZBMKWXja4erMaepxLlwIggQ1qE2zekGkybl/ApYejLYfC+yOFfiSS7LeobMj
         7Xazwy20lIfV1CDZez+wH64HaeOhRT1vlupGADVHzZNLAPk22aegvVDXJJVN1VFrALB0
         Bq7ZIlh3FcZE9jmt5Qz9NilV640S5FF9dXfY2EvnkhgwlMZIfTXw/wF4Nm+r1fjY6gTe
         jWkOIDmh7Hf34IQPnqerLdwkF/cpIsLqWFR5fDSPShpoqAthG7Gl8YUOpw2ICMaXEkZ+
         ursGZVOewBHqBWkP+KbDBieJ45yGHc2GMLUrhqxSIL4wI4tNK4kZu9dg8Ixs2ThNZF+a
         +g1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761490169; x=1762094969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lb6ES41tqXu+5foRoOY9F6w8rssbd1JAOpMDC5HrpGE=;
        b=mpQ+tssCoKabCyMuu9EG8yrQN5r5K2p7kNE7Yck81eN+uh0LusBdv1dJufk0kAeaqa
         kc0CCi4r6cCY0cdnVoqZKUJInQ8j85jcHDbOwkv4hhWDbUPv/KEx/qoBQgzPU1Ah+mA8
         WcL/q5NaNZuc2jsnhXwdutW+9kH9oq5GhJneipncEwf9ZaS6OyolmbEjy3g8izn8o1PC
         5+dYLYWQIY1lMQdU18QVfqdv/CtA2mGrCy0NAK0GTu/3hh0Jwd8xeFmQA5CiH2s72zA5
         JciN7S5Cyz2tKSw8pRv+RRO5/W6j7V0tCnhh6GxYDZ1sc74qO6NOBqitrY2gRP7h+cLu
         mXng==
X-Forwarded-Encrypted: i=1; AJvYcCUbHJTGq71eIKKhq2rYfSPr2/M6Yk55AxRpokGOZJ2PffWZN1rNKp9UEETAKmn7b9veWBPst6Tv93SsslR9Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMeTJTsGXdSjPp9LuQJ8ILlhCk256/MoVsXlqsem6WqopQD2XM
	bk4oUFITxu8BSFvvPGRYd6pCb8YaL9s8qKL46c1d5Uh2UGCT/76H2sKFXwcqIZDZTTPR5nPyQJ7
	pFIFvtu3G1jYiHME/c0M9nDOmFE2ERyQ=
X-Gm-Gg: ASbGncu4x60+V+uPe3rGsEuJryvi55lp09cwZnJnDPSxW/c7d5N8L/u4tb08tMblUn1
	SYs6OGN+v7J7duUEqrdO73HCPBg3Y5tCW73DSpm1juNOoFSO4bgaytHYjhpiGJn+yo/ii1yCQo1
	gNrnGi9ayaNC+IPYQUhHefHdBFNok+d4BkaQsqcFw5zu7HNildoSBdB1iKzPs6zdMZhiAb4r7Rj
	NJ0rPnTaRuO/m0Cm+aAL0sFwGI0tOatO4P30Ff6WnKjRVHaZiJ5QzWIxbnSDRs75NA7o/GW+u18
	OiCeRnHd2j/fm+jCKCRpYxXdWwU5Jtmg65SPdACVP/k2VDQvJBGmJUybyr0zcnGXlgWjcHQK/WM
	j9nSV3Sr51IP4JA==
X-Google-Smtp-Source: AGHT+IEbq1idU6mFUHaEkLHxYClYVOJgW4+NCUJadAvg7TkFzSAWnge1vJm7GcM3ks9O9zyxp995r9uERHVQy8bNrcs=
X-Received: by 2002:a17:903:120b:b0:28e:aacb:e6f7 with SMTP id
 d9443c01a7336-292d3e61e60mr119561235ad.3.1761490168926; Sun, 26 Oct 2025
 07:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <877bwkhfrr.fsf@t14s.mail-host-address-is-not-set>
 <aPtGgNajcXKWpji0@google.com> <CANiq72=wkL_tfmStR1HYOBsyV5_o41YXTtUsCM5t+i80+urxxw@mail.gmail.com>
 <20251026.221126.278291666422815679.fujita.tomonori@gmail.com>
In-Reply-To: <20251026.221126.278291666422815679.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Oct 2025 15:49:16 +0100
X-Gm-Features: AWmQ_bk1MM-IWjmjcUhQCFzYQ8EoO_-8B_XmoPKX-aSUCiL4ZygZDVzwkcDRXBs
Message-ID: <CANiq72nVz64-8W4rYK=oyexMugW9YD7+eMGhcbf9W61kW7Y5tQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: add udelay() function
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, a.hindborg@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, alex.gaynor@gmail.com, ojeda@kernel.org, 
	anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 26, 2025 at 2:11=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> I've sent v3 with debug_assert! added.
>
> Is anyone currently working on pr_*_once? If I remember correctly,
> there were a few proposals in the past, but they didn=E2=80=99t reach a
> conclusion on how to implement it and never got merged.

Thanks Tomo -- I think the latest was:

    https://lore.kernel.org/rust-for-linux/20241126-pr_once_macros-v4-0-410=
b8ca9643e@tuta.io/

Cheers,
Miguel
