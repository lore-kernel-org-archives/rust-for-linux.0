Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910121EFF80
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 12:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769171504; cv=pass; b=bhkQcz9Wat8NnISxP+2k6rW4VPLD77l/BGAFsV6BVA7u3NWNpRvPM3C7MflVRzxHiETh58cXrQTM936KjHInno8LOd1lv6DCojHcCzOAzBQUNLdMvlyXPdkjT4ha249o8yvLWinEARr580oHg2eRCbjPw7phVMLzbA6a7IH7z20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769171504; c=relaxed/simple;
	bh=+GzcYi91BQDSWwlAc4ZNh6qiTOwo9jBo7rD3VEnOcRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TeeqD9orIFbsDyXevy+RFckOoHeq2Rn2IgrU7/Ys823Vf7PCq/JQuHfyHlwwx44DIHMr72ATe065oqTT3QgBbSDzYB2CfW5aI/7cwi3JQBwf/Rvqe5L9uWGYKGOzocnCz3L9lMaYumEBiGNyi3Jjdy3KttbKjE/hp+PcpfbjFHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nq2R4LlE; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nq2R4LlE"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b72b154883so48246eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 04:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769171503; cv=none;
        d=google.com; s=arc-20240605;
        b=BIV85Elgn9eX1n9xv+i017EJK+8ArI5ilXypCABDJCrVKNkpiHN3oZlqc9idmiWmoI
         HpDDMhvGkhxJWjqjg+bEQbBG5ixOU8vX8mf+DFV/k83Dmnwg8pdZ72QeZybpAr4FYiMA
         13UZakY/RDl0B/PKeceXAYyxMdQCGEIP5htaZ0j7qIY4CuoQoyS10Vc6D5E5b9QHSoiJ
         GS3phqlseNm46IebhJq7EntUq8ZDzImXLooZV0QMutYU8d4qkaelqDDHZ0MbCpg22Qry
         G+ZDNc5dl3jc//w3QvPSm1XrOLAgxu7VGXFqyOtcU7zmcfk6Z6+496anNRxMVqEBDHF4
         wfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+GzcYi91BQDSWwlAc4ZNh6qiTOwo9jBo7rD3VEnOcRo=;
        fh=i5oR0HW7cJanKMGQPRqWgdyQ8LjiNYshfU+LViRsX5I=;
        b=SwO5tRaSAHW4tFL38Jo03NXtZWdECSBwGvXyiS6oF/JSIlMZO8ZSwaIyf/p9LgJzo9
         +5nIARaaHwf7qaFJcCTcR3fUC0SD49ruceRpL6QtW7aAuTnt/PWShny8dT7BQG4js/Q3
         M93I5dJl6q71GQ3GgeM/J8v4Pg6KCyHEmh/h9JR20TcpF8z1qd7b34sxhNB4k0jgqY9L
         lzvkKAw99xmjShXQoKYNyJUBSxFB8+Tu2VIAnQYpiy/8/Gjk44ph7k5vtG8Wg1pozs2r
         ChNckZIgjn8BxaEc1TV7VW0qV6MZ5ZErEEqrmTY9M1kKXz3c6ivRgasbUUYtZ7Wnu9Ns
         Mm5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769171503; x=1769776303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GzcYi91BQDSWwlAc4ZNh6qiTOwo9jBo7rD3VEnOcRo=;
        b=Nq2R4LlEZezTvdD4MWuUf0q9DrC8UHwzuXK4vIl2i5idOmHdEaGDBXTSMMoUa5bWz2
         ccg2tzEYyjiHZ1rGfNfTch5mf8AzFIisIy0zhmsWNUEH5XR7uZr9H7DoCO7Nvo5NUTFZ
         2jEr5CgqCT2GG6GxOnSKb/OUR4I24r759FDwccjZQrhDDFyAO8ByAezp6Sb1A+0sQEO/
         LmB3qQXYoqCuCyytu1DtnuxEcyLNgMP9ecihucF7XTU95LS00BtoSXKdiCXK7Gia06b6
         iPdmOOA5/SwpytUUsrPQzs3Zpq35G0hac0qZKPuY2g93NDf1mmKhrQBcLclE6b/uP8Ps
         eECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769171503; x=1769776303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+GzcYi91BQDSWwlAc4ZNh6qiTOwo9jBo7rD3VEnOcRo=;
        b=oryZX6pPjwyajGk8ci2pKLv9sN3MbnBakZSpXfDTKnUq+s2EEz4ixOG/ZNSTBFE8Pf
         W4U95iGCeHcUcQFpRYJOgDtUHYfdPHWiJEA4kW6/FvuKHdxODPSAkd4qIS8nZOamdr8e
         OzgB61k7JG8iiVsR8S1OZCryAKy8YsoRMA2XSQjbYeumvFh5JXTGf665oOMQs4gNTV3t
         5mdF6fbxyIDkElTzzRSyezrt/vYdcQfbb+0UYWDsvqve5UWAoZWvdzGKZOZvO96/7NWy
         lJOlFuwdzMp+1wYBkiuyWrs7Ly1kB/ul2HncpJ9C4Uo5mWYLI7VAb6aa20LwYNCMr2gk
         eVjA==
