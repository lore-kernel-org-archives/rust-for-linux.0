Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0CA1FBEA8
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Jun 2026 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780744932; cv=pass; b=dbaZrl3vFiR8K/8hGvdOrP3Xtn3FhyD1XL2nGe8LFz9RVXCcHIFlB35GJ3nc0kCPcKgmJSREeq1onxyc8tUZ7Yahx4EZ0BXcXOTiyH3FgAIRnSBU3AO3wzGsxEq4eDltuygc5ogMhl81+WM4MBJHUZJtJJ/7COWNE3Os3dCoyD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780744932; c=relaxed/simple;
	bh=zjWFIdhkLdOcg6H+FzXTUqPe2VxkrkzrZmnKEbpQkSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m8/nt21luyW5LORUXans7M2C2dTSv3ZoVP0Dqy4Ibok4vjRqsvWDI4qZfX9jWg+T4T1ugfuWpAAbejUsNc1WUZASKwrEJrv1E1/2qsThapNeTmI+gmTKU+AIz9bNG2xM/Ev5sA3d7BwbCUKsmi+NqQNI+Rt3+v5pDRhrstuqbQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2XulmYy; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2XulmYy"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304e86ecebfso153787eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Jun 2026 04:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780744930; cv=none;
        d=google.com; s=arc-20240605;
        b=fBfHBjW/yyttGgoUPLvmV1fKqJUiJr1qmpXvwebI6LM75vWIxR/+J1GHQFCFAIV11a
         JGE94s7y1xeK4vtAMR8x/IhLN/rjePDUhdMelV4pRd12TUUXWWXdryCCydPx0iTfAM+E
         xYCHdLT52aMz9+zt4LvKwn9Ow7p3pdE2dK3W7LRqe6Yh1AkZdTnlq9lYu8H72de25u+Z
         24ukK4B6dCrh5qlFLA0ITuEmEWN7Fdf3R/JcXGOldqB2YHU6PO954yElTymzM5KTzkGN
         RqCt0lceCBGJQVueJi0zatysEtuZYKWEc8Nk/FRzPGRbo31N+klrz1g2iLifuFJfjmuW
         P18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zjWFIdhkLdOcg6H+FzXTUqPe2VxkrkzrZmnKEbpQkSo=;
        fh=BhEcdQgCj2td6m7FzHqYjOnY4gIiWA0XEUpPhLsvP0E=;
        b=FtVH88sj0LnnVS6ACJkH2X4FgK8QzXyR1sLHGhNS5BcIawzQLef43yPyR/WclZzEyR
         rocf+kXnvJIaE2fhfLgGH+1u1x+ns5bfvFkiWFCgcaP+pKga3LaLH1hoTqbIr0c6W2ws
         +ER1GFGUxQePFcWHqHMdenlFRSEqgzYuQwIaWOu13+SC1DszGtu3q+YKMqGPQsQtHc0c
         4fw1uLIrpNC/Q/QAf7uV0mi6K6SZZ5dpSPSpFv7onTGpruUHD5ZbtmMgi5LCHUxPEREx
         bPexoT1zMGeRBmc/R5bcGn8IVV2PwdaLOfYq17aMyZLcoSGtAK6oMcptevjKqBk3z0Mg
         xCcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780744930; x=1781349730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjWFIdhkLdOcg6H+FzXTUqPe2VxkrkzrZmnKEbpQkSo=;
        b=Q2XulmYy+W7JroFbSjRm3u3mJrCQQM0+lZGyqM/jhHg1nAXYaaLSyjK7T84kqiW669
         9k3Rl/cyRiFAqQU12d/9lbRmdCiwUDpvqy11QnOH55xa+sjY8jpXkZY30coq/ioCSeC6
         tAB8zK4h0NKR/9t7/D/ppzdHqCoYkQPz7LmCD4c1hybuV6MW4fWGudrT+g3mGbH8lcrJ
         lNAxwuLWTzEaXjknldhLZ9Mu0fMmW7+GsXmwwyADu+qD9iXWADO7vchpvuf4/ZAbZgWc
         Z1gF2ecTTEdBEc+GIkYBFy/tLwTJbLHP5nSKFwNh1JymAEmlc4Ic6N+bHcICBIZCReBG
         EC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780744930; x=1781349730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zjWFIdhkLdOcg6H+FzXTUqPe2VxkrkzrZmnKEbpQkSo=;
        b=SQV5NI6M2MNx4LggYFnROaezAp2pSQtU0H3Fnk6+fy56MbquJTGCBgp1WYeWWbvpYc
         Kv65ZylPQ29+lN0mGBjEm5iijvr1Khoe68rg7zHlW3DICgEnKz449XfBO8JrNObE7I13
         gTB+sL6d0SWXPU7k9/UcIW7s6FvFxby3/jEi5qno94ZvbIFS1ju/Azpry1i5Mb7zsUys
         f8MlzUbg5XZGxs55N/CsWslvQUfZrbgHFEMjvEBwom2ib26heXjP9KiiSbjYtuLFFVWS
         SoyX6cppqZHUHK1JjUea1HqbsmnT5a/I4VAIs6bL/tTb9qfaxuTqA3L450UzlGtIEXOQ
         +gyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Rj8FGF5X9f+omNUO6FKIRDfU0LTlwWvL+DdR2ssWkxCKgCh09gg6GECv+aLpwcRmFZPSskb10pmf3EaahpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMMRk0kgYBD1SZEynEIbYCSjHCbLLCTOeQ/TrbmebsT1ydDtXY
	2ZM3c6rN7lJQ60OpTrTLbF24WyhpAshGVumkSU9HyHJIOnsmdJcARG79lAmeNOgWK5uPk/psA/o
	x3vF3YnotZr2XWYz7Sp5zZj/3UxI8n5Q=
