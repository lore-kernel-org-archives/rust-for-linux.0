Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4579E2E11DD
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Jun 2025 18:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749924343; cv=none; b=lKaTVSvaRR4InPSjs9cBtBEc1pvkrRiQRq5mCaYkOM54FbYjrF5BR1Qo/7eZ0jmjUb4CYKNDOB5gbMlc0+3tQNdiuHfC6NzzXTDvmqnBUPNlzwnfIu2K/lsEnvxwixjuno3kDEtW84vtdVfevbElkVMvnd2xObS7w2VNWGRSYhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749924343; c=relaxed/simple;
	bh=0HNFlzjQMcGG+Qr6GFRtuTiCYmtliJoYJvNpN/FASRY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nUCBLACvVvqHGwiWOUSzqqoHHTNFxODVSM6vzMpRdzFYxPh/EleTfgK88tUxt+DwKnlSJRAC/np7W8DDHZddkBDm/HrVQMespK1Mb8IhxSxo2pboUJg0pQ7OCueY7GR/f1f4f0YO6nWrxfGh64Tyaf4DWzZ6NPCK6VSHD9ykVM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ox6mNkVQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ox6mNkVQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620F6C4CEEB;
	Sat, 14 Jun 2025 18:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749924341;
	bh=0HNFlzjQMcGG+Qr6GFRtuTiCYmtliJoYJvNpN/FASRY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ox6mNkVQY0D1FO68sU7GVRE+RJKzWnbp4uTe/GxP7A3+mhgxbpOPTUW7gEzgnZqFD
	 cfQa/0dlUJ7vOWbnszJeq8yKuTq1A79cRLpOvUaAc5H+EEvPOYVeusRyls3BE0snMP
	 1zu/nMDiJ0JndamPv/ZUExzAmiiqgmHjRJcJeIKEamjUO2AnxOK6X9ooOupbeBSoFm
	 +erE66YQVCs3OzP5q6o6+BRiT94F/Tr2VXlkLbvkCvsTpYLxpZIZG4q9e016Zyjd7l
	 3aEN4orzBuY7WBtBFYoA6le4nT8rZoRlnAELqSL80Gv2/hw4TXhTU1ivjtOYqc0HL3
	 Pga6y2EEcWlYg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 20:05:38 +0200
Message-Id: <DAMGEMZF6UC9.1YB4QHDZIW5PS@kernel.org>
Cc: <dakr@kernel.org>, <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com>
 <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
 <CAPZ3m_hQF+ZHdfWTVZ3Z3dJoMu37Q8YcSecKi=fv1s3dw6UTSA@mail.gmail.com>
In-Reply-To: <CAPZ3m_hQF+ZHdfWTVZ3Z3dJoMu37Q8YcSecKi=fv1s3dw6UTSA@mail.gmail.com>

On Thu Jun 12, 2025 at 9:22 PM CEST, Marcelo Moreira wrote:
> Em qui., 12 de jun. de 2025 =C3=A0s 06:02, Benno Lossin <lossin@kernel.or=
g> escreveu:
>> On Tue Jun 3, 2025 at 1:26 AM CEST, Marcelo Moreira wrote:
>> > +            // and because this `PinnedDrop` context (having `&mut Se=
lf`) guarantees exclusive access,
>> > +            // ensuring no other thread can concurrently access or re=
voke `data`.
>> > +            // This ensures `data` is valid for `drop_in_place`.
>>
>> This last sentence is not needed. Instead, we should mention that since
>> this is a `drop` function, we're only called once, so it's fine to call
>> drop (since that also is only allowed to be called once).
>>
>
> ok, I thought of something like:
>
> // SAFETY: `self.data` is valid for writes because of `Self`'s type invar=
iants.
> // The `&mut Self` context guarantees exclusive access and a single
> call to `drop`,

Let's mention that no thread can access `data` *because* of the
exclusive reference.

> // making `self.data` valid for `drop_in_place`.

The part about drop should be separate. We usually use bullet points for
that.

---
Cheers,
Benno
