Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ADF3AB269
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Apr 2026 16:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578671; cv=pass; b=X2aZvg7m9/vW8hVOP+ESGmKmHFmhwMf/nPTVdsJuuBPKCziQjhoHpRYY2oL4fQH2D354htzGfmTeM8IeLD3+45vOAEjmtf+7e3kJrf4yzz8jlbbMcSlj1i+YwG+ooZlzKWbQx0ANdNQYoGUhxuseTBCkqkbDk76sTroyxT6Wg0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578671; c=relaxed/simple;
	bh=aT65bSXexGyY5cEBVfmg5eYe33LV6WCYFKHDF1HIJJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YbBuyGxA2jHJELJIHs8/JYz8ZU3kn6dgLai1BL2Nhx4Ag0OC5+B2l5ez8x9T2I+an/cOpGgceJTycAn6//xontC2NqquR8DcRiBnYWz8s4aswk/unig8xa/9LjUh6IjC9W8ClFsUF65McEkbyf7zAV/v23ceYjLY3+QcdL2gHHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HN/K972z; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HN/K972z"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-127337e3870so348015c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Apr 2026 09:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775578669; cv=none;
        d=google.com; s=arc-20240605;
        b=EEFaBSeKtodrT5NrHLSnoHc4+SVHKOliQ3CZCHCSkK+vDzF0jZwKR8zBPXOjgvCN7M
         H1nCxzLpLf6XSQxFycULIhoMp8rF5w9N5piOhbNsPdHtizzgTqa+wnHBTjGQNSFoF7Kw
         V8ba+3X1CXofJw3/OuMH5ZceOpwd0h+MMfKSJ4ZQJO1t+Knk4mPrj4ROQ5+VOD/ClCR3
         gbptdUT8HrnxvzLNj6qK+aKB9I05R42X2n5bpFwXSnM3CTn9ljw0rFN88Bo/SPO8hXQQ
         ZpqlO9KzPBrIDFvZOD8r/Jcf3GKckGOudflyjut33gSXIEFJpMOttzGqe2NY3bd5nR+Q
         QYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aT65bSXexGyY5cEBVfmg5eYe33LV6WCYFKHDF1HIJJ0=;
        fh=pWky2Ovyt0HWyePRi9RdaAG6eMQwEOp9QgJ3vrORnOQ=;
        b=W6iw++Qdni1ObCcQ8nNmPr2cy5DC1oqYfg39OrhbjRegNMkVpaEGBN5IG8reDo/d8C
         S6xw/FX4/wdoiIugjwAnlffT+iee77D57YEvKlQTxBdS6aM51IGILB30zTORLKU8rDn6
         9eGKhANKhoSOdPvZktY/+gGc9Heb3monHQUaKlKHjgISdxSfH18O3afmNfrSA+sTtVQp
         ggWPTb11mdjm6T4qJ607AgbuvMDCIAuZU06r3zmQYDELJcG4KDTKuMX1nGFMppRSWC65
         +KbRIDuekwQC1UqOVzVOVchgS32Hu4dWVknn4l9ffKQC9ShUVCfdUdyb1ExludR6lojd
         wMLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775578669; x=1776183469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT65bSXexGyY5cEBVfmg5eYe33LV6WCYFKHDF1HIJJ0=;
        b=HN/K972zoIT48SAPckrbTZ6N6WZuiTd/uH/rEleCtA9Z9pLyahxNllsUmYLZXR7/tR
         LIzJwQaenDBYovH0lXVp2aGb7AuSGK82Ce1ckbzE8wMdiOzkHZ2R2+seJGuXyTOv07g1
         o730wuZvzJWsJQTVv+1jmYrzdNeV5FKRuX8rGen0JJJkfKg+GLLgrghZNbJH0HIsFc0m
         mWF5FRMxc+OzTAxe/Iccr3hRwppTQ6tC5IqFflE2b5KScHR1oifWSK3r44J1CmpFIiAK
         owelCeblDrkXzQFn/iBBS7RO6pdKbmvFbb3RvXMJeSMeyaz2yDsgNVyUpIdIgk+hFimB
         ictw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578669; x=1776183469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aT65bSXexGyY5cEBVfmg5eYe33LV6WCYFKHDF1HIJJ0=;
        b=Byuu1o26/Mil9MNVirrmMaNF8NP2MdtqvmChCKw0mQZ4EaGTsfTQRHxgliGwDPNcgR
         TVDCz9d7Z82ZGUlFVM7a701Nokrl1lbaZA/MySzAC5E54xMVuyHu/AHQwTviZH3FeAzn
         9QEv2IkuOkQFNxQausN1SaMEkEiZ8+q5aenM74J4C76FDbHVtRPtLmcQoQp5UxEtXJhX
         9lA20Pib21WBCuwaBep4MldL60wbOwd2DfKyeK+CukeoObWeHqoLrCKr/GMEtUpwbACt
         86I42l9mnOwT/KWxZFCmWzuLFIVyNPNuozyZgRKa2dQme64hmwRMTXI9aymTiMzmfvvl
         R9mg==
