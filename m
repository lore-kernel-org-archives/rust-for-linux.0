Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8995716F8E9
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jul 2024 12:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719923281; cv=none; b=VtbVV0WY1b7RWOXDcIAnjLhilXrmrYqtqpCOlq5DduCYQf97+61q5RjCi3M19Z0P2ij4Oi8h/6pCH4uCuve68AVvOPY9sBDmVDLwVwZuCMq+k7zjSNS7ApwPVDNxIWPCmU841ic2ia/Co9qU27on7uVVTVCiry/fImqxjTK+wAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719923281; c=relaxed/simple;
	bh=1v5lOVUChevQP+N2QZWisjCxH7AUTxAWh+Bnio2PItY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cD7bo20eeyhcXh2Zgmkym5lY/8K8Re5s22y1+HRHTfWDIeJuj5pf0XJYfilwFy7AN8K6VohwG/3cjesFLAtMjBShnygZEJs7eeoQSIpq9uc1CCi7nWDHG1APkbNlCIY25HTSaMAiGqp8ug8rg2P91GcjQZUS4ERGFv5fjFb37pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ekXuqG89; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ekXuqG89"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-367818349a0so354687f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Jul 2024 05:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719923278; x=1720528078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1v5lOVUChevQP+N2QZWisjCxH7AUTxAWh+Bnio2PItY=;
        b=ekXuqG89b+fAiKRdV2IZfgBSYgw6jaFMBIrwG9dNcFcUGTDP6190ViYvCaVZboT5Zz
         UbNYGPaqW1sGl7S3IvE05/gS163fH0wMRW6tYKalYy+EvosHdO2Y3mUVI37W2qrfPYMT
         fikBocX3TFRqpD6Dx6TN2mLDJqgfBOez8JB4pkqFQCDGHIlAo92V3W/26on3v7rjgOnT
         KWD4AeFthVeREjD2f1fLMTupJMyDzQvYm5WObZ+vVZnUMwNlFSmiO/DMovxstD1Uc2Jf
         BJtd4tk17hU0LreLSVLl19SGNP67KIeYAoAtpx1udQ/EkZuonWHsBFGreFusev9h1bi2
         aO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719923278; x=1720528078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1v5lOVUChevQP+N2QZWisjCxH7AUTxAWh+Bnio2PItY=;
        b=aGxC5w5u9dMnlH9H8zJhCbLRj3QXH6PbWdTy/2NpVXxUn1Z6u8Rt0xCRX/wqtN2LPT
         ZbfGds/9DxI0D/ySoHFK2anzjkbiAPF701CUZPN0ar7D2yyc0ccvUjmbJUoT72X5XbXN
         M0OMIJlkgRGj2v/QDlsQLRBjy91lPP7alKpODkmSgSnOpHeRemX43QFUGH4gm3eyEsbU
         1jChieZFhWtfsPPkaOM4gbZHRbklI6zMzuKXf7W/NuMalPxYr0wUhdWhqWN2cYNK3gRU
         4rPG6yk4z80wFS4kQKuODmJvKGk54SN14xargBzaTiEFD7x9XR4uhdtBjhT1YXIyE9k8
         wkLg==
X-Forwarded-Encrypted: i=1; AJvYcCWR589wYa5jkwy7teigb5ch7q9gco5kVPybUklZfu+hZYLoN3UYVmmHvEbuiBnYgmaX5yKkwu7FaQsQ829nP55bBPwNAwwLltziXIcu6yM=
X-Gm-Message-State: AOJu0Yx4FIRsdc6Qi6VL69VSX6Lfpful5MHHdSnLuLjZQywiAC1KfL27
	P/CcUQ3Zi/kZDjVw2LOIVTBzrKawMhCYbDLZvn+WHLn/oGjaED0ebUWqa5BrwKW3nknFHwLeWv2
	G2FeM8iBgrrCVMqqDxosujY2oxTdA6Xos/7IJ
X-Google-Smtp-Source: AGHT+IF4qZD52kZRJjBUJxyc2yqwkhHDch0UUTYE9b5JxPadLBBqquNx7emNw9zg4DSnlg0OkbPdmI7A1w5xcyHHBrU=
X-Received: by 2002:a05:6000:1045:b0:367:13a:5276 with SMTP id
 ffacd0b85a97d-367756ad617mr5683027f8f.20.1719923277752; Tue, 02 Jul 2024
 05:27:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701183625.665574-1-ojeda@kernel.org> <20240701183625.665574-3-ojeda@kernel.org>
 <ap7u5hpgfdzYgTkobIleYc0uolBIsAVbq56CwMJG6k4x57wXeEtu4fpLpgSOvQtbJHvB6D0J1wlBaqDV-xt2owlVejhfABUv_ivILyJ2J9o=@protonmail.com>
 <CANiq72kMaPm2OsGb3o0VUtdoMhSUoo8QEsCFzVjYFtCThvNJ1w@mail.gmail.com>
In-Reply-To: <CANiq72kMaPm2OsGb3o0VUtdoMhSUoo8QEsCFzVjYFtCThvNJ1w@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 2 Jul 2024 14:27:45 +0200
Message-ID: <CAH5fLgiApXtur45Uz+o+xOTX4qqFAf6LnB+Csz2-0CGmJue40g@mail.gmail.com>
Subject: Re: [PATCH 02/13] rust: init: simplify from `map_err` to `inspect_err`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 11:58=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Jul 1, 2024 at 10:05=E2=80=AFPM Bj=C3=B6rn Roy Baron
> <bjorn3_gh@protonmail.com> wrote:
> >
> > The formatting here is a bit weird. I would have expected the ) ending =
the inspect_err call to be placed on a new line given that the unsafe block=
 isn't placed on the same line as the start of the inspect_err call either.=
 This seems to be a case where rustfmt mostly gives up on formatting. If I =
deindent the comment and unsafe block rustfmt will keep it that way and if =
I add a trailing space to the inspect_err line it will keep it and emit an =
error that it left behind trailing whitespace. Maybe add a block around the=
 comment and unsafe block to make rustfmt work again?
>
> Benno: any preference here? Or even open coding it.

I would open code it with an `if res.is_err() { drop }`. Using inspect
for a side effect other than printing seems weird to me.

Alice
