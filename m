Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7843E317F
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986418; cv=pass; b=P/6T+hVVanvKK+n3S9JBZcy/o7zGU+CyaGgtZRdFsLlyPk5gDZKkNDOIIB8hMmNHJTCBAdk79WJJ6/BvdXKhc45mLCpU5tClNsirm35sy/+PpvasKljCuc6wahdHYYoiu7GRViRG78AxWPh2Cjr083tCVoP7HUbQtxGK7FMunhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986418; c=relaxed/simple;
	bh=q66Y38ySJZNoNHWz4eqshKORvAxGsbvPehGBaXPqHgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4s6PJmQraysQZmTbgXpNBZxowxK8j2OT1AKhKroBe+pBMyKOVt5HqDQHkKzFLZdHaeB93hhIVfynWU9u0qc6j212s7D8QR0b9k5iTTnehFYC8/QZEqjeCBstKc2pVFoGPKIJZwZs+6apwkOx3X9lmtBqYUSRdSxSB+M5LJCH9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhxtp5az; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhxtp5az"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1277863a912so766837c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 12:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774986416; cv=none;
        d=google.com; s=arc-20240605;
        b=AEd7nI6jWK+qbxzDeJQlNp5eWjQWYpoebDObdvG2vm2lHzyX7hQ6wf1xSTSeJs9ESl
         J+miClr4Z9us7EMe8iv3k+0yiifWG840NMuF/WZto4m+kkm4ADOKleH2m2FRjZPQ17XC
         der9JS+S93N8cPhAl64e1o9G0U/90rhiIoAdFROgAXxMdWPOZGgbSniLu4hbvSshtL0f
         LZeIgMi4ycwzgg6dBAqlECYTBLMHcRPU2cAokM8h8ERcC199g00KZ3JHuIjp6hgCio6q
         X9/u0mRXZpcW8WpSyAmHS0fN589fnBPJhutDggdkN2sm0nMIx8BM+0xDSoS9PABIKHy6
         G2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q66Y38ySJZNoNHWz4eqshKORvAxGsbvPehGBaXPqHgY=;
        fh=atPvNl+Mbn/INBNZFxEQwlkJiMVtmQQAbNfkhpcgbLg=;
        b=YSKQvTSjIgxMW2Vqr+yb7KI5pqArBgNs9oSa1o0tgWXLGU8pOWnZ1Bei1tEF2ZZRHO
         hDtafNzEi/AA7I3itdz7M/DrH8GqXga+pTQ0cKap8r2adTd4bM/NIf2u/fx7gCVV+rFF
         QomyqLqsbi0pLCAIHEh/J60duyseKveye3fj+7LVv0sHwOLq+zs5YLhnRrJjY+qUAK3U
         GSf0oSWC+YLSjvEekp3NHD7eAw+Txay5FnivxA2/fAconxb1ynrNwgBsvUntr1Sshm1j
         6qK4Fr9wxLMncrmypgSVD+IPjchATAf3ZgwAODeuTgfDgRqcOL2tIYIed4zXmvP6ddvA
         eCIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986416; x=1775591216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q66Y38ySJZNoNHWz4eqshKORvAxGsbvPehGBaXPqHgY=;
        b=lhxtp5azrswCqMvn0Xp3tn5BauHa+o4SJcZLIaBrWutn4/7dJbjHdnTAO71GiJOjvG
         KMjXdBdud1B6sZeZGleERP7IdSjCu/hoKuKTnlB/a2C9RqDRNWSmCZ3wQwHmAQF29lBT
         7kd+t9GLE0hiA8TEeVvVlnVSTMqWQJKhVwvPANRoRUv98xW9wwjDzAjTmnYGcc/0wxm4
         5qQ/F575GS91dKh6H7KqCkFLnpuUL852Iu5B5tl84HW5SCpfd7YkgIsJEdW1CN2aRJhy
         IuITCNbFmggqFuo01tuBDH4+eNVQdUJtraVSmNCblUoV316yFL1LeeiuVTUv8DeIsqnW
         ZXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986416; x=1775591216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q66Y38ySJZNoNHWz4eqshKORvAxGsbvPehGBaXPqHgY=;
        b=Heeiy+biW6nozgN8KXu8U1FPBR1hQq2FlwkMDD+sX65sQ5DaNOyUdUWP6Z6jL0HP3z
         s1UWH4QmPAkynX+rxxJT+rRuVpolOFUvp3kSYSGu1l7fG06Qm4GsmHdpIcjyoED1ueQb
         Fwd85z/PzUgNIpW0mzxc3bVP/LHx72ye1aIihSgGEC61pHY2P5IUjTYSOOS5aW/ZQZq+
         47sl4pXSTj39/BbL9ii8NteLJ9MHdqKj0idgdX4Fg0lunHvv70F6mwvuJZyzetAERWA+
         trXxOZFmwG76ilQnjjVhmoynZJ8yZvbs42Zt/Ntk3ZRWg98/40pYB62GgSlca57IBsxe
         B9gA==
