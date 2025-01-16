Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD3119D8A0
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 08:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737016376; cv=none; b=sOHxHubayOyyUNycvJAhBMyYZpmg0lL6hvnZHrUa3s8WKqNOadLZ+E8lVreiIT0bZfwIV7NzObVXPDMAxyGO0367v9gctW9JEsF5MqSWAqqIH03MQ72Md+MDvhPO6PR6xZwV7JovmO6dhPk7Sc4aGZScAtRae+kgo+XDj+DxXcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737016376; c=relaxed/simple;
	bh=kJ6CIe/Y4H7WjuSViRjZaVlg02+ifEvjHsN/NCSpWIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpQsSiZy46hqe195cDyWu7dKdZBQob10fF7jvluqv2h3DqlSLK2NRMDgqXGTALVfeFQ9WmTzIxkhAi8LMKWkvOXED8amuwAPbMxW1ce1DMoKG5afSQt74tFef8vXBKcs7Mfh5hB0/7s4cbDkMegth31FdrCHeuJcuMLkyJFX2Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aKEUsfLq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aKEUsfLq"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so573415f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 00:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737016373; x=1737621173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ6CIe/Y4H7WjuSViRjZaVlg02+ifEvjHsN/NCSpWIA=;
        b=aKEUsfLqfk8/fOnFvOEGk55nJ0K/1w2uUVgZ76rle33eQSLbFnooykJxgE8nyzkgE7
         ESxpsjjOPyInxU637HJjYqm5PM3Iwx9FwTnEI7KoczZPeuvBL6qagqKcSZf7YYXcqUPb
         yDshcA/u0yH2OQfd3uOimg8+7x/2rzzS98tguNdcGOlDZ1gVW5qSBXxKXE6OWr27iTKg
         4rnibIH4eN8xUFmhtRvMr1omzbfW3daoEySuPVpjA/aKB3UwcAb8ok0phhR1Z3N/fgwe
         w6t+n71ETuX0qvudAj0nfMALytrd+TrewNb3nSDp8U0k1EuyF9+SfZlUBLmDNLC1YfIc
         HRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737016373; x=1737621173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ6CIe/Y4H7WjuSViRjZaVlg02+ifEvjHsN/NCSpWIA=;
        b=AC9JkvntqDBWI7r/L866jUwzZkQg0H1I2qxmAAPmg+QaA9MMGHncEfwCexFqvFJdKH
         PbzP1uFVDCKVYC+Nnb1AmEp1eO3blT2bO2KhBwa4Leo5Y0QCSVBhaXJre80XPT/w1hPH
         ja3Igt9DzWNhvBEOEQ4FRH3o9FfOuUEYomAj3Q51ZxA3FUuf4HxrrdiO+THyr30KbR6e
         HxaVdluUdPwMCF2Qyqf1lApopW0S0M90dRwJAlDGOpVdHFLIPyxf5ttrceOjvYCFFh1R
         P/LCcnuQyvdfTOYM5tDLwYxoI6/dpbB7IDwjCkgDroS7+UZh8I/nGnUZtoY6RShi+8cO
         TCCA==
X-Forwarded-Encrypted: i=1; AJvYcCX7R9Q8pMT+rBFTgqvUNhnN+2IwtMc4hw0neU40NNdk8ZmD+DopTaWIFun32bwkgFdM+sHiOcC8QBcdm17P1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVTM7zWWqmVeOTroJH3DnfPoOUvmPbbrJ9V/sine+wHDvK6a7C
	25L9YuQcbXhi53uDAZVZtv6qgtHuAqWesjZNWMR2R692INMX7tsBisYysClDDjNw8HcfLn9hXtc
	pT0V/EUsV/DQghU7kMHv6gpdIz1N0qyeTZn7+
X-Gm-Gg: ASbGncu5iAPJihwCZLt++yveeWtRtxgKpHOg7AuisppnSv3fZn59AU1dYHIEUaphSRi
	RIhckgiw07afT/7JYrGjsSD2febn3Bo2CqDMhG9VGoM7IyV/WuHEGQwTD0LAYPwY43ng=
X-Google-Smtp-Source: AGHT+IE+jsBrPXZGdbayPbLY/juwtdV1VqWJKNOBWq8IuOIMNKuq9E3g4Mq1uE3OxPN8wLJ5UzDSOrorgrze70of89w=
X-Received: by 2002:a5d:648a:0:b0:385:f0c9:4b66 with SMTP id
 ffacd0b85a97d-38a87313097mr28319779f8f.33.1737016373051; Thu, 16 Jan 2025
 00:32:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116044100.80679-1-fujita.tomonori@gmail.com> <20250116044100.80679-8-fujita.tomonori@gmail.com>
In-Reply-To: <20250116044100.80679-8-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 16 Jan 2025 09:32:40 +0100
X-Gm-Features: AbW1kvZbmRmM2Oa_zh0mN65XvGmmvLS9EV3qIH4ExHRuACPP5fFY6xEcjuHFX4M
Message-ID: <CAH5fLgiAJL12HHxRmmJNer4JirJ8Fex0Jbazem17uafp2gtidQ@mail.gmail.com>
Subject: Re: [PATCH v8 7/7] net: phy: qt2025: Wait until PHY becomes ready
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, hkallweit1@gmail.com, 
	tmgross@umich.edu, ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	anna-maria@linutronix.de, frederic@kernel.org, tglx@linutronix.de, 
	arnd@arndb.de, jstultz@google.com, sboyd@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 5:43=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Wait until a PHY becomes ready in the probe callback by
> using read_poll_timeout function.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