X-Forwarded-Encrypted: i=1; AJvYcCU1QXW3IK595T21t5BX8rc9E3SCW6hWrzN8oJvvC6KY1TOkKUPPJATJsdvJEJsv/Wl/0wwVOzlsYE5OqN3X7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze6uieNzzeD3N9GT4Ak4iKTVNMbHvMuxrWWPzDmBfxgmwG9VH4
	T53PVjylMxRnl1MhFqfA75MM2XfYYM+9QQlkOv+pHGMIf10M7+79SmfaUf2PQaNqUQ5V5flxOMK
	XzkE+QsgfEUkfYo220Ok2rv+c0TScrOs=
X-Gm-Gg: AZuq6aKAJe4UZQ1K1gRtmJQe0MrTBN6krRqot0aQHqA38IayhSsmiecfl3JGpSjQmDJ
	hnnF1TboofNsKn3g7pUCNIr27Rw3ga52hxd/bj+UwJGha+/ZiDLZEmaDPsCY2AFiJ7wKSBHbdjj
	uxA8oHxDtFTX5l9ToLDCmBvsUWKfnVWTohOqXfwMm9pzXOlE8TJbFD6uxpx2W9GyeJ+VSHW9Cmi
	0fd/ckk/JvjB6DpFvkJOWZvAMomv8l4LSp7aJzkzmB943pbcCXNYxdouDqlLEDMgeLkXaFY15u/
	alnun837syvXa7jeEhRD6x7dHuvkIkH7oeF646MZZQ0kACrRbNr4UZz0S4wXG/q+lyVybwqpY5w
	kU3QXh1sEkU62oUP9M+Ssv5k=
X-Received: by 2002:a05:7300:cd87:b0:2b6:f613:74e6 with SMTP id
 5a478bee46e88-2b739b6f228mr766445eec.4.1769171502626; Fri, 23 Jan 2026
 04:31:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com> <20260120-ra-fix-v1-6-829e4e92818c@nvidia.com>
 <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>
 <DFTTQTYK1KNF.2N1PS08QIAID2@gmail.com> <DFV0C3T2RXW8.1F3G0Q7R999TC@nvidia.com>
 <DFV2IL7N8X9O.2DLY12HALP8AA@gmail.com> <DFVQBFD54CJO.2D3VQ091URH2B@nvidia.com>
 <CANiq72n65eLUmWShvpVBzkbCork_85A8nMZPKdf+rpw-nJ6j_Q@mail.gmail.com> <DFVYSBDDF4L4.24SKCFXJ1M00A@garyguo.net>
In-Reply-To: <DFVYSBDDF4L4.24SKCFXJ1M00A@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 13:31:30 +0100
X-Gm-Features: AZwV_Qjv_kM_Ib87W-Q6Ic8acv_zKWF-fRViP125obbU1YTM7QOJocoA-kwnG9o
Message-ID: <CANiq72=dxV9fLo7--oeAE+5OH7PKSUnwsP60Y31maHpmt6zxVw@mail.gmail.com>
Subject: Re: [PATCH 6/6] scripts: generate_rust_analyzer: move sysroot crates
 to sysroot_project
To: Gary Guo <gary@garyguo.net>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 1:23=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I would avoid dropping old RA support before we actually bump MSRV.

There is no intentional support for old rust-analyzer at the moment.

i.e. if it works, it is because it still happens to work with the
current output.

That is why I mentioned that -- but if it actually works well today
with the current output, then sure, let's not break it.

Cheers,
Miguel
