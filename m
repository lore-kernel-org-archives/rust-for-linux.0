Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02554239096
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755002962; cv=none; b=HaZFYsVLt8JrMy3ov/TLnAvcqg/qL+qgZL/3rNLOFJHvuFeEr3iI0GNp/g1rxAZ5IfS6Qvvidt20KoToz3WWH2OYfE7BzKihZiasuqWabZonoMwTIXp3gKbfqJ7vPUjqKNZaqwGBIccBC4108azAtnGRhK2b5V10g3Q7lCS/vq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755002962; c=relaxed/simple;
	bh=exJH9qV20PmfRA67Nc0mzkXNYH20APnMYURrH6ZbFgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/fJdoqrIrbb17Cdv3JF+C204oxGiyhNnkE49+Gfi2Sqesdra8t57PcQZGDy/aMSMtvwXH+TFLPzqaxJjinkVB8PJgqlq4PEmsWlBqWZ4tb60JmD54VF0aoh6QP53QIgmPDTYgHqCVIRp5AJsiRUpg4wSaASTSUISQTfdqNHuL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtOdPr99; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtOdPr99"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76bf762cd52so569239b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 05:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755002960; x=1755607760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exJH9qV20PmfRA67Nc0mzkXNYH20APnMYURrH6ZbFgY=;
        b=MtOdPr990riN75Zp9tHDsoN2QNtuB0Ksa2xu519UMEOHZCwXF8BgH71lz6YrEKfwOc
         j908uv3SgNKnLUqs5fOXeeLpRzW+DSgKWz36dLeFVerOYe3z6s2KO2kcGh+TYF/Z4/2q
         AjMwkdrH7GaByxFbk/vxcu/Go9aL4x7qjeNlAL4YbL+sCxODQEFQ8DPoQjeb9bs8i57G
         cDCyp6qOo8Vm7kXcqcOho8YPYZbq6GG8LvqrhcGyl6a38zcBij17GKNkjJPXzxpu6Tuc
         F3P2iicJroH1AzD2KqnUY4lKmqqaiRdEpnQPoVIWoSKCUruHi+czJksf7VSWnDHEm9zm
         MfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755002960; x=1755607760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exJH9qV20PmfRA67Nc0mzkXNYH20APnMYURrH6ZbFgY=;
        b=ClrCnKTSfFIy8SdbUxU4AMwFLe5Rm1DTCiIRocc/7KKUhpmbAo663uY+sNYD8zpKg/
         JHuwILTcmp+sTkb8ydfOHx8qPIOsP72UKiG/EUg4T44NPPSVfivW0Jfsm2rxYqXOOHNY
         DZI3U8hGcbB4++zfXRwQJWHox64EJjjCN8y+DmG1/zK4s7LrTkSMFFDi9kGiXFqyLkCQ
         ofL1GMi7ntiuJkbR2Sqk8fI/SWInEus1GCfNVNpNOtgpfSf493ZC0S/5tqNEd0yWMYoa
         j/3fAxhkWKQ44mebHeGjYgQ47h6IBYNT3q58/KdQ9WUEjnvcNeRPj3BqDl7q3R1LSyNN
         aUJg==
X-Forwarded-Encrypted: i=1; AJvYcCVf46f4U9eAo0EYEkPP9QAcI8gC6BPYjhzb9ktJZ0f9YXojGgNe5xaK8HzMEs6qzKwoWfKH4JCogEobmXwm7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys7CYmluA/TJeiwXMvUeiBAudmMByAcIJaMV990Ll7T3WQe7wN
	7IXSCOpz5P2xf+HIgKLzisrw20CQmGCsIrCLx9SXh8PpiwU2PiQNFK/1iwNq6m7MF6TkcAeleZi
	Hw5egMOekd1XUGFxPMnf6WPxrV1oWeiM=
X-Gm-Gg: ASbGnct5UanM4m721kGev/pN27dspolwxoYWeqhfj17RiZKm9Jb2Ru6sOmond7yQA/n
	Ve9bc0eVFecH6E+xmytJDtRPljiS5Qcrgv+1kfXdCvoENW6estwI1gHPEi1KTOAzmZockb3m+mk
	CNKpLAdN5i2P8K0KEOMzUCapL8GdAXp9g6LY+PzTFEFgRU0DtLKbJswCuUw2/NFzRtmvc1VZb8z
	24LE+TV8Nd7OikNK8Q=
X-Google-Smtp-Source: AGHT+IHXrycj81bdHIYuHtLdvoBL4ADtNG1pPoycijw8zJc6Jtvw6Ytfnz5V40Fp6SpRcSAntzIPf9RAYZOChUztmCI=
X-Received: by 2002:a05:6a21:1f81:b0:1ee:d5fb:dff1 with SMTP id
 adf61e73a8af0-240a242b3eemr819138637.8.1755002960131; Tue, 12 Aug 2025
 05:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACvsgUCBk5Dt2yBSy9_NA0z38-wP68vvBX7XDYgJGinTURT1kQ@mail.gmail.com>
 <2025081221-cloning-able-a6ed@gregkh> <CACvsgUDP8rX4evCbaNC1MTy56qWH655Cc2bOLuryUxfP-o4_4g@mail.gmail.com>
In-Reply-To: <CACvsgUDP8rX4evCbaNC1MTy56qWH655Cc2bOLuryUxfP-o4_4g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Aug 2025 14:49:08 +0200
X-Gm-Features: Ac12FXwPYKABrF7JxATwUmuwMyv7bSvDojv1CaXxXv3juURnLwNy_V7pV5TP3XE
Message-ID: <CANiq72nn+mPHWdt1XwQ-znL2ydMwWRN=7-9Vdq_5UkU8hFeqPA@mail.gmail.com>
Subject: Re: [PATCH] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
To: trev <trev@trevrosa.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>, alex.gaynor@gmail.com, ojeda@kernel.org, 
	rafael@kernel.org, dakr@kernel.org, arlied@gmail.com, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "aliceryhl@google.com" <aliceryhl@google.com>, vireshk@kernel.org, nm@ti.com, 
	sboyd@kernel.org, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, brauner@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, jack@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 2:24=E2=80=AFPM trev <trev@trevrosa.dev> wrote:
>
> Sorry, my bad, what should I do to fix it?

It seems your patch is also word-wrapped, which suggests you perhaps
copy-pasted it into an editor/clients like Gmail, so it cannot be
applied.

I would suggest you try `git send-email` (it comes with Git).

Thanks!

Cheers,
Miguel
