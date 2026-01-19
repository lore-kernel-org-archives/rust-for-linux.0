Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837C032E148
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 17:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768845585; cv=pass; b=hPWngKKY5xE8MJaPgpd8DjUGglULb9Z9dOZd1VaYvoWPL5pzrqX6KIhdrb2A4qs/wjnSUsHDl2QfXxcyJlzgU15WjxaGYMGUDK7jmnJ/dEj93c11vRkKDweb1w0rAWf7//itR7noXsWJkfB3n+hxyjwsmaIprfYaIpZBi7ySnFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768845585; c=relaxed/simple;
	bh=fHiHG3XGd6NwWX9Uy0EYY9n0lY7YFx/20ows0FCUdeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gwOjM9Z1LhYsR2Sale4ZSrXYclX5p1dbCT1krl+5x9l7qZW5ZBTlpIqn9G+il6IecNtaTkI+ddlfaggF7ojeiPhsH48DByyHJka36cJ2flTtTMNhOuW/qUvNPzuX3/Y3sIfqWi/55phW7r4xTeItMhyZm+ZKt88Sac8DN3My33o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dII3zRRS; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dII3zRRS"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b6c1ec0dd6so268123eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 09:59:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768845584; cv=none;
        d=google.com; s=arc-20240605;
        b=jru5NpNLUJOZaPjMMxTURyfTT8b26WaVZBDdV8t4LLXu58C7s9diCJ8MJ4KwYWux84
         VJp6APjEpKcfUS1IghiwcLIRRBT7o0En2XPmbmlF0YA+B2YC2qjgRtUB1b3AHk9aEyxP
         TpgungUCFMGV0XOvvhWD8YfrVF+7/bLehfrmDubvLyWEgX2IiVH/lT5Cu26PeS+PgdLa
         O5S81hriAhWSaqDZBJabYrqFRBtYK5L+C1GXcdTsbNkN/7qJk8cM6b6X1oidqS/B+PpM
         uxUb5O9uP63PGw5d/6aTh2TLpTSfdHqVCLZdTUUVl7QvdrIK7NEFwDt2DkTrPo9bDJSN
         OjEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JlWBG2gf5cflL1pmTjExB8oZFgP76EDRjk1UwBZmEDk=;
        fh=MiD6giACHdU+0Q9lfzPc0PLlZJ5vHf5QM1DhWNbPKH4=;
        b=kNiBK6VYpCiYTpVoJqiG7M0GM8GTBaIQrLWGgPVVjx3NEf7+Y6jecJDQlHo4WrZ+uF
         OHZyWwzybo5q4sgOWK9FdI+pamBmkiViuGJ1nkPKb2JhU+WIGv8DLOL74aIlLtlGdO3i
         c4p9lOdns+R1RYitVe7dWDlpHMqP2H0CRQYQKc8CKkdxj8nk/nz2Edqh5W2lu37b/MaG
         XaIe+ktkZBzjOgs1pBYNuMBum/HmO3mHHztAFxVp/yuuT7xecca+aPLYn/UL2YzkQP6A
         57abNCY7QPdth2AVvwOu2TfUYZtKE7/NqEZhliPTmFpgZF7Bag8wr94VBENhcTvXsyyi
         mLPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768845584; x=1769450384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlWBG2gf5cflL1pmTjExB8oZFgP76EDRjk1UwBZmEDk=;
        b=dII3zRRSwXOC0hGKPazhNzc40s1nV2FPNUi+9jbYkYh0lMw/xohoj04JuZQcWzzJh7
         tubXvVvLQw0M4e40BI2L/8in8+iRmw3WV3OUNk4JVXsJKbTriNvG2DFjepawnbeR4J2w
         jeSzFra8xz4ZQpSDvzeMpZSEJBVJDDs62icCpSMZGFMbKHaXvH+G/LtmM7ZJ3E2IdDCR
         q38HUX9QvCiKjRH6dtoWwJLR2gYAGeKPrm2Qgk4kNnKGRV2ev9IQ7t2F+JFWMaK6TAb2
         vG0tYTZ9yuEVCESDr9YyIQ/kI9fxvYV/tmf1h0iymnuNjaNoHuYkZ75kyfC4Re3CUfQ8
         k2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768845584; x=1769450384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JlWBG2gf5cflL1pmTjExB8oZFgP76EDRjk1UwBZmEDk=;
        b=oTYzdIbrhKBZBq6DJfp+i8k4fVADWMlBQVxE86RLm96LjYAHfU9pqFoXiN+7lElqI0
         GMHy4vmyQi0V/+w7encGbvXGEdtBVT4izKJ1F8pMnsW4Hwb0faxOEbL8t4uo2eLsKVX6
         1jZb3bkKQOznNdKAVlnxM5k0fLEwC1ym0hXGQr4hxx3j8HsCns2NotaoQ5l3DrmxaXTu
         kF+zTQXB1mVGRkgc3MTuMkv6Gonk6uHTljD3KQfUzuAGx1ZWsb1BJIDkTbo2tFXDtaNa
         iwmBuCUy+L+BQlxaQyN+vF5/+qQS3ns3SVAOTCRPm+b86Y9Ng0Ef6wnXzcdYX8ZkIgdb
         st8g==