X-Gm-Gg: Acq92OHEpxzpMx5xRFd3nHRpRDhpc5+ki3CY2PapuIXoerA6xdm3rRRG8b61e9u5X02
	gPvN9MXcPGYTQHdY7pEYur+fm41Ue6FurN0Hyexftu7eXhtFOxV315Q9vgJ7KFjQ5sZqgW+L2p1
	uSNklVXJwv7ZrHTwZT+f7xyrPJSLgnESe2e7AncYilScv4qgkLILudZMtXbQoFzr27b9j15KYdD
	W1Xtp+eAG2/eK24xHseg+NRrWWKjgeVdBH43uQ6/NCxqDtN7UHAOhK9QVF/hnN6os9leuM8wh9s
	pQoQ5CwT8vngFVHOdHCfXQCnfG2R4mjE8Of6GOgKrl4VlDChMh/Iq0DlZGJDoDygKdj/XUdmCC+
	yF217CJmu9Ev8IfgpfF/TbbEuHbKwmp2V4g==
X-Received: by 2002:a05:7300:8cac:b0:304:f860:3ae3 with SMTP id
 5a478bee46e88-3077ae67a39mr2208435eec.1.1780744930174; Sat, 06 Jun 2026
 04:22:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-impl-flags-additions-v2-0-0d27242f460b@kernel.org>
 <20260605-impl-flags-additions-v2-2-0d27242f460b@kernel.org>
 <CANiq72ksbJPBtOhB+Oo0bc48g+dYLXPOZz=yQVTE1C5H+jyKzQ@mail.gmail.com> <87h5nghyys.fsf@kernel.org>
In-Reply-To: <87h5nghyys.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 6 Jun 2026 13:21:57 +0200
X-Gm-Features: AVVi8Ces9z95vzzyqj6atvVnxV6Zs1XsS1qupLxQ_RE9HoEku_vDaT1_jAjSJco
Message-ID: <CANiq72nw96aQFqq8qXh0her9ELug39-rovTguqHNddnWSsApGg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: impl_flags: add bitwise operations with the
 underlying type
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 10:09=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> I feel like we already discussed this. I don't understand the objection.

Now that you mention it, yeah. Hmm... it may be have been a call.

> I have a C type integer that is a set of flags. In bindings, I
> manipulate the flags (I will send this code within the next few days):

Yeah, so what I suggested is that providing the before-and-after
(rather than "after" only below as you do here and in the commit
message) can help to justify it.

That is, what exactly would you need to do before this patch? i.e. do
you really need a temporary? e.g. could you have written `as ...`
(putting aside that we try to avoid casts) or are we missing something
else from your use case? Would a `From` instead be good enough
instead?

My reading of Gary's comment is that, by providing too convenient
operators on the raw type, people may avoid actually using the newtype
when it makes sense to do so (which is a general principle that I
agree with).

In your case, I can see it is reasonable to have the operator there
(to avoid either casts or , and I think we are still in a better spot
than C here (since we only implement it for a particular primitive
type etc.), but yeah, it should have a better justification -- it is a
tradeoff to introduce more convenience, and the patch doesn't really
discuss it or its alternatives.

I hope this clarifies.

Cheers,
Miguel
