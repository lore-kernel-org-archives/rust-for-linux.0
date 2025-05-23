Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A911320CCD3
	for <rust-for-linux@vger.kernel.org>; Fri, 23 May 2025 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748001208; cv=none; b=LomMvvVW2+e+uH/EGIMZeUgMTpUQVFW06JBnCcK5QLq9lMzzfeB8OuxoVRxh4GwVPHR/7qOSo+pph6rcorRf9pgmZQZ+S5lXzKWkSv+f/4GzNTDNa0348aFOdoMWcXeuF1bGT8xQTJiarYbYvyiHWTNkNch3iy04yYaTEeeLNLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748001208; c=relaxed/simple;
	bh=8m+84PI0xY9G72NqwkULWmDnkygrhJle3AVSGN4iBy0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=JpR4k6mioDRsZRpeHfLom14wPp+xbGzWobP7ET5Otk3qQxl21iCH0aCDrpooDaEap/l4eDUiygZnU6EF4cryewNNSN2/hVLO7s4u2Bug05LQWkZQtshShaXFiRm/j490cevLyzy59hW9YoFr2eDI0T90EXmpBBbFw+yZS0yMi1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HH0ieDuw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HH0ieDuw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A2FC4CEE9;
	Fri, 23 May 2025 11:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748001208;
	bh=8m+84PI0xY9G72NqwkULWmDnkygrhJle3AVSGN4iBy0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=HH0ieDuwDesIqqzHmBoGn0nrdJiFp0qwHGygl8el1oYhY7/ywg8llks+Sav6g6uB7
	 dR5wP2t7h+EKFThc7llYcOBpe9tuPOatOSThkedmIyaB1LPZ6mQCrUTlpM+h4DVd/S
	 rtjeYlNKtJ+OlcuIOn5zQW8SprmEChmKQCb1St2IDi6yFd+SbaPSyYI4/oc06NFD3m
	 03SoDlOdj2GbuHh73CQnb/i38BfpolGphuHrPF5Qo67LbhUtBONtTGzVPDRk8rYErl
	 SO92yaffzXJOsVmmQteXH5i37MNPUgQ+U6rQxP1P4QFmolqjuannH5sEJxDcc4pr1b
	 zKyY2cktRtz5g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 May 2025 13:53:24 +0200
Message-Id: <DA3IPNILKRA0.3LJ8DGKQ99KP8@kernel.org>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Marcelo Moreira" <marcelomoreira1905@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, <benno.lossin@proton.me>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
X-Mailer: aerc 0.20.1
References: <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org> <aCrwuQP46RFHxYB5@pollux>
 <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org> <aCsAEJtkCKKhspnF@pollux>
 <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org> <aCsX-k0K_jqLvD4e@pollux>
 <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
 <CAPZ3m_i8fwsBRJKay72LHT4pEW=eZ5LxCFD=8CYkuEksjjt3_Q@mail.gmail.com>
 <DA3ENUO97I6D.234AA7I97AV62@kernel.org> <aDA4HIOL-g37cvpy@cassiopeiae>
In-Reply-To: <aDA4HIOL-g37cvpy@cassiopeiae>

On Fri May 23, 2025 at 10:55 AM CEST, Danilo Krummrich wrote:
> On Fri, May 23, 2025 at 10:42:58AM +0200, Benno Lossin wrote:
>> On Fri May 23, 2025 at 2:13 AM CEST, Marcelo Moreira wrote:
>> > 3. Clarified revoke_internal for SYNC =3D false and swap correction
>> > Proposed Documentation:
>> >  if self.is_available.swap(false, Ordering::Relaxed) {
>> >  if SYNC {
>> >                 // SAFETY: Just an FFI call, there are no further requ=
irements.
>> >                 unsafe { bindings::synchronize_rcu() };
>>=20
>> @Boqun: is this true?
>>=20
>> If the answer is yes, then we should add this as a safe function in the
>> rcu module.
>
> I think it's a case for Klint, since synchronize_rcu() must not be called=
 from
> atomic context, since it may block. Otherwise, there shouldn't be any add=
itional
> requirements.

Makes sense, but then we should add this as a safe function (in a
separate patch). After all we already have other safe functions that
should be unsafe were it not for klint.

>> >  }  else {
>> >        // This branch for `revoke_nosync` requires the caller to prove
>> > that `data`
>> >        // can be dropped immediately without waiting for any RCU grace=
 period.
>>=20
>> I'm not sure that having a single function that does the revocation, but
>> has this going on is a good idea. The safety requirements will be pretty
>> complex.
>>=20
>> @Danilo what do you think of inlining this function?
>
> Sure, if it makes documentation significantly easier, which seems to be t=
he
> case, then it's probably worth.

Yeah then let's do it (also separate patch).

---
Cheers,
Benno
