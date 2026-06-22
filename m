Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BBB3A16BC
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jun 2026 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121490; cv=pass; b=SnGcUmC/XlniNNIKdcRVF/LJo/2Q7HjaekNJixT81RKqCb7+VNuqBysZqMlC3pFWkcg15LrNg4Gx51yfp1d2U5V9EbW8uszh+evkPw/KtPNNCfXFWxf3ABMXroW8PdYjREKbRhIkZdznsuz+NhWpxqQPpX6E0zINReHiFXMc2aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121490; c=relaxed/simple;
	bh=vsc9loLMj+rHFEBUBCNp2xO+GJ8t1rptDqXO0OMBK78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3gpr7hszDYKoSQLgwvw+nrChp0UjiOoCdOo0sqqHEu183CtYhx9LWbbN+q9RTLwlEVooT0sntQZ/xHlohtHiJhMiGhDwUE0bvphJNkKwVwTib4QlVCsTezBZ1O/d+Wu+25PWqiVy0O7570zgI2g6LaelloO0GeCRa1S1Qbbdrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcrRRhsB; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcrRRhsB"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30bb87c90deso502692eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jun 2026 02:44:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782121486; cv=none;
        d=google.com; s=arc-20240605;
        b=T0VIrxUo/e+SglixkX2LLd3ozoFrJ24KXG/B2r5H76tKO4xZMFZADv1J8xPo/+9157
         Y1D6GarWpXuWx45snCchtGiAmS9eCK16XJ1pQYZESyuTtZ7ilV5CsLIUvVzSgnthcNJt
         OM+db1zs2RVwoi0Ec3JDEtI9L1OKi/vfMLJX77Igg4yPUpPZWIZo85ZmDbNHzjIxy13E
         3xd0lzleq3VDLqor56o4s7KpTUaQisYj9wg1jUZGoQ4yIvD3/KAi0ps511DhzHW9NPiU
         QXLrXdrTqY5IlCkdol494dU3t5TaiKl8JqgrNl+ZqeruxQFno3vpiCFxOGA/2r0/eoxA
         lyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vsc9loLMj+rHFEBUBCNp2xO+GJ8t1rptDqXO0OMBK78=;
        fh=4xFM8bTWIWUVwDs1k/mc19ME5VPmDi3MvV+5Y/yaJbE=;
        b=fCs4woDUUKhoYLnO/VHvnY/P+70VicpK1DQK8iSmpc8H56zanF1R79m6A5uICILv5q
         siN5tpQUsH2S/Kk1ULcpQ3MPl4kRvFdDy+XfJbDjZI0f19F41B7emP9s4UEHIO1ISDXd
         RS8Tfj0h/09Qpw0O+r3s9tsh0nJk231nhd8O6bN4dOzPL7CdIpOpq1LL4WRLETZ93sjK
         0LnROm636qoppH2TeOht/UG7lsi7fL4GyMt147Tv/RCA5fRbX0snS8P+kO9wqqoHDKAw
         izbIVNl/n5QOzHqdUBW9fGA9IO/U3RTfjrjaLuhc8iZex1hdIb0XGhmFOl77w7njHmB/
         iIEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782121486; x=1782726286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsc9loLMj+rHFEBUBCNp2xO+GJ8t1rptDqXO0OMBK78=;
        b=LcrRRhsBK2ga1LtufnjUkHynhBenfsutA82SV1RDtZyooVFXjQMDY+jDfuUmVQHrIU
         8Z7US4W/GsN5GS2lpQqkyXTEoFjRlZYRsLyQ878VSrXYQwT338kLlnZf7axv20ux+dqu
         D2FUmYULIYZPtE5uLw8clf1D/SjrxiCc5CaM/cSf15URt9kwBGOX8j3DFLdlYVbZImY9
         u5bLOA8dcGHL3m3aPmeZ34GLMHaPHhNI3H6e8l2gN8V5MOnLBvPy9oU6oLVOjRb0pGfn
         b0EvL/b1tmqOcUW6EtHiynFsR5xENvOl0Wwfsm80GtDfRL0xB/Y27gQg6rLcLFrXBycK
         OsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121486; x=1782726286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vsc9loLMj+rHFEBUBCNp2xO+GJ8t1rptDqXO0OMBK78=;
        b=bOdRKTqIKBfVPmrS+1y3ndIcvGjPLGDLr0qGk58dnV5OdWz6UX5OOCCLZndoUfwomz
         R3S6x9BCHPliiz7hygZ+kO1AWYr1O5EVoqti0mFJtJh9mYdZiwfMNjenDIHMLjqolWH4
         X0RkqJO8nbwY3pThLYKwHs8CMxXdY9ZH7+3jd5dlMCKBA1Tj7h7zEWc2flOLZZayLMCF
         IiI1a3Nmqnc1EDHUUWCzPYWsnrd3oJLidtRiKE8HrymKt5KmNIT7v022R2tmT6IrnHmE
         qoD6Ufa7tVUfLcS0k/EzLiU9GfyuCUBLr83x8HRcSAF0eQAoJhbfgjRWZXKV745WoYPc
         oHag==