X-Forwarded-Encrypted: i=1; AJvYcCXRrJjI87vftT8sjWT8yNNmCNyS4j2swDuzo82nlnUA1pKSttcRKlmnNwCKd6hnAsf8RVq0oKGcm/zlVf5jGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDehfdwFmAzDak+u5UtHqCFSEtucspN19NLBhL321p+jX4lU3y
	ysqc5D4IK1uOpr4rJ+GIoMYgyyNq6PmnMBFOsdzEOv0ox+Fi5aEGnm9o/bVXnvwMDcR3Im1lA4T
	0RUgBmJgTgj9Y3JxNkD5fO9hgtIm2vJE=
X-Gm-Gg: AZuq6aIHKXo5jPsUDMjDIfANwne7ujIwDNSam9tiFx8wqmp/D83xOGu6UkRAsYTZ0Ig
	RqBuPBMlfWgbmd3XNjO4tBMozxblLQ9eg73PD/oxPzG/0dWVAjD+p6dKVGGKgxroFe4VQJJof1L
	NyntoTcdGPZ3IPQeEjmfP3r8iMCtRNx7WP6kilHPBkSkqLfh0KzI7S2w64bWEQ+F/qDwtcjt7M2
	1KlyWyUqn4b0e36QBWQr7ed7cV9ajccIoYrD5zGbI7YSs5Kzo0BTdzStM49ZyAzsSzdIjueZnIS
	HLPIuz7K8wr85AtMClkbyHI9EY+OhPpMosvsxYTHA84N0xAI3Syn+eI4DXDh9JOhir5xcwqw1mc
	aNaj2MovUWC/U
X-Received: by 2002:a05:7300:aa8d:b0:2ae:5d59:3ef6 with SMTP id
 5a478bee46e88-2b6b410a06bmr4815258eec.9.1768845583491; Mon, 19 Jan 2026
 09:59:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-vfs-v1-1-18e3d327cbd7@gmail.com>
 <CAJ-ks9kDy2_A+Zt4jO_h-=yzDjN024e1pmDy4kBrr5jsbJxvtQ@mail.gmail.com> <CAJ-ks9nZA84HYL_7+raFvcS1G77O7FyHk7_fsPMYuv2K1Ecp8w@mail.gmail.com>
In-Reply-To: <CAJ-ks9nZA84HYL_7+raFvcS1G77O7FyHk7_fsPMYuv2K1Ecp8w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 18:59:31 +0100
X-Gm-Features: AZwV_Qhp4p-_hjdKH_I_kqS4f4SnusBiM1f0nziIRKxUS8EC-vyWKyseHtN4Ck0
Message-ID: <CANiq72nFuR+W=sKMgmxx3VjxtrWGb66N3UBP6ZDG1hhhU9Bf9A@mail.gmail.com>
Subject: Re: [PATCH] rust: seq_file: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-fsdevel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 1:53=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Alexander or Christian: could you please take this through vfs or
> would you be ok with it going through rust-next?

Either seems good to me, thanks!

For context, this is part of a long migration:

    https://github.com/Rust-for-Linux/linux/issues/1075
    https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a9152403778=
3@gmail.com/

Cheers,
Miguel