X-Forwarded-Encrypted: i=1; AJvYcCWWVszu4n6LGKXoFtg8+cnWzXr8gYt/+OfLjCGtpgF2FTvm06NedTT9q6lNdK951SRWBlTXpKvcCtEPnvsdSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0HF3wMjBDq6G3MEbL69GSw04aoPidvGGkN1XptWk4k4pcYLkb
	1NlQqTMMFmELifFYpZyanQwKDQOUQRPbqL6aT2SH1mTEqJ6DMPu4k7u5oV1RC61f+AynNWClZYK
	g0R/a7KKIEJw+DU6GLNb8yTYX41FdIuQ=
X-Gm-Gg: AeBDieupCnV+3ijSA9bkYtmSGAtgySJHw9kTd9QAn0j9/uOLuvUIzlgM7IKI4KrdGi6
	gEQ5jbG4CM8/SIvBEFlDjaEJMewJY6JpnVuuRwLUagovOGhuqCnb4VwngUzSohSEpDCzF1RlhIP
	jol8Q8gPtieyxXY4xgnwqKB/kBexrhYWyM2uyI3Iupx9NQ/n+3gn9xE2ZTMcEy0NdV2qtu8tJ19
	0i3SMTpXms79tpj+v6x4Cg9lz/+6/hx8FlK8ahT4IgC7EIsVr2gDkTgs29233RiaLtCuyHIFjGk
	HfBmTkOebaKuGnzk8g03ylxRG/82mFw8pctoxoUlsfX2tpufLEYBONGWo2WwYfaEDaW2tvHh9eP
	5CIxQ6jz2XV1udeS4Yx6YdU0=
X-Received: by 2002:a05:7300:dc8d:b0:2d1:d434:d006 with SMTP id
 5a478bee46e88-2d1d434db3fmr650961eec.0.1775578669089; Tue, 07 Apr 2026
 09:17:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331131729.1104236-1-lossin@kernel.org> <DHN08GKYMQB5.3O5LSRRBUZZOK@garyguo.net>
In-Reply-To: <DHN08GKYMQB5.3O5LSRRBUZZOK@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 18:17:34 +0200
X-Gm-Features: AQROBzC97Zrd6eyIZhHOsLoTBogd6SQSwK473DjcxKORo3X2icxmJtLkmvgej2w
Message-ID: <CANiq72=_C3eeKX20pPNmWtZJ8AVdfj6=7axvi4UU1iJC0EjU_w@mail.gmail.com>
Subject: Re: [GIT PULL] Rust pin-init for v7.1
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Antonio Hickey <contact@antoniohickey.com>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Oleksandr Babak <alexanderbabak@proton.me>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 4:49=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> A gentle nudge about this PR.

No worries, it isn't forgotten.

This one (and Andreas' one) had newer bases so they count as back
merges, thus I decided to put them at the top of my PR to avoid
affecting the branch until then.

(By the way, for the future, please try to pick a base at most as
recent as the upstream one, i.e. `rust-next`, so that they don't count
as back merges -- we should avoid those wherever possible.).

Thanks for the ping!

Cheers,
Miguel
