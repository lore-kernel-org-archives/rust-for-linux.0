Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCEB3208
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 07:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058140; cv=none; b=qDASWEs6Nui4Ldrl8JJlE/Wb1frBPfgxIk/s9sgm5QdvU9bxC9QT2HACzAGi1wme3wskkXJhwmehIvNswd7WcN0WCfvUqYD0paMOHXShdPfyvRc4ACtsugOobi8fSCdILTVaqdFM2ZWiJd9vxBKPvOCEtzrnhDPvAZFYTfRx2oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058140; c=relaxed/simple;
	bh=XlzTWIS75+l6at5NogEHyv+JNSYzRylm5Id0QSKt+SU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=b++5wlrC2GlyELQ2UsFgP/PvR0BG/f7ByN8cMHn1x20izCjKdiol/NWd2NMVO/KtLdKGBr4lLboUuAZHs6u1MAP9Q6QPzbJhPPkaXVtNa2dgi0Mc2NLA17f0u/E3U/2J1FRtB6PUNXZyNGFVp/AHX4Q0BhaOrcqVrtoxpNNWcKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AW7HlJ/N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AW7HlJ/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA76DC4CEEA;
	Mon, 16 Jun 2025 07:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750058139;
	bh=XlzTWIS75+l6at5NogEHyv+JNSYzRylm5Id0QSKt+SU=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=AW7HlJ/N3qiq9GztNMbDo91FZgXjT/H6OPUosNp/DFUKLCxZijj+NMU9/m2tif3jW
	 uIcCewr6keHB2+caq3WrU2ndlJMpwXVe2VYiLB6e8/kCin+iKVXT66wmH3+o+AN4e1
	 xFRgfivOBLO9g2rsdxmf90GOgoqBubGjoi08K3UFy/DOlhetZy9w8EhhwZ0rtCb3IU
	 g4QUHldjF+JYFaB35E7HTUZtogxI2DZlX4gs4/ruWTjc3EkS1SKbjSF7dcGhT819qt
	 FHdUisgASxTzBsBwirfEME+tWzovaWbodmzyUwFpW+X/jvRjwzgboVSfV2/+l2FwMi
	 BZIP5ZENE8i+A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Jun 2025 09:15:36 +0200
Message-Id: <DANRU0TC3F11.30DUO1LQZUE42@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Cc: <dakr@kernel.org>, <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com>
 <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
 <CAPZ3m_hQF+ZHdfWTVZ3Z3dJoMu37Q8YcSecKi=fv1s3dw6UTSA@mail.gmail.com>
 <DAMGEMZF6UC9.1YB4QHDZIW5PS@kernel.org>
 <CAPZ3m_jqnGJtOxff2cJre_qFLyOehbhZ+XVvE0BjzFv7ADqOAg@mail.gmail.com>
 <CANiq72kmjEEsBjbmJ1rN-OYA7Tt7N_0j6mEB0=DPK9ng7uyuDA@mail.gmail.com>
 <CAPZ3m_gGOy2XsiVaVbbAivwO0JBpgqMke68LV4OD+i2L1Z5PEw@mail.gmail.com>
In-Reply-To: <CAPZ3m_gGOy2XsiVaVbbAivwO0JBpgqMke68LV4OD+i2L1Z5PEw@mail.gmail.com>

On Mon Jun 16, 2025 at 2:36 AM CEST, Marcelo Moreira wrote:
> Em dom., 15 de jun. de 2025 =C3=A0s 05:38, Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> escreveu:
>>
>> On Sun, Jun 15, 2025 at 1:12=E2=80=AFAM Marcelo Moreira
>> <marcelomoreira1905@gmail.com> wrote:
>> >
>> > what about:
>> >
>> > // SAFETY: `self.data` is valid for writes because of `Self`'s type in=
variants.
>> > // The `&mut Self` context guarantees exclusive access, meaning no oth=
er
>> > // thread can concurrently access `data`.
>> > //
>> > // - `drop_in_place` is valid to call because `drop` is only called on=
ce.
>> > unsafe { drop_in_place(p.data.get()) };
>> >
>> > I'm not sure if the line break in the comment is okay...
>>
>> Benno likely meant to use bullet points for each one, rather than a
>> bullet point after a paragraph.
>>
>> If you do e.g.
>>
>>     git grep -A5 '// SAFETY:$' -- rust/kernel
>>
>> you will find examples of that.
>
> Cool! Thanks for the command Miguel =3DD it helped a lot.
>
> I'm ready to send like this:
>
> // SAFETY:
> // - `self.data` is valid for writes because of `Self`'s type invariants.
> // - The `&mut Self` context guarantees exclusive access, meaning no othe=
r
> //    thread can concurrently access `data`.
       ^ spurious space here,

This argument is actually an extension of the previous one.

> // - `drop_in_place` is valid to call because `drop` is only called once.

This phrasing feels a bit weird to me, but I can't put my finger on what
exactly...

> unsafe { drop_in_place(p.data.get()) };

How about:

// - `self.data` is valid for writes because of `Self`'s type invariants:
//   `&mut Self` guarantees exclusive access, thus no other thread can conc=
urrently access `data`.
// - this function is a drop function, thus this code is at most executed o=
nce.

---
Cheers,
Benno