X-Gm-Message-State: AOJu0YyJCufAd3ViAtV6nh5+9pgiE4fjgWT24ezjLZ2sZ0YXxa+RhFUv
	QD2ZNcW8E2emeKXtgSjXA6KRjS3jtPsAwAOLdIxPOSJaL+6pmror7D3onPKb9nUy18rKbsCptPV
	cpObv3fYHe4P3/hvw0Uk5wKlxcbVMarc=
X-Gm-Gg: ATEYQzzOLcuUwRVCkGbK/Anpvv9hKkYsfwZztwh0EX9aXIqAlqDzsK+R3oSc+yIZOej
	UN1k+xJlGpYYlc0XzuRlnn5J5yPM+BhZioVPUoCIiYuYxp8nqFHtx7stsuRnW/k6cIx9I8uCZHH
	56TqOQhhA4CiFAa3KCoARD8WLZjv4UAnuTFelXCCavvmHXviFvIh/B5Rru6WwkbeTQxOIea6EfC
	3Cbs/iTVoE+5MMdaA46JrOuOkQ0oQuXz7UDeftMPZgBcyiWLYpLo5IuJ5qCKu1ENcuo77hcN4/f
	lq4UBc55plcuzWEh+kKt+tAiHeg1XF3NlqxbdCyKMYgn2BQWIjdKUBBTPIrRVostWCNLBa8DfyB
	8tf6y4s1AMtVI5VWh+VUlZT8=
X-Received: by 2002:a05:7300:2211:b0:2c6:2bac:8af with SMTP id
 5a478bee46e88-2c932db3c6cmr152840eec.6.1774986416531; Tue, 31 Mar 2026
 12:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331190308.141622-1-david@readahead.eu>
In-Reply-To: <20260331190308.141622-1-david@readahead.eu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 21:46:44 +0200
X-Gm-Features: AQROBzBG0hm0IX27j9LC9A6z3WjheTQvCkRk-e_5KnJqKmJ3POL2hxnoWMGzrls
Message-ID: <CANiq72kbUh2F6o_oNPO5hF89FVZOiAAogSJZrHSLt=XYt6mEjg@mail.gmail.com>
Subject: Re: [RFC 00/16] bus1: Capability-based IPC for Linux
To: David Rheinsberg <david@readahead.eu>
Cc: rust-for-linux@vger.kernel.org, teg@jklm.no, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 9:05=E2=80=AFPM David Rheinsberg <david@readahead.e=
u> wrote:
>
> `dbus-broker` [2]) and are convinced more than ever that we should move
> forward with bus1. But for this initial submission I want to put focus
> on the Rust integration.

In general, if it is a big feature that still needs to be agreed by
some kernel maintainers etc., then it may be best to discuss that
first.

In any case, I have Cc'd certain people in a few patches, but Cc'ing
"RUST" here in general too for the "utilities" etc.

I hope that helps.

Cheers,
Miguel
