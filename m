Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7361E5B7A
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 17:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768154260; cv=none; b=aO0uBL/OuadY4gj3cXnSGWcJty2JOOGmsMnstFCDAxbpDFZ/2gcGpkM/2rPGCiCZUhmm2EiBpnp0Eg3bVz0cBZpNAuWM+Gur/QuRiU06Kv4P9EapEqXnJKZUdLNdVpOgjDpX2UNHw0RbgFrYLUtQIEUwnorMph4RQRm19tfhhYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768154260; c=relaxed/simple;
	bh=fbJK7xOI/xq6Tar8qezI6hVv8dspBtPq2Jhl4huh3nY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcbtxslvo3zoLZGEoVeBcp/TNd+TTts1MULo4jxJVwbXEdBiWoZ18ip3shPBHgocOUMcpbd87fDsCPxDWYzBocRpQAEZeDv3biwqWdjRN09C5tnqZzkM7S9Zy5Fx3a28h9ENsA96yuemmttzyIw6DsFM2Mk4ZbvUzZMRaxLNjr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxuE3rHf; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxuE3rHf"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b176db6de5so124609eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 09:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768154258; x=1768759058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbJK7xOI/xq6Tar8qezI6hVv8dspBtPq2Jhl4huh3nY=;
        b=mxuE3rHf/Gdpqbss+uKujK4jg/ftTr7Aw1KdFKgW5ryvOT9GdvcAR5rqHFoIt43CtJ
         QZe23wYie35xSFIXf/ds91Fn0KUyOiIwMALy+Ifpgu1k7QTz3yGgpYbf+vqZJzlpk1TJ
         e/lp1LWqtmnxMfGH0VHJLea6Ou230ZRKqlZwM7si+ltca/1TwgPJpZvoupYycrkDm3XH
         XmpIqD4rRe7AFTm7khy48+Sl9PHaUQF4/Sxzj8JJX+qhQNozDttPbJ+r2c+I3FG/YWuM
         jQKaPM/iXzh0ZbQt6kA/czIwi/y0OREq91O2rbjloGOg+o0arJo5F2Y03u2gP6yac6uv
         5y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768154258; x=1768759058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fbJK7xOI/xq6Tar8qezI6hVv8dspBtPq2Jhl4huh3nY=;
        b=s4GqYTLtme9VF1t8dHt6gjnCdYmaVuGAOZmb138UUp18YUZWURfGobUqRzJJSRZ3wB
         6E4UePcCuDfWQlZucQ3hfCQWwwa7q8bI40LNQ7KSmZ5kByvtuIx++INLhBQIn8bBXVOK
         DoTbH0rEbPKX5TWXBKj3iyuohKbjLzx1ffveeqdyJb4Nn2x6eRFBlN/YzniukgigX/g0
         UDMUct4EBPOsLnXmmET7QOqCSPbPRfLGRJ9nXBTtbdinaNEl8HvO5ie2wOgnINK+6Npu
         lis0+2GoQK3jaQM5hnMjkDXEvBtbunJ0nYOg2aIaCXmcj050IPL6d6JFZ9qA8CRmaT+c
         Zphg==
X-Forwarded-Encrypted: i=1; AJvYcCW2b47j4ksalAB+AbTH3GjyOK9mV7BmDZo/VpqpmxzgjOKYVZe2QiIysYBSC2unxLSiq6BBWEcNM/ZCrWFU8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7xxMGa7zFYyz10VudvxIVAuUchU4+g9Je4AjhQnd3ZwSoul09
	HbEh0pFxBLF5eWIA/Llt/m27kqBiUlKBavDt2ONuFsg9hy6Yf+tLQMHlUOlPn69EV2mPmDcTH05
	gO/10FVwu5a8VFNaMkzX575/Q3EeOHCo=