X-Forwarded-Encrypted: i=1; AHgh+RpZjMY5b2SdnHV38gq4JrDchZpWW3xQrtq1KEsilKqFOb1FmRa31erb238Nyo6e3bCvv7IG4hAbuY5DEgPQDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsTze3APUJJn4OPVDiJE/8AXpfkz0A6JSwEl5L0tUvFHwSTm20
	8iQBmVDIMpryD8IqP/3suhmOOJ0Inz4jgvcB42YWALgiV3e21MOKY0O4kRw30CShHtK/sYx1PPX
	WwzW/Aa08RmcZE8kzaHAdRHspR6faXAw=
X-Gm-Gg: AfdE7ckM9zpsTzfBYpuhZedHg0CQcRRsYVGD64/GewUP0B6iAVmGPDx7PAhyNRTf4rF
	witJvoyWVo/10pBWi488iXvTbrlvFv4kLmVnls5GKxNConmH5oFWmdyheVT3kzr8R6Pm6qStUk7
	I7PBGbNZYD2K1d3vvxvxTt6iKkT7ugrb8/uBLZkkM+/6ZuTuVnlGDIQaNtIxmQalEM8NXWUwQbz
	tcydNkodR1dNBsnzll1AzoRuH82M5EFIGNRtNp/S6VHSbc9LZpOIKQn0YHTflqPsBRCBy8LsSg+
	wrFu2NrsLpkVowrHg6f9wkS9HgzlkLEutVP7xrUcvchuGf2CiezwxVwy7hFibI4c4fQDBW7i/Sx
	Lh7s/i0A1vxr2DeZR0k1bSb4=
X-Received: by 2002:a05:7301:4885:b0:30c:48e4:972e with SMTP id
 5a478bee46e88-30c48e4af84mr353817eec.7.1782121486020; Mon, 22 Jun 2026
 02:44:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819003824.23019-1-contact@antoniohickey.com> <20250819003824.23019-2-contact@antoniohickey.com>
In-Reply-To: <20250819003824.23019-2-contact@antoniohickey.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Jun 2026 11:44:31 +0200
X-Gm-Features: AVVi8Ce1iY9weUWzCRVNQ-RiS0tWpcouPVjTjzsM50zmkhDa5tb_svHtLwDio8A
Message-ID: <CANiq72mYBkEi2yAYjDa3vxNkROa7xp2bt88TFnbvHjPR59dXOg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: kernel: create `overflow_assert!` macro
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Cote <danielstonecote@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonio,

Someone asked about this old issue in GitHub -- let me take the chance
to give a couple comments to resurrect this series...

On Tue, Aug 19, 2025 at 2:39=E2=80=AFAM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1159

It seems you didn't reorder the tags as mentioned in v4? Was there a
reason for that?

> +/// This macro only has effect when `CONFIG_RUST_OVERFLOW_CHECKS`
> +/// is enabled, otherwise it expands to a no-op.

This is not exactly true anymore, no? i.e. it was true back before you
changed the approach to use `cfg!`, but now some code will be emitted,
even if discarded later.

I would just add " if `CONFIG_RUST_OVERFLOW_CHECKS` is enabled." in
the title (i.e. first paragraph), and remove this paragraph here.

Which is good, because it also means the important bit (i.e. the
`CONFIG_` part that decides when it is enabled) is in the title, not
buried in the third paragraph.

If you can fix that and send a rebased v6, then it would be good (and
you will get a Sashiko review by doing so, too! :)

Thanks!

Cheers,
Miguel
