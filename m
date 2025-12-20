Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E667828850B
	for <rust-for-linux@vger.kernel.org>; Sat, 20 Dec 2025 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766235241; cv=none; b=erOcQqtng35JF3tvB76SeWULkRZW4mc+2uqSHMz3EvPoyeuc2V5tnFCvaQa8GwTB7+9mVlk52DBFA9g9Rt/4s59d7DG4mwAzXTOjf0Z7Mm6gCSOYa++SnnokyxsVGF/P/LvLkPqmmwyd6ZBC573zPnRHFJEHBmtADYteZWj7t5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766235241; c=relaxed/simple;
	bh=DCt1NiXGvYVNiSKFRGiFenUe4OH0SVeIOjJJWZ88kDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QlEbbo0p8IFM37P71AVBRHdMAsRUtArK4WMHS/aoU2LF7DMNebrR0/ex2c0UjV4M3hNmZpRo1qkywd5Q10CFG35SLE39ViFczZ3TbUmQQzqQoTz4HQwSs3qWd28fwseOcnGcNbRbLToZQvlhmNPJPBILNLh4JBxdQcX9w0sQHgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeaIKpP1; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeaIKpP1"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34e730f5fefso2695986a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 20 Dec 2025 04:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766235239; x=1766840039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCt1NiXGvYVNiSKFRGiFenUe4OH0SVeIOjJJWZ88kDs=;
        b=SeaIKpP1wVhp8GGemF/MLZtd+AAJBZY2Cclx0gI23fXmZWtxUNNeugUWVGjlermE9c
         e/3Ok69rbKZdd8PKsznRRju9hdDoZviMkpl4Da1cLQDrMzPtvIK2wpsP5G0r9utIxWpB
         pr/UCUxWgu3adOXyU7QkoJKQE0geaNa/qcgC2r8mtbqb+zlWzn2c76DbinvF85Hx2R2k
         QQF9lBdm96x0iZn/WPT2t+YsiXRXjBJBV9dEJWJyVLwUKL5fJkw2fSju7cW78vlgcHE8
         cpmJWhxidWXmshxv3sJWOuZzCrQNWwN+7mp8h2cMJ3qT/YBEHl54XZFJ1iBJBmkO0KQX
         MQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766235239; x=1766840039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DCt1NiXGvYVNiSKFRGiFenUe4OH0SVeIOjJJWZ88kDs=;
        b=qn+Jq1Kl3/Ii+uvKgC0+Zygdtk1LiOGk4/YeTba3NmabTX+I31IeE5FMLCsj6U2ycW
         ojv82JQo5mvT5FdCZ8IR5tb2eROXbA4ms4Ef1Ku6Owhw9a5EnSD3N3GDmmU718/pntZB
         KaIzvYZLalkhs+1tuC39edyugMZokYqoK6HYFez9kBvR3VH/7XPrI5hNnKQSpmihzXPg
         yQ2V83Z8w3bjRMhS1yjvulfnXJEqi25pZti1+SZ4yquApzirwgiVD5kZdo7traZoiU+T
         QhOEsCdhBEQc/+ZUYAS9PlYcuplQtlsgsFoZR5kuq41WpyE2CXgkXzdC0jcK5Lk6nnCi
         lybQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzsXedUpQugimWZPRHvK8uluUpXSV5neADvzG/ZyDyuQeCgqTGpvAmykkeNzzGDyuTDJyaksID/jk8hnhvNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0z0dmCk/vGXISu4VudoocgQHCu8iWDv7eMranWmTOD6NUiOdl
	3AbtN93YfvgsHp3pbaZUZ3aVpCeklhoissLQJckQJrOJTyOnOUKF9BgTLRavLypTUm5j5L5Wguf
	BnmYhxJJI8gfX2ehkoiE8BwBxXU9Gul4=
X-Gm-Gg: AY/fxX4NTsvLRXq1nMFJEujqrhLqhmN0qUb/Che/PNwrm7349V1RYUNfZ9NIMUeWOH1
	8A5BfiyDqfd2HGi3Y2iLPqQg5zCgpzbQaxkyM1O4HADfk2zn6CQJxsu7qYp/gxxt5GZnfGdII/Y
	EtPhUUYk1mrghCOEoIEApPBGqCM94O7WwGqkGNcFiTrzvIUsAcu6RVFqGd8QcWBrH5OZdi40eQl
	sBWd2L88D0RK0b4Oe5IBJLZQ9xTB2hl4Nrdq9svr/z4xKz7I7bDTi6Xlt5RcMvrQEZR+GLJp+RK
	nw04ySE9Iv7o6iOVwDRSLxlvP4o=
X-Google-Smtp-Source: AGHT+IGxNP/OFMZ9VQzxbDRyZknUn4r2tWcISDr4M8YPv4RUlT3pFlEiCYhZwoZk9P9jMjfG7pp8xWIa63+jRalj8zo=
X-Received: by 2002:a17:90b:590b:b0:34e:5aa2:cf61 with SMTP id
 98e67ed59e1d1-34e921cc3b8mr4507598a91.28.1766235239094; Sat, 20 Dec 2025
 04:53:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219-rust-page-check-v1-1-df2e52fa3bd5@gmail.com> <9efae3dc-05d5-475b-bc69-250c2186dd70@gmail.com>
In-Reply-To: <9efae3dc-05d5-475b-bc69-250c2186dd70@gmail.com>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Sat, 20 Dec 2025 14:53:43 +0200
X-Gm-Features: AQt7F2q2KCAmh1RkxHvGyCP5QJH5FmUFdWQjor_e7FhxwJWiL0SnJgUIgH-KIfU
Message-ID: <CAC=eVgSkqruKPn=-5RJW-1SR5TmPRj5BtbPH0Nu3_kuUqk53Eg@mail.gmail.com>
Subject: Re: [PATCH] rust: page: Simplify overflow check using checked_add()
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 20.12.2025 10.41 Dirk Behme (dirk.behme@gmail.com) wrote:
>
> On 19.12.25 22:29, Kari Argillander wrote:
> > Option::is_none_or() would be nicer, but it requires Rust 1.82; the
> > kernel currently targets 1.78.
> >
>
> I just wonder if we would like to add a comment like
>
> // TODO: replace `map_or` with `is_none_or` once the MSRV is >=3D 1.82.
>
> like we do in e.g. transmute.rs [2]?

Sure, I can do that. I=E2=80=99ll send a respin maybe next Tuesday.

> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/r=
ust/kernel/transmute.rs#n75