X-Gm-Gg: AY/fxX4m0G9bP6aNkudJMbo83JToevIgYaNNvsgaiOAl65DSHOXRNbw27Lw8idYE23H
	KjJAP7OhFl0DR5JMkGncSTN1YNqomBz7/YwsL23XvsTRURy0nG+iqM7qS88evtW0vh41wO9AntV
	GubeZi0T3zQECNF9kC49LpDSTcQWqc0clAhAqQIIJ9KipzOAKIwGtdHefIfSnfpuQjLrQCSW3YS
	I2CkaRw3XvoT2vJ0tRn3g4HYlHutlIve4xFGQNzoyICNe7TWZCk10N+2yiSx183BJLxjIuDevd9
	qSz79Bcd5Bs7songXaN6J0u6xMgqTsQteD0sMfUqvXX7AXq5WuJ05vtnzF2F2ZwUA71TzawzUbs
	IYXwRra1MN5UM
X-Google-Smtp-Source: AGHT+IHsUNDTkZWXPnDKsokQQfGSgLB5pLSBd31BRF2afyEHDMLGxpLMw7U1an74C6nf4v5M3uxlrayIC4FhizbbcvI=
X-Received: by 2002:a05:7301:fa0f:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2b17d23fd01mr8560661eec.2.1768154257822; Sun, 11 Jan 2026
 09:57:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767818037.git.foxido@foxido.dev> <05261e88ac8503e2af59d703389d94cc15f4450d.1767818037.git.foxido@foxido.dev>
 <20260108132141.6cce4827.gary@garyguo.net> <7b8130de-8096-4fcb-be84-c13209638b25@foxido.dev>
 <CANiq72=TAXwjjxFiKiiwh9m_rRK_yUVS4b+2st=QJWErz5qTpQ@mail.gmail.com> <b8e2c3ed-7db1-48ca-8dc8-64dfa437c595@foxido.dev>
In-Reply-To: <b8e2c3ed-7db1-48ca-8dc8-64dfa437c595@foxido.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Jan 2026 18:57:24 +0100
X-Gm-Features: AZwV_QjkEeEeUhKFkM_68O4DnxLwqPiN_AxlqeD2e8VEqMZVrLimsVfRWFtZI4Q
Message-ID: <CANiq72n27gF0e3r_pZ_6ZD7EBhwCLghFkQtLwfApEGCQo6gcnQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: implement wrapper for acpi_object
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: Gary Guo <gary@garyguo.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 11:57=E2=80=AFAM Gladyshev Ilya <foxido@foxido.dev> =
wrote:
>
> If I understand correctly, acpi_object is something untrusted in general
> and broken hardware can provide arbitrary _type value. So ergonomics of
> enum solution would be kinda strange:
>
> ```
> type_id() -> Result<Enum> // Result because it can be invalid
>
> // ...
>
> // '?' here makes it look like non-trivial operation
> if x.type_id()? =3D=3D Enum::Buffer
> ```

Yeah, I was mentioning the `bindgen` bit because returning
`Result<Enum>` is essentially what we asked for the generated code,
i.e. we generate a panicking `From` impl, a fallible `TryFrom` impl
and an unsafe conversion method too.

Whether that may add overhead or not, it depends, of course. Sometimes
the result (i.e. the enum) may need to be used later on in several
places, and knowing statically that the value is in-bounds means there
is no need to recheck anymore for that reason.

That can actually mean reducing overhead (e.g. if checks exist in
several APIs, possibly defensively) or at least reduce the mistakes
that may be made tracking whether the value is valid or not.

But, of course, if the value is not used for anything on the Rust
side, and is just passed along, and the consumer of the value in the C
side do not have UB if it is out of range, and you generally don't
expect that to change, then checking validity upfront may indeed not
add much value like you say. From what you say (I don't know), it
seems that is the case and thus a newtype may be simpler and best.

But if those conditions change, e.g. you later start to want to
manipulate the value on the Rust side for any reason, then it will
likely be a different story. In such a case, then we shouldn't be
scared of the ergonomics of conversions, i.e. it is fine and expected
to have to do that, which is why we want to generate all that
boilerplate in `bindgen` eventually.

Or perhaps you may need both options, i.e. the newtype, and the other
one, depending on what you are doing with the value.

Regarding `ACPI_TYPE_INVALID`, yeah, it would depend on what is used
for. If nobody should be calling a given API with such a value, then
that API should return `Err`. But if it gets used as a useful marker
value somewhere, then it may need to be a valid value and thus return
`Ok`. If both cases are true, then perhaps again two ways may be
needed to model those.

Cheers,
Miguel
