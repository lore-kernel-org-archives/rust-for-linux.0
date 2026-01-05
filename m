Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31B9306D26
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 17:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767632661; cv=none; b=C0+MZJbFAtlSycLa4bVdQ2Jus5O8JZ49E5tgTW7MoRY6TJe/m8T1N1p3eW/hu9U2gj7iqpDT/VG2GPUwQgGptTM2b6TfiGuljFGPjxc5TlKMhKiw5v+rsV8KA+26+Cizz0NlJiJhAwaharDc2tRAYZl1m0d1lsc8HlMi98gukUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767632661; c=relaxed/simple;
	bh=ilLwR16RMLSpu+h/CI9vg5l2EA0Q6YCa+cnEWqn8Qp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ClQxjIPgt6IGx1MqSyD165GtGcdlKBBXaCDnu6gnXpfGspPBhtjIY85t0cnStj3/6SABgOJyORZa/2joCKM0R3lNlLN931RkJs2in4DMFrDT4ydqE7n5isMoaNq4CBNrppiBUaIZrJzRzWhz9D3jjADu+y1bSkjcQNsm9uztWHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/5uca7T; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/5uca7T"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a110548f10so275515ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 09:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767632657; x=1768237457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilLwR16RMLSpu+h/CI9vg5l2EA0Q6YCa+cnEWqn8Qp8=;
        b=S/5uca7TRCn5naAQkriEBsthVGQ21CQHyWgrSmHlUtdU4R0BQ1hipfI/JEpot1MGkr
         8/3Bfkcy5xRsAxSpEreYvnWfC6IRh5Dbt8kEIXBQ+VFAYGIHZGVLjkRofukT9f1KK71G
         XGJV3L3HGETcduISSK6bHnL1mhiD0ahMQKyDQewEbDmaVzLlGANWgXKJmJr8RIHUiYhz
         5friONdRHG3pZdNQdH1NxxRwjRjPIhfef1i7iRA+24oocyXH+G1snsOxhJttxLYSZyQJ
         3RPtcYJiePuZqN5+0y2T6kMPkbnZm0v+9/YFrQ01zUBdHcdoLFjv4ch0vzEU+IxZnGic
         w5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767632657; x=1768237457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ilLwR16RMLSpu+h/CI9vg5l2EA0Q6YCa+cnEWqn8Qp8=;
        b=bdTSFpWbZ9YMeLbTGEgDhqibSi9bZ7f+T4w7skl0+QYZRczew6ungKe5Rmy51xSzau
         WHCIFsUm0rXHV9rY34zaCSxJVP7w81p9/36eP4L8aPtp4w0w2olFIFokVfJg58Y21Lsm
         BX5n5FZLic65Ep/L/xgUldW4vXX6YvPE6UgZ/onlJYpdHpnlnlQMyWhcxW5aiKqq2h0L
         QAtasnWfDcFEyHGywAqhmkZiAyWfxs/gn/NLDyYIbelRToLjBzgd4J9XsOloOco8+Qrx
         +UpXFJNeufuWITrBMQeHPWWYo5BpXYy4TbxaLWMV07tuwQTsso+lNj+BGGmGJVcJEXaR
         ROLw==
X-Forwarded-Encrypted: i=1; AJvYcCXXGWt0DtXjMoYNmckqDsoVlODb80vg0MqB+mZ2mWGMWkt8dQ04tv/S1QvXHnhFAwP5jRllj95m6VZMUE7R9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YywlAInSY99Qbgq5r1a4jD0M4JCriftPosolfWm5n4ZBnQscwe8
	CEs2MKe838NNGItyPClcus8H0ghb0nONXKqQiUqEzD9Kpq3cfEp5cq/q4CJHl2jfJexPLsmagFc
	ECEas9WVu6ebxBlN2tL3IzZkqXTPywHM=
X-Gm-Gg: AY/fxX6A+DFigLrlpYMdbibuLDuZd8dQeki8aodcUYqfKOtYhRWtmsAENeZowb6owwJ
	skcIAzIigk0cJnPdMA7Amno7W+KhbdPGjjf9AP1tLjvW0+mYKDRyQNCugtTMfPNxrTEBwOo6DTt
	l3a6d1de19MhhlPJ5LlPrp42P/SDsEHU5E30aiXpwpvm1REWcZRtxftQxICpVX05U6cy25Y0342
	idlsZW6jEgnqyJiDiVxMrHF4j97J4OvsAhPjKE1VsZ7u4UZqbNCZGMp4gzwUv64WLRcjeB6thlb
	U8IYCa5PPqM9NKLWlD7sXMkCwxmvj/8CpH97YvOyemAlwwzJ8eOKjsubG60/iWFlS6AaHZ2A+i+
	kgWviUcwz3RR1
X-Google-Smtp-Source: AGHT+IF18Z2ptclTHFuI5wsbeS3aaHGQ6ACz7o81OJDeTHsMyGFuplXxLtKI31ZXLGQCJf+ikc4XnEbwioyMwcGjjFo=
X-Received: by 2002:a05:7300:fc13:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b05ec3dc45mr18785092eec.4.1767632657369; Mon, 05 Jan 2026
 09:04:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
 <20260105-define-rust-helper-v2-19-51da5f454a67@google.com>
 <DFGO7BGCVJF8.3K3G547RK3SVN@kernel.org> <aVu3RJ7wyuRU1RAc@google.com>
In-Reply-To: <aVu3RJ7wyuRU1RAc@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 5 Jan 2026 18:04:05 +0100
X-Gm-Features: AQt7F2p1pwTPcxm_Hg8Ccr7lNXQNC7lZD6XvJArrbZANtdzkwLBFOBqNVk9KPrU
Message-ID: <CANiq72mYt0xPNH2976OJ-9u1qUdzEAmXvzhZ_vuxrsXXf-m6jg@mail.gmail.com>
Subject: Re: [PATCH v2 19/27] rust: slab: add __rust_helper to helpers
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Vitaly Wool <vitaly.wool@konsulko.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 2:06=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Sounds good to me. There is also mm and maple_tree for Andrew Morton.

Either way sounds good for me -- anyway I will have to pick the `bug`
and `err` at least.

Cheers,
Miguel
